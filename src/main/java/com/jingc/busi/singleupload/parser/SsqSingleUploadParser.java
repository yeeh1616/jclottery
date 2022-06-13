package com.jingc.busi.singleupload.parser;

public class SsqSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String fileContent) {
		String retObj = "";
		fileContent = fileContent.replaceAll("\\|", "").replaceAll("\\+", "").replaceAll(",", "").replaceAll(" ", "");
		if ( fileContent.length() != 14 ) {
			return null;
		}
		String[] qianLines = new String[6];
		String[] houLines = new String[1];
		char[] chs = fileContent.toCharArray();
		for ( int i = 0; i < 6; i++ ) {
			qianLines[i] = chs[i*2] + "" + chs[i*2 + 1];
		}
		for ( int i = 0; i < 1; i++ ) {
			houLines[i] = chs[12+i*2] + "" + chs[12+i*2 + 1];
		}
		
		//遍历前区号码
		for ( String qianLine : qianLines ) {
			//前区号码长度为2，且在01-33之间
			if ( qianLine.length() == 2
					&& (Integer.parseInt(qianLine) <= 33 && Integer
							.parseInt(qianLine) > 0) ) {
				retObj += qianLine + ",";
			} else {
				return null;
			}
		}
		retObj = retObj.substring(0, retObj.length()-1) + "+";
		//遍历后区号码
		for ( String houLine : houLines ) {
			//后区号码长度为2，且在01-16之间
			if ( houLine.length() == 2
					&& (Integer.parseInt(houLine) <= 16 && Integer
							.parseInt(houLine) > 0) ) {
				retObj += houLine + ",";
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
