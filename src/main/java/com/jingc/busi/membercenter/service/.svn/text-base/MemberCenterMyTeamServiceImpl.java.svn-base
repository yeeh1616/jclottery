package com.jingc.busi.membercenter.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.mapper.ChasingOrderMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberDrowMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.MemberPayLogMapper;
import com.jingc.busi.common.mapper.MergerJoinMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberDrow;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.util.member.MemberUtil;

@Service("memberCenterMyTeamService")
public class MemberCenterMyTeamServiceImpl implements MemberCenterMyTeamService{
	
	@Resource private MemberMapper memberMapper; //彩民列表
	
	@Resource private MemberAccountMapper memberAccountMapper; //充值记录
	
	@Resource private LotteryOrderMapper lotteryOrderMapper; //购彩记录
	
	@Resource private MemberPayLogMapper memberPayLogMapper;//充值记录
	
	@Resource private MemberDrowMapper memberDrowMapper;//充值记录
	
	@Resource private MemberMoneyLogMapper memberMoneyLogMapper;//交易明细

	@Resource private ChasingOrderMapper  chasingOrderMapper; //追号记录
	
	@Resource private MergerJoinMapper mergerJoinMapper; //合买记录
	
	/**
	 * 代理彩民查询我的团队
	 */
	public Pagination getMyTeam(String agentId, String memberName,Integer pageNo,
			Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberMapper.selectMyteamCountByParamObject(agentId,memberName);
		pagination.setTotalCount(count);
		List<Member> list = this.memberMapper.selectByTeamObject(agentId ,memberName, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	 /**
     * 团队 彩民列表详情
     */
	@Override
	public Member getOneMember(Integer id) {
		
		return this.memberMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 团队 彩民账户信息  用于详情显示
	 */
	@Override
	public MemberAccount queryMemberAccount(Integer id) {
		return this.memberAccountMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 购彩记录
	 */
	@Override
	public Pagination getLotteryListByMyTeam(String agentId,LotteryOrder param,Integer pageNo,Integer pageSize) {
		
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.lotteryOrderMapper.selectLotteryCountByMyTeam(agentId,param);
		pagination.setTotalCount(count);
		
		List<LotteryOrder> list = this.lotteryOrderMapper.selectLotteryByMyTeam(pagination,agentId,param);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * 查询用户充值记录
	 * @param memberpaylog
	 * @return
	 */
	@Override
	public Pagination getRechargeLogByMyTeam(Integer id,MemberPayLog param,Integer pageNo,Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		
		pagination.setTotalCount(this.memberPayLogMapper.selectPayLogCountByMyTeam(id,param));
		
		List<MemberPayLog> list = this.memberPayLogMapper.selectPayLogByMyTeam(id,param,pagination);
		
		for (MemberPayLog log : list) {
			log.setTypeName(MemberUtil.MEMBER_PAY_TYPE_MAP.get(log.getType()));
		}
		
		pagination.setList(list);

		return pagination;
	}
	
	
	/**
	 * 查询团队用户提款记录
	 * @param memberdrow
	 * @return
	 */
	@Override
	public Pagination getMyTeamDrow(Integer agentId,MemberDrow param, Integer pageNo,Integer pageSize) {
		Pagination pin = new Pagination(pageNo,pageSize);
		
		pin.setTotalCount(this.memberDrowMapper.myTeamDrowListCount(agentId,param));
		
		List<MemberDrow> list = this.memberDrowMapper.myTeamDrowList(pin,agentId,param);
		pin.setList(list);
		
		return pin;
	}
	
	/**
     * 交易明细
     */
	@Override
    public Pagination  getMyTeamMoneylog(Integer agentId,MemberMoneyLog param, Integer pageNo, Integer pageSize){
		
		Pagination pin = new Pagination(pageNo,pageSize);
    	
		pin.setTotalCount(this.memberMoneyLogMapper.selectMyTeamMenoyLogCount(agentId,param));
		
		pin.setList(this.memberMoneyLogMapper.selectMyTeamMenoyLogList(agentId,param,pin));
		
		return pin;
    }
	
	/***
	 * 追号记录
	 * @param memberId
	 * @param money
	 * @param type
	 * @return
	 */
	
	public Pagination getChaseMemberRecord(Integer agent,ChasingOrder param, Integer pageNo,Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		
		pagination.setTotalCount(this.chasingOrderMapper.getMyTeamChaseListCount(agent,param));
		
		List<ChasingOrder> list = this.chasingOrderMapper.getMyTeamChaseList(agent,param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * 合买
	 */
	@Override
	public Pagination getMyTeamMergerJoin(Integer agentId, Integer pageNo,
			Integer pageSize, MergerJoin param) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		
		pagination.setTotalCount(this.mergerJoinMapper.myTeamMergerJoinCount(agentId,param));
		
		List<MergerJoin> list = this.mergerJoinMapper.myTeamMergerJoinList(agentId,param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * 中奖记录
	 */
	@Override
	public Pagination getMyTeamPrize(Integer agentId, LotteryOrder param,Integer pageNo, Integer pageSize) {
		
		Pagination pagination = new Pagination(pageNo,pageSize);
		
		pagination.setTotalCount(this.lotteryOrderMapper.getMyTeamPrizeCount(agentId,param));
		
		List<LotteryOrder> list = this.lotteryOrderMapper.getMyTeamPrizeList(agentId,param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	
}
