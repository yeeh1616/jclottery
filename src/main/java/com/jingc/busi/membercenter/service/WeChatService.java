package com.jingc.busi.membercenter.service;

import java.util.Map;

import com.qq.weixin.mp.aes.AesException;

/**
 * 
 * This class is used for 用户充值接口
 * @author ZhangHao
 * @version   
 *       1.0, 2015-12-28 上午10:52:17
 */
public interface WeChatService {
	
	public String demo(String sVerifyMsgSig, String sVerifyTimeStamp, String sVerifyNonce, String sVerifyEchoStr) throws AesException;
	
	public String getQRCode(String orderId, String money, String deviceInfo, String ip, String deviceSign);
	
	public Map<String, String> pay(String code, String data);
}
