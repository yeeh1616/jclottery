/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.CombAlgorithm;

/**
 * <p>File: FootballService.java</p>
 * <p>Desc: 足彩公用功能</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-3
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class FootballService {
	
	private static FootballService instance = new FootballService();
	
	private FootballService() {
		
	}
	
	public static FootballService getInstance() {
		return instance;
	}
	
	/**
	 * 单式/复式判断
	 * @param betCode
	 * @return
	 */
	public boolean isSingeString(String betCode) {
		boolean result = true;
		String[] codes = betCode.split(",");
		for ( String code : codes ) {
			if( code.length() > 1 ) {
				result = false;
				break;
			}
		}
		return result;
	}
	

	/**
	 * 任选九拆单
	 * @param betString,格式：1:3`0,2:10`1,3:#`#,4:#`#,5:30`1,6:310`1...14:1`0 ，符号"`"后面0表示胆，1表示非胆
	 * @return
	 */
	public List<String> divRxjBetString ( String betString ) {
		List<String> danArea = new ArrayList<String>();
		List<String> area = new ArrayList<String>();
		List<String> result = new ArrayList<String>();
		String[] sch = betString.replaceAll(",", "|").split("\\|");
		for ( String _sch : sch ) {
			String[] pSch = _sch.split("`");
			if ( "0".equals(pSch[1]) ) {
				if ( pSch[0].indexOf('#') == -1 ) {
					danArea.add(pSch[0]);
				}
			} else if ( "1".equals(pSch[1]) ) {
				if ( pSch[0].indexOf('#') == -1 ) {
					area.add(pSch[0]);
				}
			}
		}
		CombAlgorithm<String> c = new CombAlgorithm<String>();
		List<List<String>> list = c.findJcComb(area.toArray(new String[0]), area.size(), 9 - danArea.size());
		for ( List<String> lst : list ) {
			String subBetString = "";
			for ( String ss : danArea ) {
				subBetString += ss + "|";
			}
			for ( String st : lst ) {
				subBetString += st + "|";
			}
			subBetString = subBetString.substring(0, (subBetString.length() - 1));
			/*for ( String s : findNmComb(toBetString(subBetString)) ) {
				result.add(s);
			}*/
			result.add(toBetString(subBetString));
			//System.out.println("RXJ_CODE:"+subBetString);
		}
		return result;
	}
	
	private String toBetString(String str) {
		String toString = "";
		Map<String,String> sch = getSch(str);
		for ( int i = 1; i <= 14; i++ ) {
			if ( sch.containsKey(i+"") ) {
				String bet = sch.get(i+"");
				
				toString += bet.split("`")[0]+"|";
			} else {
				toString += "#|";
			}
		}
		toString = toString.substring(0, toString.length()-1);
		return toString;
	}
	
	private Map<String,String> getSch(String str) {
		Map<String,String> list = new Hashtable<String, String>();
		String[] ss = str.replaceAll(",", "|").split("\\|");
		for ( String s : ss ) {
			String[] _s = s.split(":");
			list.put(_s[0], _s[1]);
		}
		return list;
	}
	
	public List<String> findNmComb( String betString ) {
		List<String> result = new ArrayList<String>();
		String[] ops = betString.replaceAll(",", "|").split("\\|");
		for ( int i = 0; i < ops[0].length(); i++ ) {
			String _tArr = ops[0].split("")[i+1] + "|";
			findSubNmComb( result, _tArr, ops, ops.length-1 );
		}
		return result;
	}
	
	private void findSubNmComb( List<String> result, String tArr, String[] ops, int n ) {
		if ( n == 0 ) {
			result.add(tArr);
		} else {
			for ( int i = 0; i < ops[ops.length-n].length(); i++ ) {
				String _tArr = tArr;
				_tArr += ops[ops.length-n].split("")[i+1] + "|";
//				_tArr = ops[ops.length-n].split(":")[0] + ":" + _tArr + ",";
				findSubNmComb( result, _tArr, ops, n-1 );
			}
		}
	}
	
	/**
	 * 14场胜负彩复式拆分->子复式
	 * @param betString，格式："310|310|10...|31"
	 * @return
	 */
	public List<String> getDivSfcBetString( String betString ) {
		String[] subBetStrings = betString.replaceAll(",", "|").split("\\|");
		long betMoneyLimited = 1;
		StringBuffer stringBuffer = new StringBuffer();
		for ( String subString : subBetStrings ) {
			int currLen = subString.length();
			if ( betMoneyLimited * currLen > 10000 ) {
				break;
			}
			stringBuffer.append(subString + "|");
			betMoneyLimited *= currLen;
		}
		String beforeArea = stringBuffer.toString();
//		beforeArea = beforeArea.substring(0, beforeArea.length() - 1);
		
		List<String> result = new ArrayList<String>();
		if ( beforeArea.length() >= betString.length() ) {
			result.add(beforeArea.substring(0, beforeArea.length()-1));
			return result;
		}
		String afterArea = betString.substring(beforeArea.length());
		List<String> lst = findNmComb(afterArea);
		
		for ( String s : lst ) {
			String nwString = beforeArea + s;
			nwString = nwString.substring(0, nwString.length() - 1);
			result.add(nwString);
		}
		return result;
	}
	
	/**
	 * 获取胜负彩注数
	 * @param betString
	 * @return
	 */
	public int getBetNum( String betString ) {
		String[] subBetStrings = betString.replaceAll(",", "|").split("\\|");
		int betNum = 1;
		for ( String subString : subBetStrings ) {
			int currLen = subString.length();
			betNum *= currLen;
		}
		return betNum;
	}
	
	/**
	 * 计算任选九注数
	 * @param betString
	 * @return
	 */
	public int calcRxjBetNum( String betString ) {
		String[] subBetStrings = betString.replaceAll(",", "|").split("\\|");
		int betNum = 1;
		for ( String subString : subBetStrings ) {
			if ( subString.indexOf('#') == -1 ) {
				betNum *= subString.length();
			}
		}
		return betNum;
	}
	
}
