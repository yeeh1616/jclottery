package com.jingc.busi.lottery.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/WeChat/")
public class WeChatTest {
	
	@RequestMapping("getSnsapiBase.jhtml")
	public void test(String code){
		System.out.println(code);
	}
}
