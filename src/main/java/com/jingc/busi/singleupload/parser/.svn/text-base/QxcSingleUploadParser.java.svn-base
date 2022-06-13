package com.jingc.busi.singleupload.parser;

public class QxcSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String fileContent) {
		fileContent = fileContent.replaceAll(",", "");
		String retObj = "";
		//长度为7
		if ( fileContent.length() != 7 ) {
			return null;
		}
		char[] chs = fileContent.toCharArray();
		for ( char ch : chs ) {
			//字符在0-9之间
			if ( ch < 48 || ch > 57 ) {
				return null;
			}
			retObj += ch + ",";
		}
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}
}
