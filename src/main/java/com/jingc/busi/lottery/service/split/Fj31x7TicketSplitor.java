/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.CombAlgorithm;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;

/**
 * <p>File: Fj31x7TicketSplitor</p>
 * <p>Desc: 福建31选7拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2016-5-30
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class Fj31x7TicketSplitor extends TicketSplitor {

	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 网页类型转换
	 */
	private static final Map<String, Integer> WEB_TYPE = new Hashtable<String, Integer>();
	static {
		WEB_TYPE.put("q1pt", 1);	// 前一
		WEB_TYPE.put("r2pt", 2);	// 任二
		WEB_TYPE.put("r2dt", 9);	// 任二胆拖
		WEB_TYPE.put("r3pt", 3);	// 任三
		WEB_TYPE.put("r3dt", 10);	// 任三胆拖
		WEB_TYPE.put("r4pt", 4);	// 任四
		WEB_TYPE.put("r4dt", 11);	// 任四胆拖
		WEB_TYPE.put("r5pt", 5);	// 任五
		WEB_TYPE.put("r6pt", 6);	// 任六
		WEB_TYPE.put("r6dt", 13);	// 任六胆拖
		WEB_TYPE.put("r7pt", 7);	// 任七
		WEB_TYPE.put("r7dt", 14);	// 任七胆拖
		WEB_TYPE.put("ds", 15);	// 单双
	}
	
	/**
	 * 单式/复式可以一起投注;1-单式，2-复式,3-胆拖
	 * 胆拖格式：(03,09)10,13,20,30,01,10;(03,09)10,13,20,30,31,02,10;01,02,03,04,05,06,07
	 * 页面不允许投注超过10000注
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		if ( playType.indexOf("pt") > -1 ) {
			if ( playType.indexOf("q1pt") > -1 ) {
				retList = this.splitQ1(order, 1);
			} else {
				int len = Integer.valueOf(playType.substring(1,2));
				retList = this.splitR5(order, len, len);
			}
		} else if ( playType.indexOf("dt") > -1 ) {
			int len = Integer.valueOf(playType.substring(1,2));
			retList = this.splitR5Dt(order, len, len);
		} else if ( playType.indexOf("ds") > -1 ) {
			retList = this.splitQ1(order, 8);
		}
		
		return retList;
	}
	
	/**
	 * 前一玩法拆分
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitQ1(LotteryOrder order, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> dsList = new ArrayList<String>();
		for ( String complex : betCodes ) {
			int betNum = complex.split(",").length;
			if ( betNum == 1 ) {
				dsList.add(complex);
			} else {
				createComplexTicket(order, retList, complex, betNum, "" + type);
			}
		}
		{
			// 生成直选单式票
			int singleLen = dsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, dsList, singleTicketLimit, singleTicketLimit, i, "" + type);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, dsList, mod, singleTicketLimit, loop, "" + type);
			}
		}
		return retList;
	}
	
	/**
	 * 任选五票拆分(任选玩法皆调用此方法)，复式不大于10000注
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitR5(LotteryOrder order, int len, int fsType) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> dsList = new ArrayList<String>();	// 直选普通单式
		List<String> fsList = new ArrayList<String>();	// 直选普通复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( betCode.split(",").length == len ) {
				dsList.add(betCode);
			} else {
				fsList.add(betCode);
			}
		}
		{
			// 生成直选单式票
			int singleLen = dsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, dsList, singleTicketLimit, singleTicketLimit, i, "" + fsType);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, dsList, mod, singleTicketLimit, loop, "" + fsType);
			}
		}
		// 直选复式票
		for ( String complex : fsList ) {
			String[] codes = complex.split(",");
			int betNum = this.combAlg.findCombNum(codes.length, len);
			createComplexTicket(order,retList, complex, betNum, "" +fsType);
		}
		
		return retList;
	}
	
	/**
	 * 任选五胆拖票拆分（所有胆拖格式皆可调用此方法拆分）
	 * @param order
	 * @param len
	 * @param type
	 * @return
	 */
	private List<LotteryTicket> splitR5Dt(LotteryOrder order, int len, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		for ( String complex : betCodes ) {
			String[] dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			String[] tuos = complex.substring(complex.indexOf(')')+1).split(",");
			int betNum = this.combAlg.findCombNum(tuos.length, len - dans.length);
			createComplexTicket(order,retList, complex, betNum, "" + type);
		}
		return retList;
	}
	
	public static void main(String[] args) {
		LotteryServiceImpl.maxMultiple.set(99);
		LotteryOrder o = new LotteryOrder();
		o.setLicenseId(227);
		o.setUserid(123456);
		o.setBetCode("(01,02)03,04,05,06,07,11,12");
		o.setMultiple(1);
		o.setPlayType("1");
		o.setSingleFlag("0");
		o.setBetState("1");
		o.setId(1);
		o.setIssue("1");
		o.setUsername("zhangsan");
		o.setStoreid(1);
		
		TicketSplitor t = new Fj31x7TicketSplitor();
		List<LotteryTicket> l = t.split(o);
		System.out.println(l);
	}

}
