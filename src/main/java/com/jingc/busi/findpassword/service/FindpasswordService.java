/**
 * 
 */
package com.jingc.busi.findpassword.service;

import com.jingc.busi.common.table.Member;

/**
 * <p>File: ChartService.java</p>
 * <p>Desc: 走势图业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  ChenXin
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface FindpasswordService {

	/**
	 * 根据店铺id，帐号，得到彩民信息
	 * @param storeid
	 * @param username
	 * @return
	 */
	public Member getMember(Integer storeid,String username);
	
	
	/**
	 * 修改密码
	 * @param param
	 * @return
	 */
	public String updatePass(Member param);
	
}
