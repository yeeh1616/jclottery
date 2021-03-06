package com.jingc.busi.membercenter.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.util.SHA1;
import com.jingc.busi.membercenter.service.WeChatService;
import com.zh.wechat.common.WeChatExepction;

/**
 * 
 * This class is used for 微信开发
 * @author ZhangHao
 * @version   
 *       1.0, 2016-1-21 下午04:42:12
 */
@Controller
@RequestMapping("/wechat/")
public class WeChatController {
	
	@Resource
	private WeChatService wechatService;
	
	@RequestMapping("/test.jhtml")
	@ResponseBody
	public String test(String signature, String timestamp, String nonce, String echostr){
		if(signature == null || timestamp == null || nonce == null) return "ERROR";
		String token = "ZhangHao";
		System.out.println("1.signature:"+signature+"\n2.timestamp:"+timestamp+"\n3.nonce:"+nonce+"\n4.echostr:"+echostr);
		List<String> list = new ArrayList<String>();
		list.add(timestamp);
		list.add(nonce);
		list.add(token);
		Collections.sort(list);
		String temp = "";
		for(String str : list){
			temp += str;
		}
		String tempStr = new SHA1().getDigestOfString(temp);
		if(tempStr.equals(signature)){
			System.out.println("链接成功");
			return  echostr;
		}else{
			System.out.println("链接失败");
			return "ERROR";
		}
	}
	
///////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/code.jhtml")
	public ModelAndView getCode(String orderId, String money, String deviceInfo, String ip) throws UnsupportedEncodingException{
		return new ModelAndView("wechat/qr_code", "url", this.wechatService.getQRCode(orderId, money, deviceInfo, ip, null));
	}
	
	@RequestMapping("/code.do")
	public ModelAndView execute(String code, String state) {
		ModelAndView mv = new ModelAndView("wechat/success");
		try {
			Map<String, String> map = this.wechatService.pay(code, state);
			mv.addObject("map", map);
			mv.addObject("code", "SUCCESS");
			mv.addObject("msg", "兑奖成功！");
		} catch (WeChatExepction e) {
			mv.addObject("code", e.getErrCode() == null ? "" : e.getErrCode());
			mv.addObject("msg",  e.getErrMsg());
		}
		return mv;
	}
}
