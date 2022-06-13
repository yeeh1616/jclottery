/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.List;

import com.jingc.afc.util.CombAlgorithm;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.busi.util.member.PlayerTypes;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: DltTicketSplitor.java</p>
 * <p>Desc: 大乐透拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-3
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class DltTicketSplitor extends TicketSplitor {

	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 单式/复式可以一起投注;1-单式，2-复式,3-胆拖
	 * 胆拖格式：(03,09)10,13,20,30+01,10;(03,09)10,13,20,30+(01)02,10
	 * 页面不允许投注超过10000注
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		
		List<String> singleList = new ArrayList<String>();   // 存放单式串
        List<String> complexList = new ArrayList<String>();     // 存放复式串
        List<String> danTuoList = new ArrayList<String>();     // 存放胆拖串
        
        String[] betCodes = order.getBetCode().split(";");
        for ( String betCode : betCodes ) {
        	if ( betCode.indexOf('(') > -1 ) {
        		danTuoList.add(betCode);
        	}
        	else if ( betCode.replace("+", ",").split(",").length == 7 ) {
        		singleList.add(betCode);
        	} else {
        		complexList.add(betCode);
        	}
        }
        {
			// 生成单式票
			int singleLen = singleList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, singleList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.DLTDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, singleList, mod, singleTicketLimit, loop, "" + GameUtil.DLTDS);
			}
		}
        // 复式票
        for ( String complexCode : complexList ) {
        	String[] areaCodes = complexCode.split("\\+");
            String[] beforeArea = areaCodes[0].split(",");
            String[] afterArea = areaCodes[1].split(",");
            
            int beforeBetNum = combAlg.findCombNum(beforeArea.length, 5);  // 前区注数
            int afterBetNum = combAlg.findCombNum(afterArea.length, 2); // 后区注数
            int betNum = beforeBetNum * afterBetNum;
            // 注数超过1万注拆分
            if ( betNum > 10000 ) {
            	// 暂不做处理
            } else {
            	createComplexTicket(order,retList, complexCode, betNum, "" + GameUtil.DLTFS);
            }
        }
        // 胆拖票
        for ( String complexCode : danTuoList ) {
        	String[] areaCodes = complexCode.split("\\+");
            
        	int beforeBetNum = 0;
        	int afterBetNum = 0;
            if ( areaCodes[0].indexOf('(') > -1 ) {
            	String[] beforeAreaDan = areaCodes[0].substring(areaCodes[0].indexOf('(')+1, areaCodes[0].indexOf(')')).split(",");
            	String[] beforeAreaTuo = areaCodes[0].substring(areaCodes[0].indexOf(')')+1).split(",");
            	beforeBetNum = combAlg.findCombNum(beforeAreaTuo.length, 5-beforeAreaDan.length);  // 前区注数
            } else {
            	String[] beforeArea = areaCodes[0].split(",");
            	beforeBetNum = combAlg.findCombNum(beforeArea.length, 5);  // 前区注数
            }
            if ( areaCodes[1].indexOf('(') > -1 ) {
            	String[] afterAreaDan = areaCodes[1].substring(areaCodes[1].indexOf('(')+1, areaCodes[1].indexOf(')')).split(",");
            	String[] aftereAreaTuo = areaCodes[1].substring(areaCodes[1].indexOf(')')+1).split(",");
            	afterBetNum = combAlg.findCombNum(aftereAreaTuo.length, 2-afterAreaDan.length); // 后区注数
            } else {
            	String[] aftereArea = areaCodes[1].split(",");
            	afterBetNum = combAlg.findCombNum(aftereArea.length, 2); // 后区注数
            }
            int betNum = beforeBetNum * afterBetNum;
            
            // 注数超过1万注拆分
            if ( betNum > 10000 ) {
            	// 暂不做处理
            } else {
            	createComplexTicket(order,retList, complexCode, betNum, "" + GameUtil.DLTDT);
            }
        }
		return retList;
	}
	
	public static void main(String[] args) {
		LotteryServiceImpl.maxMultiple.set(99);
		LotteryOrder o = new LotteryOrder();
		o.setLicenseId(227);
		o.setUserid(123456);
		o.setBetCode("12,23,24,28,35+03,07;08,10,11,14,31+07,10;04,07,11,17,33+03,10;02,15,16,25,29+01,04;19,25,31,34,35+04,07;07,21,29,31,35+01,08;07,21,29,31,35+01,09;07,21,29,31,35+01,10;07,21,29,31,35+01,11;07,21,29,31,35+01,12;07,21,29,31,35+01,13;07,21,29,31,35+01,14;07,21,29,31,35+01,15");
		o.setMultiple(1);
		o.setPlayType("dlt");
		o.setSingleFlag("0");
		o.setBetState("1");
		o.setZjFlag("1");
		o.setId(1);
		o.setIssue("1");
		o.setUsername("zhangsan");
		o.setStoreid(1);
		
		TicketSplitor t = new DltTicketSplitor();
		List<LotteryTicket> l = t.split(o);
		System.out.println(o.getBetCode());
		for ( LotteryTicket tt : l ) {
			System.out.println(tt.getBetCode());
		}
	}

}
