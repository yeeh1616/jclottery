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
 * ????????????
 * <p>File: MemberCenterNewController.java</p>
 * <p>Desc: </p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: ????????????</p> 
 * @author zhanghao
 * @version 1.0 2015-7-7
 * <p>          ??????????????? ??????????????????</p>
 * @see     ?????????1
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
	 * ????????????????????????zh
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/index.jhtml")
	public ModelAndView userCenter(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		Member mb = this.memberCenterService.getOneMember(smb.getId());
		mb.setLoginTiem(smb.getLoginTiem());
		List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());//????????????????????????
		Double[] mones = this.loginService.getAccount(mb.getId());
		/*======================== ?????????????????? ===========================*/
		MemberWithdraw[] mws = new MemberWithdraw[3];
		if (mwlist.size() != 0) {
			for (MemberWithdraw mw : mwlist) {
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Y)) {// ?????????
					mws[0] = mw;
				}
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_W)) {// ??????
					mws[1] = mw;
				}
				if (mw.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Z)) {// ?????????
					mws[2] = mw;
				}
			}
			
		}
		/*========================???????????? ????????????===========================*/
		LotteryOrder param = new LotteryOrder();
		Pagination pagination = null;//????????????
		Pagination pagination2 = null;//????????????
		param.setUserid(mb.getId());
		param.setBeginTime(DateUtil.getDayBefore(DateUtil.getDateFORMAT0Stirng(),7));
		param.setEndTime(DateUtil.getDateFormat0());
		param.setBetType(LotteryOrderState.BET_TYPE_BUY);
		// ????????????
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getYYTOrderByMemberAndGameType(param, 1, 10);
		} else {
			pagination = this.memberCenterService.getOrderByMemberAndGameType(param, 1, 10);
		}
		//????????????
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			param.setReserved1(currMember.getReserved1());
			pagination2 = this.memberCenterService.getMemberOrderListBonus(param, 1, 10);
		} else {
			pagination2 = this.memberCenterService.getMemberOrderListBonus(param, 1, 10);
		}
		Double[] result =  this.memberCenterService.allowGetMoney(mb.getId());//???????????????
		mv.addObject("debt", result[4]);
		mv.addObject("pagination", pagination);//????????????
		mv.addObject("pagination2", pagination2);//????????????
		mv.addObject("mones", mones);//????????????
		mv.addObject("mb", mb);//????????????
		mv.addObject("mws",mws);
		mv.setViewName("membercenternew/userCenter");
		return mv;
	}
	
	
	
	/**
	 * ???????????? zh
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/capital.jhtml")
	public ModelAndView centerIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		// ????????????????????????[???????????????????????????(??????)??????????????????????????????????????????????????????]
		Double[] mones = this.loginService.getAccount(mb.getId());
		Double[] result =  this.memberCenterService.allowGetMoney(mb.getId());
		mv.addObject("debit", result[4]);//????????????
		mv.addObject("mb", mb);
		mv.addObject("mones", mones);//????????????
		mv.setViewName("membercenternew/capital");
		return mv;
	}
	
	/**
	 * ????????????
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
		// ???????????????
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getYYTOrderByMemberAndGameType(param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getOrderByMemberAndGameType(param, pageNo, pageSize);

		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/purchasList");
		return mv;
	}
	
	/**
	 * ????????????
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

		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/chaseNumberRecord");
		return mv;
	}
	
	/***
	 * ?????????????????????????????????????????????
	 * 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            ???????????????????????????id
	 * @param LicenseId
	 *            ????????????
	 * @return
	 */
	@RequestMapping("/memberCenterNew/zhfax.jhtml")
	public ModelAndView DescriptionChase(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer LicenseId,HttpServletRequest request) {
		Member mb = (Member)session.getAttribute("member");
		if(mb == null){
			throw new BaseException("????????????");
		}
		TraditionOrderchasing mathorder = this.orderservice.findMathOrderchase(orderId, pageNo, pageSize);
		List<String[]> newList = new ArrayList<String[]>();//?????????
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
	 * ??????????????????
	 * 
	 * @param session
	 *@param orderId
	 *            ????????????
	 */

	@RequestMapping("/memberCenterNew/colse.do")
	@ResponseBody
	public String orderColse(HttpSession session, Integer orderId) {
		this.chasingService.cancelOneIssueChasing(orderId);
		return "?????????";
	}
	
	/**
	 * ???????????????????????? zh 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenterNew/colseAll.do")
	@ResponseBody
	public String orderColseAll(HttpSession session, Integer orderId){
		this.chasingService.cancelChasing(orderId);
		return "????????????";
	}
	
	/**
	 * ????????????
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
		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/mergerRecord");
		return mv;
	}
	
	/**
	 * ????????????
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
		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenternew/prizeList");
		return mv;
	}
	
	/**
	 * ???????????????IP ????????????????????????Request.getRemoteAddr()?????????????????????nginx???????????????????????????????????????????????????
	 * ???????????????Header?????????X-Real-IP????????????????????????X-Forwarded-For???????????????IP(???,??????)???
	 * ???????????????????????????Request .getRemoteAddr()???
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
			// ?????????????????????????????????IP????????????????????????IP???
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
	 * ??????????????????
	 *//*
	@RequestMapping("/memberCenterNew/moneyButton.jhtml")
    public ModelAndView moneyButton(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/moneyButton");
		return mv;
	}
	*/
	/**
	 * ???????????? Iframe
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

		mv.addObject("storeBanklist", storeBanklist);// ?????????????????????
		mv.addObject("store", store);// ????????????
		mv.setViewName("membercenternew/putMoneyOutLineIFrame");
		return mv;
	}*/
	
	/**
	 * ????????????
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

		mv.addObject("storeBanklist", storeBanklist);// ?????????????????????
		mv.addObject("store", store);// ????????????
		mv.setViewName("membercenternew/putMoneyOutLine");
		return mv;
	}*/
	
	/**
	 * ?????????????????? zh Copy
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
		// ???????????????
		Map<Integer, String> memberPayLogStates = MemberUtil.STATE.MEMBERPAYLOGSTATENAMES;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setCreateTimeBegin(beginTime);
		param.setCreateTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberPutMoney(
				param, pageNo, pageSize);

		mv.addObject("memberPayLogStates", memberPayLogStates);// ???????????????
		mv.addObject("pagination", pagination);// ????????????

		mv.setViewName("membercenternew/putMoneyList");
		return mv;
	}
	*/
	/**
	 * ???????????? zh
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
	 * ???????????? ?????? zh
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
	 * ???????????? zh
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
	 * ???????????? ?????? zh
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
	 * ???????????? ?????? zh
	 */
	@RequestMapping("/memberCenterNew/authenticat.jhtml")
	public ModelAndView authenticat(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// ???????????????
		if (CommonTag.isEmpty(mb.getCertiName()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenternew/authenticat");
		}
		// ??????????????????
		else{
			mv.addObject("mb",mb);
			mv.setViewName("membercenternew/authenticatSure");
		}
		return mv;
	}
	
	/**
	 * ???????????? ?????? zh
	 */
	@RequestMapping("/memberCenterNew/doAuthenticat.jhtml")
	public ModelAndView doAuthenticat(HttpSession session, Member member) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		member.setId(mb.getId());
		member.setLoginPass(null);//????????????????????????
		this.memberCenterService.updateMemberMessage(member);//????????????
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenternew/doAuthenticat");
		return mv;
	}
	
	/**
	 * ???????????? ?????? zh
	 */
	@RequestMapping("/memberCenterNew/changePass.jhtml")
	public ModelAndView changePass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/changePass");
		return mv;
	}
	
	/**
	 * ?????????????????? ?????? zh
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
	 * ???????????? ?????? zh
	 */
	@RequestMapping("/memberCenterNew/getMoneyOptions.jhtml")
	public ModelAndView getMoneyOptions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		//????????????????????????
		if(CommonTag.isEmpty(mb.getCertiName()).equals("false") && CommonTag.isEmpty(mb.getCertiNumber()).equals("false")){
			MemberWithdraw mwObj = this.memberCenterService.drawInfoOne(mb.getId());
			mv.addObject("mb", mb);
			mv.addObject("mwObj", mwObj);
			mv.setViewName("membercenternew/getMoneyOptions");
		}else{
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//???????????????????????????
		}
		return mv;
	}
	
	
	/*@RequestMapping("/memberCenterNew/getMoneyOptions.jhtml")
	public ModelAndView getMoneyOptions(HttpSession session){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		//????????????????????????
		if(CommonTag.isEmpty(mb.getCertiName()).equals("false") && CommonTag.isEmpty(mb.getCertiNumber()).equals("false")){
			MemberWithdraw[] mws = new MemberWithdraw[3];
			List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());
			for(MemberWithdraw mwd:mwlist){
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Y)){
					mws[0] = mwd;//?????????
				}
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_W)){
					mws[1] = mwd;//??????
				}
				if(mwd.getAccountType().equals(MemberUtil.ACCOUNT_TYPE_Z)){
					mws[2] = mwd;//?????????
				}
			}
			mv.addObject("mb", mb);
			mv.addObject("mws", mws);
			mv.setViewName("membercenternew/getMoneyOptions");
		}else{
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//???????????????????????????
		}
		return mv;
	}*/
	
	/**
	 * ?????????????????? ?????????????????? OK zh
	 */
	@RequestMapping("/memberCenterNew/addGetMoney.jhtml")
	public ModelAndView getMoneyAdd(HttpSession session, MemberWithdraw mw){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		String time = DateUtil.getDateFormat2();//??????????????????
		mw.setMemberId(mb.getId());
		mw.setCreatTime(time);
		mw.setStoreId(mb.getStoreId());
		mw.setAccountState(mw.getAccountState() == null?1:mw.getAccountState());
		String str = this.memberCenterService.addMemberWithdraw(mw);

		if (str.equals("SUCCESS")) {
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
		}else{
			throw new BaseException("????????????????????????");
		}
		return mv;
	}
	
	/**
	 * ????????????????????????  zh
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
			throw new BaseException("????????????");
		}
		return mv;
	}
	
	/**
	 * ???????????????????????? zh
	 */
	@RequestMapping("/memberCenterNew/defaultManner.jhtml")
	public ModelAndView defaultManner(HttpSession session, MemberWithdraw mw) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member)session.getAttribute("member");
		String str = this.memberCenterService.updMemberWithdrawStateByMid(mw.getAccountType(), mb.getId());
		if(str.equals("SUCCESS")){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");
		}else{
			throw new BaseException("???????????????");
		}
		return mv;
	}
	
	/**
	 * ????????????????????? zh AJAX
	 */
	@RequestMapping("/memberCenterNew/checkOldLoginPass.do")
	@ResponseBody
	public String checkOldLoginPass(HttpSession session, String loginPass) {
		Member mb = (Member) session.getAttribute("member");
		String newMd5LoginPass = com.jingc.afc.util.MD5.toMD5WithJDK(loginPass);
		if (mb.getLoginPass().toUpperCase().equalsIgnoreCase(newMd5LoginPass.toUpperCase())) {
			return "1";// ????????????
		} else {
			return "0";// ????????????
		}
	}
	
	/**
	 * ???????????????
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
		// ???????????????
		Map<Integer, String> debitState = MemberUtil.STATE.DEBITSTATEMAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setObligorId(memberId);
		param.setCreateTimeBegin(beginTime);
		param.setCreateTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberDebitLog(
				param, pageNo, pageSize);

		mv.addObject("debitState", debitState);// ???????????????
		mv.addObject("pagination", pagination);// ????????????
		mv.setViewName("membercenternew/debitList");
		return mv;
	}
	
	/**
	 * ???????????? zh Copy
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
		// ???????????????
		Map<Integer, String> memberMoneyType = MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_MAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setCreateBeginTime(beginTime);
		param.setCreateEndTime(endTime);
		param.setCategory(category);
		Pagination pagination = this.memberCenterService.getMemberMoneyLog(
				param, pageNo, pageSize);

		//Double[] mones = this.loginService.getAccount(memberId);

		// ????????????????????????[???????????????????????????????????????????????????????????????]
		//mv.addObject("mones", mones);
		mv.addObject("memberMoneyType", memberMoneyType);// ???????????????
		mv.addObject("pagination", pagination);// ????????????
		mv.setViewName("membercenternew/accountDetail");
		return mv;
	}
	
	/**
	 * ???????????? ?????? zh
	 */
	@RequestMapping("/memberCenterNew/getMoney.jhtml")
	public ModelAndView getMoney(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		if (mb.getCertiName() == null || mb.getCertiNumber() == null) {// ???????????????????????????
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//??????????????????
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
		if (mb.getCertiName() == null || mb.getCertiNumber() == null) {// ???????????????????????????
			mv.setViewName("redirect:/memberCenterNew/authenticat.jhtml");//??????????????????
			return mv;
		} 
		List<MemberWithdraw> mwlist = this.memberCenterService.drawInfo(mb.getId());
		if(mwlist.size() == 0){
			mv.setViewName("redirect:/memberCenterNew/getMoneyOptions.jhtml");//??????????????????
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
	 * ??????????????? zh
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
		double amountUsedGetMoney = accountRecord.getMoneyAccount() + accountRecord.getBonusAccount() - accountRecord.getFrozenAccount();//???????????????
		if(amountUsedGetMoney < currMoney){
			throw new BaseException("??????????????????????????????????????????");
		}
		this.memberCenterService.doGetMoney(currMember, currMoney , accountRecord , typeNameV , accountMessageV);
		mv.setViewName("redirect:/memberCenterNew/getMoneySucc.jhtml");
		return mv;
	}
	
	/***
	 * ??????????????????url??????????????????????????????  zh
	 */
	@RequestMapping("/memberCenterNew/getMoneySucc.jhtml")
	public ModelAndView getMoneySucc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/getMoneySucc");
		return mv;
	}
	
	
	/**
	 * ????????????
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
		// ???????????????
		Map<Integer, String> memberDrowStates = MemberUtil.STATE.MEMBERDROWSTATENAMES;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setMemberId(memberId);
		param.setBeginCreateTime(beginTime);
		param.setEndCreateTime(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberGetMoney(
				param, pageNo, pageSize);

		mv.addObject("memberDrowStates", memberDrowStates);// ???????????????
		mv.addObject("pagination", pagination);// ????????????
		mv.setViewName("membercenternew/getMoneyList");
		return mv;
	}
	
	
	/***
	 * ????????????????????????????????????????????????????????????????????? Ok zh update
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            ????????????
	 * @param LicenseId
	 *            ????????????
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
			throw new BaseException("????????????????????????????????????????????????");
		}

		ModelAndView mv = null;
		if ((LicenseId == GameUtil.GAMEIDJCZQ
				&& !"8".equals(orderRecord.getPlayType()) && !"9"
				.equals(orderRecord.getPlayType()))
				|| LicenseId == GameUtil.GAMEIDJCLQ || LicenseId == Constants.LICENSE_BJDC || LicenseId == Constants.LICENSE_SFGG) {
			// ??????
			GuessOrder guessorder = this.orderservice.findGuessOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/order_detail_jc",
					"guessorder", guessorder);
		} else if (LicenseId == GameUtil.GAMEIDSFC
				|| LicenseId == GameUtil.GAMEIDRXJ
				|| LicenseId == GameUtil.GAMEIDBQC
				|| LicenseId == GameUtil.GAMEIDJQC) {
			// ??????
			TraditionOrder zcorder = this.orderservice.findZcOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenternew/order_detail_zc", "zcorder",
					zcorder);
		} else {
			// ?????????
			TraditionOrder mathorder = this.orderservice.findMathOrder(orderId,pageNo, pageSize);
			List<String[]> newList = new ArrayList<String[]>();//?????????
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
	 * ?????????????????????????????????
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
				//????????????????????????????????????(????????????????????????)
				StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,mb.getStoreId(),StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_BHALL,true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/memberCenterNew/purchasList.jhtml";
	}
	
	/*** 
	 * ??????????????????????????? zh Copy
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
	 * ?????????
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
		// ???????????????
		Map<Integer, String> memberMessageState = MessageStateType.READ_STATE_MAP;

		Integer memberId = ((Member) session.getAttribute("member")).getId();
		param.setAcceptUserId(memberId);
		param.setSendTimeBegin(beginTime);
		param.setSendTimeEnd(endTime);
		param.setState(state);
		Pagination pagination = this.memberCenterService.getMemberMessageList(
				param, pageNo, pageSize);

		mv.addObject("memberMessageState", memberMessageState);// ???????????????
		mv.addObject("pagination", pagination);// ????????????
		mv.setViewName("membercenternew/message");
		return mv;
	}
	
	/**
	 *???????????????
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
			return "1";// ??????????????????
		else
			return "0";//
	}
	
	/**
	 * ?????????????????? zh
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
	 * ???????????????????????????
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
	 * ????????????
	 */
	@RequestMapping("/memberCenterNew/myTeam.jhtml")
	public ModelAndView myTeam(HttpSession session,String memberName, Integer pageNo,Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		Pagination pagination = this.memberCenterService.getMyTeam(smb.getId()+"", memberName,pageNo, pageSize);
		mv.addObject("pagination", pagination);// ????????????
		
		//????????????
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
		// ???????????????????????????
		ReturnForm rForm = sftService.getReturnForm(request);
		
		// ??????????????????????????????
		if (sftService.checkReturnFormRSA(rForm)) {
			
		}
		return "";
	}*/
	
	/*public static void main(String[] args){
		//HttpHandler handle = HttpHandler.getInstance();
		try{
			//String cont = "TransNo=20151212003259517246&PaymentNo=20151212003325996532&OrderAmount=0.01&TransTime=20151212003259&SendTime=20151212003327&TraceNo=81aba96a-c08f-4240-bb1e-32c2db85926f&TransAmount=0.01&BankSerialNo=020942015121213091&Charset=UTF-8&OrderNo=767497&TransType=PT021&PayableFee=0.00&Ext1={'agreementNo':'342372'}&Version=V4.1.2.1.1&Ext2=&TransStatus=01&PayChannel=43&SignType=RSA&ReceivableFee=0.00&Name=REP_B2CPAYMENT&InstCode=CMBC&outMemberId=&MerchantNo=429861&MsgSender=SFT&SignMsg=CAGU1LD1c+Gzkox/qG9rMNKvqpAkDXtHoTs21wIY6P4Yr8LXEzGAJPeu+2jlAqKwo4luChvgKXJUTbK7gAORIYdwDNocOu93xielFt9N9Hs8/iTMO6kmAXfa4vvc16gdv1np/+9VABzrLYPKTxxVdwmlE0QYG5HrlR9sxaU0gGg=&ErrorMsg=&ErrorCode=";
			//handle.doPost("http://localhost/newcz/sft/apiNotify.jhtml",cont);
			//??????
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
			
			//??????
			String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC69veKW1X9GETEFr49gu9PN8w7H6alWec8wmF8SoP3tqQLAflZp8g83UZPX2UWhClnm53P5ZwesaeSTHkXkSI0iSjwd27N07bc8puNgB5BAGhJ80KYqTv3Zovl04C8AepVmxy9iFniJutJSYYtsRcnHYyUNoJai4VXhJsp5ZRMqwIDAQAB";
			
			//???????????????
			String src = "REP_B2CPAYMENT" + "V4.1.2.1.1" + "UTF-8" + "SFT" + "20151212003327" + "767497" + "0.01" 
			  + "" + "" + "" + "43" + "CMBC" + "" + "" 
			  + "http://www.cp020.com/newcz/sft/apiNotify.jhtml" + "" + "" + "" + "" + "{\"agreementNo\":\"342372\"}" + "RSA" ;
			
			//??????????????????,??????
			String rsa = RSA.sign(src, privateKey, "utf-8");
			System.out.println("rsa=" + rsa);
			
			String src2 = "REP_B2CPAYMENTV4.1.2.1.1UTF-8SFT20151212004835CMBC7674970.01201512120032595172460.0101PT02120151212003259429861{\"agreementNo\":\"342372\"}RSA";
			String rsa2 = RSA.sign(src2, privateKey, "utf-8");
			System.out.println("rs2=" + rsa2);
			
			//?????????????????????
			String repRsa = "CAGU1LD1c+Gzkox/qG9rMNKvqpAkDXtHoTs21wIY6P4Yr8LXEzGAJPeu+2jlAqKwo4luChvgKXJUTbK7gAORIYdwDNocOu93xielFt9N9Hs8/iTMO6kmAXfa4vvc16gdv1np/+9VABzrLYPKTxxVdwmlE0QYG5HrlR9sxaU0gGg=";
			//????????????
			String src3 = "REP_B2CPAYMENTV4.1.2.1.1UTF-881aba96a-c08f-4240-bb1e-32c2db85926fSFT20151212003327CMBC7674970.01201512120032595172460.0101PT02120151212003259429861{\"agreementNo\":\"342372\"}RSA";
			
			boolean signResult = RSA.verify(src3, repRsa,publicKey, "utf-8");
			System.out.println("signResult=" + signResult);
			
		}catch(Exception e){}
	}*/
	
	//String aa = "{\"returnCode\":\"SUCCESS\",\"returnMessage\":\"??????????????????\",\"exts\":null,\"agreementInfoList\":null}";
	//String bb = "sr5VTlcqbdrP7o55yXkq77koy6D4ZqgHKPN1sdd7NFyI2jSfEoKNGyG8bY9jcEBrbvXjeXUu03SZoPIqK0iN1jv/Zy5CLwz8IyuEFw3a5wP6yAN49SyaBLh6lm1yHypsZsocEA5+wXwZd2G9nwt9OGr06VEA9/5ADjXZ2C9FAu4=";
	//boolean cc = RSA.verify(aa, bb,SftService.publicKey, "utf-8");
	//System.out.println(cc);
}