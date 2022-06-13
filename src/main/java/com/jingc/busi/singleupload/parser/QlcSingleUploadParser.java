package com.jingc.busi.singleupload.parser;

public class QlcSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String fileContent) {
		String retObj = "";
		fileContent = fileContent.replaceAll("\\|", "").replaceAll("\\+", "").replaceAll(",", "").replaceAll(" ", "");
		if ( fileContent.length() != 14 ) {
			return null;
		}
		String[] qianLines = new String[7];
		char[] chs = fileContent.toCharArray();
		for ( int i = 0; i < 7; i++ ) {
			qianLines[i] = chs[i*2] + "" + chs[i*2 + 1];
		}
		
		for ( String qianLine : qianLines ) {
			
			if ( qianLine.length() == 2
					&& (Integer.parseInt(qianLine) <= 30 && Integer
							.parseInt(qianLine) > 0) ) {
				retObj += qianLine + ",";
			} else {
				return null;
			}
		}
		
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}

	public static void main(String[] args) {
	}
}
