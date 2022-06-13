package com.jingc.busi.membercenter.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.alipay.util.AlipayNotify;
import com.google.gson.Gson;
import com.jingc.afc.pagination.CommonTag;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreReceiv;
import com.jingc.busi.common.table.StoreYeepay;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.membercenter.service.MemberRechargeXunYiService;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.PathCode;
import com.jingc.busi.util.member.StoreReceivTypeState;
import com.jingc.common.util.HttpHandler;
import com.jingc.common.util.PropertiesTool;
import com.jingc.common.util.TwoDimensionCode;
import com.jingc.file.util.FileUtil;
import com.sft.api.SharingResponse40;
import com.sft.service.SftService;
import com.wxpay.service.WxService;
import com.wxpay.util.PayBack;
import com.wxpay.util.PayOrder;
import com.xywallet.protocol.quickpayh5.AsynchronousNotify;
import com.xywallet.protocol.quickpayh5.SynchronousReturn;
import com.yeepay.zgt.service.PayApiServiceImpl;
import com.yeepay.zgt.service.QueryOrderApiServiceImpl;
import com.yeepay.zgt.utils.ZGTUtils;
import com.zh.heepay.income.HeepayPayImpl;
import com.zh.heepay.income.QuickPay.QuickNotice;
import com.zh.heepay.income.QuickPayImpl;
import com.zh.shengpay.service.ShengPayService;
import com.zh.shengpay.service.ShengPayServiceImpl;

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
public class MemberCzController {
	@Resource private MemberCenterService memberCenterService;
	@Autowired private MemberRechargeXunYiService memberRechargeXunYiService;
	/**
	 * 在线充值
	 */
	@RequestMapping("/memberCenterNew/putMoney.jhtml")
	public String putMoney(HttpSession session) {
		return "redirect:/memberCenterNew/putMoneySFT.jhtml";
	}
	
	/***************************************************************************************************
     * ********************盛付通充值************************************************************
     ****************************************************************************************************/
	/**
	 * 盛付通平台
	 */
	@RequestMapping("/memberCenterNew/putMoneySFT.jhtml")
	public ModelAndView putMoneySFT(HttpSession session,Integer type) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Store storeRecord = this.memberCenterService.getOneStore(new Integer(mb.getStoreId()));
		StoreYeepay storeYeepay = this.memberCenterService.getStoreYeepay(new Integer(mb.getStoreId()));
		mv.addObject("storeObj", storeRecord);
		mv.addObject("storeYeepay",storeYeepay);
		mv.setViewName("membercenternew/putMoney");
		return mv;
	}
	
	//修改金额返回页面
	@RequestMapping("/memberCenterNew/moneyChangeBack.jhtml")
	public ModelAndView moneyChangeBack(Double currMoney,Integer type) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoney");
		return mv;
	}
	
	@RequestMapping("/memberCenterNew/putMoneySFTZ.jhtml")
	public ModelAndView putMoneySFTZ(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyZ");
		return mv;
	}
	
	/***
	 * 盛付通网银在线充值入库
	 * 
	 * @param session
	 * @param currMoney
	 *            当前交易额
	 * @param payBank
	 *            充值方式
	 * @return
	 */
	@RequestMapping("/memberCenterNew/doPutMoneySure.jhtml")
	public void doPutMoneySure(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Double currMoney, String payBank)
			throws IOException {
		Member mb = (Member) session.getAttribute("member");
		Member currMb = this.memberCenterService.getOneMember(mb.getId());
		Store storeRecord = (Store) session.getAttribute("domain");
		String storeName = storeRecord.getStoreName();//店铺名称
		// 充值日志
		int orderId = this.memberCenterService.doPutMoney(mb, currMoney,
														  payBank, MemberUtil.MEMBER_PAY_TYPE.SFT_PAY ,
														  "盛付通平台",getCurrUserIP(request));
		String result = "";
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(
				url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		result = czSft(orderId + "", currMoney, payBank,
				getCurrUserIP(request), contextUrl,storeName,currMb);
		//response.sendRedirect(result);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(result);
	}

	/**
	 * 盛付通网银充值调用
	 * 
	 * @param httpSession
	 * @param pay_money
	 * @param pay_bank ,sftMoneyTable---到盛付通的收款台
	 * @param rIp
	 * @return
	 */
	private String czSft(String orderId, double payMoney, String payBank,
			String rIp, String contextUrl,String storeName,Member mb) {
		ShengPayService service = ShengPayServiceImpl.getInstance();
		String payUrl = service.createPayOrderWEB(mb.getId() + "", mb.getCreateTime().trim().replace(":", "").replace("-", "").replace(" ", ""), 
																	rIp, contextUrl, 
																	mb.getCertiName(), mb.getCertiNumber(), 
																	mb.getPhone(), orderId, 
																	payMoney + "", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()), 
																	contextUrl + "网页充值", rIp);
		return payUrl;
	}

	
	/** 
	 * h5收银台
	 * @author ZhangHao
	 *//*
	@RequestMapping("/memberCenterNew/doPutMoneySureH5.do")
	@ResponseBody
	public String doPutMoneySureH5(HttpSession session, HttpServletRequest request, Double currMoney) throws IOException {
		Member mb			= (Member) session.getAttribute("member");
		Integer orderId		= this.memberCenterService.doPutMoney(mb, currMoney, "盛付通H5", 
																  MemberUtil.MEMBER_PAY_TYPE.SFT_PAY,
																  "手机收银台",getCurrUserIP(request));
		StringBuffer url	= request.getRequestURL();
		String contextUrl	= url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		return czSftH5(String.valueOf(orderId), currMoney, null, getCurrUserIP(request), contextUrl, mb);
	}*/

	/**
	 * 盛付通在线充值返回,展示页
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newcz/sft/return.jhtml", method = RequestMethod.POST)
	public ModelAndView sftReturn(ModelAndView mv, HttpServletRequest request) {
		System.out.println("============盛付通同步反馈开始===================");
		Map<String, String> map = new HashMap<String, String>();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		    map.put(el,request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "";
		
		// 计算得出通知验证结果
		boolean currSign = new ShengPayServiceImpl().inFormPayOrderWEB(map);
		if (currSign) {
			if ("01".equals(map.get("TransStatus"))) {// 交易成功
				returnMessage = "交易成功！";
			}
		} else {
			returnMessage = "定单异常或者订单已被处理！";
		}
		
		mv.addObject("returnMessage", returnMessage);
		mv.setViewName("membercenternew/putMoneySucc");
		return mv;
	}

	/**
	 * 在线充值返回,点对点通讯,不需要展示
	 * 
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newcz/sft/notify.jhtml", method = RequestMethod.POST)
	@ResponseBody
	public String sftNotify(HttpServletRequest request) {
		System.out.println("=============盛付通点对点反馈开始===================");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		Map<String, String> map = new HashMap<String, String>();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		    map.put(el,request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "fail";
		
		// 计算得出通知验证结果
		boolean currSign = false;

		if ("ap".equals(map.get("PayChannel")) || "wp".equals(map.get("PayChannel"))) {
			currSign = new ShengPayServiceImpl().inFormQRCodePayWEB(map);
		} else {
			currSign = new ShengPayServiceImpl().inFormPayOrderWEB(map);
		}
		
		if (currSign) {
			if ("01".equals(map.get("TransStatus")))  {// 交易成功
				// 根据店铺号获得分账账户
				MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(map.get("OrderNo")));
				if ("ap".equals(map.get("PayChannel"))){
					payLogRecord.setType(MemberUtil.MEMBER_PAY_TYPE.SFT_ZFB_WEB);
					String desc = MemberUtil.MEMBER_PAY_TYPE_MAP.get(MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_WEB);
					payLogRecord.setComments(desc);
					payLogRecord.setReserved5(desc);
				} else if ("wp".equals(map.get("PayChannel"))) {
					payLogRecord.setType(MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_WEB);
					String desc = MemberUtil.MEMBER_PAY_TYPE_MAP.get(MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_WEB);
					payLogRecord.setComments(desc);
					payLogRecord.setReserved5(desc);
				}
				
				Store storeRecord = this.memberCenterService.getOneStore(new Integer(payLogRecord.getStoreId()));
				String account = storeRecord.getReserved8();
				// 订单金额
				String paytoAmount = new DecimalFormat("######.##").format(payLogRecord.getMoney());//payLogRecord.getMoney().doubleValue();
				if(paytoAmount == null) paytoAmount = "";
				String currAmount = map.get("OrderAmount").equals("0.00")?map.get("OrderAmount"):map.get("TransAmount");
				if(currAmount == null)
					currAmount = "";
				// 比较支付金额是否与订单金额相等,相等调用分账接口
				System.out.println("订单号-"+map.get("TransNo") + ":" + paytoAmount + ";" + currAmount);
				if(Double.parseDouble(paytoAmount) == Double.parseDouble(currAmount)){
					// 更改数据库状态
					payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
					payLogRecord.setReserved2(map.get("TransType") + "," + map.get("BankSerialNo") + "," + account);
					payLogRecord.setReserved3(map.get("ErrorCode") + "," + map.get("ErrorMsg"));
					payLogRecord.setPayId(map.get("TransNo"));//盛付通订单号
					payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
					if(map.get("TransType").equals("PT010") || map.get("TransType").equals("PT021")){
						payLogRecord.setComments("盛付通快捷");
					}else{
						payLogRecord.setComments("盛付通普通");
					}
					this.memberCenterService.putMoney(
							payLogRecord, 
							contextUrl, 
							map.get("TransType"), 
							MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.SFT_RECHANGE,
							true);
				}
				returnMessage = "OK";
			}
		}else{
			//this.memberCenterService.updateMemberPayLogNoState(payLogRecord);
		}
		return returnMessage;
	}
	
	@RequestMapping("newcz/sft/h5SharingNotifyUrl.jhtml")
	@ResponseBody
	public String h5SharingNotifyUrl(HttpServletRequest request){
		Enumeration en = request.getParameterNames();  
		System.out.println("分账通知begig...");
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    System.out.println(el + "=" + request.getParameter(el));
		}
		return "fall";
	}
	
	/**
	 * 盛付通在线充值返回,展示页
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/wap/recharge/h5return.jhtml", method = RequestMethod.POST)
	public ModelAndView h5sftReturn(ModelAndView mv, HttpServletRequest request) {
		System.out.println("============盛付通h5同步反馈开始===================");
		Map<String, String> map = new HashMap<String, String>();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		    map.put(el,request.getParameter(el));
		}  
		System.out.println(strb.toString());
		String returnMessage = "充值完成！";

		JSONObject jsonObject = JSONObject.parseObject(map.get("backMessage"));
		Map<String, Object> jsonMap = (Map<String, Object>) jsonObject;
		String transStatus = (String)jsonMap.get("transStatus");
		String msg = (String)jsonMap.get("msg");
		if("01".equals(transStatus)){
			returnMessage = "付款成功";
		}else{
			returnMessage = "失败，错误码：" + transStatus;
		}
		//mv.addObject("returnMessage", returnMessage + ";" + msg);
		//mv.setViewName("membercenternew/putMoneySucc");
		
		return new ModelAndView("redirect:/client2/page/usercenter/recharge/sfth5return.html?returnMessage="+returnMessage);
	}
	
	/****
	 * h5收银台
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newcz/sft/h5notify.jhtml", method = RequestMethod.POST)
	@ResponseBody
	public String h5sftNotify(HttpServletRequest request) {
		System.out.println("=============盛付通h5点对点反馈开始===================");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		Map<String, String> map = new HashMap<String, String>();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		    map.put(el,request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "fail";
		MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(map.get("OrderNo")));
		// 计算得出通知验证结果
		boolean currSign = false;
		if (MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_APP == payLogRecord.getType()) {
			currSign = new ShengPayServiceImpl().inFormMobileWeChat(map);
		} else {
			currSign = new ShengPayServiceImpl().inFormPayOrderWAP(map);
		}
		System.out.println("currSign="+currSign);
		if (currSign) {
			if ("01".equals(map.get("TransStatus"))) {// 交易成功
				Store storeRecord = this.memberCenterService.getOneStore(new Integer(payLogRecord.getStoreId()));
				String account = storeRecord.getReserved8();
				// 订单金额
				String paytoAmount = new DecimalFormat("######.##").format(payLogRecord.getMoney());
				if(paytoAmount == null) paytoAmount = "";
				String currAmount = map.get("OrderAmount").equals("0.00")?map.get("OrderAmount"):map.get("TransAmount");
				if(currAmount == null)
					currAmount = "";
				// 比较支付金额是否与订单金额相等,相等调用分账接口
				System.out.println("订单号-"+map.get("TransNo") + ":" + paytoAmount + ";" + currAmount);
				//if(paytoAmount == Double.valueOf(rForm.getTransAmount().equals("0.00")?rForm.getOrderAmount():rForm.getTransAmount())) {
				
				if(Double.parseDouble(paytoAmount) == Double.parseDouble(currAmount)){
					// 更改数据库状态
					payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
					payLogRecord.setReserved2(map.get("TransType") + "," + map.get("InstCode") + "," + account);
					payLogRecord.setReserved3(map.get("ErrorCode") + "," + map.get("ErrorMsg"));
					payLogRecord.setPayId(map.get("TransNo"));//盛付通订单号
					payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
					if(map.get("TransType").equals("PT010") || map.get("TransType").equals("PT021")){
						payLogRecord.setComments("盛付通快捷");
					} else if ("PT312".equals(map.get("TransType"))) {
						payLogRecord.setComments("盛付通h5微信-app");
					} else {
						payLogRecord.setComments("盛付通普通");
					}
					this.memberCenterService.putMoney(
							payLogRecord, 
							contextUrl, 
							"PTWap",
							MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.SFT_RECHANGE,
							true);
				}
				returnMessage = "OK";
			}
		}else{
		}
		return returnMessage;
	}
	
	/**
	 * 在线充值分账返回,点对点通讯,不需要展示
	 * 
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newcz/sft/sharingnotify.jhtml", method = RequestMethod.POST)
	@ResponseBody
	public String sftSharingNotify(HttpServletRequest request) {
		System.out.println("=============盛付通分账通知===================");
		String returnMessage = "fail";
		SftService sftService = new SftService();
		// 获取盛付通反馈信息,封装
		SharingResponse40 response40 = sftService.getReturnSharingForm(request);
		System.out.println(response40.getHeader().getTraceNo() + "" + response40.getReturnInfo().getErrorCode() + "" + response40.getReturnInfo().getErrorMsg());
		// 验证是否盛付通返回
		//if (sftService.checkSharingResponse(response40)) {
			if ("S".equals(response40.getStatus())) {
				returnMessage = "OK";
			} else if ("F".equals(response40.getStatus())) {
			}
			
			//更新支付记录状态
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(response40.getPaymentOrderNo()));
			payLogRecord.setReserved4(response40.getItems().get(0).getPayeeId() 
									  + "," + response40.getStatus() 
									  + "," + response40.getReturnInfo().getErrorCode()
									  + "," + response40.getReturnInfo().getErrorMsg());
			
			//payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_FAIL);//不是失败状态
			
			this.memberCenterService.updateMemberPayLogNoState(payLogRecord);
		//}
		return returnMessage;
	}
	
	/****************************************************************************
	 * **************************快捷支付，调用连连支付************************
	 *****************************************************************************/
	/**
	 * 在线充值
	 */
	@RequestMapping("/memberCenterNew/putMoneyQuick.jhtml")
	public ModelAndView putMoneyQuick(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyQuick");
		return mv;
	}

	/**
	 * 在线充值确认
	 */
	@RequestMapping("/memberCenterNew/putMoneyQuickSure.jhtml")
	public ModelAndView putMoneyQuickSure(HttpSession session,String payBank) {
		ModelAndView mv = new ModelAndView();
		String bankLogo = MemberUtil.GFBBANKMAP.get(payBank);
		if(bankLogo == null)
			bankLogo = "GFB";
		
		mv.addObject("bankLogo", bankLogo);
		mv.setViewName("membercenternew/putMoneyQuickSure");
		return mv;
	}

	
	/*******************************************************************************************
	 * **************************汇付宝支付******************************************************
	 *******************************************************************************************/
/*	*//**
	 * 在线充值
	 *//*
	@RequestMapping("/memberCenterNew/putMoneyHft.jhtml")
	public ModelAndView putMoneyHft(HttpSession session,
			Double currMoney, 
			String payBank) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyHft");
		return mv;
	}

	*//**
	 * 在线充值确认
	 *//*
	@RequestMapping("/memberCenterNew/putMoneyHftSure.jhtml")
	public ModelAndView putMoneyHftSure(HttpSession session,String payBank) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyHftSure");
		return mv;
	}
	*//**
	 * 汇付宝充值，生成订单
	 * @param mv
	 * @param httpSession
	 * @param response
	 * @param currMoney
	 * @param payBank  value:heepay标示快捷支付，其他是普通通道
	 * @throws IOException 
	 *//*
	@RequestMapping("/memberCenterNew/doPutMoneyHftSure.jhtml")
	public void doPutMoneyHftSure (HttpServletRequest request,
			HttpSession httpSession,
			HttpServletResponse response,
			Double currMoney, 
			String payBank){
		try{
			String result = czHftpay(request,httpSession, currMoney, payBank);
			response.setContentType("text/html;charset=gbk");  
			PrintWriter out = response.getWriter();
			out.print(result);//将form表单字符串写到页面，有字符串中的js函数自动提交表单跳转到支付宝页面
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
	
	@RequestMapping("/memberCenterNew/putMoneyHft.jhtml")
	public void czHftpay(HttpServletRequest request,
						HttpServletResponse response,
						HttpSession httpSession,
						Double pay_money,
						String payBank,
						String trueName,
						String cardNumber) throws Exception{
		String result = "";
		Member mb = (Member) httpSession.getAttribute("member");
		//Store storeRecord = this.memberCenterService.getOneStore(new Integer(mb.getStoreId()));
		//调用汇付宝
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		HeepayPayImpl heepService = new HeepayPayImpl();
		//SubmitReturn returnObj = null;
		//快捷支付，直接跳到收银台让彩民选择银行
		if("HFBquick".equals(payBank)){
			// 充值日志
			int orderId = this.memberCenterService.doPutMoney(mb, pay_money,
															 payBank, MemberUtil.MEMBER_PAY_TYPE.HFT_PAY, 
															 "汇付宝快捷支付",getCurrUserIP(request));
			result = heepService.quickPay(orderId + "", 
										pay_money + "", 
										"0", 
										getCurrUserIP(request), 
										new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()), 
										contextUrl + "快捷", "" , contextUrl);
		}else if("HFBbank".equals(payBank)){
			int orderId = this.memberCenterService.doPutMoney(mb, pay_money,
															  payBank, MemberUtil.MEMBER_PAY_TYPE.HFT_PAY, 
															  "汇付宝网银支付",getCurrUserIP(request));
			result = heepService.bankPay(orderId + "", 
					pay_money + "", 
					"0", 
					getCurrUserIP(request), 
					new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()), 
					contextUrl + "网银", "" , contextUrl);
		}else{
			int orderId = this.memberCenterService.doPutMoney(mb, pay_money,
															  payBank, MemberUtil.MEMBER_PAY_TYPE.HFT_ALIPAY, 
															  "汇付宝支付宝支付",getCurrUserIP(request));
			result = heepService.aliPay(orderId + "", 
					pay_money + "", 
					"0", 
					getCurrUserIP(request), 
					new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()), 
					contextUrl + "支付宝", "" , contextUrl);
		}
		response.setContentType("text/html;charset=gbk");  
		PrintWriter out = response.getWriter();
		out.print(result);//将form表单字符串写到页面，有字符串中的js函数自动提交表单跳转到支付宝页面
	}
	
	/**
	 * 在线充值返回,展示页
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/Hft/return.jhtml")
	public ModelAndView HftReturn(
			ModelAndView mv,
			HttpSession httpSession,
			HttpServletRequest request) {
		System.out.println("=============汇付宝同步通知反馈===================");
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		String returnMessage = "";
		
		String result = request.getParameter("result");
		String pay_message = request.getParameter("pay_message"); //支付结果，如果失败，会展示失败信息
		String agentId = request.getParameter("agent_id");
		String jnetBillNo = request.getParameter("jnet_bill_no");
		String agentBillId = request.getParameter("agent_bill_id");
		String payType = request.getParameter("pay_type");
		String payAmt = request.getParameter("pay_amt");
		String remark = request.getParameter("remark");
		String sign = request.getParameter("sign");
		
		try{
			//订单校验
			if (new HeepayPayImpl().payInformVerify(result,agentId,jnetBillNo, agentBillId,  payType,payAmt, remark,sign)) {
				//汇付宝的异步通知偶尔出现问题，需要在同步中处理反馈结果
				StringBuffer url = request.getRequestURL();
				String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
				MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(agentBillId));
				String s_temp_money = new DecimalFormat("######.##").format(payLogRecord.getMoney());//payLogRecord.getMoney() +"";// 本地金额
				if (s_temp_money == null)
					s_temp_money = "";
				boolean be_equ_money = false;
				//double temp_money = Double.valueOf(s_temp_money);

				if (payAmt == null)
					payAmt = "";
				//double d_alipay_money = Double.valueOf(payAmt);
			
				//if (s_temp_money.equals(payAmt))
				if(Double.parseDouble(s_temp_money) == Double.parseDouble(payAmt))
					be_equ_money = true;
				System.out.println("==================centerController.1090:" + payLogRecord.getId() + ";" + payLogRecord.getPayId() + ";" + be_equ_money + "(" + s_temp_money + ";" + payAmt +")");
				if (be_equ_money) {
					payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
					payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
					payLogRecord.setPayId(jnetBillNo);
					// 本地操作
					try{
						this.memberCenterService.putMoney(
								payLogRecord, 
								contextUrl, 
								"", 
								MemberUtil.MEMBER_PAY_TYPE.HFT_PAY,
								false);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				returnMessage = "交易成功！";
			} else {
				returnMessage = "定单异常或者订单已被处理！[" + pay_message + "]";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mv.addObject("returnMessage", returnMessage);
		mv.setViewName("membercenternew/putMoneySucc");
		
		return mv;
	}
	
	/**
	 * 在线充值返回,点对点通讯,不需要展示
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/Hft/notify.jhtml")
	@ResponseBody
	public void HftNotify(
			ModelAndView mv,
			HttpSession httpSession,
			HttpServletRequest request,
			HttpServletResponse response) {
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		
		System.out.println("=============汇付宝点对点反馈开始===================");
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println("客户机ip：" + getCurrUserIP(request));
		System.out.println(strb.toString());
		
		String result = request.getParameter("result");
		//String pay_message = request.getParameter("pay_message"); //支付结果，如果失败，会展示失败信息
		String agentId = request.getParameter("agent_id");
		String jnetBillNo = request.getParameter("jnet_bill_no");
		String agentBillId = request.getParameter("agent_bill_id");
		String payType = request.getParameter("pay_type");
		String payAmt = request.getParameter("pay_amt");
		String remark = request.getParameter("remark");
		String sign = request.getParameter("sign");
		
		try{
			PrintWriter out = response.getWriter();
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(agentBillId));
			if(payLogRecord.getState() == 2){
				out.println("ok");
			}else{
				payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
				payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
				payLogRecord.setPayId(jnetBillNo);
				payLogRecord.setReserved2("");//支付组合信息
				System.out.println("======");
				if (new HeepayPayImpl().payInformVerify(result,agentId,jnetBillNo, agentBillId,  payType,payAmt, remark,sign)) { //订单校验
					String s_temp_money = new DecimalFormat("######.##").format(payLogRecord.getMoney());//payLogRecord.getMoney() +"";// 本地金额
					if (s_temp_money == null)
						s_temp_money = "";
					boolean be_equ_money = false;
					//double temp_money = Double.valueOf(s_temp_money);

					if (payAmt == null)
						payAmt = "";
					//double d_alipay_money = Double.valueOf(payAmt);
				
					//if (s_temp_money.equals(payAmt))
					if(Double.parseDouble(s_temp_money) == Double.parseDouble(payAmt))
						be_equ_money = true;
					System.out.println("==================centerController.1442:" + payLogRecord.getId() + ";" + payLogRecord.getPayId() + ";" + be_equ_money + "(" + s_temp_money + ";" + payAmt +")");
					if (be_equ_money) {
						// 本地操作
						this.memberCenterService.putMoney(
								payLogRecord, 
								contextUrl, 
								"", 
								MemberUtil.MEMBER_PAY_TYPE.HFT_PAY,
								false);
					}
					out.println("ok");
					} else {
						out.println("error");
					}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/Hft/quickNotify.do")
	@ResponseBody
	public void quickNotifyHFB(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		
		System.out.println("=============汇付宝快捷点对点反馈开始===================" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println("客户机ip：" + getCurrUserIP(request));
		System.out.println(strb.toString());
		
		String agent_id = request.getParameter("agent_id");
		String encrypt_data = request.getParameter("encrypt_data");
		String sign = request.getParameter("sign");
		QuickNotice qn = QuickPayImpl.getInstance().paySignVerify(agent_id, encrypt_data, sign);
		System.out.println(qn.getAgent_bill_id() + ";" + qn.getAgent_bill_time() + ";" + qn.getHy_bill_no() + ";"
							+ qn.getDeal_note() + ";" + qn.getStatus() + ";" + qn.getPay_amt()  + ";" + qn.getReal_amt());
		
		PrintWriter out = null;
		try{
			out = response.getWriter();
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(qn.getAgent_bill_id()));
			if(payLogRecord.getState() == 2){
				out.println("ok");
			}else{
				payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
				payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
				payLogRecord.setPayId(qn.getHy_bill_no());
				payLogRecord.setReserved2("");//支付组合信息
				
				if (qn.isFlag()) { // 订单校验
					String s_temp_money = new DecimalFormat("######.##").format(payLogRecord.getMoney());// payLogRecord.getMoney();// 本地金额
					if (s_temp_money == null) s_temp_money = "";
					boolean be_equ_money = false;

					//if (s_temp_money.equals(qn.getPay_amt())) be_equ_money = true;
					if(Double.parseDouble(s_temp_money) == Double.parseDouble(qn.getPay_amt()))
						be_equ_money = true;
					System.out.println("==================centerController.1246:"
									+ payLogRecord.getId() + ";"
									+ payLogRecord.getPayId() + ";"
									+ be_equ_money + "(" + s_temp_money + ";"
									+ qn.getPay_amt() + ")");
					if (be_equ_money) {
						this.memberCenterService.putMoney(payLogRecord, contextUrl, "", MemberUtil.MEMBER_PAY_TYPE.HFT_PAYMOBILE, false);
						out.println("ok");
					}
				} else {
					out.println("error");
				}
			}
		}catch(Exception e){
			if (out != null) out.println("ERROR");
			e.printStackTrace();
		}
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
//		String currIp = "";
//		if (request.getHeader("x-forwarded-for") == null) {
//			currIp = request.getRemoteAddr();
//		}else{
//			currIp = request.getHeader("x-forwarded-for");
//		}
//		if(currIp.indexOf(",") > -1){
//			currIp = currIp.split(",")[0];
//		}
//		return currIp;
		String ip = request.getHeader("x-forwarded-for"); 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("Proxy-Client-IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getRemoteAddr(); 
		} 
		return ip; 
	}
	
	/**
	 * 金额提交页面
	 */
	@RequestMapping("/memberCenterNew/moneyButton.jhtml")
    public ModelAndView moneyButton(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/moneyButton");
		return mv;
	}
	
	/**
	 * 转账充值 Iframe
	 */
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
	}
	
	/**
	 * 转账充值
	 */
	@RequestMapping("/memberCenterNew/putMoneyOutLine.jhtml")
	    public String putMoneyOutLine(HttpSession session) {
		return "redirect:/memberCenterNew/putMoneySFT.jhtml";
	}
	
	/**
	 * 在线充值记录 zh Copy
	 */
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

	/** 离线二维码支付
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/memberCenterNew/QRpay.jhtml")
	@ResponseBody
	public ModelAndView QRpay(HttpSession session, Integer customId) {
		ModelAndView mv = new ModelAndView();
		Member smb = (Member)session.getAttribute("member");
		String filePath =FileUtil.createPath(smb.getStoreId()+"", PathCode.STORE_IMAG_TWOCODE_WININFO);
		mv.addObject("filePath", filePath);
		mv.setViewName("membercenternew/QRpay");
		return mv;
	}
	
	/**
	 * 微信支付
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/memberCenterNew/wxPay.jhtml")
	public ModelAndView wxPay(HttpSession session,
							  HttpServletRequest request,
							  HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView("membercenternew/wxPay"); 
		mv.setViewName("membercenternew/wxpay");
		return mv;
	}
	
	/***
	 * 微信支付，提交订单生成本地二维码
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/memberCenterNew/wxTwoDC.do")
	public void wxTwoDC(HttpSession session,
							  HttpServletRequest request,
							  HttpServletResponse response) throws IOException {
		//Member mb = (Member)session.getAttribute("member");
		PrintWriter out = response.getWriter();
		String payResult = "";
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(
				url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		PayOrder payOrder = new PayOrder();
		payOrder.setBody("凤凰微彩-微信充值");
		payOrder.setOutTradeNo("10001");//订单号
		payOrder.setTotalFee("1");//分
		payOrder.setSpbillCreateIp("127.0.0.1");//客户机ip
		payOrder.setNotifyUrl(contextUrl + "newcz/wxpay/notify.jhtml");
		
		HttpHandler handle = HttpHandler.getInstance();
		try{
			String cont = payOrder.createXmlMessage();
			System.out.println("===========wxpay=="+cont);
			String backMessage = handle.doHttpsPost("https://api.mch.weixin.qq.com/pay/unifiedorder",cont);
			System.out.println("===========backMessage=="+backMessage);
			WxService wxService = new WxService();
			PayBack payBack = wxService.createPayBackMessage(backMessage);
			if(payBack != null){
				String returnCode = payBack.getReturnCode();
				if("SUCCESS".equals(returnCode)){
					String resultCode = payBack.getResultCode();
					if("SUCCESS".equals(resultCode)){
						boolean checkFlag = wxService.checkBackMessage(payBack);
						if(checkFlag){
							//订单生成成功
							PropertiesTool pTool = new PropertiesTool("/jc.properties");
					    	String twodimensionCodeLOGO = pTool.getValue("twodimensionCodeLOGO");//LOGO源
					    	twodimensionCodeLOGO = twodimensionCodeLOGO.endsWith("/") ? twodimensionCodeLOGO : twodimensionCodeLOGO + "/";
							String code_url = payBack.getCodeUrl();//二维码连接
							TwoDimensionCode twodimensionCode = new TwoDimensionCode();
							twodimensionCode.outQRCode(code_url,"",twodimensionCodeLOGO + "logo.jpg",response);
						}else{
							payResult = "订单校验失败";
							out.print(payResult);
						}
					}else{
						payResult = "订单预校验失败";
						out.print(payResult);
					}
				}else{
					payResult = payBack.getReturnMsg();
					out.print(payResult);
				}
			}else{
				payResult = "生成订单失败";
				out.print(payResult);
			}
		}catch(Exception e){}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newcz/wxpay/notify.jhtml", method = RequestMethod.POST)
	@ResponseBody
	public String wxPayNotify(HttpServletRequest request) {
		System.out.println("=============微信点对点反馈开始===================");
		/*StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();*/
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		return "";
	}
	


	/*******************************************************************************************
	 * **************************支付宝支付******************************************************
	 *******************************************************************************************/
	/**
	 * 在线充值
	 */
	/*@RequestMapping("/memberCenterNew/putMoneyZfb.jhtml")
	public ModelAndView putMoneyZfb(HttpSession session,
			Double currMoney, 
			String payBank) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyZfb");
		return mv;
	}*/

	/**
	 * 在线充值确认
	 */
	@RequestMapping("/memberCenterNew/putMoneyZfbSure.jhtml")
	public ModelAndView putMoneyZfbSure(HttpSession session,String payBank) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("membercenternew/putMoneyZfbSure");
		return mv;
	}
	/**
	 * 支付宝充值，生成订单
	 * @param mv
	 * @param httpSession
	 * @param response
	 * @param money
	 * @param pay_bank
	 * @throws IOException 
	 */
	/*@RequestMapping("/memberCenterNew/doPutMoneyZFBSure.jhtml")
	public void doPutMoneyZFBSure (HttpServletRequest request,
			HttpSession httpSession,
			HttpServletResponse response,
			Double currMoney, 
			String payBank){
		try{
			String result = czAlipay(request,httpSession, currMoney, payBank);
			response.setContentType("text/html;charset=gbk");  
			PrintWriter out = response.getWriter();
			out.print(result);//将form表单字符串写到页面，有字符串中的js函数自动提交表单跳转到支付宝页面
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
	
	/*private String czAlipay(HttpServletRequest request,
							HttpSession httpSession,
							Double pay_money,
							String payBank) throws Exception{
		String result = "";
		//Store storeRecord = (Store) httpSession.getAttribute("domain");
		Member mb = (Member) httpSession.getAttribute("member");
		Store storeRecord = this.memberCenterService.getOneStore(new Integer(mb.getStoreId()));
		// 充值日志
		int orderId = this.memberCenterService.doPutMoney(mb, pay_money,
				payBank, MemberUtil.MEMBER_PAY_TYPE.ALIPAY_PAY , "支付宝支付");

		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(
				url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		if (!(orderId + "").equals("-1")) {
			// 必填参数//
			// 请与贵网站订单系统中的唯一订单号匹配
			String out_trade_no = orderId + "";// UtilDate.getOrderNum();
			// 订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
			//String srcSubject = "凤凰微彩-"+storeName+"-彩民充值";
			String srcSubject = storeRecord.getNetUrl() + "--CHONGZHI";
			//byte[] temp = srcSubject.getBytes("utf-8");//这里写原编码方式
           // byte[] newtemp = new String(temp,"utf-8").getBytes("gbk");//这里写转换后的编码方式
            //String subject = new String(newtemp,"gbk");//这里写转换后的编码方式

			// 订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
			String body = "";
			// 订单总金额，显示在支付宝收银台里的“应付总额”里
			String total_fee = pay_money + "";
			// 扩展功能参数——默认支付方式//
			// 默认支付方式，取值见“纯网关接口”技术文档中的请求参数列表
			String paymethod = "";
			// 默认网银代号，代号列表见“纯网关接口”技术文档“附录”→“银行列表”
			String defaultbank = "";

			if (payBank.equals("directPay")) {
				paymethod = "directPay";
			} else {
				paymethod = "bankPay";
				defaultbank = payBank;
			}
			String anti_phishing_key = "";
			// 获取客户端的IP地址，建议：编写获取客户端IP地址的程序
			String exter_invoke_ip = "";
			String extra_common_param = mb.getStoreId() + "_" + paymethod;//用于分润接口区分费率
			// 默认买家支付宝账号
			String buyer_email = "";
			String seller_email = "";// 签约支付宝账号或卖家收款支付宝帐户
			// 商品展示地址，要用http:// 格式的完整路径，不允许加?id=123这类自定义参数
			String show_url = storeRecord.getNetUrl();//"http://www.cp020.com";
			*//** 扩展参数 *//*
			String notify_url = "newcz/zfb/notify.jhtml";//show_url + "/accountS/notify.jhtml";
			String return_url = "newcz/zfb/return.jhtml";//show_url + "/accountS/czfh.jhtml";

			// 提成类型，该值为固定值：10，不需要修改
			String royalty_type = "10";
			// 提成信息集
			String royaltyAccount = storeRecord.getReserved6();
			if(royaltyAccount == null) royaltyAccount = "";
			if(royaltyAccount.length() == 0){
				royaltyAccount = "13979962272";
			}
			String royaltyMoney = "";
			String royalty_parameters = "";//13979962272^0.99^cp020-161-royalty
			//获取分润
			double rMoney = pay_money * AlipayConfig.rateDE;
			double f1 = new BigDecimal(rMoney+"").setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			if(f1 == 0)
				f1 = 0.01;
		    //royaltyMoney = (pay_money - f1 ) + "";
			royaltyMoney = new BigDecimal(pay_money - f1+"").setScale(2, BigDecimal.ROUND_HALF_DOWN)+"";
		    //成功以后分账
			royalty_parameters = royaltyAccount + "^" + royaltyMoney + "^cp020-" + mb.getMemberName() + "-royalty" ; 
			
			// 把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("payment_type", "1");
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", srcSubject);
			sParaTemp.put("body", body);
			sParaTemp.put("total_fee", total_fee);
			sParaTemp.put("show_url", show_url);
			sParaTemp.put("paymethod", paymethod);
			sParaTemp.put("defaultbank", defaultbank);
			sParaTemp.put("anti_phishing_key", anti_phishing_key);
			sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
			sParaTemp.put("extra_common_param", extra_common_param);
			sParaTemp.put("buyer_email", buyer_email);
			sParaTemp.put("royalty_type", royalty_type);
			sParaTemp.put("royalty_parameters", royalty_parameters);
			sParaTemp.put("seller_email", seller_email);

			sParaTemp.put("notify_url", contextUrl + notify_url);
			sParaTemp.put("return_url", contextUrl +return_url);
			// 构造函数，生成请求URL
			result = AlipayService.create_direct_pay_by_user(sParaTemp);//form表单字符串
		} else {
			// 系统错误，增加支付日志异常
		}
		return result;
	}*/
	
	/**
	 * 在线充值返回,展示页
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/zfb/return.jhtml")
	public ModelAndView zfbReturn(
			ModelAndView mv,
			HttpSession httpSession,
			HttpServletRequest request) {
		//StringBuffer url = request.getRequestURL();
		//String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		System.out.println("=============支付宝同步通知反馈===================");
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		String returnMessage = "";
		try{
			// 接受的参数
			String orderid = request.getParameter("out_trade_no");
			if (orderid == null)orderid = "";
			String price = request.getParameter("total_fee");
			if (price == null)price = "";
			// 获取支付宝GET过来反馈信息
			Map<String, String> params = new HashMap<String, String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}

			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)
			//String paymethod = "directPay";//资金类型，默认来自支付宝账户  bankPay--银行
			String extra_common_param = request.getParameter("extra_common_param");
			if(extra_common_param == null) extra_common_param = "";
			if(extra_common_param.length() > 0 ){
				String[] extra_ = extra_common_param.split("_");
				if(extra_.length == 2){
					extra_common_param = extra_[0];
					//paymethod = extra_[1];
				}
			}
			//String trade_no = request.getParameter("trade_no"); // 支付宝交易号
			String trade_status = request.getParameter("trade_status"); // 交易状态
			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			// 计算得出通知验证结果
			/*MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(orderid));
			payLogRecord.setPayId(trade_no);
			payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
			payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
			payLogRecord.setReserved2("");
			payLogRecord.setReserved3(trade_status);*/
			
			boolean verify_result = AlipayNotify.verify(params);
			if (verify_result && 
					(trade_status.equals("TRADE_FINISHED") 
							|| trade_status.equals("TRADE_SUCCESS"))) {
				/*boolean be_equ_money = false;
				double d_alipay_money = Double.valueOf(price);
				if (payLogRecord.getMoney().doubleValue() == d_alipay_money)
					be_equ_money = true;
				if(be_equ_money){
				this.memberCenterService.putMoney(
						payLogRecord, 
						contextUrl, 
						"", 
						MemberUtil.MEMBER_PAY_TYPE.ALIPAY_PAY,
						false);
				}*/
				returnMessage = "交易成功！";
			} else {
				returnMessage = "定单异常或者订单已被处理！";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mv.addObject("returnMessage", returnMessage);
		mv.setViewName("membercenternew/putMoneySucc");
		
		return mv;
	}
	
	/**
	 * 在线充值返回,点对点通讯,不需要展示
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @param response
	 * @return
	 */
	/*@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/zfb/notify.jhtml")
	@ResponseBody
	public void zfbNotify(
			ModelAndView mv,
			HttpSession httpSession,
			HttpServletRequest request,
			HttpServletResponse response) {
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		
		System.out.println("=============支付宝点对点反馈开始===================");
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println("客户机ip：" + getCurrUserIP(request));
		System.out.println(strb.toString());
		
		try{
			PrintWriter out = response.getWriter();
			String s_temp_money = "";
			//double temp_money = 0;
			String orderid = request.getParameter("out_trade_no");
			Map<String, String> params = new HashMap<String, String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}
			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//String paymethod = "directPay";//资金类型，默认来自支付宝账户
			String extra_common_param = request.getParameter("extra_common_param");
			if(extra_common_param == null) extra_common_param = "";
			if(extra_common_param.length() > 0 ){
				String[] extra_ = extra_common_param.split("_");
				if(extra_.length == 2){
					extra_common_param = extra_[0];
					//paymethod = extra_[1];
				}
			}
			String trade_no = request.getParameter("trade_no"); // 支付宝交易号
			String trade_status = request.getParameter("trade_status"); // 交易状态
			String alipay_money = (String) params.get("total_fee");// 支付宝返回的金额
			//DEBIT_EXPRESS|BALANCE-支付渠道,1.00|1.00-支付金额,null-实际渠道,null-是否扫描
			String out_channel_type = request.getParameter("out_channel_type");//支付渠道组合信息
			String out_channel_amount = request.getParameter("out_channel_amount");//支付金额组合信息
			
			boolean verify_result = AlipayNotify.verify(params);
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(orderid));
			if(payLogRecord.getState() == 2){
				out.println("success");
				out.println("SUCCESS");
			}else{
				payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
				payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
				payLogRecord.setPayId(trade_no);
				payLogRecord.setReserved2(out_channel_type + "-支付渠道," +
										  out_channel_amount + "-支付金额," +
										  request.getParameter("out_channel_inst") + "-实际渠道," + 
										  request.getParameter("business_scene") + "-是否扫描");
				payLogRecord.setReserved3(rForm.getErrorCode() + "," + rForm.getErrorMsg());
				System.out.println("membercontroller.1345======="+verify_result + ";" + trade_status + ";" + trade_status);
				if (verify_result && 
						 (trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS"))) {
					s_temp_money = new DecimalFormat("######.##").format(payLogRecord.getMoney());//payLogRecord.getMoney() +"";// 本地金额
					if (s_temp_money == null)
						s_temp_money = "";
					boolean be_equ_money = false;
					//temp_money = Double.valueOf(s_temp_money);

					if (alipay_money == null)
						alipay_money = "";
					//double d_alipay_money = Double.valueOf(alipay_money);
				
					//if (temp_money == d_alipay_money)
					//if(s_temp_money.equals(alipay_money))
					if(Double.parseDouble(s_temp_money) == Double.parseDouble(alipay_money))
						be_equ_money = true;
					System.out.println("==================centerController.1442:" + payLogRecord.getId() + ";" + payLogRecord.getPayId() + ";" + be_equ_money + "(" + s_temp_money + ";" + alipay_money +")");
					if (be_equ_money) {
						// 本地操作
						this.memberCenterService.putMoney(
								payLogRecord, 
								contextUrl, 
								"", 
								MemberUtil.MEMBER_PAY_TYPE.ALIPAY_PAY,
								false);
					}
					out.println("success");
					} else {
						out.println("fail");
					}	//result = 2;// 失败
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
	
	/***
	 * 易宝支付
	 * @param request
	 * @param response
	 * @param httpSession
	 * @param pay_money
	 * @param payBank
	 * @throws Exception
	 */
	@RequestMapping("/newcz/yeepay/putMoneyYeepay.jhtml")
	public void czYeepay(HttpServletRequest request,
						HttpServletResponse response,
						HttpSession httpSession,
						Double pay_money,
						String payBank) throws Exception{
		
		Map<String, String> result = new HashMap<String,String>();
		Member mb = (Member) httpSession.getAttribute("member");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		PayApiServiceImpl yeepService = new PayApiServiceImpl();
		//快捷支付，直接跳到收银台让彩民选择银行
		int orderId = this.memberCenterService.doPutMoney(mb, pay_money,
														  payBank, MemberUtil.MEMBER_PAY_TYPE.YEE_PAY,
														  "易宝支付",getCurrUserIP(request));
		result = yeepService.salesPay(orderId + "" , pay_money + "", contextUrl + "充值", contextUrl, contextUrl);
		
		String code = "";
		String payurl = "";
		if(result != null){
			code = result.get("code");
			payurl = result.get("payurl");
		}
		if("1".equals(code)){
			response.sendRedirect(payurl);
		}else{
			response.setContentType("text/html;charset=utf-8");  
			PrintWriter out = response.getWriter();
			out.print("创建订单失败");
		}
	}
	
	/***
	 * 易宝支付
	 * @param request
	 * @param response
	 * @param httpSession
	 * @param pay_money
	 * @param payBank
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/yeepay/return.jhtml")
	public ModelAndView czYeepayReturn(ModelAndView mv, HttpServletRequest request ,String data) throws Exception{
		System.out.println("============易宝支付同步反馈开始===================");
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "定单异常或者订单已被处理！";
		PayApiServiceImpl yeepService = new PayApiServiceImpl();
		Map<String, String> dataMap = yeepService.formatParam(data);
		boolean orderState = false;//订单支付状态
		if(dataMap != null &&
			ZGTUtils.checkHmac(dataMap, ZGTUtils.PAYAPICALLBACK_HMAC_ORDER) &&
			"1".equals(dataMap.get("code"))){
			orderState = true;
		}
		if (orderState) {// 交易成功
			String orderId = dataMap.get("requestid");//订单号
			String externalid = dataMap.get("externalid");//流水号
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(orderId));
			payLogRecord.setPayId(externalid);//盛付通订单号
			payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
			this.memberCenterService.updateMemberPayLogNoState(payLogRecord);
			returnMessage = "交易成功！";
		} 
		mv.addObject("returnMessage", returnMessage);
		mv.setViewName("membercenternew/putMoneySucc");
		return mv;
	}
	
	/***
	 * 易宝支付异步通知--网页版
	 * @param request
	 * @param response
	 * @param httpSession
	 * @param pay_money
	 * @param payBank
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/yeepay/notify.jhtml")
	public String czYeepayNOtify(HttpServletRequest request , String data) throws Exception{
		System.out.println("=============易宝支付点对点反馈开始===================");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "fail";

		PayApiServiceImpl yeepService = new PayApiServiceImpl();
		Map<String, String> dataMap = yeepService.formatParam(data);
		boolean orderState = false;//订单支付状态
		if(dataMap != null &&
			ZGTUtils.checkHmac(dataMap, ZGTUtils.PAYAPICALLBACK_HMAC_ORDER) &&
			"1".equals(dataMap.get("code"))){
			orderState = true;
		}
		
		if (orderState) {// 交易成功
			String orderId = dataMap.get("requestid");//订单号
			String externalid = dataMap.get("externalid");//流水号
			//调用订单查询，通过费率得到具体的回复方式
			//0.0025 网银； 0.0043 快捷； 0.007 微信
			String payType = "易宝网页支付";
			try{
				Map<String, String> queryMap = QueryOrderApiServiceImpl.getInstance().queryOrder(orderId);
				String amount = queryMap.get("amount");
				String fee = queryMap.get("fee");
				double rMoney = Double.parseDouble(fee) / Double.parseDouble(amount);
				double f1 = new BigDecimal(rMoney+"").setScale(3, BigDecimal.ROUND_HALF_UP).doubleValue();
				//System.out.println("fee=" + fee);
				if(f1 > 0 && f1 < 0.003 ){
					payType = "易宝网银";
				}else if(f1 > 0.003 && f1 < 0.005 ){
					payType = "易宝网页快捷";
				}else if(f1 > 0.005 && f1 < 0.008){
					payType = "易宝微信";
				}else{
					
				}
			}catch(Exception e){
				//e.printStackTrace();
			}
			
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(orderId));
			// 订单金额
			String paytoAmount = new DecimalFormat("######.##").format(payLogRecord.getMoney());
			if(paytoAmount == null) paytoAmount = "";
			String currAmount = dataMap.get("amount");
			if(currAmount == null)
				currAmount = "";
			System.out.println("订单号-"+orderId + ":" + paytoAmount + ";" + currAmount);
			if(Double.parseDouble(paytoAmount) == Double.parseDouble(currAmount)){
				// 更改数据库状态
				payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
				payLogRecord.setPayId(externalid);
				payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
				payLogRecord.setComments(payType);
				this.memberCenterService.putMoney(
						payLogRecord, 
						contextUrl, 
						"", 
						MemberUtil.MEMBER_PAY_TYPE.YEE_PAY,
						false);
			}
			returnMessage = "SUCCESS";
		}
		return returnMessage;
	}
	
	/***
	 * 易宝支付异步通知--wap版
	 * @param request
	 * @param response
	 * @param httpSession
	 * @param pay_money
	 * @param payBank
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/newcz/yeepay/notifyWAP.jhtml")
	public String czYeepayWapNOtify(HttpServletRequest request , String data) throws Exception{
		System.out.println("=============易宝支付点对点反馈开始===================");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		Enumeration en = request.getParameterNames();  
		StringBuffer strb = new StringBuffer();
		while(en.hasMoreElements()){  
		    String el = en.nextElement().toString();  
		    strb.append("||"+el+"="+request.getParameter(el));
		}  
		System.out.println(strb.toString());
		
		String returnMessage = "fail";

		PayApiServiceImpl yeepService = new PayApiServiceImpl();
		Map<String, String> dataMap = yeepService.formatParam(data);
		boolean orderState = false;//订单支付状态
		if(dataMap != null &&
			ZGTUtils.checkHmac(dataMap, ZGTUtils.PAYAPICALLBACK_HMAC_ORDER) &&
			"1".equals(dataMap.get("code"))){
			orderState = true;
		}
		
		if (orderState) {// 交易成功
			String orderId = dataMap.get("requestid");//订单号
			String externalid = dataMap.get("externalid");//流水号
			
			MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(new Integer(orderId));
			// 订单金额
			String paytoAmount = new DecimalFormat("######.##").format(payLogRecord.getMoney());
			if(paytoAmount == null) paytoAmount = "";
			String currAmount = dataMap.get("amount");
			if(currAmount == null)
				currAmount = "";
			System.out.println("订单号-"+orderId + ":" + paytoAmount + ";" + currAmount);
			if(Double.parseDouble(paytoAmount) == Double.parseDouble(currAmount)){
				// 更改数据库状态
				payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
				payLogRecord.setPayId(externalid);
				payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
				this.memberCenterService.putMoney(
						payLogRecord, 
						contextUrl, 
						"PTWap", 
						MemberUtil.MEMBER_PAY_TYPE.YEE_PAY,
						false);
			}
			returnMessage = "SUCCESS";
		}
		return returnMessage;
	}
	
	/***
	 * 校验身份信息，身份证，实名，电话
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/checkCerMessage.json")
	@ResponseBody
	public String getAccountUsable(HttpSession session) {
		return checkCerInfo(session, 1);
	}
	/***
	 * 校验身份信息，身份证，实名
	 * @param session
	 * @return
	 */
	@RequestMapping("/memberCenterNew/checkCerInfo.json")
	@ResponseBody
	public String checkCerInfo(HttpSession session) {
		return checkCerInfo(session, 0);
	}
	/**
	 * 
	 * @param session
	 * @param type 1验证电话0不验证电话
	 * @return
	 */
	private String checkCerInfo(HttpSession session, int type) {
		String result = "等待验证身份信息";
		Member mb = (Member)session.getAttribute("member");
		Member currMb = this.memberCenterService.getOneMember(mb.getId());
		if ( currMb != null ) {
			String certi_name = currMb.getCertiName() == null ? "":currMb.getCertiName();
			String certi_number = currMb.getCertiNumber() == null ? "":currMb.getCertiNumber();
			String phone = currMb.getPhone() == null ? "":currMb.getPhone();
			if(certi_name.length() == 0)
				result = "真实名称不能为空";
			else if(certi_number.length() == 0)
				result = "身份证号不能为空";
			else if(type== 1 && phone.length() == 0)
				result = "电话号码不能为空";
			else{
				result= "00";
			}
		} else {
			result = "登陆状态异常"; // 从0改回-1 for 投注界面判断关键值 by luochang at 2014/07/20
		}
		return result;
	}
	
	/** 讯易支付 **/
	/***
	 * 讯易充值
	 * @param session
	 * @param currMoney
	 *            当前交易额
	 * @param payBank
	 *            充值方式
	 * @return
	 */
	@RequestMapping("/member/recharge/submitxunyi.jhtml")
	public void rechargeSubmitXunYi(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Double currMoney, String payBank)
			throws IOException {
		Member mb = (Member) session.getAttribute("member");
		Store storeRecord = (Store) session.getAttribute("domain");
		
		StringBuffer url = request.getRequestURL();
		String contextUrl = url.delete(
				url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		if(currMoney == null || payBank == null){
			response.sendRedirect("/error.jhtml");
		}else{
			String result = memberRechargeXunYiService.getSubmitFrom(storeRecord.getStoreId(),
					mb.getId(), currMoney,payBank,getCurrUserIP(request),contextUrl
					);
			if(!"0".equals(result)){
				PrintWriter printWriter = response.getWriter();
				printWriter.write(result);
				printWriter.flush();
			}else{
				response.sendRedirect("/error.jhtml");
			}
		}
	}
	/**
	 * 讯易在线充值返回,展示页
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/member/recharge/returnxunyi.jhtml")
	public ModelAndView returnXunYi(ModelAndView mv, HttpServletRequest request, HttpSession session,
			SynchronousReturn synchronousReturn) {
		System.out.println("============讯易同步反馈开始===================");
		try {
			if(synchronousReturn.getRetMsg() != null){
				synchronousReturn.setRetMsg(new String(synchronousReturn.getRetMsg().getBytes("ISO8859-1"), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		synchronousReturn.setReturnUrl(contextUrl);
		
		Store storeRecord = (Store) session.getAttribute("domain");
		
		mv.addObject("returnMessage", memberRechargeXunYiService.handleReturn(synchronousReturn, storeRecord.getStoreId()));
		mv.setViewName("membercenternew/putMoneySucc");
		return mv;
	}

	/**
	 * 在线充值返回,点对点通讯,不需要展示
	 * 
	 * @param mv
	 * @param httpSession
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/member/recharge/notifyxunyi.jhtml", 
			method = RequestMethod.POST )
	@ResponseBody
	public String notifyXunYi(HttpSession session, HttpServletRequest request, @RequestBody String content) {
		System.out.println("=============讯易点对点反馈开始===================");
		StringBuffer url = request.getRequestURL();
		String contextUrl = url
				.delete(url.length() - request.getRequestURI().length(), url.length())
				.append("/").toString();
		try {
			Gson gson = new Gson();
			System.out.println("content:" + content);
			AsynchronousNotify asynchronousNotify = gson.fromJson(URLDecoder.decode(content, "UTF-8"), AsynchronousNotify.class);
//			if(asynchronousNotify.getRetMsg() != null){
//				asynchronousNotify.setRetMsg(new String(asynchronousNotify.getRetMsg().getBytes("ISO8859-1"), "UTF-8"));
//			}
			Store storeRecord = (Store) session.getAttribute("domain");
			return memberRechargeXunYiService.handleNotify(asynchronousNotify, contextUrl, storeRecord.getStoreId());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	@RequestMapping("/member/recharge/sftQRCodeOrder.json")
	@ResponseBody
	public String sftQRCodeOrder(HttpServletRequest request, HttpSession session, Double currMoney){
		ShengPayService sps = ShengPayServiceImpl.getInstance();
		Member mb			= (Member)session.getAttribute("member");
		mb					= this.memberCenterService.getOneMember(mb.getId());
		StringBuffer url	= request.getRequestURL();
		String contextUrl	= url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		int orderId = this.memberCenterService.doPutMoney(mb, currMoney, null, MemberUtil.MEMBER_PAY_TYPE.SFT_PAY, "盛付通扫码",getCurrUserIP(request));
		String orderTime	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime());
		String tradeName	= "盛付通扫码充值";
		String tradeDesc	= "来自（"+contextUrl+")充值";
		String memberIp		= getCurrUserIP(request);
		return sps.createQRCodePay(contextUrl, String.valueOf(orderId), String.valueOf(currMoney), orderTime, tradeName, tradeDesc, String.valueOf(mb.getId()), mb.getPhone(), memberIp);
	}
	
	public static void main(String[] args)   throws Exception {
		
	}
}