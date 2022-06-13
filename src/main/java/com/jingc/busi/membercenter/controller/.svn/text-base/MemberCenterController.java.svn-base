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
 * Desc: 个人中心Controller
 * </p>
 * <p>
 * Copyright: Copyright (c) 2013
 * </p>
 * <p>
 * Company: 北京中科易达科技发展有限责任公司
 * </p>
 * 
 * @author luochang
 * @version 1.0 2014-3-4
 *          <p>
 *          修改者姓名 修改内容说明
 *          </p>
 * @see 参考类1
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
	 * 账户中心首页
	 */
	@RequestMapping("/memberCenter/index.jhtml")
	// @ResponseBody
	public ModelAndView centerIndex(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Double[] mones = this.loginService.getAccount(mb.getId());
		// 用户资金详情数组[现金账户，赠金账户，冻结总额，账户可用资金]
		mv.addObject("mones", mones);
		// 身份证，银行卡，手机
		String[] veriMessage = new String[3];
		veriMessage[0] = mb.getCertiNumber();// 身份证号码
		veriMessage[1] = mb.getBankAccount();// 银行卡号码
		veriMessage[2] = mb.getPhone() + "";// 手机信息
		mv.addObject("veriMessage", veriMessage);

		mv.setViewName("membercenter/index");
		return mv;
	}
	/*
	 * 取款信息
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
	 * 查询取款账户
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
	 * 修改取款账户
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());// new Date()为获取当前系统时间
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
	 * 修改账户状态
	 */
	@RequestMapping("/memberCenter/updateDrawstate.jhtml")
	// @ResponseBody
	public ModelAndView updateDrawstate(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		int id=Integer.parseInt(request.getParameter("id"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());// new Date()为获取当前系统时间
		this.memberCenterService.updateDrawstate(id,time);
		List<MemberWithdraw> list=this.memberCenterService.drawInfo(mb.getId());
		mv.addObject("list",list);
		mv.setViewName("membercenter/drawinfo");
		return mv;
	}
	/**
	 * 代购记录
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
		// 营业厅彩民
		if (mb.getMemberFrom() == 5) {
			Member currMember = this.memberCenterService.getOneMember(userId);
			param.setReserved1(currMember.getReserved1());
			pagination = this.memberCenterService
					.getYYTOrderByMemberAndGameType(param, pageNo, pageSize);
		} else
			pagination = this.memberCenterService.getOrderByMemberAndGameType(
					param, pageNo, pageSize);

		// 取到彩票种类列别
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenter/purchasList");
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
	 * 营业厅用户删除方案
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
	 * 中奖记录
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

		// 取到彩票种类列别
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenter/prizeList");
		return mv;
	}
     
	/**
	 * 在线充值记录
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

		mv.setViewName("membercenter/putMoneyList");
		return mv;
	}

	/**
	 * 转账充值
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

		mv.addObject("storeBanklist", storeBanklist);// 店铺设置的收款
		mv.addObject("store", store);// 店铺信息
		mv.setViewName("membercenter/putMoneyOutLine");
		return mv;
	}

	/**
	 * 提款
	 */
	@RequestMapping("/memberCenter/getMoney.jhtml")
	public ModelAndView getMoney(HttpSession session) {
		/*ModelAndView mv = new ModelAndView();
		// 先校验真实名称和银行卡
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());

		//Double[] mones = this.loginService.getAccount(mb.getId());
		// 用户资金详情数组[现金账户，赠金账户，冻结总额，账户可用资金]
		//mv.addObject("mones", mones);
		Double sumConsume = 0.0;//所有购彩
		Double sumPut = 0.0;//所有充值
		Double sumBonus = 0.0;//所有中奖
		Double sumGet = 0.0;//所有取款
		Double sumDebit = 0.0;//未归还的欠款单
		Double sumWaitGet = 0.0;//未处理的取款单
		Double pointer = 0.0;//店铺充值款的最低消费比例
		
		Double[] allMoney = this.memberCenterService.allowGetMoney(mb.getId());
		if(allMoney != null && allMoney.length == 6){
			 sumPut = allMoney[0];//所有充值
			 sumBonus = allMoney[1];//所有中奖
			 sumConsume = allMoney[2];//所有购彩
			 sumGet = allMoney[3];//所有取款
			 sumDebit = allMoney[4];//未归还的欠款单
			 sumWaitGet = allMoney[5];//未处理的取款单
		}
		Store storeRecord = (Store) session.getAttribute("domain");
		pointer = storeRecord.getConsumpProp();
		
		//可提款金额 = (总充值*(1-消费比例))+总中奖-总购彩-总提款 - 未还款欠款充值 -未处理的取款单
		//Double allowGet = sumPut * (1-pointer) + sumBonus - sumConsume - sumGet - sumDebit - sumWaitGet;
		//可提款金额 = ((总充值-未还款欠款充值)*(1-消费比例))+总中奖                  -总提款  -未处理的取款单-总购彩
		Double allowGet = (sumPut - sumDebit) * (1-pointer) + sumBonus  - sumGet - sumWaitGet - sumConsume;
		if(allowGet.doubleValue() < 0){
			allowGet = 0.0;
		}
		mv.addObject("allowGet", allowGet);
		//展示给彩民的取款辅助信息String[]{店铺的消费比例,总充值,总兑奖,总提款,未还款欠款充值,未处理的取款单,总购彩}
		mv.addObject("auxMessage",new String[]{pointer+"",sumPut+"",sumBonus+"",sumGet+"",sumDebit+"",sumWaitGet+"",sumConsume+""} );
		mv.addObject("mb", mb);
		// 没有实名验证,未绑定银行卡
		if (CommonTag.isEmpty(mb.getCertiName()).equals("true")
				|| CommonTag.isEmpty(mb.getBankAccount()).equals("true")) {
			mv.setViewName("membercenter/getMoneyPrepare");
		} else {
			mv.setViewName("membercenter/getMoney");
			// mv.setViewName("membercenter/getMoneyPrepare");
		}
		return mv;*/
		ModelAndView mv = new ModelAndView();
		// 先校验真实名称和银行卡
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());

		Double[] mones = this.loginService.getAccount(mb.getId());
		// 用户资金详情数组[现金账户，赠金账户，冻结总额，账户可用资金]
		mv.addObject("mones", mones);

		mv.addObject("mb", mb);
		// 没有实名验证,未绑定银行卡
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
	 * 取款单入库
	 * 
	 * @param session
	 * @param currMoney
	 * @return
	 */
	@RequestMapping("/memberCenter/doGetMoney.jhtml")
	public String doGetMoney(HttpSession session, Double currMoney) {
		Member mb = (Member) session.getAttribute("member");
		/*Double[] money = this.loginService.getAccount(mb.getId());
		//最后一道防线，账户表的可取款金额 与 当前的申请取款额 对比
		if(money[4] < currMoney){
			throw new BaseException("彩民取款单失败，账户资金异常");
		}*/
		
		MemberAccount getMemberAccount = this.loginService.getMemberAccount(mb.getId());
		double amountUsedGetMoney = getMemberAccount.getMoneyAccount() - getMemberAccount.getFrozenAccount();//可提款账户
		if(amountUsedGetMoney < currMoney){
			throw new BaseException("彩民取款单失败，账户资金异常");
		}
		
		this.memberCenterService.doGetMoney(mb, currMoney , getMemberAccount , "" , "");
		return "redirect:/memberCenter/getMoneySucc.jhtml";
	}

	/***
	 * 取款单入库后url重定向，防止重复订单
	 */
	@RequestMapping("/memberCenter/getMoneySucc.jhtml")
	public ModelAndView getMoneySucc(HttpSession session) {
		// Member mb = (Member)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/getMoneySucc");
		return mv;
	}

	/**
	 * 提款记录
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
		mv.setViewName("membercenter/getMoneyList");
		return mv;
	}

	/**
	 * 账户明细
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
		mv.setViewName("membercenter/accountDetail");
		return mv;
	}

	/**
	 * 欠款单明细
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
		mv.setViewName("membercenter/debitList");
		return mv;
	}

	/**
	 * 安全首页
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
	 * 个人信息
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
	 * 个人信息修改入库
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
	 * 修改登陆密码
	 */
	@RequestMapping("/memberCenter/changePass.jhtml")
	public ModelAndView changePass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changePass");
		return mv;
	}

	/**
	 * 校验老登录密码是否正确
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
			return "1";// 校验成功
		} else {
			return "0";// 校验失败
		}
	}

	/**
	 * 登录密码修改入库
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
	 * 修改财务密码
	 */
	@RequestMapping("/memberCenter/changeAccountPass.jhtml")
	public ModelAndView changeAccountPass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/changeAccountPass");
		return mv;
	}

	/**
	 * 校验老登录密码是否正确
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
			return "1";// 校验成功
		else
			return "0";// 校验失败
	}

	/**
	 * 财务密码修改入库
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
	 * 密码保护
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
	 * 修改密保问题
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
	 * 实名认证
	 */
	@RequestMapping("/memberCenter/authenticat.jhtml")
	public ModelAndView authenticat(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// 已实名验证
		if (CommonTag.isEmpty(mb.getCertiName()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenter/unAuthenticat");
		}
		// 没有实名验证
		else{
			mv.addObject("mb",mb);
			mv.setViewName("membercenter/authenticat");
		}
		return mv;
	}

	/***
	 * 实名认证确认
	 * 
	 * @param session
	 * @param certiName
	 *            证件名称
	 * @param certiNumber
	 *            证件号码
	 * @return
	 */
	@RequestMapping("/memberCenter/authenticatSure.jhtml")
	public ModelAndView authenticatSure() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/authenticatSure");
		return mv;
	}

	/***
	 * 实名认证入库
	 * 
	 * @param session
	 * @param certiName
	 *            证件名称
	 * @param certiNumber
	 *            证件号码
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
	 * 银行卡绑定
	 */
	@RequestMapping("/memberCenter/bankCard.jhtml")
	public ModelAndView bankCard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		mb = this.memberCenterService.getOneMember(mb.getId());
		// 已经绑定银行卡
		if (CommonTag.isEmpty(mb.getBankAccount()).equals("false")) {
			mv.addObject("mb", mb);
			mv.setViewName("membercenter/unBankCard");
		} else {// 未绑定银行卡
			// 获取店铺接受付款的银行信息
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
	 * 编辑银行卡信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenter/changeBankCard.jhtml")
	public ModelAndView changeBankCard(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// 获取店铺接受付款的银行信息
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
	 * 银行卡绑定
	 */
	@RequestMapping("/memberCenter/bankCardSure.jhtml")
	public ModelAndView bankCardSure(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenter/bankCardSure");
		return mv;
	}

	/**
	 * 银行卡信息入库
	 * 
	 * @param session
	 * @param bankUserName
	 *            开户人
	 * @param bankName
	 *            银行名称
	 * @param bankAccount
	 *            账户
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
	 * 站内信
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
		mv.setViewName("membercenter/message");
		return mv;
	}

	/**
	 * 校验老登录密码是否正确
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
			return "1";// 状态更新成功
		else
			return "0";//
	}

	/***
	 * 方案详请，分为三种展示方式：竞彩，足彩，数字彩
	 * 
	 * @param session
	 * @param pageNo
	 * @param pageSize
	 * @param orderId
	 *            订单编号
	 * @param LicenseId
	 *            彩种类别
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
			mv = new ModelAndView("/membercenter/order_detail_jc",
					"guessorder", guessorder);
		} else if (LicenseId == GameUtil.GAMEIDSFC
				|| LicenseId == GameUtil.GAMEIDRXJ
				|| LicenseId == GameUtil.GAMEIDBQC
				|| LicenseId == GameUtil.GAMEIDJQC) {
			// 足彩
			TraditionOrder zcorder = this.orderservice.findZcOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenter/order_detail_zc", "zcorder",
					zcorder);
		} else {
			// 数字彩
			TraditionOrder mathorder = this.orderservice.findMathOrder(orderId,
					pageNo, pageSize);
			mv = new ModelAndView("/membercenter/order_detail_math",
					"mathorder", mathorder);
		}

		return mv;
	}
	
	/**
	 * 追号记录
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

		// 取到彩票种类类别
		List<StoreLicense> lotteryTypes = this.memberCenterService
				.getStoreLicenseList(storeId);

		mv.addObject("lotteryTypes", lotteryTypes);
		mv.addObject("pagination", pagination);
		mv.setViewName("membercenter/ChaseNumberRecord");

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
	 * 追号取消操作
	 * 
	 * @param session
	 *@param orderId
	 *            订单编号
	 */

	@RequestMapping("/memberCenter/colse.do")
	@ResponseBody
	public String orderColse(HttpSession session, Integer orderId) {

		this.chasingService.cancelOneIssueChasing(orderId);
		return "已取消";

	}
	
	/**********************合买开始******************************/
	
	/**
	 * 合买记录
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
		// 取到彩票种类类别
		List<StoreLicense> types = this.memberCenterService.getStoreLicenseList(storeId);
		mv.addObject("ltype", types);
		mv.addObject("pin", pin);
		mv.setViewName("membercenter/mergerRecord");
		return mv;
	}
	/**********************合买结束******************************/
	
	/***
	 * 营业厅用户删除跟单
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
