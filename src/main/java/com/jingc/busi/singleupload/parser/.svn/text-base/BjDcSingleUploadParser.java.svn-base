/**
 * 
 */
package com.jingc.busi.singleupload.parser;

/**
 * <p>File: BjDcSingleUploadParser.java</p>
 * <p>Desc: 北京单场单式上传文件解析</p>
 * <p>Copyright: Copyright (c) 2015</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-09-10
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class BjDcSingleUploadParser implements
		GuessSingleUploadParser {
	
	@Override
	public String parseSingleFileLine(int playId, String fileContent, int schNum, int passLen, boolean withSch) {
		fileContent = fileContent.replaceAll(",", "").replaceAll("-", "").replaceAll("\\s+", "");
		String list = null;
		switch ( playId ) {
		case 2:
			if ( !withSch ) {
				list = parseSpf(fileContent, schNum, passLen);
			}
			break;
		case 5:
			if ( !withSch ) {
				list = parseZjq(fileContent, schNum, passLen);
			}
			break;
		case 4:
			if ( !withSch ) {
				list = parseBqc(fileContent, schNum, passLen);
			}
			break;
		case 6:
			if ( !withSch ) {
				list = parseSxds(fileContent, schNum, passLen);
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
	
	/**
	 * 上下单双
	 * （3代表上单，2-上双，1代表下单，0代表下双）
	 */
	private String parseSxds(String fileContent, int schNum, int passLen) {
		String list = "";
		char[] chs = fileContent.toCharArray();
		if ( chs.length != schNum ) {
			return null;
		}
		int index = 0;
		for ( char c : chs ) {
			if ( !(c == '3' || c == '1' || c == '0' || c == '2' || c == '#' || c == '*') ) {
				return null;
			}
			if ( c == '3' || c == '1' || c == '2' || c == '0' ) {
				index++;
			}
			char view = c;
			if ( view == '3' ) {
				view = '0';
			} else if ( c == '2' ) {
				view = '1';
			} else if ( c == '1' ) {
				view = '2';
			} else if ( c == '0' ) {
				view = '3';
			}
			list += view + ",";
		}
		if ( index != passLen ) {
			return null;
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
