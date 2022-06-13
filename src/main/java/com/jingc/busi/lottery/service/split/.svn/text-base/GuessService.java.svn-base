/*
 *    Copyright (c) 2011-2012 87cn Ltd.
 *    All rights reserved
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.BetCalcTool;
import com.jingc.afc.util.CombAlgorithm;
import com.jingc.afc.util.JcUtil;

public class GuessService {
	
	private static GuessService instance = new GuessService();
	
	// 竞彩混合单关拆分对象定义
	public static class DgGuess {
		private String playType;
		private String betCode;
		public String getPlayType() {
			return playType;
		}
		public void setPlayType(String playType) {
			this.playType = playType;
		}
		public String getBetCode() {
			return betCode;
		}
		public void setBetCode(String betCode) {
			this.betCode = betCode;
		}
	}
	
	private GuessService(){}
	
	public static GuessService getInstance() {
		return instance;
	}
	
	/**
	 * 自由过关方式拆分
	 * @param betCode
	 * @param cTring,3C1
	 * @return
	 */
	public List<List<String>> findFreeCrossingCode(String betCode, String cTring) {
		CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
		String[] _bCode = betCode.split("\\|");
		List<List<String>> list = combAlgorithm.findJcComb(_bCode, _bCode.length, Integer.parseInt(cTring.toUpperCase().split("C")[0]));
		return list;
	}
	
	/**
	 * 竞彩大复式拆分->子复式
	 * @param betCode,格式：20120428001:3,1,0:0|20120428002:1:0|20120428003:0:0|20120428004:1:0|20120428005:3:0|20120428006:1:0|20120428007:0:0|20120428008:1:0
	 * @param cTring,3C1,3C4
	 */
	public ArrayList<String> getDivBetCode(String betCode, String cTring) {
		String[] _cString = cTring.split(",");
		String[] _bCode = betCode.split("\\|");
		CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
		ArrayList<String> result = new ArrayList<String>();
		for ( String cString : _cString ) {
			if ( "1".equals(cString.split("c")[1]) ) {  /** 自由过关 */
				List<List<String>> list = combAlgorithm.findJcComb(_bCode, _bCode.length, Integer.parseInt(cString.split("c")[0]));
				
				for ( List<String> lst : list ) {
					long moneyLimited = 1;
					String beforeArea = "";
					String afterArea = "";
					for ( String sl : lst ) {
						String slt = sl.substring(sl.indexOf(":")+1, sl.lastIndexOf(":"));
						if ( moneyLimited * slt.split(",").length > 10000 ) {
							afterArea += sl + "|";
						} else {
							beforeArea += sl + "|";
						}
						moneyLimited *= slt.split(",").length;
					}
					if ( "".equals(afterArea) ) {
						result.add(beforeArea.substring(0, beforeArea.length()-1));
						continue;
					}
					List<String> llst = findNmComb(afterArea.substring(0, afterArea.length()-1));
					for ( String s : llst ) {
						String nwString = beforeArea + s;
						nwString = nwString.substring(0, nwString.length() - 1);
						result.add(nwString);
					}
					
				}
			} else { /** 组合过关 */
				String[] _cTring = JcUtil.COMB_CR_MAP.get(cString.toLowerCase());
				for ( String s : _cTring ) {
					List<List<String>> list = combAlgorithm.findJcComb(_bCode, _bCode.length, Integer.parseInt(s.split("c")[0]));
					for ( List<String> lst : list ) {
						long moneyLimited = 1;
						String beforeArea = "";
						String afterArea = "";
						for ( String sl : lst ) {
							String slt = sl.substring(sl.indexOf(":")+1, sl.lastIndexOf(":"));
							if ( moneyLimited * slt.split(",").length > 10000 ) {
								afterArea += sl + "|";
							} else {
								beforeArea += sl + "|";
							}
							moneyLimited *= slt.split(",").length;
						}
						if ( "".equals(afterArea) ) {
							result.add(beforeArea.substring(0, beforeArea.length()-1));
							continue;
						}
						List<String> llst = findNmComb(afterArea.substring(0, afterArea.length()-1));
						for ( String ss : llst ) {
							String nwString = beforeArea + ss;
							nwString = nwString.substring(0, nwString.length() - 1);
							result.add(nwString);
						}
					}
				}
			}
		}
		return result;
	}
	
	/**
	 * 胆拖后重新排序场次 Added by Luochang at 2013/01/29
	 * @param betCode
	 * @return
	 */
	public String reSortSch(String betCode) {
		String retObj = "";
		String[] codes = betCode.split("\\|");
		int len = codes.length;
		for ( int i = 0; i < len - 1; i++ ) {
			for ( int j = i + 1; j < len; j++ ){
				if ( Long.parseLong(codes[i].split(":")[0]) > Long.parseLong(codes[j].split(":")[0]) ) {
					String tCode = codes[i];
					codes[i] = codes[j];
					codes[j] = tCode;
				}
			}
		}
		for ( int i = 0; i < len; i++ ) {
			retObj += codes[i] + "|";
		}
		retObj = retObj.substring(0, retObj.length() - 1);
		
		return retObj;
	}
	
	/**
	 * <p>Desc:胆拖投注中将投注串转成单式  added at 2012/07/31 for 竞彩胆拖投注</p>
	 * @param betString,格式：20120428001:3,1,0:1|20120428002:1:2|20120428003:0:1|20120428004:1:1|20120428005:3:2
	 * 	<p>其中，第二个':'后中的1表示拖，2-胆，如串'20120428001:3,1,0:1'表示场次：20120428001，彩果：3,1,0，为拖</p>
	 * @param cTring,3C1,3C4
	 * @return
	 */
	public List<String> tsfToSingleCode( String betString, String cTring ) {
		List<String> betCodes = new ArrayList<String>();
		String[] codes = betString.split("\\|");
		
		List<String> gutCodes = new ArrayList<String>();
		List<String> dragCodes = new ArrayList<String>();
		for ( String code : codes ) {
			String[] codeSplit = code.split(":");
			if ( "2".equals(codeSplit[2]) ) {
				gutCodes.add(code);	
			} else {
				dragCodes.add(code);	
			} 
		}
		
		String _dbetStr = "";
		for (String _s : gutCodes) {
			_dbetStr += _s + "|";
		}
		_dbetStr = _dbetStr.substring(0, _dbetStr.length()-1);
		List<String> _dsingleCodes = findNmComb(_dbetStr);
			
		CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
		String[] _cString = cTring.split(",");
		for ( String cString : _cString ) {
			if ( "1".equals(cString.split("c")[1]) ) { /** 镊敱杩囧叧 */
				List<List<String>> list = combAlgorithm.findJcComb(dragCodes.toArray(new String[0]), 
						dragCodes.size(), Integer.parseInt(cString.split("c")[0])-gutCodes.size());
				for ( List<String> lst : list ) {
					String _betStr = "";
					for ( String _s : lst ) {
						_betStr += _s + "|";
					}
					_betStr = _betStr.substring(0, _betStr.length()-1);
					
					betCodes.add(reSortSch(_dbetStr + "|" + _betStr));
					
				}
			} else { 
				String[] _cTring = JcUtil.COMB_CR_MAP.get(cString.toLowerCase());
				for ( String s : _cTring ) {
					List<List<String>> list = combAlgorithm.findJcComb(dragCodes.toArray(new String[0]), 
							dragCodes.size(), Integer.parseInt(s.split("c")[0])-gutCodes.size());
					for ( List<String> lst : list ) {
						String _betStr = "";
						for ( String _s : lst ) {
							_betStr += _s + "|";
						}
						_betStr = _betStr.substring(0, _betStr.length()-1);
						
						betCodes.add(reSortSch(_dbetStr + "|" + _betStr));
					}
				}
			}
		}
		
		return betCodes;
	}
	
	/**
	 * 计算组合过关注数
	 * @param betCodes
	 * @param cString
	 * @return
	 */
	public int calcCombPtBetNum(String[] betCodes, String cString) {
		CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
		String[] _cTring = JcUtil.COMB_CR_MAP.get(cString.toLowerCase());
		int betNum = 0;
		for ( String s : _cTring ) {
			List<List<String>> list = combAlgorithm.findJcComb(betCodes, 
					betCodes.length, Integer.parseInt(s.split("c")[0]));
			for ( List<String> lst : list ) {
				int subNum = 1;
				for ( String bs : lst ) {
					subNum *= bs.split(",").length;
				}
				betNum += subNum;
			}
		}
		return betNum;
	}
	
	/**
	 * 计算自由过关注数
	 * @param betCode, 格式 :周一001[3,1]/周一002[3,1]/周一003[3,1,0]/周一004[3,1,0]
	 * @param cString,过关方式,3c1
	 * @return
	 */
	public int calcFreePtBetNum( String betCode, String cString ) {
		int betNum = 0;
		
		CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
		
		String[] betCodes = betCode.split("/");
		
		if ( betCodes.length >= Integer.parseInt(cString.split("c")[0]) ) {
			List<List<String>> list = combAlgorithm.findJcComb(betCodes, 
					betCodes.length, Integer.parseInt(cString.split("c")[0]));
			
			for ( List<String> lst : list ) {
				int subNum = 1;
				for ( String bs : lst ) {
					subNum *= bs.split(",").length;
				}
				betNum += subNum;
			}
		}
		
		return betNum;
	}
	
	public List<String> findNmComb( String betString ) {
		List<String> betCodes = new ArrayList<String>();
		String[] ops = betString.split("\\|");
		String[] before = ops[0].split(":");
		for ( int i = 0; i < before[1].split(",").length; i++ ) {
			String _tArr = before[0] + ":" + before[1].split(",")[i] + ":0|";
			findSubNmComb( betCodes, _tArr, ops, ops.length-1 );
		}
		return betCodes;
	}
	
	private void findSubNmComb( List<String> result, String tArr, String[] ops, int n ) {
		if ( n == 0 ) {
			result.add(tArr);
		} else {
			String[] before = ops[ops.length-n].split(":");
			for ( int i = 0; i < before[1].split(",").length; i++ ) {
				String _tArr = new String(tArr);
				_tArr += before[0] + ":" + before[1].split(",")[i] + ":0|";
				findSubNmComb( result, _tArr, ops, n-1 );
			}
		}
	}
	
	public List<String> toHhList(String hhCode) {
		List<String> list = new ArrayList<String>();
		String source = null;
		String[] perCode = hhCode.split(",");
		for ( int i = 0; i < perCode.length; i++ ) {
			String code = perCode[i];
			if ( source == null ) {
				source = code + ",";
				
				if ( i == perCode.length - 1 ) {
					source = source.substring(0, source.length() -1 );
					list.add(source);
				}
			} else {
				if ( Integer.parseInt(source.split(",")[0].split("-")[0]) == Integer.parseInt(code.split("-")[0]) ) {
					source += code + ",";
					if ( i == perCode.length - 1 ) {
						source = source.substring(0, source.length() -1 );
						list.add(source);
					}
				} else {
					source = source.substring(0, source.length() -1 );
					list.add(source);
					
					source = code + ",";
					
					if ( i == perCode.length - 1 ) {
						source = source.substring(0, source.length() -1 );
						list.add(source);
					}
				}
			}
		}
		return list;
	}
	
	// 混合单关拆分 added at 2015/05/14
	public List<DgGuess> findDgNmHhComb( String betString ) {
		List<DgGuess> list = new ArrayList<DgGuess>();
		String[] ops = betString.split("\\|");
		// 使用Map存放
		Map<String, String> map = new Hashtable<String, String>();
		for ( String code : ops ) {
			// 拆分玩法，而后存入map中
			String[] before = code.split(":");
			List<String> codes = toHhList(before[1]);
			for ( String sc : codes ) {
				String play = sc.split(",")[0].split("-")[0];
				String betCode = null;
				if ( map.get(play) != null ) {
					betCode = map.get(play) + "|" + before[0] + ":";
				} else {
					betCode = before[0] + ":";
				}
				String[] ss = sc.split(",");
				for ( String s : ss ) {
					betCode += s.split("-")[1] + ",";
				}
				betCode = betCode.substring(0, betCode.length() - 1) + ":0";
				
				map.put(play, betCode);
			}
		}
		
		Iterator<String> ki = map.keySet().iterator();
		while ( ki.hasNext() ) {
			String key = ki.next();
			DgGuess dg = new DgGuess();
			dg.setPlayType(key);
			dg.setBetCode(map.get(key));
			
			list.add(dg);
		}
		
		return list;
	}
	
	/**
	 * 混串拆分
	 * @param betString
	 * @return
	 */
	public List<String> findNmHhComb( String betString ) {
		List<String> betCodes = new ArrayList<String>();
		String[] ops = betString.split("\\|");
		String[] before = ops[0].split(":");
		List<String> codes = toHhList(before[1]);
		for ( String code : codes ) {
			String _tArr = before[0] + ":" + code + ":"+before[2]+"|";
			findSubHhNmComb( betCodes, _tArr, ops, ops.length-1 );
		}
			
		return betCodes;
	}
	
	private void findSubHhNmComb( List<String> result, String tArr, String[] ops, int n ) {
		if ( n == 0 ) {
			result.add(tArr.substring(0, tArr.length()-1));
		} else {
			String[] before = ops[ops.length-n].split(":");
			List<String> codes = toHhList(before[1]);
			for ( String code : codes ) {
				String _tArr = new String(tArr);
				_tArr += before[0] + ":" + code + ":"+before[2]+"|";
				findSubHhNmComb( result, _tArr, ops, n-1 );
			}
			
		}
	}
	
	public int getBetNumber(String codes,String type_){
		int bet_num = 0;
		List<String> list = getDivBetCode(codes, type_);
		for(String code:list){
			int length_ = code.split("\\|").length;//子复式的串长
			bet_num += BetCalcTool.countBet(code,length_+"C1");
		}
		return bet_num;
	}
	
	public static void main(String[] args) {
		GuessService service = new GuessService();
		List<DgGuess> ss = service.findDgNmHhComb("20130701001:1-3,1-1,2-1:0|20130701002:1-1,2-1,2-2:0");
		for ( DgGuess s : ss ) {
			System.out.println(s.getPlayType() + " " + s.getBetCode());
		}
		//20130701001:1-3,1-1,6-1:0|20130701002:6-1,2-1,2-2:0
		//20130701001:1-3,1-1,6-1,2-3,4-4,4-5:0|20130701002:2-4:0|20130702001:2-2,4-3:0
		/*List<String> list = service.findNmHhComb("20130701001:1-3,1-1,6-1,2-3,4-4,4-5:0|20130701002:2-4,2-1:0|20130702001:2-2,4-3:0");
		for ( String s : list ) {
			System.out.println(s);
		}*/
	}

}
