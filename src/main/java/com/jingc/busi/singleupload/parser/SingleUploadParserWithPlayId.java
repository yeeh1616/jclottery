/**
 * 
 */
package com.jingc.busi.singleupload.parser;

/**
 * <p>File: SingleUploadService.java</p>
 * <p>Desc: 单式上传业务</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京九歌在线科技有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-11-26
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface SingleUploadParserWithPlayId extends SingleUploadParser {

	/**
	 * 解析单式上传文件
	 * @param fileContent
	 * @return
	 */
	public String parseLine(int playId, String line);
}
