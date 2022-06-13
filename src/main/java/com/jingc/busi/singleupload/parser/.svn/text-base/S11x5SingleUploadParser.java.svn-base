package com.jingc.busi.singleupload.parser;

public class S11x5SingleUploadParser implements SingleUploadParserWithPlayId {
	
	@Override
	public String parseLine(String fileContent) {
		return null;
	}
	
	/**
	 * 解析单式上传文件
	 */
	@Override
	public String parseLine(int playId, String line) {
		String retObj = null;
		switch ( playId ) {
		case 1:
			retObj = this.parse(line, 1);
			break;
		case 2:
			retObj = this.parse(line,2);
			break;
		case 3:
			retObj = this.parse(line,3);
			break;
		case 4:
			retObj = this.parse(line,4);
			break;
		case 5:
			retObj = this.parse(line,5);
			break;
		case 6:
			retObj = this.parse(line,6);
			break;
		case 7:
			retObj = this.parse(line,7);
			break;
		case 8:
			retObj = this.parse(line,8);
			break;
		case 9:
			line = line.replaceAll("\\|", ",");
			retObj = this.parse(line,2);
			retObj = retObj.replaceAll(",", "|");
			break;
		case 10:
			retObj = this.parse(line,2);
			break;
		case 11:
			line = line.replaceAll("\\|", ",");
			retObj = this.parse(line,3);
			retObj = retObj.replaceAll(",", "|");
			break;
		case 12:
			retObj = this.parse(line,3);
			break;
		}
		return retObj;
	}
	
	/**
	 * 
	 * @param fileContent，格式：01,02,03,04,05 或  01 02 03 04 05
	 * @param len
	 * @return
	 */
	private String parse(String fileContent, int len) {
		fileContent = fileContent.replaceAll(" ", ",");
		String[] ss = fileContent.split(",");
		if ( ss.length != len ) {
			return null;
		}
		for ( String s : ss ) {
			if( s.trim().length() != 2 ) {
				return null;
			}
			try {
				if ( !(Integer.valueOf(s.trim()) > 0 && Integer.valueOf(s.trim()) < 12) ) {
					return null;
				}
			} catch ( Exception e ) {
				return null;
			}
		}
		return fileContent;
	}
	
	public static void main(String[] args) {
		String s = "1|2,3";
		System.out.println(s.replaceAll("\\|", ","));
	}
}
