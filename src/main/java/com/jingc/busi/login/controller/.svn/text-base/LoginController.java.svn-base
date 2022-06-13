/**
 * 
 */
package com.jingc.busi.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.VerificationCode;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.core.service.CommonService;
import com.jingc.busi.core.service.ICytxCommonOperationService;
import com.jingc.busi.core.service.CommonService.MemberStatis;
import com.jingc.busi.core.service.ICytxCommonOperationService.UpdateStatisTypes;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.MemberState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.common.util.JsonUtils;

/**
 * <p>File: LoginController.java</p>
 * <p>Desc: 注册、登陆、找回密码、退出</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/common/")
public class LoginController {
	
	@Resource
	private LoginService loginService;
	@Resource
	private MemberCenterService memberCenterService;
	@Resource
	private CommonService commonService;
	@Resource 	
	private ICytxCommonOperationService cytxcservice;
	/**
	 * 查询彩民可投注余额
	 * @param session
	 * @return -1,未登录 / 彩民余额
	 */
	@RequestMapping("/getAccountUsable.json")
	@ResponseBody
	public String getAccountUsable(HttpSession session) {
		String result = null;
		Member mb = (Member)session.getAttribute("member");
		if ( null != mb ) {
			Double[] money = this.loginService.getAccount(mb.getId());
			if(money != null)
				result = money[3] + "";
		} else {
			result = "-1"; // 从0改回-1 for 投注界面判断关键值 by luochang at 2014/07/20
		}
		return result;
	}
	
	/**
	 * 营业厅彩民的购物车（等待确认的方案）
	 * @param session
	 */
	@RequestMapping("/getTemporaryOrder.json")
	@ResponseBody
	public String getTemporaryOrder(HttpSession session) {
		Member mb = (Member)session.getAttribute("member");
		if ( null != mb ) {
			LotteryOrder param = new LotteryOrder();
			param.setUserid(mb.getId());
			param.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "");
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			param.setReserved1(currMember.getReserved1());
			//param.setReserved1(mb.getReserved1());
			Pagination pagi = this.memberCenterService.getYYTOrderByMemberAndGameType(param, null, null);
			int allNum = 0;
			int allMoney = 0;
			if(pagi != null){
				allNum = pagi.getTotalCount();
				List<LotteryOrder> list = (List<LotteryOrder>)pagi.getList();
				if(list != null && list.size() > 0){
					for(LotteryOrder record:list){
						allMoney = allMoney + record.getBetPrice();
					}
				}
				
			}
			//return "[{'allNum':'"+allNum+"','allMoney':'"+allMoney+"'}]";
			return allNum + "," + allMoney;
		}else{
			return "";
		}
		
	}
	
	/**
	 * 查询彩民可取款余额
	 * @param session
	 * @return -1,未登录 / 彩民余额
	 */
	@RequestMapping("/getMemStat.json")
	@ResponseBody
	public String getMemberStat(HttpSession session) {
		Member mb = (Member)session.getAttribute("member");
		MemberStatis ms = this.commonService.getMemberStatis(mb.getId());
		return JSONObject.fromObject(ms).toString();
	}
	
	/**
	 * 查询彩民可取款余额
	 * @param session
	 * @return -1,未登录 / 彩民余额
	 */
	@RequestMapping("/getAccountUsableGetMoney.json")
	@ResponseBody
	public String getAccountUsableGetMoney(HttpSession session) {
		String result = null;
		Member mb = (Member)session.getAttribute("member");
		if ( null != mb ) {
			Double[] money = this.loginService.getAccount(mb.getId());
			if(money != null)
				result = money[4] + "";
		} else {
			result = "-1";
		}
		return result;
		/*Member mb = (Member) session.getAttribute("member");
		Integer memberId = mb.getId();
		Double sumConsume = 0.0;//所有购彩
		Double sumPut = 0.0;//所有充值
		Double sumBonus = 0.0;//所有中奖
		Double sumGet = 0.0;//所有取款
		Double sumDebit = 0.0;//未归还的欠款单
		Double sumWaitGet = 0.0;//未处理的取款单
		Double pointer = 0.0;//店铺充值款的最低消费比例
		
		Double[] allMoney = this.memberCenterService.allowGetMoney(memberId);
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
		return allowGet + "";*/
	}
	
	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	} 
	
	/**
	 * 登录
	 * @param session
	 * @return -1,失败  1-成功
	 */
	@RequestMapping("/logon.json")
	@ResponseBody
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response, String username, String password) {
		String result = null;
		Integer storeid = ((Store)session.getAttribute("domain")).getStoreId();	// 从缓存中提取，放入session。如果缓存不存在，数据库提，再放入缓存,解析域名对应的店铺编号
		Member mb = this.loginService.login(storeid, username, password, getRemortIP(request));
		
		
		/*
		 * 获取账户安全级别 1 2 3
		 */
		if(mb != null && (mb.getReserved2() == null || "".equals(mb.getReserved2())) ){
			String level = MemberUtil.AnalyzePasswordSecurityLevel(password);
			mb.setReserved2(level);
			this.memberCenterService.updateMemberMessage(mb);
		}
		if ( null != mb ) {
			// 状态为“正常”才能登陆
			if ( mb.getState().intValue() != MemberState.MemberIDState.NORMAL ) {
				result = "-1";
			} else {
				String time = DateUtil.getDateFormat2();
				mb.setLoginTiem(time);
				session.setAttribute("member", mb);
				result = "1";
				CacheUtil.setStoreOnlineStatistics(mb.getStoreId(), 2, true);
				// 设置cookie
				/*Cookie cookie = new Cookie("uunmmm",username);
				Cookie cookieP = new Cookie("uunmpp",password);
				cookie.setMaxAge(10*365*24*60*60);
				cookieP.setMaxAge(10*365*24*60*60);
				response.addCookie(cookie);
				response.addCookie(cookieP);*/
			}
		} else {
			result = "-1";
		}
		return result;
	}
	
	/**
	 * 不分店铺登录
	 * @param session
	 * @return -1,失败  1-成功
	 */
	@RequestMapping("/commonLogon.json")
	@ResponseBody
	public String commonLogon(HttpSession session, String username, String password) {
		String result = null;
		String stationUrl = null;
		HashMap<String , String> resultMap = new HashMap<String , String>();
		Member mb = this.loginService.commonLogin(username, password);
		if ( null != mb ) {
			//查找店铺,获取店铺的推广地址
			Store store = this.loginService.getStore(mb.getStoreId());
			stationUrl = store.getNetUrl();
			resultMap.put("stationUrl", stationUrl);
			// 状态为“正常”才能登陆
			if ( mb.getState().intValue() != MemberState.MemberIDState.NORMAL ) {
				result = "-1";
			} else {
				//session.setAttribute("member", mb);
				result = "1";
				String uuid = mb.getStoreId() + "_" + mb.getId();
				resultMap.put("uuid", session.getId());
				CacheUtil.putDomainLoginFlag(session.getId(), uuid);
			}
			
		} else {
			result = "-1";
		}
		
		resultMap.put("result", result);
		
		return JsonUtils.getJsonFromMap(resultMap);
	}
	
	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		/*Cookie[] cookies = request.getCookies();
		if ( null != cookies ) {
			for(Cookie cookie : cookies){
				if ( cookie.getName().equals("uunmmm") || cookie.getName().equals("uunmpp") ) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}*/
		session.invalidate();
		return "1";
	}
	
	@RequestMapping("/register/index.jhtml")
	public ModelAndView indexRegiste(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		/*String aa = (String)session.getAttribute("agentId");
		System.out.println(aa);
		System.out.println(session.getId());*/
		mv.setViewName("login/registe1");
		return mv;
	}
	
	@RequestMapping("/captcha.do")
	public void captcha(HttpSession session, HttpServletResponse response, String propertyName) {
		
		VerificationCode verificationCode = VerificationCode.getInstance(60,20,4);
		if(null == propertyName || "".equals(propertyName)){
			propertyName = "captcha";
		}
		// 将认证码存入session
		session.setAttribute(propertyName,verificationCode.getString());
		// 设置页面不缓存
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 输出图象到页面
		try{
			ImageIO.write(verificationCode.getImage(), "JPEG", response.getOutputStream()); 
		}catch(IOException e){
		}    
	}
	
	/**
	 * 登录
	 * @param session
	 * @return -1,存在  1-不存在
	 */
	@RequestMapping("/checkUser.json")
	@ResponseBody
	public String checkUser(HttpSession session, String username) {
		String result = null;
		Integer storeid = ((Store)session.getAttribute("domain")).getStoreId();	
		List<Member> mb = this.loginService.reg(storeid, username, null, null);
		if ( null == mb  || mb.size() == 0) {
			result = "1";
		} else {
			result = "-1";
		}
		return result;
	}
	
	/**
	 * 校验验证码
	 * @param session
	 * @return -1,不正确  1-正确
	 */
	@RequestMapping("/checkCaptcha.json")
	@ResponseBody
	public String checkCaptcha(HttpSession session, String code) {
		String result = null;
		String rc = (String)session.getAttribute("captcha");
		if ( code.equals(rc) ) {
			result = "1";
		} else {
			result = "-1";
		}
		return result;
	}
	
	/**
	 * 注册信息入库
	 * @param session
	 * @param username
	 * @param password
	 * @param yzCode
	 * @return
	 */
	@RequestMapping("/register/register.jhtml")
	public String register(HttpSession session, String username, String password, String yzCode,String phone,String agentId) {
		if(username == null)
			username = "";
		if(password == null)
			password = "";
		if(phone == null)
			phone = "";
		if(username.length() == 0 || password.length() == 0)
			throw new BaseException("[您的用户名或密码为空，请重新注册]"); 
		
		Integer storeid = ((Store)session.getAttribute("domain")).getStoreId();
		/*
		 * 获取账户安全级别
		 */
		/*String aa = (String)session.getAttribute("agentId");
		System.out.println(aa);
		System.out.println(session.getId());*/
		String level = MemberUtil.AnalyzePasswordSecurityLevel(password);
		Member mb = this.loginService.registe(storeid, username, password, phone, level , agentId);
		this.cytxcservice.cytxUpdateStatis(mb.getId(),mb.getMemberName(),mb.getStoreId(),
				((Store)session.getAttribute("domain")).getStoreName(),
				new Integer(UpdateStatisTypes.MEMBER_REGISTRATION),null,0d);

		String title = "新用户注册";
		String message = "<font size=\"2px\">新用户<strong color=\"red\">"+mb.getMemberName()+"</strong>注册了您的网站！（来自网站）</font>";
		this.loginService.sendMessage(mb.getId(), mb.getStoreId(), title, message);//添加用户注册站内信 zh
		session.setAttribute("member", mb);
		return "redirect:/common/register/registerSucc.jhtml";
	}
	
	/***
	 * 注册成功，url重定向
	 * @param session
	 * @return
	 */
	@RequestMapping("/register/registerSucc.jhtml")
	public ModelAndView register2(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/registe2");
		return mv;
	}
	
	/***
	 * 登陆页登陆
	 * @param session
	 * @return
	 */
	@RequestMapping("/login/login.jhtml")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login");
		return mv;
	}
	
	/**
	 * 查询站内信总条数
	 * @param session
	 * @return -1,未登录 / 
	 */
	@RequestMapping("/getMessageUsable.json")
	@ResponseBody
	public String getMemberMessage(HttpSession session,HttpServletRequest request) {
		String result = "0";
		Member mm = (Member)session.getAttribute("member");
		if ( null != mm ) {
			int message = this.loginService.getMessageTotal(mm.getId());
			String s = String.valueOf(message);
			if(mm != null){ 
				result = s;
			} else {
				result = "-1"; // 从0改回-1 for 投注界面判断关键值 by luochang at 2014/07/20
			}
		}
		return result;
	}
	
	public static void main(String[] args){
		System.out.println("test.cp020.com".split("\\.")[1]);
	}
}
