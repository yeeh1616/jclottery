/**
 * 
 */
package com.jingc.busi.singleupload.parser;

import java.util.Hashtable;
import java.util.Map;

/**
 * <p>File: GuessFootballSingleUploadServiceImpl.java</p>
 * <p>Desc: 竞彩篮球单式上传文件解析</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-3-12
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class GuessBasketballSingleUploadParser implements
		GuessSingleUploadParser {
	
	public final static Map<String, String> JCLQ_SFC_TRANSF_R = new Hashtable<String, String>();
	
	static {
		JCLQ_SFC_TRANSF_R.put("01", "0");
		JCLQ_SFC_TRANSF_R.put("02", "1");
		JCLQ_SFC_TRANSF_R.put("03", "2");
		JCLQ_SFC_TRANSF_R.put("04", "3");
		JCLQ_SFC_TRANSF_R.put("05", "4");
		JCLQ_SFC_TRANSF_R.put("06", "5");
		
		JCLQ_SFC_TRANSF_R.put("11", "6");
		JCLQ_SFC_TRANSF_R.put("12", "7");
		JCLQ_SFC_TRANSF_R.put("13", "8");
		JCLQ_SFC_TRANSF_R.put("14", "9");
		JCLQ_SFC_TRANSF_R.put("15", "10");
		JCLQ_SFC_TRANSF_R.put("16", "11");
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
		
		（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）
	
	 */
	@Override
	public String parseSingleFileLine(int playId, String fileContent, int schNum, int passLen, boolean withSch) {
		//fileContent = fileContent.replaceAll(",", "").replaceAll("-", "").replaceAll("#", "").replaceAll("\\*", "").replaceAll("\\s+", "");
		fileContent = fileContent.replaceAll(",", "").replaceAll("-", "").replaceAll("\\s+", "");
		String list = null;
		switch ( playId ) {
		case 1:
			if ( !withSch ) {
				list = parseSf(fileContent, schNum, passLen);
			}
			break;
		case 2:
			if ( !withSch ) {
				list = parseSf(fileContent, schNum, passLen);
			}
			break;
		case 3:
			if ( !withSch ) {
				list = parseSfc(fileContent, schNum, passLen);
			}
			break;
		case 4:
			if ( !withSch ) {
				list = parseDxf(fileContent, schNum, passLen);
			}
			break;
		}
		return list;
	}
	
	/**
	 * 胜负
	 * （3代表胜0代表负）
		不带场次
	 */
	private String parseSf(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length != schNum ) {
			return null;
		}
		int index = 0;
		for ( char c : chs ) {
			if ( !(c == '3' || c == '0' || c == '#' || c == '*') ) {
				return null;
			}
			if ( c == '3' ||  c == '0' ) {
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
	
	private String parseSfc(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length/2 != schNum ) {
			return null;
		}
		int index = 0;
		for ( int i = 0; i < chs.length; i = i + 2 ) {
			if ( "**".equals(chs[i]+""+chs[i+1]) || "##".equals(chs[i]+""+chs[i+1])
					|| "*#".equals(chs[i]+""+chs[i+1]) || "#*".equals(chs[i]+""+chs[i+1]) ) {
				
			} 
			else if ( JCLQ_SFC_TRANSF_R.get(chs[i]+""+chs[i+1]) == null ) {
				return null;
			} else {
				index++;
			}
			list += JCLQ_SFC_TRANSF_R.get(chs[i]+""+chs[i+1]) + ",";
		}
		if ( index != passLen ) {
			return null;
		}
		list = list.substring(0, list.length() - 1);
		return list;
	}
	
	/**
	 * 大小分
	 * （0代表大小1代表小分）
		不带场次
	 */
	private String parseDxf(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length != schNum ) {
			return null;
		}
		int index = 0;
		for ( char c : chs ) {
			if ( !(c == '1' || c == '0' || c == '#' || c == '*') ) {
				return null;
			}
			if ( c == '1' ||  c == '0' ) {
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

	@Override
	public String parseLine(String line) {
		return null;
	}
}
