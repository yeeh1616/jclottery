/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.List;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.CombAlgorithm;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.JcUtil;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.busi.lottery.service.split.GuessService.DgGuess;
import com.jingc.busi.util.member.PlayerTypes;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: GuessFootballTicketSplitor.java</p>
 * <p>Desc: 竞彩足(篮)球拆票</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-2-28
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class GuessFootballTicketSplitor extends TicketSplitor {
	
	private GuessService jczqService = GuessService.getInstance();

	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> list = null;
		//	过关投注
		if ( !"1c1".equals(order.getPassType()) ) {
			list = generateGgTickets(order);
		} 
		// 单关投注
		else {
			// 冠军、冠亚军
			if ( "7".equals(order.getPlayType()) || "8".equals(order.getPlayType()) || "9".equals(order.getPlayType())
					|| "10".equals(order.getPlayType()) || "11".equals(order.getPlayType()) ) {
				list = generateCupTicket(order);
			} else {
				list = generateDgTickets(order);
			}
		}
		return list;
	}
	
	/**
	 * 冠军、冠亚军票生成  added at 2014/06/17
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> generateCupTicket(LotteryOrder order) {
		List<LotteryTicket> list = new ArrayList<LotteryTicket>();
		int betNum = order.getBetCode().split(",").length;
		super.createComplexTicket(order, list, order.getBetCode(), betNum, order.getPlayType());
		return list;
	}
	
	/**
	 * 过关票生成
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> generateGgTickets(LotteryOrder order) {
		List<LotteryTicket> list = null;
		// 复式投注
		if ( "0".equals(order.getSingleFlag()) ) {
			list = generateGgFsTickets(order);
		} 
		// 单式上传/奖金优化/在线过滤投注
		else {
			list = generateGgDsTickets(order);
		}
		return list;
	}
	
	/**
	 * 生成过关复式票
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> generateGgFsTickets(LotteryOrder order) {
		String[] ptypes = order.getPassType().split(",");
		
		String freePString = "";	//	自由过关串
		String combPString = "";	//	组合过关串
		
		for ( String ptype : ptypes ) {
			if ( isFreeCrossing(ptype) ) {
				freePString += ptype + ",";
			} else {
				combPString	+= ptype + ",";
			}
		}
		
		List<LotteryTicket> list = new ArrayList<LotteryTicket>();
		
		if ( !"".equals(freePString) ) {// 自由过关处理
			freePString = freePString.substring(0, freePString.length() - 1);
			addFrpTickets(list, freePString, order);
		}
		
		if ( !"".equals(combPString) ) {// 组合过关处理
			combPString = combPString.substring(0, combPString.length() - 1);
			addCombpTickets(list, combPString, order);
		}
		return list;
	}
	
	/**
	 * 判断玩法类型是否为自由过关
	 * 
	 * @param cTring
	 * @return true-为自由过关,false-组合过关
	 */
	private boolean isFreeCrossing(String cTring) {
		boolean freeCrossing = false;
		String[] _cString = cTring.split(",");
		if (_cString.length == 1) {
			if ("1".equals(_cString[0].split("c")[1])) {
				freeCrossing = true;
			} else {
				freeCrossing = false;
			}
		} else {
			for (String _cStr : _cString) {
				if (!"1".equals(_cStr.split("c")[1])) {
					throw new RuntimeException("[存在自由过关于组合过关同时下注或者多个组合过关下注]");
				}
			}
			freeCrossing = true;
		}
		return freeCrossing;
	}
	
	/**
	 * 自由过关票加入到list中
	 * @param list
	 * @param freePString
	 * @param order
	 */
	private void addFrpTickets(List<LotteryTicket> list, String freePString, LotteryOrder order) {
		String betCode = order.getBetCode();
		int multiple = order.getMultiple();
		int maxMult = LotteryServiceImpl.maxMultiple.get();
		// 判断是否为胆拖投注
		if ( isDtBetCode(betCode) ) {
			List<String> _betCodes = jczqService.tsfToSingleCode(betCode, freePString);
			if ( (maxMult + 1) > multiple ) {
				addFrpOneMultipleTicket(order, list, _betCodes, multiple);
			} else {
				int loop =  multiple / maxMult ;
				int mod = multiple % maxMult;
				for ( int j = 0; j < loop; j++ ) {
					addFrpOneMultipleTicket(order, list, _betCodes, maxMult);
				}
				if ( mod != 0 ) {
					addFrpOneMultipleTicket(order, list, _betCodes, mod);
				}
			
			}
		} else {
			String[] _cString = freePString.split(",");
			for ( String _cStr : _cString ) {
				handleComplex(betCode, _cStr, multiple, list, maxMult, order);
			}
		}
	}
	
	/**
	 * 判断投注码是否为胆拖投注
	 * @param betCode
	 * @return
	 */
	private boolean isDtBetCode(String betCode) {
		boolean dtBetCode = false;
		int dtCounter = 0, counter = 0;
		String[] codes = betCode.split("\\|");
		for (String code : codes) {
			String[] codeSplit = code.split(":");
			if ("2".equals(codeSplit[2]) ) {
				dtCounter++;
			} else {
				counter++;
			}
		}
		if (dtCounter > 0 ) {
			dtBetCode = true;
		} else {
			dtBetCode = false;
		} 
		return dtBetCode;
	}
	
	private void addFrpOneMultipleTicket(LotteryOrder order, List<LotteryTicket> list, List<String> _betCodes, int multiple) {
		int codesSize = _betCodes.size();
		for ( int i = 0; i < codesSize; i++ ) {
			if ( Integer.parseInt(order.getPlayType()) == GameUtil.JCZQHHG 
					|| Integer.parseInt(order.getPlayType()) == GameUtil.JCLQHHG ) {
				List<String> codesList = jczqService.findNmHhComb(_betCodes.get(i));
				for ( String __betCode : codesList ) {
					int betNum = 1;
					String[] pCodes =  __betCode.split("\\|");
					for ( String pcode : pCodes ) {
						betNum *= pcode.split(",").length;
					}
					list.add(new LotteryTicket(order, order.getPlayType(),__betCode, betNum,  __betCode.split("\\|").length+"c1", multiple));
				}
			} else {
				int betNum = 1;
				String[] pCodes =  _betCodes.get(i).split("\\|");
				for ( String pcode : pCodes ) {
					betNum *= pcode.split(",").length;
				}
				list.add(new LotteryTicket(order, order.getPlayType(),_betCodes.get(i), betNum,  _betCodes.get(i).split("\\|").length+"c1", multiple));
			}
		}
	}
	
	private void handleComplex(String betCodes, String _cStr, int betMult,
			List<LotteryTicket> tp, int jcMaxMult, LotteryOrder order) {

		List<List<String>> combCodes = jczqService.findFreeCrossingCode(
				betCodes, _cStr);
		for (List<String> lst : combCodes) {
			// 判断每种过关方式的单倍投注额是否大于2万
//			int subSum = 1;
			String betCode = "";
			for (String _b_s : lst) {
//				subSum *= _b_s.split(":")[1].split(",").length;
				betCode += _b_s + "|";
			}
			betCode = betCode.substring(0, betCode.length() - 1);
			List<String> codesList = new ArrayList<String>();
			if ( Integer.parseInt(order.getPlayType()) == GameUtil.JCZQHHG || 
					Integer.parseInt(order.getPlayType()) == GameUtil.JCLQHHG )  { 
				codesList = jczqService.findNmHhComb(betCode);
			} else {
				codesList.add(betCode);
			}
			//List<String> _betCodes = this.jczqService.findNmHhComb(betCode);
			for ( String _betCode : codesList ) {
				int subSum = 1;
				String[] calcDesc = _betCode.split("\\|");
				for (String _b_s : calcDesc) {
					subSum *= _b_s.split(":")[1].split(",").length;
				}
			if (subSum > 10000) {
				List<String> splitCodes = jczqService.getDivBetCode(
						_betCode, _cStr);
				for (String bCode : splitCodes) {
					int betN = jczqService.getBetNumber(bCode, _cStr);
					// 寻找一个小于99的最大倍数
					int maxMult = jcMaxMult;
					while (maxMult > 0) {
						if (betN * maxMult < 10000) {
							break;
						}
						maxMult--;
					}
					if (maxMult > betMult) {
						// 计算注数
						tp.add(new LotteryTicket(order, order.getPlayType(), bCode, betN, _cStr, betMult));
					} else {
						int loop = betMult / maxMult;
						int mod = betMult % maxMult;
						for (int i = 0; i < loop; i++) {
							tp.add(new LotteryTicket(order, order.getPlayType(), bCode, betN, _cStr, maxMult));
						}
						if (mod != 0) {
							tp.add(new LotteryTicket(order, order.getPlayType(), bCode, betN, _cStr, mod));
						}
					}
				}
			} else {
				// 寻找一个小于99的最大倍数
				int maxMult = jcMaxMult;
				while (maxMult > 0) {
					if (subSum * maxMult < 10000) {
						break;
					}
					maxMult--;
				}
				if (maxMult > betMult) {
					tp.add(new LotteryTicket(order, order.getPlayType(), _betCode, subSum, _cStr, betMult));
				} else {
					int loop = betMult / maxMult;
					int mod = betMult % maxMult;
					for (int i = 0; i < loop; i++) {
						tp.add(new LotteryTicket(order, order.getPlayType(), _betCode, subSum, _cStr, maxMult));
					}
					if (mod != 0) {
						tp.add(new LotteryTicket(order, order.getPlayType(), _betCode, subSum, _cStr, mod));
					}
				}
			}
			}
		}

	}
	
	/**
	 * 组合过关票加入到list中
	 * @param list
	 * @param freePString
	 * @param order
	 */
	private void addCombpTickets(List<LotteryTicket> _list, String combPString, LotteryOrder order) {
		int maxMult = LotteryServiceImpl.maxMultiple.get();
		String _betCode = order.getBetCode();
		int multiple = order.getMultiple();
		String[] combPs = combPString.split(",");
		for ( String combPt : combPs ) {
			if ( isMoreSch(_betCode, combPt) ) {
				List<List<String>> list = new CombAlgorithm<String>().findJcComb(_betCode.split("\\|"), Integer.parseInt(combPt.split("c")[0]));
				for ( List<String> lst : list ) {
					String betCode = "";
					for ( String code : lst ) {
						betCode += code + "|";
					}
					betCode = betCode.substring(0, betCode.length() - 1);
					
					List<String> codesList = new ArrayList<String>();
					if ( Integer.parseInt(order.getPlayType()) == GameUtil.JCZQHHG || 
							Integer.parseInt(order.getPlayType()) == GameUtil.JCLQHHG ) { // 
						codesList = jczqService.findNmHhComb(betCode);
						
					} else {
						codesList.add(betCode);
					}
					for ( String __betCode : codesList ) {
					int betNum = jczqService.calcCombPtBetNum(__betCode.split("\\|"), combPt);
					if ( betNum > 10000 ) {
						String[] cString = JcUtil.COMB_CR_MAP.get(combPt);							
						for ( String _cStr : cString ) {
							handleComplex(_betCode, _cStr, multiple, _list, maxMult, order);
						}
					} else {
						int _maxMult = maxMult;
						while ( _maxMult > 0 ) {
							if ( betNum * _maxMult <= 10000 ) {
								break;
							}
							_maxMult--;
						}
						if ( _maxMult >= multiple ) {
							_list.add(new LotteryTicket(order, order.getPlayType(), __betCode, betNum, combPt, multiple));
						} else {
							int loop =  multiple / _maxMult ;
							int mod = multiple % _maxMult;
							for ( int i = 0; i < loop; i++ ) {
								_list.add(new LotteryTicket(order, order.getPlayType(), __betCode, betNum, combPt, _maxMult));
							}
							if ( mod != 0 ) {
								_list.add(new LotteryTicket(order, order.getPlayType(), __betCode, betNum, combPt, mod));
							}
						}
					}
					}
				}
			} else {
				List<String> codesList = new ArrayList<String>();
				if ( Integer.parseInt(order.getPlayType()) == GameUtil.JCZQHHG || 
						Integer.parseInt(order.getPlayType()) == GameUtil.JCLQHHG ) {
					codesList = jczqService.findNmHhComb(_betCode);
					
				} else {
					codesList.add(_betCode);
				}
				for ( String __betCode : codesList ) {
				int betNum = jczqService.calcCombPtBetNum(__betCode.split("\\|"), combPt);
				if ( betNum > 10000 ) {
					String[] cString = JcUtil.COMB_CR_MAP.get(combPt);							
					for ( String _cStr : cString ) {
						handleComplex(__betCode, _cStr, multiple, _list, maxMult, order);
					}
				} else {
					
					int _maxMult = maxMult;
					while ( _maxMult > 0 ) {
						if ( betNum * _maxMult <= 10000 ) {
							break;
						}
						_maxMult--;
					}
					if ( _maxMult >= multiple ) {
						_list.add(new LotteryTicket(order, order.getPlayType(),__betCode, betNum, combPt, multiple));
					} else {
						int loop =  multiple / _maxMult ;
						int mod = multiple % _maxMult;
						for ( int i = 0; i < loop; i++ ) {
							_list.add(new LotteryTicket(order, order.getPlayType(),__betCode, betNum, combPt, _maxMult));
						}
						if ( mod != 0 ) {
							_list.add(new LotteryTicket(order, order.getPlayType(), __betCode, betNum, combPt, mod));
						}
					}
				}
				}
			}
		}
	}
	
	private boolean isMoreSch(String betCode, String cTring) {
		String[] codes = betCode.split("\\|");
		if (codes.length > Integer.parseInt(cTring.split("c")[0])) {
			return true;
		}
		return false;
	}
	
	/**
	 * 生成过关单式票 Modified at 2014/04/27
	 * 单式详情存：schInfo，格式：20140411001:1:0|20140411002:1:0`2;20140411001:3:0|20140411002:1:0`3
	 * 						场次:彩果：0`倍数
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> generateGgDsTickets(LotteryOrder order) {
		String betCode = order.getSchInfo();// 存放在schInfo,betCode存放原复式号码
		
		int maxMult = LotteryServiceImpl.maxMultiple.get();
		
		List<LotteryTicket> list = new ArrayList<LotteryTicket>();
		
		String[] betCodes = betCode.split(";");
		
		for ( String code : betCodes ) {
			String[] cInfo = code.split("`");	
			int pass = cInfo[0].split("\\|").length;
			int multiple = Integer.valueOf(cInfo[1]);
			if ( multiple < 0 ) {
				throw new BaseException("[倍数错误]");
			}
			// 拆分倍数
			int multLoop = multiple / maxMult;
			int multMod = multiple % maxMult;
			for ( int j = 0; j < multLoop; j++ ) {
				// 生成一张票
				list.add(new LotteryTicket(order, order.getPlayType(), cInfo[0], 1, pass + "c1", maxMult));
			}
			if ( multMod != 0 ) {
				// 生成一张票
				list.add(new LotteryTicket(order, order.getPlayType(), cInfo[0], 1, pass + "c1", multMod));
			}
		}
		
		return list;
	}
	
	
	/**
	 * 单关票生成
	 * <ul>
	 * <li>添加混合单关支持 modified at 2015/05/14</li>
	 * <li>拆分条件：playType=6,passType=1c1</li>
	 * <li>先拆分陈单玩法，再逐个玩法拆分</li>
	 * <ul>
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> generateDgTickets(LotteryOrder order) {
		List<LotteryTicket> list = new ArrayList<LotteryTicket>();
		int multiple = order.getMultiple();
		
		int maxMult = LotteryServiceImpl.maxMultiple.get();
		
		// Modified for 比分单关奖金奖金优化 at 2013/10/09
		if ( !"0".equals(order.getSingleFlag()) ) {
			String[] _betCodes = order.getSchInfo().split(";");
			for ( String _pcode : _betCodes ) {
				// 格式:20120428001:3'10,20120428001表示场次，3表示选项，10表示倍数
				String[] dd = _pcode.split("`");
				String[] codes = dd[0].split(":");
				int dgMult = Integer.parseInt(dd[1]);
				if ( dgMult > maxMult ) {
					int loop =  dgMult / maxMult ;
					int mod = dgMult % maxMult;
					for ( int i = 0; i < loop; i++ ) {
						list.add(new LotteryTicket(order, order.getPlayType(),codes[0] + ":" + codes[1] + ":0", 1, "1c1", maxMult));
					}
					if ( mod != 0 ) {
						list.add(new LotteryTicket(order, order.getPlayType(), codes[0] + ":" + codes[1] + ":0", 1, "1c1", mod));
					}
				} else {
					list.add(new LotteryTicket(order, order.getPlayType(), codes[0] + ":" + codes[1] + ":0", 1, "1c1", dgMult));
				}
			}
			
			//order.setBetCode(order.getSchInfo());
		} else {
			// 混合单关拆分
			List<DgGuess> dlist = null;
			if ( order.getPlayType().equals(PlayerTypes.JczqPlayer.HHGG+"") ) {
				dlist = this.jczqService.findDgNmHhComb(order.getBetCode());
			} else {
				dlist = new ArrayList<DgGuess>();
				DgGuess dg = new DgGuess();
				dg.setPlayType(order.getPlayType());
				dg.setBetCode(order.getBetCode());
				dlist.add(dg);
			}
			for ( DgGuess dg : dlist ) {
				//String[] _betCodes = order.getBetCode().split("\\|");
				String[] _betCodes = dg.getBetCode().split("\\|");
				if ( (maxMult + 1) > multiple ) {
					int pass = getMaxPass(dg.getPlayType(), order);
					String nBetCode = "";
					int index = 0;
					int betCounter = 0;
					for ( int i = 0; i < _betCodes.length; i++ ) {
						betCounter += _betCodes[i].split(",").length;
						if ( (i+1) % pass == 0 ) {
							nBetCode += _betCodes[i];
							list.add(new LotteryTicket(order, dg.getPlayType(),nBetCode, betCounter, "1c1", multiple));
							index++;
							nBetCode = "";
							betCounter = 0;
							
						} else {
							nBetCode += _betCodes[i] + "|";
						}
						//prepareArgs(conn, lt, args, i ,_betCodes[i], betMult, "1C1", _betCodes[i].split(",").length, _betCodes[i].split(",").length * betMult * 2);
					}
					if ( _betCodes.length % pass != 0 ) {
						nBetCode = nBetCode.substring(0, nBetCode.length() - 1);
						list.add(new LotteryTicket(order, dg.getPlayType(),nBetCode, betCounter, "1c1", multiple));
					}
				} else {
					// 由于单关的generalMaxMult倍不会超过2万，当倍数大于generalMaxMult时，取generalMaxMult作为最大倍数
					int loop =  multiple / maxMult ;
					int mod = multiple % maxMult;
					int pass = getMaxPass(dg.getPlayType(), order);
					int index = 0;
					for ( int j = 0; j < loop; j++ ) {
						String nBetCode = "";
						
						int betCounter = 0;
						
						for ( int i = 0; i < _betCodes.length; i++ ) {
							betCounter += _betCodes[i].split(",").length;
							if ( (i+1) % pass == 0 ) {
								nBetCode += _betCodes[i];
								list.add(new LotteryTicket(order, dg.getPlayType(), nBetCode, betCounter, "1c1", maxMult));
								index++;
								nBetCode = "";
								betCounter = 0;
							} else {
								nBetCode += _betCodes[i] + "|";
							}
						}
						if ( _betCodes.length % pass != 0 ) {
							nBetCode = nBetCode.substring(0, nBetCode.length() - 1);
							list.add(new LotteryTicket(order, dg.getPlayType(), nBetCode, betCounter, "1c1", maxMult));
							index++;
						}
					}
					if ( mod != 0 ) {
						String nBetCode = "";
						int betCounter = 0;
						for ( int i = 0; i < _betCodes.length; i++ ) {
							betCounter += _betCodes[i].split(",").length;
							if ( (i+1) % pass == 0 ) {
								nBetCode += _betCodes[i];
								list.add(new LotteryTicket(order, dg.getPlayType(),nBetCode, betCounter, "1c1", mod));
								index++;
								nBetCode = "";
								betCounter = 0;
							} else {
								nBetCode += _betCodes[i] + "|";
							}
						}
						if ( _betCodes.length % pass != 0 ) {
							nBetCode = nBetCode.substring(0, nBetCode.length() - 1);
							list.add(new LotteryTicket(order, dg.getPlayType(), nBetCode, betCounter, "1c1", mod));
						}
					}
				}
			}
		}
	
		return list;
	}
	
	private int getMaxPass( String splayType, LotteryOrder order ) {
		int playType = Integer.parseInt(splayType);
		int retObj = 0;
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ ) {
			switch ( playType ) {
			case GameUtil.JCZQSPF : 
				retObj = JcUtil.JCZQ_SPF_MAX_PASS;
				break;
			case GameUtil.JCZQRQSPF : 
				retObj = JcUtil.JCZQ_SPF_MAX_PASS;
				break;
			case GameUtil.JCZQZJQ : 
				retObj = JcUtil.JCZQ_ZJQ_MAX_PASS;
				break;
			case GameUtil.JCZQBQCSPF : 
				retObj = JcUtil.JCZQ_BQC_MAX_PASS;
				break;
			case GameUtil.JCZQBF : 
				/* 存在3场以上全选的比分的情况下，每张彩票放三场比赛 */
				String[] codes = order.getBetCode().split("\\|");
				int allSelected = 0;
				for ( String code : codes ) {
					if ( code.split(",").length == 31 )
						allSelected++;
				}
				if ( allSelected > 3 )
					retObj = 3;
				else
					retObj = JcUtil.JCZQ_BF_MAX_PASS;
				break;
			}
		} else if ( order.getLicenseId() == Constants.LICENSE_JCLQ ) {
			switch ( playType ) {
			case GameUtil.JCLQSF : 
				retObj = JcUtil.JCLQ_SF_MAX_PASS;
				break;
			case GameUtil.JCLQRFSF : 
				retObj = JcUtil.JCLQ_RFSF_MAX_PASS;
				break;
			case GameUtil.JCLQSFC : 
				retObj = JcUtil.JCLQ_SFC_MAX_PASS;
				break;
			case GameUtil.JCLQDXF : 
				retObj = JcUtil.JCLQ_DXF_MAX_PASS;
				break;
			}
		}
		return retObj;
	}

}
