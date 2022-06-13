package com.jingc.busi.singleupload.parser;


public class FootballBqcSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String line) {
		String _line = line.replaceAll("[^310]", "").trim();
		if ( _line.length() == 12 ) {
			char[] chs = _line.toCharArray();
			String retObj = "";
			for ( char ch : chs ) {
				retObj += ch + ",";
				if ( ch != '3' && ch != '1' && ch != '0' ) {
					return null;
				}
			}
			retObj = retObj.substring(0, retObj.length()-1);
			return retObj;
		} else {
			// 复式上传
			String[] bets = line.split(",");
			if ( bets.length == 12 ) {
				for ( String bet : bets ) {
					if ( bet.length() > 3 ) {
						return null;
					}
					char[] chs = bet.toCharArray();
					for ( char ch : chs ) {
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
}
