package com.jingc.busi.singleupload.parser;


public class FootballRxjSingleUploadParser implements SingleUploadParser {

	@Override
	public String parseLine(String line) {
		//String aline = line.replaceAll("[^310]", "#").trim();
		String _line = line.replaceAll(",", "").replaceAll("-", "").replaceAll("\\*", "#").replaceAll("\\s+", "");
		if ( _line.length() == 14 ) {
			char[] chs = _line.toCharArray();
			String retObj = "";
			int index = 0;
			for ( char ch : chs ) {
				retObj += ch + ",";
				//字符必须为3,1,0
				if ( ch != '3' && ch != '1' && ch != '0' && ch != '#' ) {
					return null;
				}
				if ( ch == '#' ) {
					index++;
				}
			}
			if ( index > 5) {
				return null;
			} else if ( index < 5 ) {
				return parseComplex(line);
			}
			retObj = retObj.substring(0, retObj.length()-1);
			return retObj;
		} else {
			// 复式上传
			return parseComplex(line);
		}
	}
	
	public String parseComplex(String line) {
		String[] bets = line.split(",");
		if ( bets.length == 14 ) {
			String retObj = "";
			int index = 1;
			for ( String bet : bets ) {
				if ( bet.length() > 3 ) {
					return null;
				}
				char[] chs = bet.toCharArray();
				for ( char ch : chs ) {
					//字符必须为3,1,0
					if ( ch != '3' && ch != '1' && ch != '0' && ch != '#' && ch != '*' ) {
						return null;
					}
				}
				retObj += index + ":" + bet.replaceAll("[*]+", "*").replaceAll("[#]+", "#") + "`1"+",";
				index++;
			}
			retObj = retObj.substring(0, retObj.length()-1);
			return retObj;
		} else {
			return null;
		}
	}

	public static void main(String[] args) {
		String s = "1*00*33*333###1";
		System.out.println(s.replaceAll("[#]+", "#"));
	}
}
