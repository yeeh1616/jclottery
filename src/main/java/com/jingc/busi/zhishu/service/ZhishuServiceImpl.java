package com.jingc.busi.zhishu.service;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.ZhishuPayMapper;
import com.jingc.busi.common.table.ZhishuPay;
import com.zh.wechat.service.QRCodePayServiceImpl;

@Service("zhishuService")
public class ZhishuServiceImpl implements ZhishuService {
	
	@Resource private ZhishuPayMapper zhishuPayMapper;

	@Override
	public ZhishuPay findMemberZhishuPay(Integer memberId) {
		String nowTime = DateUtil.getDateFormat2();
		return this.zhishuPayMapper.selectMemberPay(memberId, nowTime);
	}
	
	@Override
	public String getZhishuPay(Integer id) {
		ZhishuPay zhishuPay = this.zhishuPayMapper.selectByPrimaryKey(id);
		JSONObject obj = new JSONObject();
		if (zhishuPay == null) {
			obj.put("code", 0);
			obj.put("msg", "订单不存在！");
			return obj.toString();
		}
		obj.put("code", 1);
		obj.put("state", zhishuPay.getPayState());
		if (zhishuPay.getPayState() == ZhishuPay.PAYSTATE_CZZ) {//充值中
			obj.put("msg", "充值中");
		}
		if (zhishuPay.getPayState() == ZhishuPay.PAYSTATE_CZCG) {//充值成功
			obj.put("msg", "充值成功");
		}
		if (zhishuPay.getPayState() == ZhishuPay.PAYSTATE_CZSB) {//充值失败
			obj.put("msg", "充值失败");
		}
		return obj.toString();
	}
	
	/**
	 * 创建支付订单
	 */
	@Override
	public ZhishuPay createZhishuPay(Integer memberId, Integer storeId, Double account, Integer payChannel, Integer payType, String remarks) {
		ZhishuPay param = new ZhishuPay();
		param.setMemberId(memberId);
		param.setStoreId(storeId);
		param.setPayChannel(payChannel);
		param.setPayMoney(account);
		param.setPayTime(DateUtil.getDateFormat2());
		param.setPayState(ZhishuPay.PAYSTATE_CZZ);
		param.setPayType(payType);
		param.setRemarks(remarks);
		int falg = this.zhishuPayMapper.insert(param);
		if (falg <= 0) {
			throw new BaseException("订单创建失败！");
		}
		return param;
	}

	/**
	 * 微信下单 
	 */
	@Override
	public String wechatPay(Integer memberId, Integer storeId,  Double account, String contextUrl, String ip, Integer payType) {
		Integer payChannel	= ZhishuPay.PAYCHANNEL_WECHAT;	//设置支付通道（微信）
		String remarks		= null;							//备注
		//创建支付订单
		ZhishuPay param	= this.createZhishuPay(memberId, storeId, account, payChannel, payType, remarks);
		String orderId	= String.valueOf(param.getId());	//订单号
		String body		= "凤凰指数-" + (payType == 1 ? "4小时" : "全天");//购买商品描述
		//调用微信接口生成订单图片
		String img		= new QRCodePayServiceImpl().createOrder(orderId, account, body, ip, contextUrl);
		JSONObject obj = new JSONObject();
		obj.put("code", 1);
		obj.put("img", img);
		obj.put("zhishuPayId", param.getId());
		return obj.toString();
	}

	@Override
	public String notifyVerify(Map<String, String> params) {
		if (params == null || "FAIL".equals(params.get("return_code"))) {//微信通知通信标识
			return "FAIL";
		}
		boolean vResult	= new QRCodePayServiceImpl().verifyNotice(params);
		if (!vResult) {	//签名结果判断
			return "FAIL";
		}
		String orderId	= params.get("out_trade_no");		//获取订单号
		ZhishuPay param	= this.zhishuPayMapper.selectByPrimaryKey(Integer.valueOf(orderId));//根据订单号查询订单
		//判断该订单状态 成功或者失败
		if (param.getPayState() == ZhishuPay.PAYSTATE_CZCG || param.getPayState() == ZhishuPay.PAYSTATE_CZSB) {
			return "SUCCESS";
		}
		String beginTime;
		//查询是否存在未结束订单
		ZhishuPay zsp = this.zhishuPayMapper.selectLastMemberPay(param.getMemberId());
		if (zsp == null || zsp.getStopTime() == null) {
			beginTime = DateUtil.getDateFormat2();//设置当前时间
		} else {
			Date d = DateUtil.getDate(zsp.getStopTime(), "yyyy-MM-dd HH:mm:ss");
			if (new Date().before(d)) {			//判断当前时间是否小于订单结束时间
				beginTime = zsp.getStopTime();	//设置未结束订单的结束时间为当前订单起始时间
			} else {
				beginTime = DateUtil.getDateFormat2();//设置当前时间 
			}
		}
		param.setPayTime(beginTime);						//设置订单开始时间
		String stopTime;
		if (param.getPayType() == 2) {
			stopTime = ztime(param.getPayTime(), 24);//购买时间1天
		} else {
			stopTime = ztime(param.getPayTime(), 4);//购买时间4小时
		}
		param.setStopTime(stopTime);						//结束时间
		if ("SUCCESS".equals(params.get("result_code"))){	//业务结果-充值成功
			param.setPayState(ZhishuPay.PAYSTATE_CZCG);		//支付状态-充值成功
			param.setRemarks(params.get("transaction_id"));	//备注微信订单号
		} else {
			param.setRemarks(params.get("err_code_des"));	//备注错误描述
			param.setPayState(ZhishuPay.PAYSTATE_CZSB);		//支付状态-充值失败 
		}
		int flag = this.zhishuPayMapper.updateByPrimaryKey(param);//更新订单 
		if (flag <= 0) {
			return "FAIL";
		}
		return "SUCCESS";
	}
	
	/**
	 * 生成 time 的 hour 小时后的时间
	 * @param time	时间参数
	 * @param hour	小时参数
	 * @return		time 的 hour 小时后的时间
	 */
	private String ztime(String time, int hour) {
		Calendar c = Calendar.getInstance();
		Date d = DateUtil.getDate(time, "yyyy-MM-dd HH:mm:ss");
		c.setTime(d);
		c.add(Calendar.HOUR_OF_DAY, hour);
		return DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", c.getTime());
	}
}
