package com.jingc.busi.lottery.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.LotteryOrder;

public class LotteryServiceTest {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		LotteryService s = (LotteryService)context.getBean("lotteryService");
		LotteryOrder o = new LotteryOrder();
		o.setLicenseId(4);
		o.setUserid(123456);
		o.setBetCode("01,02,03,04,05,06+01,02,03");
		o.setMultiple(1);
		o.setPlayType("1");
		o.setSingleFlag("0");
		o.setBetState("1");
		o.setId(1);
		o.setIssue("1");
		o.setUsername("zhangsan");
		o.setStoreid(1);
		o.setOrderDate(DateUtil.getDateFormat2());
		o.setUserid(1);
		o.setReserved8("2014-07-12 12:00:00");
		
		long c = System.currentTimeMillis();
		s.bet(o);
		System.out.println((System.currentTimeMillis()-c)+"ms");
		
		/*CollectionManagerService s = (CollectionManagerService)context.getBean("collectionManagerService");
		s.handleResult(Constants.LICENSE_JCLQ, Constants.LICENSE_TYPE_GUESS);*/
	}

}
