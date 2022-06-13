package com.jingc.busi.singleupload.parser;

public class FootballSfcSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String line) {
		String _line = line.replaceAll("[^310]", "").trim();
		//长度为14
		if ( _line.length() == 14 ) {
			char[] chs = _line.toCharArray();
			String retObj = "";
			for ( char ch : chs ) {
				retObj += ch + ",";
				//字符必须为3,1,0
				if ( ch != '3' && ch != '1' && ch != '0' ) {
					return null;
				}
			}
			retObj = retObj.substring(0, retObj.length()-1);
			return retObj;
		} else {
			// 复式上传
			String[] bets = line.split(",");
			if ( bets.length == 14 ) {
				for ( String bet : bets ) {
					if ( bet.length() > 3 ) {
						return null;
					}
					char[] chs = bet.toCharArray();
					for ( char ch : chs ) {
						//字符必须为3,1,0
						if ( ch != '3' && ch != '1' && ch != '0' ) {
							return null;
						}
					}
				}
				return line;
			} else {
				return null;
			}
		}
		
	}
	
	public static void main(String[] args) {
		String s = "3105";
		System.out.println(s.contains("[^310]"));
	}
}
