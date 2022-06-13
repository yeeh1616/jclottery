/**
 * 
 */
package com.jingc.busi.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberLoginLogMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMessageMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.mapper.StoreMessageMapper;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberLoginLog;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreMessage;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.MessageStateType;

/**
 * <p>File: LoginServiceImpl.java</p>
 * <p>Desc: 注册、登陆、找回密码、退出 业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private MemberAccountMapper memberAccountMapper;
	
	@Resource
	private MemberMapper memberMapper;
	
	@Resource
	private StoreMapper storeMapper;
	
	@Resource
	private MemberLoginLogMapper memberLoginLogMapper;
	
	@Resource
	private MemberMessageMapper memberMessageMapper;
	
	@Resource
	private StoreMessageMapper storeMessageMapper;
	/**
	 * 查询彩民账户资金
	 * @param userid
	 * @return Double[现金账户，赠金账户(红包)，冻结总额，账户可投注资金，可以取款]
	 */
	public Double[] getAccount(Integer userid) {
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(userid);
		double amountUsedGetMoney = 0;
		double amountUsed = 0, noDrow = 0, given = 0;
		if ( null != ma.getBonusAccount() ) {
			amountUsed += ma.getBonusAccount();
		}
		if ( null != ma.getCanDrawalsAccount() ) {
			amountUsed += ma.getCanDrawalsAccount();
			noDrow = ma.getCanDrawalsAccount();
		}
		if ( null != ma.getMoneyAccount() ) {
			amountUsed += ma.getMoneyAccount();
			amountUsedGetMoney = ma.getMoneyAccount();
		}
		if ( null != ma.getGivenAccount() ) {
			amountUsed += ma.getGivenAccount();
			given = ma.getGivenAccount();
		}
		if ( null != ma.getFrozenAccount() ) {
			amountUsed = amountUsed - ma.getFrozenAccount();
			amountUsedGetMoney = amountUsedGetMoney - ma.getFrozenAccount();
		}
		//double amountUsed = ma.getMoneyAccount() + ma.getCanDrawalsAccount() + ma.getBonusAccount() + ma.getGivenAccount() - ma.getFrozenAccount();//可投注账户 zh
		//double amountUsedGetMoney = ma.getCanDrawalsAccount() - ma.getFrozenAccount();//可提款账户
		return new Double[]{ma.getMoneyAccount() + noDrow , given , ma.getFrozenAccount() , amountUsed , amountUsedGetMoney};
	}
	
	/***
	 * 一个彩民账户
	 */
	public MemberAccount getMemberAccount(Integer userid){
		return this.memberAccountMapper.selectByPrimaryKey(userid);
	}
	
	/**
	 * 彩民登录
	 * @param storeid,店铺编号
	 * @param username
	 * @param password
	 * @return
	 */
	public Member login(Integer storeid, String username, String password, String ip) {
		if ( null != password ) {
			password = com.jingc.afc.util.MD5.toMD5WithJDK(password).toUpperCase();
		} else {
			return null;
		}
		Member m = this.memberMapper.selectStoreMember(storeid, username, password);
		if ( null != m && null != ip ) {
			// 记录登录日志
			MemberLoginLog log = new MemberLoginLog();
			log.setLogIp(ip);
			log.setMemberId(m.getId());
			log.setStoreId(m.getStoreId());
			log.setMemberName(m.getMemberName());
			log.setLogTime(DateUtil.getDateFormat2());
			this.memberLoginLogMapper.insert(log);
		}
		return m;
	}
	
	/***
	 * 登陆
	 */
	public List<Member> reg(Integer storeid, String username, String password, String ip) {
		if ( null != password ) {
			password = com.jingc.afc.util.MD5.toMD5WithJDK(password).toUpperCase();
		}
		List<Member>  m = this.memberMapper.selectMemberReg(null, username, password);
		return m;
	}
	
	/**
	 * 彩民登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Member commonLogin(String username, String password) {
		if ( null == username || "".equals(username) ) {
			return null;
		}
		if ( null != password ) {
			password = com.jingc.afc.util.MD5.toMD5WithJDK(password);
		} else if ( null == password || "".equals(password) ) {
			return null;
		}
		return this.memberMapper.selectMember(username, password);
	}
	
	
	/**
	 * 注册
	 * @param storeid
	 * @param username
	 * @param password
	 * @param phone
	 * @param reserved2 账户安全级别
	 */
	@Transactional
	public Member registe(Integer storeid, String username, String password ,String phone,String reserved2 , String agentId) {
		Member mb = new Member();
		mb.setStoreId(storeid);
		mb.setState(1);
		mb.setMemberName(username);
		mb.setLoginPass(com.jingc.afc.util.MD5.toMD5WithJDK(password));
		mb.setPhone(phone);
		mb.setCreateTime(DateUtil.getDateFormat2());
		mb.setMemberFrom(MemberUtil.REGISTER_FROM.WEB);
		mb.setReserved2(reserved2);//账户安全级别 
		
		//代理推广
		try{
			if(agentId == null) agentId = "";
			if(agentId.length() > 0){
				Member curAgentMember = this.memberMapper.selectByPrimaryKey(Integer.parseInt(agentId));
				if(curAgentMember != null){
					mb.setReserved3(MemberUtil.COMMON);
					mb.setReserved4(agentId);
				}else{
					throw new BaseException("[代理不存在]");
				}
			}
		}catch(Exception e){
			throw new BaseException("[代理推广地址错误]");
		}
		
		this.memberMapper.insert(mb);
		//mb.setId((int)this.memberMapper.selectLastSeq());
		
		MemberAccount ma = new MemberAccount();
		ma.setMemberId(mb.getId());
		ma.setStoreId(storeid);
		ma.setCanDrawalsAccount(0d);
		ma.setBonusAccount(0d);
		ma.setMoneyAccount(0d);
		ma.setGivenAccount(0d);
		ma.setFrozenAccount(0d);
		ma.setScoreAccount(0d);
		ma.setState(1);
		ma.setVision(1);
		ma.setCreateTime(DateUtil.getDateFormat2());
		this.memberAccountMapper.insert(ma);
		
		return mb;
	}
	
	/**
	 * 根据url得到店铺
	 * @param url
	 * @return
	 */
	public Store getStore(String url) {
		return this.storeMapper.selectByUrl(url);
	}
	
	/**
	 * 根据店铺id得到店铺
	 * @param storeId
	 * @return
	 */
	public Store getStore(Integer storeId){
		return this.storeMapper.selectByPrimaryKey(storeId);
	}
	/**
	 * 查询站内信总条数
	 * @param userId
	 * @return
	 */

	@Override
	public int getMessageTotal(Integer acceptUserId) {
		int cc = this.memberMessageMapper.selectWCountByParamZNX(acceptUserId);
		return cc;
	}

	@Override
	public void sendMessage(Integer mId, Integer sId, String title, String message) {
		StoreMessage sm = new StoreMessage();
		sm.setSendUserId(mId);
		sm.setAcceptUserId(sId);
		sm.setTitle(title);
		sm.setContent(message);
		sm.setState(MessageStateType.READ_STATE.UNREAD);
		sm.setType(MessageStateType.STORE_MSG_TYPE.SYSTEMMSG);
		sm.setSendTime(DateUtil.getDateFormat2());
		sm.setReserved2(MessageStateType.SEND_DEL_STATE.NODELETE+"");
		this.storeMessageMapper.insert(sm);
	}
	
	/**
	 *获取一个彩民信息 
	 */
	public Member getOneMember(Integer mId){
		return this.memberMapper.selectByPrimaryKey(mId);
	}
}
