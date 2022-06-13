package com.jingc.busi.membercenter.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.qq.weixin.mp.aes.AesException;
import com.qq.weixin.mp.aes.WXBizMsgCrypt;
import com.zh.wechat.common.WeChatExepction;
import com.zh.wechat.common.WeChatOAuth;
import com.zh.wechat.service.EnterprisePayImpl;
import com.zh.wechat.util.Md5Tools;
import com.zh.wechat.util.WeChatUtil;

/**
 * 
 * This class is used for 用户充值业务实现类
 * @author ZhangHao
 * @version   
 *       1.0, 2015-12-28 上午10:25:43
 */
@Service("wechatService")
public class WeChatServiceImpl implements WeChatService {
	
	String sToken = "ZhangHao";
	String sCorpID = "wxed12a80e31e0915a";
	String sEncodingAESKey = "F8FrG42YRGOF5C4B2y9tNyIyouVmklvthRoQrEDCGAS";

	public String demo(String sVerifyMsgSig, String sVerifyTimeStamp, String sVerifyNonce, String sVerifyEchoStr) throws AesException{
		WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID);
		String sEchoStr = ""; //需要返回的明文
		try {
			sEchoStr = wxcpt.VerifyURL(sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sEchoStr;
	}
	
	
	////////////////////////////////////////////////////////////////////
	
	@Override
	public String getQRCode(String orderId, String money, String deviceInfo, String ip, String deviceSign) {
		String data = orderId + "`" + money + "`" + ip + "`";
		String sStr = orderId + money + ip + WeChatUtil.getConfigVal("LOCAL_KEY");
		String sign = Md5Tools.MD5(sStr).toUpperCase();
		data += sign + "`" + deviceInfo;
		return WeChatOAuth.createQRbase64(data);
	}
	
	@Override
	public Map<String, String> pay(String code, String data) {
		if (code != null && !"".equals(code)) {
			String openId = WeChatOAuth.getOpenId(code);
			String orderId, ip, sign, deviceInfo = null;
			String describe =	"测试兑奖";
			Double money;
			String[] datas = data.split("`");
			if (datas.length == 4) {
				orderId		= datas[0];
				money		= Double.valueOf(datas[1]);
				ip			= datas[2].replaceAll("_", ".");
				sign		= datas[3];
			} else if (datas.length == 5) {
				orderId		= datas[0];
				money		= Double.valueOf(datas[1]);
				ip			= datas[2].replaceAll("_", ".");
				sign		= datas[3];
				deviceInfo	= datas[4];
			} else {
				throw new WeChatExepction("参数数量错误！");
			}
			String signStr = datas[0] + datas[1] + datas[2] + WeChatUtil.getConfigVal("LOCAL_KEY");
			if (!Md5Tools.MD5(signStr).toUpperCase().equals(sign)) {
				throw new WeChatExepction("签名错误！");
			}
			return new EnterprisePayImpl().pay(openId, orderId, money, describe, deviceInfo, ip);
		} else {
			throw new WeChatExepction("参数code不能为空！");
		}
	}
}
