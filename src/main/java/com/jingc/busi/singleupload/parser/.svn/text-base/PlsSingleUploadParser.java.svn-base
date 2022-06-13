package com.jingc.busi.singleupload.parser;

public class PlsSingleUploadParser implements SingleUploadParserWithPlayId {
	
	public static final int ZHX_DS = 1;
	public static final int Z3_DS = 2;
	public static final int Z6_DS = 3;

	@Override
	public String parseLine(String fileContent) {
		fileContent = fileContent.replaceAll(",", "");
		String retObj = "";
		//号码长度为3
		if ( fileContent.length() != 3 ) {
			return null;
		}
		char[] chs = fileContent.toCharArray();
		for ( char ch : chs ) {
			//每个字符在0-9之间
			if (ch < 48 || ch > 57) {
				return null;
			}
			retObj += ch + ",";
		}
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}
	
	/**
	 * 组3单式校验
	 * @param fileContent
	 * @return
	 */
	private String parseZ3Line(String fileContent) {
		fileContent = fileContent.replaceAll(",", "");
		String retObj = "";
		//号码长度为3
		if ( fileContent.length() != 3 ) {
			return null;
		}
		char[] chs = fileContent.toCharArray();
		boolean z3Flag = chs[0] == chs[1] || chs[0] == chs[2] || chs[1] == chs[2];
		if ( !z3Flag ) {
			return null;
		}
		for ( char ch : chs ) {
			//每个字符在0-9之间
			if (ch < 48 || ch > 57) {
				return null;
			}
			retObj += ch + ",";
		}
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}
	
	/**
	 * 组6单式校验
	 * @param fileContent
	 * @return
	 */
	private String parseZ6Line(String fileContent) {
		fileContent = fileContent.replaceAll(",", "");
		String retObj = "";
		//号码长度为3
		if ( fileContent.length() != 3 ) {
			return null;
		}
		char[] chs = fileContent.toCharArray();
		/*boolean z3Flag = chs[0] == chs[1] || chs[0] == chs[2] || chs[1] == chs[2];
		if ( z3Flag ) {
			return null;
		}*/
		for ( char ch : chs ) {
			//每个字符在0-9之间
			if (ch < 48 || ch > 57) {
				return null;
			}
			retObj += ch + ",";
		}
		retObj = retObj.substring(0, retObj.length()-1);
		return retObj;
	}
	
	/**
	 * 解析单式上传文件
	 * @param fileContent
	 * @return
	 */
	public String parseLine(int playId, String line) {
		String retObj = null;
		switch ( playId ) {
		case ZHX_DS:
			retObj = this.parseLine(line);
			break;
		case Z3_DS:
			retObj = this.parseZ6Line(line);
			break;
		case Z6_DS:
			retObj = this.parseZ6Line(line);
			break;
		}
		return retObj;
	}
	
	public static void main(String[] args) {
		PlsSingleUploadParser pls = new PlsSingleUploadParser();
		System.out.println(pls.parseLine("123"));
	}
}
