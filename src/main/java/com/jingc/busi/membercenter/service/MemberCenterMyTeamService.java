package com.jingc.busi.membercenter.service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberDrow;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.MergerJoin;


public interface MemberCenterMyTeamService {
	
	/**
     * 团队彩民列表获取
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    //public Pagination getMyTeam(String agentId, Integer pageNo, Integer pageSize);
    
    
    /**
     * 团队彩民列表详情
     */
    public Member getOneMember(Integer id);
    
    
    /**
     * 账户信息
     * @param id
     * @return
     */
    public MemberAccount queryMemberAccount(Integer id);
    
    
    /**
     * 购彩记录
     * @param agentId 用户ID
     * @param pageNo 
     * @param pageSize
     * @return
     */
    public Pagination  getLotteryListByMyTeam(String agentId, LotteryOrder param,Integer pageNo, Integer pageSize);
    
    /**
     * 充值记录
     */
    public Pagination  getRechargeLogByMyTeam(Integer agentId,MemberPayLog param, Integer pageNo, Integer pageSize);
    
    
    /**
     * 取款记录
     */
    public Pagination  getMyTeamDrow(Integer agentId,MemberDrow param,Integer pageNo, Integer pageSize);
    
    
    /**
     * 交易明细
     */
    public Pagination  getMyTeamMoneylog(Integer agentId,MemberMoneyLog param, Integer pageNo, Integer pageSize);
    
    
    /**
	 * author ChenSuibing
	 * 获取用户追号纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getChaseMemberRecord(Integer agentId,ChasingOrder param, Integer pageNo, Integer pageSize);
	
	/**
	 * 
	 * 获取用户追号纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getMyTeamMergerJoin(Integer agentId,Integer pageNo, Integer pageSize,MergerJoin param);
	
	
	/**
	 * 
	 * 获取用户追号纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getMyTeamPrize(Integer agentId,LotteryOrder param, Integer pageNo, Integer pageSize);
	
    
    
}
