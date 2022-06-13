package com.jingc.busi.membercenter.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.CommonTag;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberDrow;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.membercenter.service.MemberCenterMyTeamService;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.merger.service.MergerQueryService;
import com.jingc.busi.order.service.OrderService;
import com.jingc.busi.order.service.OrderService.GuessOrder;
import com.jingc.busi.order.service.OrderService.TraditionOrder;
import com.jingc.busi.order.service.OrderService.TraditionOrderchasing;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.constant.util.GameUtil;


/**
 * 用户中心---我的团队
 * @author gary
 *
 */
@Controller
public class MemberCenterMyTeamController {
	
	
	@Resource
	private MemberCenterMyTeamService memberCenterMyTeamService;
	
	@Resource private MemberCenterService memberCenterService;
	
	@Resource private OrderService orderservice;//订单详情
	
	@Resource private MergerQueryService mergerQueryService;//合买
	
	/**
	 * 团队彩民详细页  跳转
	 */
	@RequestMapping("/memberCenterNew/myTeamMemberDetail.jhtml")
	public ModelAndView personDatum(HttpSession session,Integer id) {
		
		ModelAndView mv = new ModelAndView();
		Member mb = this.memberCenterMyTeamService.getOneMember(id); //彩民信息
		mv.addObject("mb", mb);
		
		mv.addObject("memberaccount", this.memberCenterMyTeamService.queryMemberAccount(id));//账户信息
		
		//登陆人的推广地址
		Member smb = (Member)session.getAttribute("member");
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		
		
		//团队彩民推广地址
		String agent_url1 = net_url + "?agent=" + Integer.toOctalString(id);
		
		mv.addObject("agentUrl", agent_url);
		mv.addObject("agentUrl1", agent_url1);
		
		mv.setViewName("membercenternew/myTeamMemberDetail");
		
		return mv;
	}
	
	/**
	 * 充值记录
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/memberCenterNew/getRechargeLog.jhtml")
	public ModelAndView getRechargeLog(HttpSession session,MemberPayLog param,Integer pageNo,Integer pageSize){
		
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		
		Pagination pagination = this.memberCenterMyTeamService.getRechargeLogByMyTeam(smb.getId(), param,pageNo, pageSize);
		mv.addObject("pagination", pagination); //充值记录
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		mv.addObject("agentUrl", agent_url);
		
		mv.addObject("stateMap",MemberUtil.STATE.MEMBERPAYLOGSTATENAMES);//状态
		
		mv.setViewName("membercenternew/myTeamMemberPayLog");
		
		return mv;
	}
	
	/**
	 * 取款记录
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/memberCenterNew/myTeamMemberDrow.jhtml")
	public ModelAndView queryDrowinfo(HttpSession session,MemberDrow param,Integer pageNo,Integer pageSize) {
		
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		
		Pagination pagination = this.memberCenterMyTeamService.getMyTeamDrow(smb.getId(),param, pageNo, pageSize);
		mv.addObject("pagination", pagination); //取款记录
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		mv.addObject("agentUrl", agent_url);
		
		mv.setViewName("membercenternew/myTeamMemberDrow");
		return mv;
	}
	
	/**
	 * 交易明细
	 */
	@RequestMapping("/memberCenterNew/myTeamMoneylog.jhtml")
	public ModelAndView queryMyTeamMoneylog(
							HttpSession session ,
							Integer pageNo,Integer pageSize,
							MemberMoneyLog param) {
		
		ModelAndView model = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		
		Pagination pagination = this.memberCenterMyTeamService.getMyTeamMoneylog(smb.getId(),param, pageNo,pageSize);
		model.addObject("pagination", pagination); //取款记录
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		model.addObject("agentUrl", agent_url);
		
		 
		
		model.setViewName("membercenternew/myTeamMemberMoneyLog");
		return model;
	}
	
	/**
	 * 购彩记录
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/memberCenterNew/myTeamPurchas.jhtml")
	public ModelAndView myTeamPurchas(HttpSession session,LotteryOrder param, Integer pageNo,Integer pageSize) {
		
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		
		if (CommonTag.isEmpty(param.getBeginTime()).equals("true") && CommonTag.isEmpty(param.getEndTime()).equals("true")) {
			param.setBeginTime(DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7));
			param.setEndTime(DateUtil.getDateFormat0());
		}
		
		param.setBetType(LotteryOrderState.BET_TYPE_BUY); //投注方式 _代购（1）
		Pagination pagination = this.memberCenterMyTeamService.getLotteryListByMyTeam(smb.getId()+"",param, pageNo, pageSize);
		
		mv.addObject("pagination", pagination); //购彩列表
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		mv.addObject("agentUrl", agent_url);
		
		mv.addObject("stateMap",LotteryOrderState.LOTTERY_ORDER_STATE_MAP);//状态
		
		mv.addObject("lotteryTypes", this.memberCenterService.getStoreLicenseList(smb.getStoreId()));//采种
		
		mv.setViewName("membercenternew/myTeamMemberLottery");
		
		return mv;
	}
	
	
	/***
	 * 购彩方案详请，分为三种展示方式：竞彩，足彩，数字彩 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId   订单编号
	 * @param LicenseId  彩种类别
	 * @return
	 */
	@RequestMapping("/memberCenterNew/myTeamOrderDetail.jhtml")
	public ModelAndView myTeamOrderDetail(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer licenseId) {
		
		LotteryOrder orderRecord = this.orderservice.findLotteryOrder(orderId);
		
		if ( "1".equals(orderRecord.getReserved17()) 
				&& !"9".equals(orderRecord.getBetState())
				&& !"10".equals(orderRecord.getBetState())
				&& !"11".equals(orderRecord.getBetState())
				&& !"12".equals(orderRecord.getBetState())
				&& !"13".equals(orderRecord.getBetState())) {
			throw new BaseException("方案是复制方案，开奖之后才能查看");
		}

		ModelAndView mv = null;
		if ((licenseId == GameUtil.GAMEIDJCZQ && !"8".equals(orderRecord.getPlayType())&& !"9".equals(orderRecord.getPlayType()))
				|| licenseId == GameUtil.GAMEIDJCLQ || licenseId == Constants.LICENSE_BJDC || licenseId == Constants.LICENSE_SFGG) {
			// 竞彩
			GuessOrder guessorder = this.orderservice.findGuessOrder(orderId, pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/myTeam_order_detail_jc",
					"guessorder", guessorder);
		} else if (licenseId == GameUtil.GAMEIDSFC
				|| licenseId == GameUtil.GAMEIDRXJ
				|| licenseId == GameUtil.GAMEIDBQC
				|| licenseId == GameUtil.GAMEIDJQC) {
			// 足彩
			TraditionOrder zcorder = this.orderservice.findZcOrder(orderId, pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/myTeam_order_detail_zc", "zcorder", zcorder);
		} else {
			// 数字彩
			TraditionOrder mathorder = this.orderservice.findMathOrder(orderId,pageNo, pageSize);
			List<String[]> newList = new ArrayList<String[]>();//投注项
			for(String[] betlist:mathorder.getBetList()){
				String[] list = betlist[0].split("<br>");
				newList.add(list);
				break;
			}
			mathorder.setBetList(newList);
			mv = new ModelAndView("/membercenternew/myTeam_order_detail_math","mathorder", mathorder);
		}

		return mv;
	}
	
	/**
	 * 追号记录
	 */
	@RequestMapping("/memberCenterNew/myTeamChaseMember.jhtml")
	public ModelAndView myTeamChase(HttpSession session, Integer pageNo,
			Integer pageSize, ChasingOrder param) {
		
		ModelAndView mv = new ModelAndView();
		
		Member mb = (Member) session.getAttribute("member");
		
		if (CommonTag.isEmpty(param.getBeginTime()).equals("true") && CommonTag.isEmpty(param.getEndTime()).equals("true")) {
			param.setBeginTime(DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7));
			param.setEndTime(DateUtil.getDateFormat0());
			mv.addObject("param",param);
		}
		
		Pagination pagination = this.memberCenterMyTeamService.getChaseMemberRecord(mb.getId(),param, pageNo, pageSize);

		List<StoreLicense> lotteryTypes = this.memberCenterService .getStoreLicenseList(mb.getStoreId());// 取到彩票种类类别
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(mb.getId());
		mv.addObject("agentUrl", agent_url);

		mv.addObject("lotteryTypes", lotteryTypes);
		
		mv.addObject("pagination", pagination);
		
		mv.setViewName("membercenternew/myTeamChaseNumber");
		return mv;
	}
	
	
	/***
	 * 追号方案详请，展示方式：数字彩
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId 追号编号和和追号表id
	 * @param LicenseId 彩种类别
	 * @return
	 */
	@RequestMapping("/memberCenterNew/myTeamZhfax.jhtml")
	public ModelAndView DescriptionChase(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer licenseId,HttpServletRequest request) {
		Member mb = (Member)session.getAttribute("member");
		if(mb == null){
			throw new BaseException("请登录！");
		}
		TraditionOrderchasing mathorder = this.orderservice.findMathOrderchase(orderId, pageNo, pageSize);
		List<String[]> newList = new ArrayList<String[]>();//投注项
		for(String[] betlist:mathorder.getBetList()){
			String[] list = betlist[0].split("<br>");
			newList.add(list);
			break;
		}
		mathorder.setBetList(newList);
		ModelAndView mv = new ModelAndView("/membercenternew/myTeam_zhfax_n","mathorder", mathorder);
		return mv;
	}
	
	/**
	 * 合买记录
	 */
	@RequestMapping("/memberCenterNew/myTeamMergerJoin.jhtml")
	public ModelAndView myTeamMergerJoin(HttpSession session, Integer pageNo,
			Integer pageSize, MergerJoin param){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		
		param.setStoreid(mb.getStoreId());

		Pagination pagination = this.memberCenterMyTeamService.getMyTeamMergerJoin(mb.getId(),pageNo, pageSize, param);
		
		// 取到彩票种类类别
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(mb.getStoreId());
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(mb.getId());
		mv.addObject("agentUrl", agent_url);
		
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/myTeamMergerJoin");
		return mv;
	}
	
	/**
	 * 合买详情页
	 */
	//@RequestMapping("/merger.jhtml")
	@RequestMapping("/memberCenterNew/myTeamMergerDetails.jhtml")
	public ModelAndView mergerDetails(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 Integer userId,
									 Integer mergerOrderId) {
		ModelAndView mv = new ModelAndView();
		MergerJoin param = new MergerJoin();
		param.setOrderId(mergerOrderId);
		LotteryOrder lo = this.mergerQueryService.selectLotteryOrderByPartnerNoOnly(mergerOrderId);
		MergerOrder mo = new MergerOrder();
		mo.setId(mergerOrderId);
		mo = this.mergerQueryService.selectMergerOrder(mo);
		mo.setSinglePrice(mo.getSinglePrice());
		//mv = this.mergerQueryService.groupsByLicenseId(lo,mo,mv);
		mv = this.mergerQueryService.myTeamGroupsByLicenseId(lo,mo,mv);
		
		int numOfMergerJoinMember = this.mergerQueryService.selectCountOfMergerJoinRecords();
		Pagination pagination = this.mergerQueryService.getMergerJoin(param, pageNo, pageSize);
		
		//Integer temp = getIsPassDeadline(session,mo.getId());
		if(mo.getShowLevel() == 1){//所有人可见
			mv.addObject("IsShowContent","show");
		}else if(getIsLanucher(session,mo.getId(),userId) != -1 ){//如果当前账号是发起人，则可见
			mv.addObject("IsShowContent","show");
		}else{//如果当前账号不是发起人
			if(mo.getShowLevel() == 2 && getIsJoiner(session,mo.getId(),userId) != -1){//参与人可见，且当前账号是参与人
				mv.addObject("IsShowContent","show");
			}else if(mo.getShowLevel() == 4 && getIsPassDeadline(session,mo.getId()) != -1){//截止后可见
				mv.addObject("IsShowContent","show");
			}else{
				mv.addObject("IsShowContent","hide");
			}
		}
		
		mv.addObject("numOfMergerJoinMember",numOfMergerJoinMember);
		mv.addObject("lo",lo);
		mv.addObject("mo",mo);
		mv.addObject("pagination", pagination);//分页记录
		return mv;
	}
	
	//判断可见级别
	public Integer getIsLanucher(HttpSession session,Integer orderId,Integer userId) {
		//Member mb = (Member)session.getAttribute("member");//获取用户userId
		if(userId != null){
			//Integer userId = mb.getId();
			
			Integer isLanucher = this.mergerQueryService.getIsLanucher(userId,orderId);
			//return this.mergerQueryService.getIsLanucher(userId,orderId);
			if( isLanucher > 0){
				return isLanucher;
			}else{
				return -1;
			}
		}else{
			return -1;
		}
	}
	
	//判断可见级别
	public Integer getIsJoiner(HttpSession session,Integer orderId,Integer userId) {
		//Integer result = 0;
		//Member mb = (Member)session.getAttribute("member");//获取用户userId
		if(userId != null){
			//Integer userId = mb.getId();
			Integer isJoiner = this.mergerQueryService.getIsJoiner(userId,orderId);
			if(isJoiner>0){
				return isJoiner;
			}else{
				return -1;
			}
		}else{
			return -1;
		}
	}
	
	
	public Integer getIsPassDeadline(HttpSession session,Integer orderId) {
		
		//Member mb = (Member)session.getAttribute("member");//获取用户userId
		//Integer userId = mb.getId();
		MergerOrder param = new MergerOrder();
		param.setId(orderId);
		Integer isPassDeadLine = this.mergerQueryService.getIsPassDeadline(param);
		
		return isPassDeadLine;
	}
	
	
	/**
	 * 中奖记录
	 */
	@RequestMapping("/memberCenterNew/myTeamPrizeList.jhtml")
	public ModelAndView myTeamPrizeList(HttpSession session, Integer pageNo,
			Integer pageSize, LotteryOrder param) {
		
		ModelAndView mv = new ModelAndView();
		
		if (CommonTag.isEmpty(param.getBeginTime()).equals("true") && CommonTag.isEmpty(param.getEndTime()).equals("true")) {
			param.setBeginTime(DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7));
			param.setEndTime(DateUtil.getDateFormat0());
		}
		
		Member mb = (Member) session.getAttribute("member");

		Pagination pagination = this.memberCenterMyTeamService.getMyTeamPrize(mb.getId(),param, pageNo, pageSize);
		
		// 取到彩票种类列别
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(mb.getStoreId());
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(mb.getId());
		mv.addObject("agentUrl", agent_url);
		
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/myTeamPrizeList");
		
		return mv;
	}
	
	
}
