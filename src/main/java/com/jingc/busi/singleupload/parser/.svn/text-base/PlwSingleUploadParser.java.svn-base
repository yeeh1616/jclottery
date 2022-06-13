package com.jingc.busi.singleupload.parser;


public class PlwSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String fileContent) {
		fileContent = fileContent.replaceAll(",", "");
		String retObj = "";
		//号码长度为5
		if ( fileContent.length() != 5 ) {
			return null;
		}
		char[] chs = fileContent.toCharArray();
		for ( char ch : chs ) {
			//每个字符在0-9之间
			if ( ch < 48 || ch > 57 ) {
				return null;
			}
			retObj += ch + ",";
		}
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}
}
