package com.jingc.busi.membercenter.service;

import com.xywallet.protocol.quickpayh5.AsynchronousNotify;
import com.xywallet.protocol.quickpayh5.SynchronousReturn;

public interface MemberRechargeXunYiService {
	public String getSubmitFrom(Integer storeId, Integer memberId, Double amt, String payBank, String ip, String contextUrl);
	public String handleReturn(SynchronousReturn synchronousReturn, Integer storeId);
	public String handleNotify(AsynchronousNotify asynchronousNotify, String contextUrl, Integer storeId);
}
