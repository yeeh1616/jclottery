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

/**
 * <p>File: QlcTicketSplitor.java</p>
 * <p>Desc: 七乐彩拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-3
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class QlcTicketSplitor extends TicketSplitor {

	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 单式/复式可以一起投注;1-单式，2-复式,3-胆拖
	 * 胆拖格式：(03,09)10,13,20,30,01,10;(03,09)10,13,20,30,31,02,10;01,02,03,04,05,06,07
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
        	else if ( betCode.split(",").length == 7 ) {
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
				super.createSingleTicket(order, retList, singleList, singleTicketLimit, singleTicketLimit, i, "1");
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, singleList, mod, singleTicketLimit, loop, "1");
			}
		}
        // 复式票
        for ( String complexCode : complexList ) {
        	String[] codes = complexCode.split(",");
            
            int betNum = combAlg.findCombNum(codes.length, 7);  
            // 注数超过1万注拆分
            if ( betNum > 10000 ) {
            	// 暂不做处理
            } else {
            	createComplexTicket(order,retList, complexCode, betNum, "2");
            }
        }
        // 胆拖票
        for ( String complexCode : danTuoList ) {
            
        	String[] beforeAreaDan = complexCode.substring(complexCode.indexOf('(')+1, complexCode.indexOf(')')).split(",");
        	String[] beforeAreaTuo = complexCode.substring(complexCode.indexOf(')')+1).split(",");
        	int betNum = combAlg.findCombNum(beforeAreaTuo.length, 7-beforeAreaDan.length);  // 前区注数
            
            // 注数超过1万注拆分
            if ( betNum > 10000 ) {
            	// 暂不做处理
            } else {
            	createComplexTicket(order,retList, complexCode, betNum, "3");
            }
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
		
		TicketSplitor t = new QlcTicketSplitor();
		List<LotteryTicket> l = t.split(o);
		System.out.println(l);
	}

}
