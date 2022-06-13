/**
 * 
 */
package com.jingc.busi.login.service;

import java.util.List;

import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberMessage;
import com.jingc.busi.common.table.Store;

/**
 * <p>File: LoginService.java</p>
 * <p>Desc: 注册、登陆、找回密码、退出 业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface LoginService {

	/**
	 * 查询彩民账户资金
	 * @param userid
	 * @return Double[现金账户，赠金账户，冻结总额，账户可投注资金，可以取款]
	 */
	public Double[] getAccount(Integer userid);
	
	/**
	 * 查询彩民账户
	 * @param userid
	 */
	public MemberAccount getMemberAccount(Integer userid);
	
	/**
	 * 彩民登录
	 * @param storeid,店铺编号
	 * @param username
	 * @param password
	 * @return
	 */
	public Member login(Integer storeid, String username, String password, String ip);
	
	/**
	 * 登陆
	 * @param storeid
	 * @param username
	 * @param password
	 * @param ip
	 * @return
	 */
	public List<Member> reg(Integer storeid, String username, String password, String ip);
	
	/**
	 * 彩民登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Member commonLogin(String username, String password);
	
	/**
	 * 注册
	 * @param storeid
	 * @param username
	 * @param password
	 * @param phone
	 * @param reserved2 账户安全级别
	 */
	public Member registe(Integer storeid, String username, String password ,String phone,String reserved2 , String agentId);
	
	/**
	 * 根据url得到店铺
	 * @param url
	 * @return
	 */
	public Store getStore(String url);
	
	/**
	 * 根据店铺id得到店铺
	 * @param storeId
	 * @return
	 */
	public Store getStore(Integer storeId);
	/**
	 * 查询站内信总条数
	 * @param userId
	 * @return
	 */
	public int getMessageTotal(Integer acceptUserId);
	/**
	 * 向店主发送站内信 zh
	 */
	public void sendMessage(Integer mId,Integer sId, String title,String message);

	/**
	 *获取一个彩民信息 
	 */
	public Member getOneMember(Integer mId);
}
