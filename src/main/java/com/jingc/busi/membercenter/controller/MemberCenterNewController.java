package com.jingc.busi.membercenter.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.cache.classification.StoreInfoCache;
import com.jingc.afc.cache.classification.StoreInfoCache.SYS_TYPE;
import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.CommonTag;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.chasing.service.ChasingService;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.Debit;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberDrow;
import com.jingc.busi.common.table.MemberMessage;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MemberWithdraw;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.merger.service.MergerQueryService;
import com.jingc.busi.order.service.OrderService;
import com.jingc.busi.order.service.OrderService.GuessOrder;
import com.jingc.busi.order.service.OrderService.TraditionOrder;
import com.jingc.busi.order.service.OrderService.TraditionOrderchasing;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.MessageStateType;
import com.jingc.constant.util.GameUtil;

/**
 * 用户中心
 * <p>File: MemberCenterNewController.java</p>
 * <p>Desc: </p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 彩游天下</p> 
 * @author zhanghao
 * @version 1.0 2015-7-7
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
public class MemberCenterNewController {
	@Resource
	private MemberCenterService memberCenterService;
	@Resource
	private OrderService orderservice;
	@Resource
	private LoginService loginService;

	@Resource
	private ChasingService chasingService;
	
	@Resource
	private MergerQueryService mergerQueryService;
	
	/*@Resource
	private CustomService customService;*/
	
	/**
	 * 【用户中心首页】zh
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/index.jhtml")
	public ModelAndView userCenter(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		Member mb = this.memberCenterService.getOneMember(smb.getId());
		mb.setLoginTiem(smb.getLoginTiem());
		List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());//用户所有取款方式
		Double[] mones = this.loginService.getAccount(mb.getId());
		/*======================== 取款方式数量 ===========================*/
		MemberWithdraw[] mws = new MemberWithdraw[3];
		if (mwlist.size() != 0) {
			for (MemberWithdraw mw : mwlist) {
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Y)) {// 银行卡
					mws[0] = mw;
				}
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_W)) {// 微信
					mws[1] = mw;
				}
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Z)) {// 支付宝
					mws[2] = mw;
				}
			}
			
		}
		/*========================购彩记录 中奖记录===========================*/
		LotteryOrder param = new LotteryOrder();
		Pagination pagination = null;//购彩记录
		Pagination pagination2 = null;//中奖记录
		param.setUserid(mb.getId());
		param.setBeginTime(DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7));
		param.setEndTime(DateUtil.getDateFormat0());
		param.setBetType(LotteryOrderState.BET_TYPE_BUY);
		// 购彩记录
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getYYTOrderByMemberAndGameType(param, 1, 10);
		} else {
			pagination = this.memberCenterService.getOrderByMemberAndGameType(param, 1, 10);
		}
		//中奖记录
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			param.setReserved1(currMember.getReserved1());
			pagination2 = this.memberCenterService.getMemberOrderListBonus(param, 1, 10);
		} else {
			pagination2 = this.memberCenterService.getMemberOrderListBonus(param, 1, 10);
		}
		Double[] result =  this.memberCenterService.allowGetMoney(mb.getId());//欠款总金额
		mv.addObject("debt", result[4]);
		mv.addObject("pagination", pagination);//购彩记录
		mv.addObject("pagination2", pagination2);//中奖纪录
		mv.addObject("mones", mones);//账户资金
		mv.addObject("mb", mb);//个人信息
		mv.addObject("mws",mws);
		mv.setViewName("membercenternew/userCenter");
		return mv;
	}
	
	
	
	/**
	 * 资金管理 zh
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/capital.jhtml")
	public ModelAndView centerIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		// 用户资金详情数组[现金账户，赠金账户(红包)，冻结总额，账户可投注资金，可以取款]
		Double[] mones = this.loginService.getAccount(mb.getId());
		Double[] result =  this.memberCenterService.allowGetMoney(mb.getId());
		mv.addObject("debit", result[4]);//欠款金额
		mv.addObject("mb", mb);
		mv.addObject("mones", mones);//账户资金
		mv.setViewName("membercenternew/capital");
		return mv;
	}
	
	/**
	 * 代购记录
	 */
	@RequestMapping("/memberCenterNew/purchasList.jhtml")
	public ModelAndView purchasList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer type, String beginTime, String endTime,
			LotteryOrder param) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		if (CommonTag.isEmpty(beginTime).equals("true") || CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7);
			endTime = DateUtil.getDateFormat0();
		}
		Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		param.setUserid(userId);
		param.setBeginTime(beginTime);
		param.setEndTime(endTime);
		param.setBetType(LotteryOrderState.BET_TYPE_BUY);
		Pagination pagination = null;
		// 营业厅彩民
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getYYTOrderByMemberAndGameType(param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getOrderByMemberAndGameType(param, pageNo, pageSize);

		// 取到彩票种类列别
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/purchasList");
		return mv;
	}
	
	/**
	 * 追号记录
	 */
	@RequestMapping("/memberCenterNew/chaseList.jhtml")
	public ModelAndView chaseList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer type, String beginTime, String endTime,
			ChasingOrder param) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		param.setUserid(userId);
		param.setBeginTime(beginTime);
		param.setEndTime(endTime);

		Pagination pagination = this.memberCenterService.getChaseMemberRecord(
				param, pageNo, pageSize);

		// 取到彩票种类类别
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/chaseNumberRecord");
		return mv;
	}
	
	/***
	 * 追号方案详请，展示方式：数字彩
	 * 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            追号编号和和追号表id
	 * @param LicenseId
	 *            彩种类别
	 * @return
	 */
	@RequestMapping("/memberCenterNew/zhfax.jhtml")
	public ModelAndView DescriptionChase(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer LicenseId,HttpServletRequest request) {
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
		ModelAndView mv = new ModelAndView("/membercenternew/zhfax_n","mathorder", mathorder);
		return mv;
	}

	/**
	 * 追号取消操作
	 * 
	 * @param session
	 *@param orderId
	 *            订单编号
	 */

	@RequestMapping("/memberCenterNew/colse.do")
	@ResponseBody
	public String orderColse(HttpSession session, Integer orderId) {
		this.chasingService.cancelOneIssueChasing(orderId);
		return "已取消";
	}
	
	/**
	 * 追号全部取消操作 zh 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenterNew/colseAll.do")
	@ResponseBody
	public String orderColseAll(HttpSession session, Integer orderId){
		this.chasingService.cancelChasing(orderId);
		return "全部取消";
	}
	
	/**
	 * 合买记录
	 */
	@RequestMapping("/memberCenterNew/mergerJoinList.jhtml")
	public ModelAndView mergerJoinList(HttpSession session, Integer pageNo,
			Integer pageSize, MergerJoin param){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		param.setJoinUserid(userId);
		param.setStoreid(storeId);
		Pagination pagination = this.mergerQueryService.getMergerJoinRecord(pageNo, pageSize, param);
		// 取到彩票种类类别
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/mergerRecord");
		return mv;
	}
	
	/**
	 * 中奖记录
	 */
	@RequestMapping("/memberCenterNew/prizeList.jhtml")
	public ModelAndView prizeList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer type, String beginTime, String endTime,
			LotteryOrder param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		Member mb = (Member) session.getAttribute("member");
		Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		param.setUserid(userId);
		param.setBeginTime(beginTime);
		param.setEndTime(endTime);
		Pagination pagination = null;
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getMemberOrderListBonus(param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getMemberOrderListBonus(param, pageNo, pageSize);
		// 取到彩票种类列别
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/prizeList");
		return mv;
	}
	
	/**
	 * 获取访问者IP 在一般情况下使用Request.getRemoteAddr()即可，但是经过nginx等反向代理软件后，这个方法会失效。
	 * 本方法先从Header中获取X-Real-IP，如果不存在再从X-Forwarded-For获得第一个IP(用,分割)，
	 * 如果还不存在则调用Request .getRemoteAddr()。
	 * 
	 * @param request
	 * @return
	 */
	public String getCurrUserIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("Proxy-Client-IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("WL-Proxy-Client-IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("HTTP_CLIENT_IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		} else {
			return request.getRemoteAddr();
		}
	}
	/*
	*//**
	 * 金额提交页面
	 *//*
	@RequestMapping("/memberCenterNew/moneyButton.jhtml")
    public ModelAndView moneyButton(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/moneyButton");
		return mv;
	}
	*/
	/**
	 * 转账充值 Iframe
	 *//*
	@RequestMapping("/memberCenterNew/putMoneyOutLineIFrame.jhtml")
	    public ModelAndView putMoneyOutLineIFrame(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Integer storeId = mb.getStoreId();
		StoreReceiv param = new StoreReceiv();
		param.setStoreId(storeId);
		param.setUsefor(StoreReceivTypeState.USEFOR.RECEIVABLES);
		param.setState(StoreReceivTypeState.STATE.AVAILABLE);
		List<StoreReceiv> storeBanklist = this.memberCenterService
				.getStoreReceivAccount(param, new Pagination());
		Store store = this.memberCenterService.getOneStore(mb.getStoreId());

		mv.addObject("storeBanklist", storeBanklist);// 店铺设置的收款
		mv.addObject("store", store);// 店铺信息
		mv.setViewName("membercenternew/putMoneyOutLineIFrame");
		return mv;
	}*/
	
	/**
	 * 转账充值
	 *//*
	@RequestMapping("/memberCenterNew/putMoneyOutLine.jhtml")
	    public ModelAndView putMoneyOutLine(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Integer storeId = mb.getStoreId();
		StoreReceiv param = new StoreReceiv();
		param.setStoreId(storeId);
		param.setUsefor(StoreReceivTypeState.USEFOR.RECEIVABLES);
		param.setState(StoreReceivTypeState.STATE.AVAILABLE);
		List<StoreReceiv> storeBanklist = this.memberCenterService
				.getStoreReceivAccount(param, new Pagination());
		Store store = this.memberCenterService.getOneStore(mb.getStoreId());

		mv.addObject("storeBanklist", storeBanklist);// 店铺设置的收款
		mv.addObject("store", store);// 店铺信息
		mv.setViewName("membercenternew/putMoneyOutLine");
		return mv;
	}*/
	
	/**
	 * 在线充值记录 zh Copy
	 *//*
	@RequestMapping("/memberCenterNew/putMoneyList.jhtml")
	public ModelAndView putMoneyList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer state, String beginTime, String endTime,
			MemberPayLog param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		// 取款单状态
		Map<Integer, String> memberPayLogStates = MemberUtil.STATE.MEMBERPAYLOGSTATENAMES;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setCreateTimeBegin(beginTime);
		param.setCreateTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberPutMoney(
				param, pageNo, pageSize);

		mv.addObject("memberPayLogStates", memberPayLogStates);// 取款单状态
		mv.addObject("pagination", pagination);// 分页记录

		mv.setViewName("membercenternew/putMoneyList");
		return mv;
	}
	*/
	/**
	 * 安全中心 zh
	 */
	@RequestMapping("/memberCenterNew/safeIndex.jhtml")
	public ModelAndView safeIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());
		mv.addObject("mb", mb);
		mv.addObject("key",mwlist.size() > 0?"T":"F");
		mv.setViewName("membercenternew/safeIndex");
		return mv;
	}
	
	/**
	 * 个人信息 跳转 zh
	 */
	@RequestMapping("/memberCenterNew/personDatum.jhtml")
	public ModelAndView personDatum(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member sessionMb = (Member) session.getAttribute("member");
		Member mb = this.memberCenterService.getOneMember(sessionMb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenternew/personDatum");
		return mv;
	}
	
	/**
	 * 个人信息 zh
	 */
	@RequestMapping("/memberCenterNew/personDatumSucc.jhtml")
	public ModelAndView personDatumSucc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member sessionMb = (Member) session.getAttribute("member");
		Member mb = this.memberCenterService.getOneMember(sessionMb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenternew/personDatumSucc");
		return mv;
	}
	
	/**
	 * 个人信息 入库 zh
	 */
	@RequestMapping("/memberCenterNew/doPersonDatum.jhtml")
	public ModelAndView doPersonDatum(HttpSession session, Member member) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		member.setId(mb.getId());
		this.memberCenterService.updateMemberMessage(member);
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenternew/doPersonDatum");
		return mv;
	}
	
	/**
	 * 实名认证 跳转 zh
	 */
	@RequestMapping("/memberCenterNew/authenticat.jhtml")
	public ModelAndView authenticat(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// 已实名验证
		if (CommonTag.isEmpty(mb.getCertiName()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenternew/authenticat");
		}
		// 没有实名验证
		else{
			mv.addObject("mb",mb);
			mv.setViewName("membercenternew/authenticatSure");
		}
		return mv;
	}
	
	/**
	 * 实名认证 入库 zh
	 */
	@RequestMapping("/memberCenterNew/doAuthenticat.jhtml")
	public ModelAndView doAuthenticat(HttpSession session, Member member) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		member.setId(mb.getId());
		member.setLoginPass(null);//防止登录密码入库
		this.memberCenterService.updateMemberMessage(member);//信息入库
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenternew/doAuthenticat");
		return mv;
	}
	
	/**
	 * 修改密码 跳转 zh
	 */
	@RequestMapping("/memberCenterNew/changePass.jhtml")
	public ModelAndView changePass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/changePass");
		return mv;
	}
	
	/**
	 * 登录密码修改 入库 zh
	 */
	@RequestMapping("/memberCenterNew/doChangePass.jhtml")
	public ModelAndView doChangePass(HttpSession session, String loginPass) {
		Member mb = (Member) session.getAttribute("member");
		String str = MemberUtil.AnalyzePasswordSecurityLevel(loginPass);
		mb.setReserved2(str);
		mb.setLoginPass(com.jingc.afc.util.MD5.toMD5WithJDK(loginPass).toUpperCase());
		this.memberCenterService.updateMemberMessage(mb);
		ModelAndView mv = new ModelAndView();
		//session.invalidate();
		mv.setViewName("membercenternew/changePassSure");
		return mv;
	}
	
	/**
	 * 取款设置 跳转 zh
	 */
	@RequestMapping("/memberCenterNew/getMoneyOptions.jhtml")
	public ModelAndView getMoneyOptions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		//判断是否实名认证
		if(CommonTag.isEmpty(mb.getCertiName()).equals("false") && CommonTag.isEmpty(mb.getCertiNumber()).equals("false")){
			MemberWithdraw mwObj = this.memberCenterService.drawInfoOne(mb.getId());
			mv.addObject("mb", mb);
			mv.addObject("mwObj", mwObj);
			mv.setViewName("membercenternew/getMoneyOptions");
		}else{
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//跳转至实名认证界面
		}
		return mv;
	}
	
	
	/*@RequestMapping("/memberCenterNew/getMoneyOptions.jhtml")
	public ModelAndView getMoneyOptions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		//判断是否实名认证
		if(CommonTag.isEmpty(mb.getCertiName()).equals("false") && CommonTag.isEmpty(mb.getCertiNumber()).equals("false")){
			MemberWithdraw[] mws = new MemberWithdraw[3];
			List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());
			for(MemberWithdraw mwd:mwlist){
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Y)){
					mws[0] = mwd;//银行卡
				}
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_W)){
					mws[1] = mwd;//微信
				}
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Z)){
					mws[2] = mwd;//支付宝
				}
			}
			mv.addObject("mb", mb);
			mv.addObject("mws", mws);
			mv.setViewName("membercenternew/getMoneyOptions");
		}else{
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//跳转至实名认证界面
		}
		return mv;
	}*/
	
	/**
	 * 添加取款方式 取款方式入库 OK zh
	 */
	@RequestMapping("/memberCenterNew/addGetMoney.jhtml")
	public ModelAndView getMoneyAdd(HttpSession session, MemberWithdraw mw){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		String time = DateUtil.getDateFormat2();//生成当前时间
		mw.setMemberId(mb.getId());
		mw.setCreatTime(time);
		mw.setStoreId(mb.getStoreId());
		mw.setAccountState(mw.getAccountState() == null?1:mw.getAccountState());
		String str = this.memberCenterService.addMemberWithdraw(mw);

		if (str.equals("SUCCESS")) {
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
		}else{
			throw new BaseException("添加取款方式失败");
		}
		return mv;
	}
	
	/**
	 * 修改取款方式信息  zh
	 */
	@RequestMapping("/memberCenterNew/updGetMoney.jhtml")
	public ModelAndView updGetMoney(HttpSession session, MemberWithdraw mw){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member)session.getAttribute("member");
		mw.setMemberId(mb.getId());
		String str = this.memberCenterService.updMemberWithdrawByMid(mw);
		if(str.equals("SUCCESS")){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
		}else{
			throw new BaseException("操作失败");
		}
		return mv;
	}
	
	/**
	 * 修改默认取款方式 zh
	 */
	@RequestMapping("/memberCenterNew/defaultManner.jhtml")
	public ModelAndView defaultManner(HttpSession session, MemberWithdraw mw) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member)session.getAttribute("member");
		String str = this.memberCenterService.updMemberWithdrawStateByMid(mw.getAccountType(), mb.getId());
		if(str.equals("SUCCESS")){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
		}else{
			throw new BaseException("操作失败！");
		}
		return mv;
	}
	
	/**
	 * 校验旧登录密码 zh AJAX
	 */
	@RequestMapping("/memberCenterNew/checkOldLoginPass.do")
	@ResponseBody
	public String checkOldLoginPass(HttpSession session, String loginPass) {
		Member mb = (Member) session.getAttribute("member");
		String newMd5LoginPass = com.jingc.afc.util.MD5.toMD5WithJDK(loginPass);
		if (mb.getLoginPass().toUpperCase().equalsIgnoreCase(newMd5LoginPass.toUpperCase())) {
			return "1";// 校验成功
		} else {
			return "0";// 校验失败
		}
	}
	
	/**
	 * 欠款单明细
	 */
	@RequestMapping("/memberCenterNew/debitList.jhtml")
	public ModelAndView debitList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer state, String beginTime, String endTime,
			Debit param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		// 欠款单状态
		Map<Integer, String> debitState = MemberUtil.STATE.DEBITSTATEMAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setObligorId(memberId);
		param.setCreateTimeBegin(beginTime);
		param.setCreateTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberDebitLog(
				param, pageNo, pageSize);

		mv.addObject("debitState", debitState);// 欠款单状态
		mv.addObject("pagination", pagination);// 分页记录
		mv.setViewName("membercenternew/debitList");
		return mv;
	}
	
	/**
	 * 账户明细 zh Copy
	 */
	@RequestMapping("/memberCenterNew/accountDetail.jhtml")
	public ModelAndView accountDetail(HttpSession session, Integer pageNo,
			Integer pageSize, Integer category, String beginTime,
			String endTime, MemberMoneyLog param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7);
			endTime = DateUtil.getDateFormat0();
		}
		// 取款单状态
		Map<Integer, String> memberMoneyType = MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_MAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setCreateBeginTime(beginTime);
		param.setCreateEndTime(endTime);
		param.setCategory(category);
		Pagination pagination = this.memberCenterService.getMemberMoneyLog(
				param, pageNo, pageSize);

		//Double[] mones = this.loginService.getAccount(memberId);

		// 用户资金详情数组[现金账户，赠金账户，冻结总额，账户可用资金]
		//mv.addObject("mones", mones);
		mv.addObject("memberMoneyType", memberMoneyType);// 取款单状态
		mv.addObject("pagination", pagination);// 分页记录
		mv.setViewName("membercenternew/accountDetail");
		return mv;
	}
	
	/**
	 * 用户提款 跳转 zh
	 */
	@RequestMapping("/memberCenterNew/getMoney.jhtml")
	public ModelAndView getMoney(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		if (mb.getCertiName() == null || mb.getCertiNumber() == null) {// 是否实名认证名验证
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//进入实名认证
			return mv;
		} 
		MemberWithdraw mw = this.memberCenterService.drawInfoOne(mb.getId());
		if(mw == null){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
			return mv;
		}
		Double[] mones = this.loginService.getAccount(mb.getId());
		mv.addObject("mb", mb);
		mv.addObject("mw", mw);
		mv.addObject("mones", mones);
		mv.addObject("typeName", MemberUtil.ACCOUNTTYPE.get(mw.getAccountType()));
		mv.setViewName("membercenternew/getMoney");
		return mv;
	}
	
	/*@RequestMapping("/memberCenterNew/getMoney.jhtml")
	public ModelAndView getMoney(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		if (mb.getCertiName() == null || mb.getCertiNumber() == null) {// 是否实名认证名验证
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//进入实名认证
			return mv;
		} 
		List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());
		if(mwlist.size() == 0){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");//进入取款设置
			return mv;
		}
		
		MemberWithdraw mw = null;
		for(MemberWithdraw dmw:mwlist){
			if(dmw.getAccountState() == MemberUtil.ACCOUNT_SATE_D){
				mw = dmw;
				break;
			}
		}
		if(mw == null){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
			return mv;
		}
		Double[] mones = this.loginService.getAccount(mb.getId());
		mv.addObject("mb", mb);
		mv.addObject("mw", mw);
		mv.addObject("mones", mones);
		mv.addObject("typeName", MemberUtil.ACCOUNTTYPE.get(mw.getAccountType()));
		mv.setViewName("membercenternew/getMoney");
		return mv;
	}*/
	
	/**
	 * 取款单入库 zh
	 */
	@RequestMapping("/memberCenterNew/doGetMoney.jhtml")
	public ModelAndView doGetMoney(HttpSession session, 
								   Double currMoney,
								   String typeNameV,
								   String accountMessageV) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		//System.out.println("==============================doGetMoney:" + mb);
		Member currMember = this.memberCenterService.getOneMember(mb.getId());
		MemberAccount accountRecord = this.loginService.getMemberAccount(mb.getId());
		//System.out.println("==============================accountRecord:" + accountRecord);
		double amountUsedGetMoney = accountRecord.getMoneyAccount() + accountRecord.getBonusAccount() - accountRecord.getFrozenAccount();//可提款账户
		if(amountUsedGetMoney < currMoney){
			throw new BaseException("彩民取款单失败，账户资金异常");
		}
		this.memberCenterService.doGetMoney(currMember, currMoney , accountRecord , typeNameV , accountMessageV);
		mv.setViewName("redirect:/memberCenterNew/getMoneySucc.jhtml");
		return mv;
	}
	
	/***
	 * 取款单入库后url重定向，防止重复订单  zh
	 */
	@RequestMapping("/memberCenterNew/getMoneySucc.jhtml")
	public ModelAndView getMoneySucc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/getMoneySucc");
		return mv;
	}
	
	
	/**
	 * 提款记录
	 */
	@RequestMapping("/memberCenterNew/getMoneyList.jhtml")
	public ModelAndView getMoneyList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer state, String beginTime, String endTime,
			MemberDrow param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		// 取款单状态
		Map<Integer, String> memberDrowStates = MemberUtil.STATE.MEMBERDROWSTATENAMES;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setBeginCreateTime(beginTime);
		param.setEndCreateTime(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberGetMoney(
				param, pageNo, pageSize);

		mv.addObject("memberDrowStates", memberDrowStates);// 取款单状态
		mv.addObject("pagination", pagination);// 分页记录
		mv.setViewName("membercenternew/getMoneyList");
		return mv;
	}
	
	
	/***
	 * 方案详请，分为三种展示方式：竞彩，足彩，数字彩 Ok zh update
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            订单编号
	 * @param LicenseId
	 *            彩种类别
	 * @return
	 */
	@RequestMapping("/memberCenterNew/orderDetail.jhtml")
	public ModelAndView orderDetail(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer LicenseId) {
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
		if ((LicenseId == GameUtil.GAMEIDJCZQ
				&& !"8".equals(orderRecord.getPlayType()) && !"9"
				.equals(orderRecord.getPlayType()))
				|| LicenseId == GameUtil.GAMEIDJCLQ || LicenseId == Constants.LICENSE_BJDC || LicenseId == Constants.LICENSE_SFGG) {
			// 竞彩
			GuessOrder guessorder = this.orderservice.findGuessOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/order_detail_jc",
					"guessorder", guessorder);
		} else if (LicenseId == GameUtil.GAMEIDSFC
				|| LicenseId == GameUtil.GAMEIDRXJ
				|| LicenseId == GameUtil.GAMEIDBQC
				|| LicenseId == GameUtil.GAMEIDJQC) {
			// 足彩
			TraditionOrder zcorder = this.orderservice.findZcOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/order_detail_zc", "zcorder",
					zcorder);
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
			mv = new ModelAndView("/membercenternew/order_detail_math","mathorder", mathorder);
		}

		return mv;
	}
	
	/****
	 * 营业厅会员提交方案出票
	 * 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param type
	 * @param beginTime
	 * @param endTime
	 * @param param
	 * @return
	 */
	@RequestMapping("/memberCenterNew/changeOrderState.jhtml")
	public String changeOrderState(HttpSession session,
			HttpServletRequest request) {
		Member mb = (Member) session.getAttribute("member");
		String[] orderIds = request.getParameterValues("orderId");
		for (String orderId : orderIds) {
			this.memberCenterService.updateLotteryOrderState(Integer
					.parseInt(orderId), mb.getId());
			
			try {
				//新版店主后台更改缓存对象(营业厅未出票订单)
				StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,mb.getStoreId(),StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_BHALL,true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/memberCenterNew/purchasList.jhtml";
	}
	
	/*** 
	 * 营业厅用户删除方案 zh Copy
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenterNew/deleteOrder.do")
	@ResponseBody
	public String deleteOrder(HttpSession session, Integer orderId) {
		if (this.memberCenterService.deleteLotteryOrder(orderId) > 0)
			return "1";
		else
			return "0";
	}
	
	/**
	 * 站内信
	 */
	@RequestMapping("/memberCenterNew/message.jhtml")
	public ModelAndView message(HttpSession session, 
								Integer pageNo,
								Integer pageSize, 
								Integer state, 
								String beginTime, 
								String endTime,
								MemberMessage param) {
		ModelAndView mv = new ModelAndView();
		if (CommonTag.isEmpty(beginTime).equals("true")
				|| CommonTag.isEmpty(endTime).equals("true")) {
			beginTime = DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),
					7);
			endTime = DateUtil.getDateFormat0();
		}
		// 站内信状态
		Map<Integer, String> memberMessageState = MessageStateType.READ_STATE_MAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setAcceptUserId(memberId);
		param.setSendTimeBegin(beginTime);
		param.setSendTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberMessageList(
				param, pageNo, pageSize);

		mv.addObject("memberMessageState", memberMessageState);// 欠款单状态
		mv.addObject("pagination", pagination);// 分页记录
		mv.setViewName("membercenternew/message");
		return mv;
	}
	
	/**
	 *站内信读取
	 * @param session
	 * @param loginPass
	 * @return
	 */
	@RequestMapping("/memberCenterNew/setMessageRead.do")
	@ResponseBody
	public String setMessageRead(HttpSession session, Integer messageId) {

		MemberMessage message = this.memberCenterService
				.getOneMessage(messageId);
		message.setState(MessageStateType.READ_STATE.READ);

		if (this.memberCenterService.updateMessage(message) > 0)
			return "1";// 状态更新成功
		else
			return "0";//
	}
	
	/**
	 * 取款信息详情 zh
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/memberCenterNew/getMoneyDetails.jhtml")
	public ModelAndView getMoneyDetails(HttpSession session, Integer id){
		Member mb = (Member)session.getAttribute("member");
		ModelAndView mv = new ModelAndView("membercenternew/getMoneyDetails"); 
		mb = this.memberCenterService.getOneMember(mb.getId());
		MemberWithdraw mw = this.memberCenterService.drawInfoById(id);
		mv.addObject("mb", mb);
		mv.addObject("mw", mw);
		return mv;
	}
	
	/***
	 * 营业厅用户删除跟单
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenterNew/deleteCustom.do")
	@ResponseBody
	public String deleteCustom(HttpSession session, Integer customId) {
		if (this.memberCenterService.deleteMergerCustom(customId) > 0)
			return "1";
		else
			return "0";
	}
	
	/**
	 * 代购记录
	 */
	@RequestMapping("/memberCenterNew/myTeam.jhtml")
	public ModelAndView myTeam(HttpSession session,String memberName, Integer pageNo,Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		Pagination pagination = this.memberCenterService.getMyTeam(smb.getId()+"", memberName,pageNo, pageSize);
		mv.addObject("pagination", pagination);// 分页记录
		
		//推广地址
		Store storeRecord = (Store) session.getAttribute("domain");
		String net_url = storeRecord.getNetUrl();
		String agent_url = net_url + "?agent=" + Integer.toOctalString(smb.getId());
		
		mv.addObject("agentUrl", agent_url);
		mv.setViewName("membercenternew/myTeam");
		return mv;
	}
	
	/*@RequestMapping(value = "/newcz/sft/test.jhtml", method = RequestMethod.POST)
	@ResponseBody
	public String sftTest(HttpServletRequest request) {
		SftService sftService = new SftService();
		// 获取盛付通反馈信息
		ReturnForm rForm = sftService.getReturnForm(request);
		
		// 计算得出通知验证结果
		if (sftService.checkReturnFormRSA(rForm)) {
			
		}
		return "";
	}*/
	
	/*public static void main(String[] args){
		//HttpHandler handle = HttpHandler.getInstance();
		try{
			//String cont = "TransNo=20151212003259517246&PaymentNo=20151212003325996532&OrderAmount=0.01&TransTime=20151212003259&SendTime=20151212003327&TraceNo=81aba96a-c08f-4240-bb1e-32c2db85926f&TransAmount=0.01&BankSerialNo=020942015121213091&Charset=UTF-8&OrderNo=767497&TransType=PT021&PayableFee=0.00&Ext1={'agreementNo':'342372'}&Version=V4.1.2.1.1&Ext2=&TransStatus=01&PayChannel=43&SignType=RSA&ReceivableFee=0.00&Name=REP_B2CPAYMENT&InstCode=CMBC&outMemberId=&MerchantNo=429861&MsgSender=SFT&SignMsg=CAGU1LD1c+Gzkox/qG9rMNKvqpAkDXtHoTs21wIY6P4Yr8LXEzGAJPeu+2jlAqKwo4luChvgKXJUTbK7gAORIYdwDNocOu93xielFt9N9Hs8/iTMO6kmAXfa4vvc16gdv1np/+9VABzrLYPKTxxVdwmlE0QYG5HrlR9sxaU0gGg=&ErrorMsg=&ErrorCode=";
			//handle.doPost("http://localhost/newcz/sft/apiNotify.jhtml",cont);
			//私钥
			String privateKey = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDxSP/sGR4exnUY6V4IvCewmLpN2EhcwvqpObX9jnrn2jEXIYBAAcn261tZXMOYiY65EfpKnVI4iG0T";
			privateKey = privateKey + "+UUsk5YSJTC6NZXblTlzVYV2lDnT0oCY69t+j/m5KUJO4TGXYezfiniC8TbgzwrT1R3Rz0fHWj6E2D2FcnUBmqnQCQ2WZ822+9zE7X40sSENCZ6woN3f74tuYWOuc7Cf";
			privateKey = privateKey + "j8H/Hq1C4M+sAHYuHkzcXqs2dQCAQsgt5TeOyMsh5eR/4g3OjiR6JIvh8MXm8Izhs8Jam5asfam22IPzJEe/SA+R2HJhFI7A3Qjul5dSEovFH7oWAgu84Whtemzr6/ph";
			privateKey = privateKey + "rifR72n5AgMBAAECggEANTfrsrCLkzAkrbzzT6voeSwGk5rrwwICdYbUHDvr4e2fPEHYXsXGPR8GQ/yQ67kTcMCFWyW999gnbuthFYbr586qI7gj+I2+YTDwwgnJg23/";
			privateKey = privateKey + "jTsga5bn9q4iAPHslT41F80b7Y20k/s2oSh1bkxwwYinF3f2gdOP+S2a3NbSV2TaMzwO+0+xjJ18gx6X+Z4jznrwkc/p7xx34onJejo/yBJ3imy7tXLeV8Yq75cQoScd";
			privateKey = privateKey + "Mj/c8XYfPLwXh0Ku/rJD2I+GsVkVM7qsS3ffg3l2EA8smeDEM8WDd+Vqbb5BlUaCg5ylY5Cr6QTCawdpI2qqOUvVGI2pBjsu4Xqe3qEyPQKBgQD9m6ttk54/PKBOmJwo";
			privateKey = privateKey + "X/M29bg/vgWTDZKzvFTMhC44VLjo8oJuzkPARHIiwq+XWKqC1HythgbQMUlQOr43vtg2MwxaNrgNM6+0UuvpZeYnAiTyjlKdTsAIw5Z1yTFyPcfuBDoMqaWbfZ+Nd3ou";
			privateKey = privateKey + "iDorljm9ds41WcE8poI7E41EwwKBgQDzj5OfbbBsiB6LkW9Wd/UWUYGJITd+93BZ+NMkTjndd7A5GKlmCCkdc3MimwRLqdb1ZjY0HdlvDNFr647xSvbULRJc5sjj0+Uy";
			privateKey = privateKey + "D/AMwHtj/DdfkCN3cspgSedc6Uetxr6YqKysQE3bADL2qAG9us2sVPLAeXvt0/BQPEB65gR6kwKBgQCT5lEXWluTbXvf2khXk313s9177wm5NNU1VMPvcbayy1X7JFLE";
			privateKey = privateKey + "5C3G1yPo+bkFfoQSQHFlkSAwEk47J8b/I6FcGnE9u2Oi712swB8swmxym2GIw0+SxfZgJhB9KJRZl4YdXQGtmNIn2B9QlTkAIhoqiTWrNLoViv6SrFiOs1xTmQKBgDBm";
			privateKey = privateKey + "BIC2zEsU1XUIhmZZWgOAWMxGJH//bX0De/mH7em7YfJGm0riLkFi8qsawMTEUCndkMHUeKOfmXHnkjUSn2/UMQTy+1KChdXn4ty11w8sTFiaDOIslliB9w64cHzwtGkj";
			privateKey = privateKey + "g4SLFq2BIZ9wDUCFgV9QVhi3S1AcQHHBN1L0qEkvAoGBAKsiViobEYYGttU9PfwOgtZrYmi/f3zfDNFfNHgRE7vtx2wowY9neagrblx0ympJJsS2DIOA5SDMms0ApqQ0";
			privateKey = privateKey + "Ki5eqKyg8S85+OPuJjQgMn1OuBJmknFcmMVi/R+qEGSbmSA3ZY7eZ8r6zexDOac/kGH3jA9LzJArP1Usw5eaBu/f";
			
			//公钥
			String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC69veKW1X9GETEFr49gu9PN8w7H6alWec8wmF8SoP3tqQLAflZp8g83UZPX2UWhClnm53P5ZwesaeSTHkXkSI0iSjwd27N07bc8puNgB5BAGhJ80KYqTv3Zovl04C8AepVmxy9iFniJutJSYYtsRcnHYyUNoJai4VXhJsp5ZRMqwIDAQAB";
			
			//加密串明文
			String src = "REP_B2CPAYMENT" + "V4.1.2.1.1" + "UTF-8" + "SFT" + "20151212003327" + "767497" + "0.01" 
			  + "" + "" + "" + "43" + "CMBC" + "" + "" 
			  + "http://www.cp020.com/newcz/sft/apiNotify.jhtml" + "" + "" + "" + "" + "{\"agreementNo\":\"342372\"}" + "RSA" ;
			
			//调用加密算法,测试
			String rsa = RSA.sign(src, privateKey, "utf-8");
			System.out.println("rsa=" + rsa);
			
			String src2 = "REP_B2CPAYMENTV4.1.2.1.1UTF-8SFT20151212004835CMBC7674970.01201512120032595172460.0101PT02120151212003259429861{\"agreementNo\":\"342372\"}RSA";
			String rsa2 = RSA.sign(src2, privateKey, "utf-8");
			System.out.println("rs2=" + rsa2);
			
			//通知中的加密串
			String repRsa = "CAGU1LD1c+Gzkox/qG9rMNKvqpAkDXtHoTs21wIY6P4Yr8LXEzGAJPeu+2jlAqKwo4luChvgKXJUTbK7gAORIYdwDNocOu93xielFt9N9Hs8/iTMO6kmAXfa4vvc16gdv1np/+9VABzrLYPKTxxVdwmlE0QYG5HrlR9sxaU0gGg=";
			//表单验签
			String src3 = "REP_B2CPAYMENTV4.1.2.1.1UTF-881aba96a-c08f-4240-bb1e-32c2db85926fSFT20151212003327CMBC7674970.01201512120032595172460.0101PT02120151212003259429861{\"agreementNo\":\"342372\"}RSA";
			
			boolean signResult = RSA.verify(src3, repRsa,publicKey, "utf-8");
			System.out.println("signResult=" + signResult);
			
		}catch(Exception e){}
	}*/
	
	//String aa = "{\"returnCode\":\"SUCCESS\",\"returnMessage\":\"请求正常完成\",\"exts\":null,\"agreementInfoList\":null}";
	//String bb = "sr5VTlcqbdrP7o55yXkq77koy6D4ZqgHKPN1sdd7NFyI2jSfEoKNGyG8bY9jcEBrbvXjeXUu03SZoPIqK0iN1jv/Zy5CLwz8IyuEFw3a5wP6yAN49SyaBLh6lm1yHypsZsocEA5+wXwZd2G9nwt9OGr06VEA9/5ADjXZ2C9FAu4=";
	//boolean cc = RSA.verify(aa, bb,SftService.publicKey, "utf-8");
	//System.out.println(cc);
}