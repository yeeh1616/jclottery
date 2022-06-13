package com.jingc.busi.zhishu.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.ZhishuPay;
import com.jingc.busi.zhishu.service.ZhishuService;
import com.jingc.common.util.HttpHandler;
import com.zh.wechat.util.WeChatUtil;

@Controller
@RequestMapping("/zhishu/")
public class ZhishuController {
	
	@Resource private ZhishuService zhishuService;

	@RequestMapping("/index.jhtml")
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String stopTime = "00,00,00";
		if ( null != session.getAttribute("member") ) {
			Member mb = (Member)session.getAttribute("member");
			ZhishuPay pay = this.zhishuService.findMemberZhishuPay(mb.getId());
			if ( null != pay ) {
				stopTime = this.getCurrentStopTime(pay.getStopTime());
				
				try {
					String oddInfo = HttpHandler.getInstance().doGet("http://collection.cp020.com/global/statis/guessfootball.js", "utf-8");
					mv.addObject("oddInfo",oddInfo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		mv.addObject("stopTime", stopTime.split(","));
		mv.setViewName("zhishu/index");
		return mv;
	}
	
	private String getCurrentStopTime(String stopTime) {
		Date nowTime = new Date();
		Date nextTime = DateUtil.getDate(stopTime, "yyyy-MM-dd HH:mm:ss");
		Calendar cc = Calendar.getInstance();
		cc.setTime(nextTime);
		nextTime = cc.getTime();
		long endLTime = nextTime.getTime() - nowTime.getTime();
		int endHou = ((int)endLTime / 1000) / 60 / 60;
		int endMin = ((int)endLTime / 1000) / 60;
		if ( endMin > 60 ) {
			endMin = endMin % 60;
		}
		int endSec = ((int)endLTime / 1000) % 60;
		
		return String.format("%02d", endHou) + "," + String.format("%02d", endMin) + "," + String.format("%02d", endSec);
	}
	
	@RequestMapping("/getStatis.jhtml")
	@ResponseBody
	public String getStatis(HttpSession session) {
		if ( null == session.getAttribute("member") )
			return "[]";
		Member mb = (Member)session.getAttribute("member");
		ZhishuPay pay = this.zhishuService.findMemberZhishuPay(mb.getId());
		if ( null != pay ) {
			try {
				String oddInfo = HttpHandler.getInstance().doGet("http://collection.cp020.com/global/statis/guessfootball.js", "utf-8");
				return oddInfo;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "[]";
	}
	
	/**
	 * 指数微信支付
	 * @author ZhangHao
	 * @param request
	 * @param account	金额
	 * @param payType	支付方式，1-4小时，2-全天
	 * @return
	 */
	@RequestMapping("/wechatpay.do")
	@ResponseBody
	public String wechatpay(HttpServletRequest request, Double account, Integer payType) {
		String contextUrl	= getRequestUrl(request);
		String ip			= getCurrUserIP(request);
		Member member		= (Member) request.getSession().getAttribute("member");
		if (member == null) {
			return "{\"code\":0,\"msg\":\"请先登录\"}";
		}
		return this.zhishuService.wechatPay(member.getId(), member.getStoreId(), account, contextUrl, ip, payType);
	}
	
	/**
	 * 支付结果通用通知
	 * @author ZhangHao
	 * @param xml 通知xml
	 * @return
	 */
	@RequestMapping("/notify.do")
	@ResponseBody
	public String notify(@RequestBody String xml) {
		Map<String, String> params = WeChatUtil.xmlToMap(xml);
		String result		= this.zhishuService.notifyVerify(params);
		return "<xml>\n<return_code><![CDATA[" + result + "]]></return_code>\n</xml>";
	}
	
	/**
	 * 刷新支付结果
	 * @param zhishuPayId
	 * @return
	 */
	@RequestMapping("/refresh_result.do")
	@ResponseBody
	public String refreshResult(Integer zhishuPayId) {
		return  this.zhishuService.getZhishuPay(zhishuPayId);
	}
	
	
	
	
	
	///////////////////////////////////////////////////////////
	private String getRequestUrl(HttpServletRequest request){
		StringBuffer url = request.getRequestURL();
		return url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
	}
	
	private String getCurrUserIP(HttpServletRequest request) {
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
}
