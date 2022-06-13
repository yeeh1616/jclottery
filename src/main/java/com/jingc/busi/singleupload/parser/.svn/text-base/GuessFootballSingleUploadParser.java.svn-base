/**
 * 
 */
package com.jingc.busi.singleupload.parser;

import java.util.Hashtable;
import java.util.Map;

/**
 * <p>File: GuessFootballSingleUploadServiceImpl.java</p>
 * <p>Desc: 竞彩足球单式上传文件解析</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2014-11-26
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class GuessFootballSingleUploadParser implements
		GuessSingleUploadParser {
	
	public final static Map<String, String> JCZQ_BF_TRANSF_R = new Hashtable<String, String>();
	
	static {
		JCZQ_BF_TRANSF_R.put("3A", "0");
		JCZQ_BF_TRANSF_R.put("10", "1");
		JCZQ_BF_TRANSF_R.put("20", "2");
		JCZQ_BF_TRANSF_R.put("21", "3");
		JCZQ_BF_TRANSF_R.put("30", "4");
		JCZQ_BF_TRANSF_R.put("31", "5");
		JCZQ_BF_TRANSF_R.put("32", "6");
		JCZQ_BF_TRANSF_R.put("40", "7");
		JCZQ_BF_TRANSF_R.put("41", "8");
		JCZQ_BF_TRANSF_R.put("42", "9");
		JCZQ_BF_TRANSF_R.put("50", "10");
		JCZQ_BF_TRANSF_R.put("51", "11");
		JCZQ_BF_TRANSF_R.put("52", "12");
		
		JCZQ_BF_TRANSF_R.put("1A", "13");
		JCZQ_BF_TRANSF_R.put("00", "14");
		JCZQ_BF_TRANSF_R.put("11", "15");
		JCZQ_BF_TRANSF_R.put("22", "16");
		JCZQ_BF_TRANSF_R.put("33", "17");
		
		JCZQ_BF_TRANSF_R.put("0A", "18");
		JCZQ_BF_TRANSF_R.put("01", "19");
		JCZQ_BF_TRANSF_R.put("02", "20");
		JCZQ_BF_TRANSF_R.put("12", "21");
		JCZQ_BF_TRANSF_R.put("03", "22");
		JCZQ_BF_TRANSF_R.put("13", "23");
		JCZQ_BF_TRANSF_R.put("23", "24");
		JCZQ_BF_TRANSF_R.put("04", "25");
		JCZQ_BF_TRANSF_R.put("14", "26");
		JCZQ_BF_TRANSF_R.put("24", "27");
		JCZQ_BF_TRANSF_R.put("05", "28");
		JCZQ_BF_TRANSF_R.put("15", "29");
		JCZQ_BF_TRANSF_R.put("25", "30");
	}

	/**
	 *  标准格式要求：
		1、只接受后缀名为“.txt”的记事本文本文档。
		2、一行一注。
		3、支持逗号、空格、横杠进行分隔，不投的场次用*或者#占位（仅支持*和#）。
		4、逗号、空格、横杠均为半角格式下。
		5、支持两种（冒号、箭头）带场次编号的格式。
		标准格式如下：
		<br>胜平负/让球
		（3代表胜，1代表平，0代表负）
		不带场次
		3,3,1,0,3,1
		3-3-1-0-3-1
		331303
		3 3 1 0 3 1
		3,3,1,*,0,3,*,*,1,*,*
		331#03##1
		带场次
		1001:[3]/1002:[3]/1003:[1]/1004:[0]/1005:[3]/1006:[1]
		1001→3,1002→3,1003→1,1004→0,1005→3,1006→1
		
		<br>比分（31代表3：1，3A代表胜其他，1A代表平其他，0A代表负其他）
		11,31,30
		11-31-30
		113130
		11 31 30
		11,31,30,**,**,**
		11##31######30##
		带场次
		1001:[11]/1002:[31]/1003:[30]
		1001→11,1002→31,1003→30
		
		<br>总进球
		0,1,2,4,5,6
		0-1-2-4-5-6
		012456
		0 1 2 4 5 6
		0,1,2,*,4,5,*,*,6
		带场次
		1001:[0]/1002:[1]/1003:[2]/1004:[4]/1005:[5]/1006:[6]
		1001→0,1002→1,1003→2,1004→4,1005→5,1006→6
		
		<br>半全场
		11,31,30,13,33,30
		11-31-30-13-33-30
		113130133330
		11 31 30 13 33 30
		11,31,30,**,13,33,**,**,30,**,**
		113130##1333####30
		带场次
		1001:[11]/1002:[31]/1003:[30]/1004:[13]/1005:[33]/1006:[30]
		1001→11,1002→31,1003→30,1004→13,1005→33,1006→30
		
		（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）
	
	 */
	@Override
	public String parseSingleFileLine(int playId, String fileContent, int schNum, int passLen, boolean withSch) {
		/*if ( fileContent.indexOf('-') > -1 || fileContent.indexOf(',') > -1 ) {
			if ( playId == 4 || playId == 5 ) {
				passLen = fileContent.replaceAll("-", ",").split(",").length;
			}
		}*/
		fileContent = fileContent.replaceAll(",", "").replaceAll("-", "").replaceAll("\\s+", "");
		String list = null;
		switch ( playId ) {
		case 1:
			if ( !withSch ) {
				list = parseSpf(fileContent, schNum, passLen);
			}
			break;
		case 2:
			if ( !withSch ) {
				list = parseSpf(fileContent, schNum, passLen);
			}
			break;
		case 3:
			if ( !withSch ) {
				list = parseZjq(fileContent, schNum, passLen);
			}
			break;
		case 4:
			if ( !withSch ) {
				list = parseBqc(fileContent, schNum, passLen);
			}
			break;
		case 5:
			if ( !withSch ) {
				list = parseBf(fileContent, schNum, passLen);
			}
			break;
		}
		return list;
	}
	
	/**
	 * 胜平负/让球
	 * （3代表胜，1代表平，0代表负）
		不带场次
		3,3,1,0,3,1
		3-3-1-0-3-1
		331303
		3 3 1 0 3 1
		3,3,1,*,0,3,*,*,1,*,*
		331#03##1
	 */
	private String parseSpf(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length != schNum ) {
			return null;
		}
		int index = 0;
		for ( char c : chs ) {
			if ( !(c == '3' || c == '1' || c == '0' || c == '#' || c == '*') ) {
				return null;
			}
			if ( c == '3' || c == '1' || c == '0' ) {
				index++;
			}
			list += c + ",";
		}
		if ( index != passLen ) {
			return null;
		}
		list = list.substring(0, list.length()-1);
		return list;
	}
	
	private String parseBf(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length/2 != schNum ) {
			return null;
		}
		int index = 0;
		for ( int i = 0; i < chs.length; i = i + 2 ) {
			if ( "**".equals(chs[i]+""+chs[i+1]) || "##".equals(chs[i]+""+chs[i+1])
					|| "*#".equals(chs[i]+""+chs[i+1]) || "#*".equals(chs[i]+""+chs[i+1]) ) {
				
			} else if ( JCZQ_BF_TRANSF_R.get(chs[i]+""+chs[i+1]) == null ) {
				return null;
			} else {
				index++;
			}
			list += JCZQ_BF_TRANSF_R.get(chs[i]+""+chs[i+1]) + ",";
		}
		if ( index != passLen ) {
			return null;
		}
		list = list.substring(0, list.length() - 1);
		return list;
	}
	
	private String parseZjq(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length != schNum ) {
			return null;
		}
		int index = 0;
		for ( int i = 0; i < chs.length; i++ ) {
			try {
				if ( chs[i] == '#' || chs[i] == '*' ) {
					
				}
				else if ( Integer.parseInt(chs[i]+"") > 7 ) {
					return null;
				} else {
					index++;
				}
			} catch ( Exception ex ) {
				return null;
			}
			list += chs[i] + ",";
		}
		if ( index != passLen ) {
			return null;
		}
		list = list.substring(0, list.length()-1);
		return list;
	}
	
	private String parseBqc(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length/2 != schNum ) {
			return null;
		}
		for ( char c : chs ) {
			if ( !(c == '3' || c == '1' || c == '0' || c == '#' || c == '*') ) {
				return null;
			}
		}
		for ( int i = 0; i < chs.length; i = i + 2 ) {
			if ( (chs[i] == '3' || chs[i] == '1' || chs[i] == '0') && (chs[i+1] == '#' || chs[i+1] == '*') ) {
				return null;
			}
			list += chs[i] +""+ chs[i + 1] + ",";
		}
		list = list.substring(0, list.length()-1);
		return list;
	}

	@Override
	public String parseLine(String line) {
		// TODO Auto-generated method stub
		return null;
	}
}
