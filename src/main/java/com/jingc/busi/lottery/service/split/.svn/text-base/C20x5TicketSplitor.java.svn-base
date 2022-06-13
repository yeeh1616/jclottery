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
 * <p>File: C20x5TicketSplitor.java</p>
 * <p>Desc: 20选5拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2015-8-26
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class C20x5TicketSplitor extends TicketSplitor {

	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 *  “20选5”是从01－20共20个自然数中选取5个自然数组成一注彩票的乐透型玩法。
	    “20选5”设多倍投注和复式投注。复式投注可一次选择6－18个号码组成复式票进行投注，多倍投注倍数范围为2－99倍，同时还提供胆拖投注，单票投注上限10000注。
	    “20选5”周一至周日每天19：00开始开奖，摇奖过程在公证人员监督下进行。
	中奖办法与奖金设置 
	    “20选5”共设3个奖级，现金兑奖，其中一等奖为浮动奖，二、三等奖为固定奖。奖金返还率为销售总额的50％（其中1％为调节基金）。所购彩票与开奖结果对照，符合以下情况即为中奖。
	单注彩票中奖奖金封顶金额为500万元。当期未中出的一等奖奖金全部转入下期一等奖基金。
		奖级 中奖条件（●代表开奖号码） 奖金分配 
		一等奖 ●●●●● 当期总奖金减去固定奖总额后的100％，及前期未中出的一等奖奖金总 
		二等奖 ●●●● 50元 
		三等奖 ●●● 5元
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
        	else if ( betCode.split(",").length == 5 ) {
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
            
            int betNum = combAlg.findCombNum(codes.length, 5);  
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
        	int betNum = combAlg.findCombNum(beforeAreaTuo.length, 5-beforeAreaDan.length);  // 前区注数
            
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
		o.setBetCode("05,06,07,11,12,16");
		o.setMultiple(1);
		o.setPlayType("1");
		o.setSingleFlag("0");
		o.setBetState("1");
		o.setId(1);
		o.setIssue("1");
		o.setUsername("zhangsan");
		o.setStoreid(1);
		
		TicketSplitor t = new C20x5TicketSplitor();
		List<LotteryTicket> l = t.split(o);
		System.out.println(l.get(0).getBetNum());
	}

}
