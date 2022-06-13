package com.jingc.busi.singleupload.parser;

public class DltSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String fileContent) {
		String retObj = "";
		fileContent = fileContent.replaceAll("\\|", "").replaceAll("\\+", "").replaceAll(",", "").replaceAll(" ", "");
		if ( fileContent.length() != 14 ) {
			return null;
		}
		String[] qianLines = new String[5];
		String[] houLines = new String[2];
		char[] chs = fileContent.toCharArray();
		for ( int i = 0; i < 5; i++ ) {
			qianLines[i] = chs[i*2] + "" + chs[i*2 + 1];
		}
		for ( int i = 0; i < 2; i++ ) {
			houLines[i] = chs[10+i*2] + "" + chs[10+i*2 + 1];
		}
		
		//遍历前区号码
		for ( String qianLine : qianLines ) {
			//前区号码长度为2，且在01-35之间
			if ( qianLine.length() == 2
					&& (Integer.parseInt(qianLine) <= 35 && Integer
							.parseInt(qianLine) > 0) ) {
				retObj += qianLine + ",";
			} else {
				return null;
			}
		}
		retObj = retObj.substring(0, retObj.length()-1) + "+";
		//遍历后区号码
		for ( String houLine : houLines ) {
			//后区号码长度为2，且在01-12之间
			if ( houLine.length() == 2
					&& (Integer.parseInt(houLine) <= 12 && Integer
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
		DltSingleUploadParser d = new DltSingleUploadParser();
		System.out.println(d.parseLine("06,11,21,25,28|01,02"));
	}
}
