/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.List;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.BjDcUtil;
import com.jingc.afc.util.CombAlgorithm;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;

/**
 * <p>File: BjDcTicketSplitor.java</p>
 * <p>Desc: 北单（胜负过关除外）拆票</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-8-19
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class BjDcTicketSplitor extends TicketSplitor {
	
	private GuessService jczqService = GuessService.getInstance();

	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		return generateGgTickets(order);
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
			int betNum = 1;
			String[] pCodes =  _betCodes.get(i).split("\\|");
			for ( String pcode : pCodes ) {
				betNum *= pcode.split(",").length;
			}
			list.add(new LotteryTicket(order, order.getPlayType(),_betCodes.get(i), betNum,  _betCodes.get(i).split("\\|").length+"c1", multiple));
		}
	}
	
	private void handleComplex(String betCodes, String _cStr, int betMult,
			List<LotteryTicket> tp, int jcMaxMult, LotteryOrder order) {
		List<List<String>> combCodes = jczqService.findFreeCrossingCode(
				betCodes, _cStr);
		for (List<String> lst : combCodes) {
			// 判断每种过关方式的单倍投注额是否大于2万
			String betCode = "";
			for (String _b_s : lst) {
				betCode += _b_s + "|";
			}
			betCode = betCode.substring(0, betCode.length() - 1);
			List<String> codesList = new ArrayList<String>();
			codesList.add(betCode);
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
					codesList.add(betCode);
					for ( String __betCode : codesList ) {
					int betNum = jczqService.calcCombPtBetNum(__betCode.split("\\|"), combPt);
					if ( betNum > 10000 ) {
						String[] cString = BjDcUtil.COMB_CR_MAP.get(combPt);							
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
				codesList.add(_betCode);
				for ( String __betCode : codesList ) {
				int betNum = jczqService.calcCombPtBetNum(__betCode.split("\\|"), combPt);
				if ( betNum > 10000 ) {
					String[] cString = BjDcUtil.COMB_CR_MAP.get(combPt);							
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

}
