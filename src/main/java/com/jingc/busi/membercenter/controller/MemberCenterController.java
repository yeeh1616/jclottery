/**
 * 
 */
package com.jingc.busi.membercenter.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.MemberWithdraw;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreReceiv;
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
import com.jingc.busi.util.member.StoreReceivTypeState;
import com.jingc.constant.util.GameUtil;

/**
 * <p>
 * File: MemberCenterController.java
 * </p>
 * <p>
 * Desc: ????????????Controller
 * </p>
 * <p>
 * Copyright: Copyright (c) 2013
 * </p>
 * <p>
 * Company: ????????????????????????????????????????????????
 * </p>
 * 
 * @author luochang
 * @version 1.0 2014-3-4
 *          <p>
 *          ??????????????? ??????????????????
 *          </p>
 * @see ?????????1
 */
@Controller
// @RequestMapping("/memberCenter/")
public class MemberCenterController {
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
	
	//@Resource
	//private CustomService customService;

	/*
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/index.jhtml")
	// @ResponseBody
	public ModelAndView centerIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Double[] mones = this.loginService.getAccount(mb.getId());
		// ????????????????????????[???????????????????????????????????????????????????????????????]
		mv.addObject("mones", mones);
		// ??????????????????????????????
		String[] veriMessage = new String[3];
		veriMessage[0] = mb.getCertiNumber();// ???????????????
		veriMessage[1] = mb.getBankAccount();// ???????????????
		veriMessage[2] = mb.getPhone() + "";// ????????????
		mv.addObject("veriMessage", veriMessage);

		mv.setViewName("membercenter/index");
		return mv;
	}
	/*
	 * ????????????
	 */
	@RequestMapping("/memberCenter/drawinfo.jhtml")
	// @ResponseBody
	public ModelAndView drawinfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		List<MemberWithdraw> list=this.memberCenterService.drawInfo(mb.getId());
		mv.addObject("list",list);
		mv.setViewName("membercenter/drawinfo");
		return mv;
	}
	/*
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/changeAccount.jhtml")
	// @ResponseBody
	public ModelAndView changeAccount(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int id=Integer.parseInt(request.getParameter("id"));
		MemberWithdraw withdraw=this.memberCenterService.drawInfoById(id);
		String accountType=withdraw.getAccountType();
		//int i=accountType.length();
		String zhihang=accountType.substring(accountType.indexOf('|')+1,accountType.length());
		mv.addObject("withdraw",withdraw);
		mv.addObject("zhihang", zhihang);
		mv.setViewName("membercenter/bankCard");
		return mv;
	}
	/*
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/updateAccount.jhtml")
	// @ResponseBody
	public ModelAndView updateAccount(HttpServletRequest request,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int id=Integer.parseInt(request.getParameter("id"));
		String accountType=request.getParameter("accountType");
		String card=request.getParameter("bankId");
		String zhihang=request.getParameter("subBankName");
		accountType +="|";
		accountType +=zhihang;
		//MemberWithdraw memberWithdraw=new MemberWithdraw();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//??????????????????
		String time=df.format(new Date());// new Date()???????????????????????????
		this.memberCenterService.updateWithdrawById(id, accountType, card,time);
		//memberWithdraw.set
		//MemberWithdraw withdraw=this.memberCenterService.drawInfoById(id);
		Member mb = (Member) session.getAttribute("member");
		List<MemberWithdraw> list=this.memberCenterService.drawInfo(mb.getId());
		mv.addObject("list",list);
		mv.setViewName("membercenter/drawinfo");
		return mv;
	}
	/*
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/updateDrawstate.jhtml")
	// @ResponseBody
	public ModelAndView updateDrawstate(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		int id=Integer.parseInt(request.getParameter("id"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//??????????????????
		String time=df.format(new Date());// new Date()???????????????????????????
		this.memberCenterService.updateDrawstate(id,time);
		List<MemberWithdraw> list=this.memberCenterService.drawInfo(mb.getId());
		mv.addObject("list",list);
		mv.setViewName("membercenter/drawinfo");
		return mv;
	}
	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/purchasList.jhtml")
	public ModelAndView purchasList(HttpSession session, Integer pageNo,
			Integer pageSize, Integer type, String beginTime, String endTime,
			LotteryOrder param) {
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
		param.setBetType(LotteryOrderState.BET_TYPE_BUY);
		Pagination pagination = null;
		// ???????????????
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService
					.getYYTOrderByMemberAndGameType(param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getOrderByMemberAndGameType(
					param, pageNo, pageSize);

		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenter/purchasList");
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
	@RequestMapping("/memberCenter/changeOrderState.jhtml")
	public String changeOrderState(HttpSession session,
			HttpServletRequest request) {
		Member mb = (Member) session.getAttribute("member");
		String[] orderIds = request.getParameterValues("orderId");
		for (String orderId : orderIds) {
			this.memberCenterService.updateLotteryOrderState(Integer
					.parseInt(orderId), mb.getId());
		}
		return "redirect:/memberCenter/purchasList.jhtml";
	}

	/***
	 * ???????????????????????????
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenter/deleteOrder.do")
	@ResponseBody
	public String deleteOrder(HttpSession session, Integer orderId) {
		if (this.memberCenterService.deleteLotteryOrder(orderId) > 0)
			return "1";
		else
			return "0";
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/prizeList.jhtml")
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
		// param.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_COMPLETE_WIN
		// + "");
		Pagination pagination = null;
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService.getMemberOrderListBonus(
					param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getMemberOrderListBonus(
					param, pageNo, pageSize);

		// Pagination pagination =
		// this.memberCenterService.getMemberOrderListBonus(param, pageNo,
		// pageSize);

		// ????????????????????????
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenter/prizeList");
		return mv;
	}
     
	/**
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/putMoneyList.jhtml")
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

		mv.setViewName("membercenter/putMoneyList");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/putMoneyOutLine.jhtml")
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
		mv.setViewName("membercenter/putMoneyOutLine");
		return mv;
	}

	/**
	 * ??????
	 */
	@RequestMapping("/memberCenter/getMoney.jhtml")
	public ModelAndView getMoney(HttpSession session) {
		/*ModelAndView mv = new ModelAndView();
		// ?????????????????????????????????
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());

		//Double[] mones = this.loginService.getAccount(mb.getId());
		// ????????????????????????[???????????????????????????????????????????????????????????????]
		//mv.addObject("mones", mones);
		Double sumConsume = 0.0;//????????????
		Double sumPut = 0.0;//????????????
		Double sumBonus = 0.0;//????????????
		Double sumGet = 0.0;//????????????
		Double sumDebit = 0.0;//?????????????????????
		Double sumWaitGet = 0.0;//?????????????????????
		Double pointer = 0.0;//????????????????????????????????????
		
		Double[] allMoney = this.memberCenterService.allowGetMoney(mb.getId());
		if(allMoney != null && allMoney.length == 6){
			 sumPut = allMoney[0];//????????????
			 sumBonus = allMoney[1];//????????????
			 sumConsume = allMoney[2];//????????????
			 sumGet = allMoney[3];//????????????
			 sumDebit = allMoney[4];//?????????????????????
			 sumWaitGet = allMoney[5];//?????????????????????
		}
		Store storeRecord = (Store) session.getAttribute("domain");
		pointer = storeRecord.getConsumpProp();
		
		//??????????????? = (?????????*(1-????????????))+?????????-?????????-????????? - ????????????????????? -?????????????????????
		//Double allowGet = sumPut * (1-pointer) + sumBonus - sumConsume - sumGet - sumDebit - sumWaitGet;
		//??????????????? = ((?????????-?????????????????????)*(1-????????????))+?????????                  -?????????  -?????????????????????-?????????
		Double allowGet = (sumPut - sumDebit) * (1-pointer) + sumBonus  - sumGet - sumWaitGet - sumConsume;
		if(allowGet.doubleValue() < 0){
			allowGet = 0.0;
		}
		mv.addObject("allowGet", allowGet);
		//????????????????????????????????????String[]{?????????????????????,?????????,?????????,?????????,?????????????????????,?????????????????????,?????????}
		mv.addObject("auxMessage",new String[]{pointer+"",sumPut+"",sumBonus+"",sumGet+"",sumDebit+"",sumWaitGet+"",sumConsume+""} );
		mv.addObject("mb", mb);
		// ??????????????????,??????????????????
		if (CommonTag.isEmpty(mb.getCertiName()).equals("true")
				|| CommonTag.isEmpty(mb.getBankAccount()).equals("true")) {
			mv.setViewName("membercenter/getMoneyPrepare");
		} else {
			mv.setViewName("membercenter/getMoney");
			// mv.setViewName("membercenter/getMoneyPrepare");
		}
		return mv;*/
		ModelAndView mv = new ModelAndView();
		// ?????????????????????????????????
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());

		Double[] mones = this.loginService.getAccount(mb.getId());
		// ????????????????????????[???????????????????????????????????????????????????????????????]
		mv.addObject("mones", mones);

		mv.addObject("mb", mb);
		// ??????????????????,??????????????????
		if (CommonTag.isEmpty(mb.getCertiName()).equals("true")
				|| CommonTag.isEmpty(mb.getBankAccount()).equals("true")) {
			mv.setViewName("membercenter/getMoneyPrepare");
		} else {
			mv.setViewName("membercenter/getMoney");
			// mv.setViewName("membercenter/getMoneyPrepare");
		}
		return mv;
	}

	/***
	 * ???????????????
	 * 
	 * @param session
	 * @param currMoney
	 * @return
	 */
	@RequestMapping("/memberCenter/doGetMoney.jhtml")
	public String doGetMoney(HttpSession session, Double currMoney) {
		Member mb = (Member) session.getAttribute("member");
		/*Double[] money = this.loginService.getAccount(mb.getId());
		//???????????????????????????????????????????????? ??? ???????????????????????? ??????
		if(money[4] < currMoney){
			throw new BaseException("??????????????????????????????????????????");
		}*/
		
		MemberAccount getMemberAccount = this.loginService.getMemberAccount(mb.getId());
		double amountUsedGetMoney = getMemberAccount.getMoneyAccount() - getMemberAccount.getFrozenAccount();//???????????????
		if(amountUsedGetMoney < currMoney){
			throw new BaseException("??????????????????????????????????????????");
		}
		
		this.memberCenterService.doGetMoney(mb, currMoney , getMemberAccount , "" , "");
		return "redirect:/memberCenter/getMoneySucc.jhtml";
	}

	/***
	 * ??????????????????url??????????????????????????????
	 */
	@RequestMapping("/memberCenter/getMoneySucc.jhtml")
	public ModelAndView getMoneySucc(HttpSession session) {
		// Member mb = (Member)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/getMoneySucc");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/getMoneyList.jhtml")
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
		mv.setViewName("membercenter/getMoneyList");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/accountDetail.jhtml")
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
		mv.setViewName("membercenter/accountDetail");
		return mv;
	}

	/**
	 * ???????????????
	 */
	@RequestMapping("/memberCenter/debitList.jhtml")
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
		mv.setViewName("membercenter/debitList");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/safeIndex.jhtml")
	public ModelAndView safeIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenter/safeIndex");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/personDatum.jhtml")
	public ModelAndView personDatum(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member sessionMb = (Member) session.getAttribute("member");
		Member mb = this.memberCenterService.getOneMember(sessionMb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenter/personDatum");
		return mv;
	}

	/**
	 * ????????????????????????
	 */
	@RequestMapping("/memberCenter/doPersonDatum.jhtml")
	public ModelAndView doPersonDatum(HttpSession session, Integer gender,
			String province, String city, Integer qq, String phone, String email) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb.setGender(gender);
		mb.setProvince(province);
		mb.setCity(city);
		mb.setQq(qq + "");
		mb.setPhone(phone);
		mb.setEmail(email);

		this.memberCenterService.updateMemberMessage(mb);
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);

		mv.setViewName("membercenter/personDatumSucc");
		return mv;
	}

	/**
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/changePass.jhtml")
	public ModelAndView changePass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changePass");
		return mv;
	}

	/**
	 * ?????????????????????????????????
	 * 
	 * @param session
	 * @param loginPass
	 * @return
	 */
	@RequestMapping("/memberCenter/checkOldLoginPass.do")
	@ResponseBody
	public String checkOldLoginPass(HttpSession session, String loginPass) {
		Member mb = (Member) session.getAttribute("member");
		String newMd5LoginPass = com.jingc.afc.util.MD5.toMD5WithJDK(loginPass);

		if (mb.getLoginPass().toUpperCase().equalsIgnoreCase(
				newMd5LoginPass.toUpperCase())) {
			return "1";// ????????????
		} else {
			return "0";// ????????????
		}
	}

	/**
	 * ????????????????????????
	 * 
	 * @param session
	 * @param loginPass
	 * @return
	 */
	@RequestMapping("/memberCenter/doChangePass.jhtml")
	public ModelAndView doChangePass(HttpSession session, String loginPass) {
		Member mb = (Member) session.getAttribute("member");
		mb.setLoginPass(com.jingc.afc.util.MD5.toMD5WithJDK(loginPass)
				.toUpperCase());
		this.memberCenterService.updateMemberMessage(mb);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changePassSucc");
		return mv;
	}

	/**
	 * ??????????????????
	 */
	@RequestMapping("/memberCenter/changeAccountPass.jhtml")
	public ModelAndView changeAccountPass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changeAccountPass");
		return mv;
	}

	/**
	 * ?????????????????????????????????
	 * 
	 * @param session
	 * @param loginPass
	 * @return
	 */
	@RequestMapping("/memberCenter/checkOldAccountPass.do")
	@ResponseBody
	public String checkOldAccountPass(HttpSession session, String accountPass) {
		Member mb = (Member) session.getAttribute("member");
		String newMd5AccountPass = com.jingc.afc.util.MD5
				.toMD5WithJDK(accountPass);
		if (mb.getAccountPass().equals(newMd5AccountPass.toUpperCase()))
			return "1";// ????????????
		else
			return "0";// ????????????
	}

	/**
	 * ????????????????????????
	 * 
	 * @param session
	 * @param accountPass
	 * @return
	 */
	@RequestMapping("/memberCenter/doChangeAccountPass.jhtml")
	public ModelAndView doChangeAccountPass(HttpSession session,
			String accountPass) {
		Member mb = (Member) session.getAttribute("member");
		mb.setAccountPass(com.jingc.afc.util.MD5.toMD5WithJDK(accountPass)
				.toUpperCase());
		this.memberCenterService.updateMemberMessage(mb);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changePassSucc");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/passProtect.jhtml")
	public ModelAndView passProtect(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);

		mv.setViewName("membercenter/passProtect");
		return mv;
	}

	/***
	 * ??????????????????
	 * 
	 * @param session
	 * @param passQuestion
	 * @param passAnswer
	 * @return
	 */
	@RequestMapping("/memberCenter/doPassProtect.jhtml")
	public ModelAndView doPassProtect(HttpSession session, String passQuestion,
			String passAnswer) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb.setPassQuestion(passQuestion);
		mb.setPassAnswer(passAnswer);
		this.memberCenterService.updateMemberMessage(mb);

		mv.setViewName("membercenter/passProtectSucc");
		return mv;
	}

	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/authenticat.jhtml")
	public ModelAndView authenticat(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// ???????????????
		if (CommonTag.isEmpty(mb.getCertiName()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenter/unAuthenticat");
		}
		// ??????????????????
		else{
			mv.addObject("mb",mb);
			mv.setViewName("membercenter/authenticat");
		}
		return mv;
	}

	/***
	 * ??????????????????
	 * 
	 * @param session
	 * @param certiName
	 *            ????????????
	 * @param certiNumber
	 *            ????????????
	 * @return
	 */
	@RequestMapping("/memberCenter/authenticatSure.jhtml")
	public ModelAndView authenticatSure() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/authenticatSure");
		return mv;
	}

	/***
	 * ??????????????????
	 * 
	 * @param session
	 * @param certiName
	 *            ????????????
	 * @param certiNumber
	 *            ????????????
	 * @return
	 */
	@RequestMapping("/memberCenter/doAuthenticat.jhtml")
	public ModelAndView doAuthenticat(HttpSession session, String certiName,
			String certiNumber,String phone) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb.setCertiName(certiName);
		mb.setCertiNumber(certiNumber);
		mb.setPhone(phone);
		this.memberCenterService.updateMemberMessage(mb);

		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenter/authenticatSucc");
		return mv;
	}

	/**
	 * ???????????????
	 */
	@RequestMapping("/memberCenter/bankCard.jhtml")
	public ModelAndView bankCard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// ?????????????????????
		if (CommonTag.isEmpty(mb.getBankAccount()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenter/unBankCard");
		} else {// ??????????????????
			// ???????????????????????????????????????
			Integer storeId = mb.getStoreId();
			StoreReceiv param = new StoreReceiv();
			param.setStoreId(storeId);
			List<StoreReceiv> storeBanklist = this.memberCenterService
					.getStoreReceivAccount(param, new Pagination());
			mv.addObject("storeBanklist", storeBanklist);
			mv.setViewName("membercenter/bankCard");
		}
		return mv;
	}

	/**
	 * ?????????????????????
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenter/changeBankCard.jhtml")
	public ModelAndView changeBankCard(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// ???????????????????????????????????????
		Member mb = (Member) session.getAttribute("member");
		Integer storeId = mb.getStoreId();
		StoreReceiv param = new StoreReceiv();
		param.setStoreId(storeId);
		List<StoreReceiv> storeBanklist = this.memberCenterService
				.getStoreReceivAccount(param, new Pagination());
		mv.addObject("storeBanklist", storeBanklist);
		mv.setViewName("membercenter/bankCard");
		return mv;
	}

	/**
	 * ???????????????
	 */
	@RequestMapping("/memberCenter/bankCardSure.jhtml")
	public ModelAndView bankCardSure(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/bankCardSure");
		return mv;
	}

	/**
	 * ?????????????????????
	 * 
	 * @param session
	 * @param bankUserName
	 *            ?????????
	 * @param bankName
	 *            ????????????
	 * @param bankAccount
	 *            ??????
	 * @return
	 */
	@RequestMapping("/memberCenter/doBankCard.jhtml")
	public ModelAndView doBankCard(HttpSession session, String subBankName,
			String bankName, String bankAccount) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb.setBankName(bankName);
		mb.setBankUserName(subBankName);
		mb.setBankAccount(bankAccount);

		this.memberCenterService.updateMemberMessage(mb);

		mb = this.memberCenterService.getOneMember(mb.getId());
		mv.addObject("mb", mb);
		mv.setViewName("membercenter/bankCardSucc");
		return mv;
	}

	/**
	 * ?????????
	 */
	@RequestMapping("/memberCenter/message.jhtml")
	public ModelAndView message(HttpSession session, Integer pageNo,
			Integer pageSize, Integer state, String beginTime, String endTime,
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
		mv.setViewName("membercenter/message");
		return mv;
	}

	/**
	 * ?????????????????????????????????
	 * 
	 * @param session
	 * @param loginPass
	 * @return
	 */
	@RequestMapping("/memberCenter/setMessageRead.do")
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

	/***
	 * ?????????????????????????????????????????????????????????????????????
	 * 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            ????????????
	 * @param LicenseId
	 *            ????????????
	 * @return
	 */
	@RequestMapping("/memberCenter/orderDetail.jhtml")
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
			mv = new ModelAndView("/membercenter/order_detail_jc",
					"guessorder", guessorder);
		} else if (LicenseId == GameUtil.GAMEIDSFC
				|| LicenseId == GameUtil.GAMEIDRXJ
				|| LicenseId == GameUtil.GAMEIDBQC
				|| LicenseId == GameUtil.GAMEIDJQC) {
			// ??????
			TraditionOrder zcorder = this.orderservice.findZcOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenter/order_detail_zc", "zcorder",
					zcorder);
		} else {
			// ?????????
			TraditionOrder mathorder = this.orderservice.findMathOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenter/order_detail_math",
					"mathorder", mathorder);
		}

		return mv;
	}
	
	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/chaseList.jhtml")
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
		mv.setViewName("membercenter/ChaseNumberRecord");

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
	@RequestMapping("/memberCenter/DescriptionChase.jhtml")
	public ModelAndView DescriptionChase(HttpSession session, Integer pageNo,
			Integer pageSize, Integer orderId, Integer LicenseId) {
		TraditionOrderchasing mathorder = this.orderservice.findMathOrderchase(
				orderId, pageNo, pageSize );
		ModelAndView mv = new ModelAndView("/membercenter/DescriptionChase",
				"mathorder", mathorder);
		return mv;
	}

	/**
	 * ??????????????????
	 * 
	 * @param session
	 *@param orderId
	 *            ????????????
	 */

	@RequestMapping("/memberCenter/colse.do")
	@ResponseBody
	public String orderColse(HttpSession session, Integer orderId) {

		this.chasingService.cancelOneIssueChasing(orderId);
		return "?????????";

	}
	
	/**********************????????????******************************/
	
	/**
	 * ????????????
	 */
	@RequestMapping("/memberCenter/mergerJoinList.jhtml")
	public ModelAndView mergerJoinList(HttpSession session, Integer pageNo,
			Integer pageSize, MergerJoin param){
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		param.setJoinUserid(userId);
		param.setStoreid(storeId);
		Pagination pin = this.mergerQueryService.getMergerJoinRecord(pageNo, pageSize, param);
		// ????????????????????????
		List<StoreLicense> types = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("ltype", types);
		mv.addObject("pin", pin);
		mv.setViewName("membercenter/mergerRecord");
		return mv;
	}
	/**********************????????????******************************/
	
	/***
	 * ???????????????????????????
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenter/deleteCustom.do")
	@ResponseBody
	public String deleteCustom(HttpSession session, Integer customId) {
		if (this.memberCenterService.deleteMergerCustom(customId) > 0)
			return "1";
		else
			return "0";
	}
	
	/********************************************************************************
	 * **************************utils test**********************************
	 *************************************************************************/
	public static String getUTF8StringFromGBKString(String gbkStr) {  
        try {  
            return new String(getUTF8BytesFromGBKString(gbkStr), "UTF-8");  
        } catch (Exception e) {  
            throw new InternalError();  
        }  
    }  
      
    public static byte[] getUTF8BytesFromGBKString(String gbkStr) {  
        int n = gbkStr.length();  
        byte[] utfBytes = new byte[3 * n];  
        int k = 0;  
        for (int i = 0; i < n; i++) {  
            int m = gbkStr.charAt(i);  
            if (m < 128 && m >= 0) {  
                utfBytes[k++] = (byte) m;  
                continue;  
            }  
            utfBytes[k++] = (byte) (0xe0 | (m >> 12));  
            utfBytes[k++] = (byte) (0x80 | ((m >> 6) & 0x3f));  
            utfBytes[k++] = (byte) (0x80 | (m & 0x3f));  
        }  
        if (k < utfBytes.length) {  
            byte[] tmp = new byte[k];  
            System.arraycopy(utfBytes, 0, tmp, 0, k);  
            return tmp;  
        }  
        return utfBytes;  
    }  
}
