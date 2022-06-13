package com.jingc.busi.membercenter.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.mapper.StorePayConfigMapper;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StorePayConfig;
import com.jingc.busi.util.member.MemberUtil;
import com.xywallet.config.Global;
import com.xywallet.protocol.quickpayh5.AsynchronousNotify;
import com.xywallet.protocol.quickpayh5.Precreate;
import com.xywallet.protocol.quickpayh5.SynchronousReturn;
import com.xywallet.util.RSAUtils;

@Service()
public class MemberRechargeXunYiServiceImpl implements MemberRechargeXunYiService{
	@Autowired private MemberMapper memberMapper;
	@Autowired private StoreMapper storeMapper;
	@Autowired private MemberCenterService memberCenterService;
	@Autowired private StorePayConfigMapper storePayConfigMapper;
	
	@Override
	public String getSubmitFrom(Integer storeId, Integer memberId, Double amt, 
			String payBank, String ip, String contextUrl) {
		
		Member currMb = memberMapper.selectByPrimaryKey(memberId);
		StorePayConfig storePayConfig = storePayConfigMapper.getOneByStoreIdAndCustomerType(storeId, 1);
//		Store storeRecord = storeMapper.selectByPrimaryKey(storeId);
		
		if(currMb.getCertiName() == null || "".equals(currMb.getCertiName())
					|| currMb.getCertiNumber() == null || "".equals(currMb.getCertiNumber())
					|| storePayConfig == null || storePayConfig.getCustomerId() == null || "".equals(storePayConfig.getCustomerId())){
			return "0";
		}
					
		// 充值日志
		int orderId = memberCenterService.doPutMoney(currMb, amt,
														  payBank, MemberUtil.MEMBER_PAY_TYPE.XUNYI_WEB ,
														  "讯易平台",ip);
		Precreate precreate = new Precreate();
		precreate.setAppId(storePayConfig.getCustomerId());
		precreate.setProductName("预存");
		precreate.setProductDesc("recharge");
		precreate.setTranAmt(amt.toString());
		precreate.setTranTime(DateUtil.getDateFormat3());
		precreate.setClientIp(ip);
		precreate.setMerOrderId(orderId + "");
		
		precreate.setReturnUrl(contextUrl + Global.RETURN_URL);
		precreate.setNotifyUrl(contextUrl + Global.NOTIFY_URL);
		
		precreate.setBankCardType(Global.CardType.DEBIT_CREDIT_CARD.value);
		precreate.setIdNo(currMb.getCertiNumber());
		precreate.setIdType(Global.CertType.ID_CARD.value);
		precreate.setBankAcctName(currMb.getCertiName());
		precreate.setPayerId(currMb.getId().toString());
		return precreate.getSubmitForm(storePayConfig.getKey1());
	}

	@Override
	public String handleReturn(SynchronousReturn synchronousReturn, Integer storeId) {
		String signOrgin = synchronousReturn.getSignOrgin();
		System.out.println("signOrgin:" + signOrgin);
		String returnMessage = "定单异常或者订单已被处理！";
		try {
			StorePayConfig storePayConfig = storePayConfigMapper.getOneByStoreIdAndCustomerType(storeId, 1);
			if(RSAUtils.verify(signOrgin.getBytes(), storePayConfig.getKey0(), synchronousReturn.getSign())){
				if(Global.ReturnCode.TRADE_SUCCESS0.value.equals(synchronousReturn.getRetCode())){
					if(Global.TradeStatus.SUCCESS.value.equals(synchronousReturn.getTradeStatus())){
						returnMessage = Global.TradeStatus.SUCCESS.desc;
					}else if(Global.TradeStatus.TRADING.value.equals(synchronousReturn.getTradeStatus())){
						returnMessage = Global.TradeStatus.TRADING.desc;
					}else if(Global.TradeStatus.UN_PAY.value.equals(synchronousReturn.getTradeStatus())){
						returnMessage = Global.TradeStatus.UN_PAY.desc;
					}else if(Global.TradeStatus.FAIL.value.equals(synchronousReturn.getTradeStatus())){
						returnMessage = Global.TradeStatus.FAIL.desc;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnMessage;
	}

	@Override
	public String handleNotify(AsynchronousNotify asynchronousNotify, String contextUrl, Integer storeId) {
		String signOrgin = asynchronousNotify.getSignOrgin();
		String returnMessage = "fail";
		try {
			StorePayConfig storePayConfig = storePayConfigMapper.getOneByStoreIdAndCustomerType(storeId, 1);
			System.out.println("signOrgin:" + signOrgin);
			System.out.println("mysign:" + RSAUtils.sign(signOrgin.getBytes(), storePayConfig.getKey1()));
			System.out.println("returnsign:" + asynchronousNotify.getSign().replaceAll(" ", "+"));
			if(RSAUtils.verify(signOrgin.getBytes(), storePayConfig.getKey0(), asynchronousNotify.getSign().replaceAll(" ", "+"))){
				if(Global.ReturnCode.TRADE_SUCCESS0.value.equals(asynchronousNotify.getRetCode())){
					if(Global.TradeStatus.SUCCESS.value.equals(asynchronousNotify.getTradeStatus())){
						// 根据店铺号获得分账账户
						MemberPayLog payLogRecord = this.memberCenterService.getOneMemberPayLog(
								Integer.valueOf(asynchronousNotify.getMerOrderId()));
						Store storeRecord = this.memberCenterService.getOneStore(new Integer(payLogRecord.getStoreId()));
						String account = storeRecord.getReserved7();
						// 比较支付金额是否与订单金额相等,相等调用分账接口
						if(payLogRecord.getMoney().doubleValue() == asynchronousNotify.getTranAmt().doubleValue()){
							// 更改数据库状态
							payLogRecord.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_PROCESSED);
							payLogRecord.setReserved2("PTWeb," + asynchronousNotify.getPayAcctNo() + "," + account);
							payLogRecord.setReserved3(asynchronousNotify.getRetCode() + "," + asynchronousNotify.getRetMsg());
							payLogRecord.setPayId(asynchronousNotify.getTranNo());//讯易订单号
							payLogRecord.setBackTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date().getTime()));
							payLogRecord.setComments("讯易快捷");
							this.memberCenterService.putMoney(
									payLogRecord, 
									contextUrl, 
									"PTWeb", 
									MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.SFT_RECHANGE,
									true);
						}
						returnMessage = "success";
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("返回结果:" + returnMessage);
		return returnMessage;
	}
}
