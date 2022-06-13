package com.jingc.busi.zhishu.service;

import java.util.Map;

import com.jingc.busi.common.table.ZhishuPay;

public interface ZhishuService {

	public ZhishuPay findMemberZhishuPay(Integer memberId);
	
	/**
	 * 根据id查询指数信息
	 * @param id	指数id
	 * @return
	 */
	public String getZhishuPay(Integer id);
	
	/**
	 * 创建订单
	 * @author ZhangHao
	 * @param memberId		用户id
	 * @param storeId		店铺id
	 * @param account		订单金额
	 * @param payChannel	支付通道
	 * @param payType		支付方式，1-4小时，2-全天
	 * @param remarks		备注
	 * @return				返回订单对象
	 */
	public ZhishuPay createZhishuPay(Integer memberId, Integer storeId, Double account, Integer payChannel, Integer payType, String remarks);
	
	/**
	 * 微信充值
	 * @author ZhangHao
	 * @param memberId		用户iid
	 * @param storeId		店铺id
	 * @param account		订单金额
	 * @param contextUrl	店铺地址
	 * @param ip			请求ip
	 * @param payType		支付方式，1-4小时，2-全天
	 * @return				返回支付二维码
	 */
	public String wechatPay(Integer memberId, Integer storeId,  Double account, String contextUrl, String ip, Integer payType);
	
	/**
	 * 订单异步通知校验
	 * @param params	通知参数集合
	 * @return			校验结果 SUCCESS/FAIL
	 */
	public String notifyVerify(Map<String, String> params);
}
