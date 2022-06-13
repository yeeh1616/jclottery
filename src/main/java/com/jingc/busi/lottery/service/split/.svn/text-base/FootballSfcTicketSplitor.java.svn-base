/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.List;

import com.jingc.afc.util.Constants;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: FootballSfcTicketSplitor.java</p>
 * <p>Desc: 足彩胜负彩拆分器</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-1
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class FootballSfcTicketSplitor extends TicketSplitor {
	
	private FootballService footballService = FootballService.getInstance();
	
	/**
	 * 单式/复式可以一起投注;1-单式，2-复式
	 * 单式5注一票
	 * 格式：3,1,0,31,1,1,0,10,3,1,0,31,1,1;3,1,0,31,1,1,0,10,3,1,0,31,1,1
	 * 胆拖格式：1:3`0,2:10`1,3:#`#,4:#`#,5:30`1,6:310`1...14:1`0 ，符号"`"后面0表示胆，1表示非胆
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		
		List<String> singleList = new ArrayList<String>();//存放单式串
		List<String> complexList = new ArrayList<String>();//存放复式串
		
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( this.footballService.isSingeString(betCode) ) {
				singleList.add(betCode);
			} else {
				complexList.add(betCode);
			}
		}
		
		// 生成复式票
		for ( String complex : complexList ) {
			
			if ( complex.indexOf('`') == -1 ) {
				// 单倍注数小于1万注
				int betNum = this.footballService.getBetNum(complex);
				if ( betNum <= 10000 ) {
					createComplexTicket(order,retList, complex, betNum, "" + GameUtil.SFCFS);
				} else {
					// 拆分子复式
					List<String> codeList = this.footballService.getDivSfcBetString(complex);
					for ( String betCode : codeList ) {
						betCode = betCode.replaceAll("\\|", ",");
						int mBetNum = this.footballService.getBetNum(betCode);
						createComplexTicket(order,retList, betCode, mBetNum, "" + GameUtil.SFCFS);
					}
				}
			} else {
				// 任九胆拖票,1:3`0,2:10`1,3:#`#,4:#`#,5:30`1,6:310`1...14:1`0 
				List<String> codeList = this.footballService.divRxjBetString(complex);
				for ( String betCode : codeList ) {
					int mBetNum = this.footballService.getBetNum(betCode);
					if ( mBetNum == 1 ) {
						singleList.add(betCode);
					} else {
						if ( mBetNum > 10000 ) {
							List<String> subList = this.footballService.getDivSfcBetString(betCode);
							for ( String subCode : subList ) {
								subCode = subCode.replaceAll("\\|", ",");
								int smBetNum = this.footballService.getBetNum(subCode);
								createComplexTicket(order,retList, subCode, smBetNum, "" + GameUtil.SFCFS);
							}
						} else {
							createComplexTicket(order,retList, betCode, mBetNum, "" + GameUtil.SFCFS);
						}
					}
				}
				
			}
			
		}
		
		{
			// 生成单式票
			int singleLen = singleList.size();
			int singleLimit = singleTicketLimit;
			if ( order.getLicenseId() == Constants.LICENSE_6CBQ ) {
				singleLimit = 4;
			}
			int loop = singleLen / singleLimit;
			int mod = singleLen % singleLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, singleList, singleLimit, singleLimit, i, "" + GameUtil.SFCDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, singleList, mod, singleLimit, loop, "" + GameUtil.SFCDS);
			}
		}
		
		// 使用reserved5存放临时投注
		if ( (LotteryOrderState.BET_FROM_WEB+"").equals(order.getBetFrom()) ) {
			if ( null == order.getBetCode() ) {
				order.setBetCode(order.getReserved5());
			}
			order.setReserved5(null);
			//1:3`0,2:10`1,3:#`#,4:#`#,5:30`1,6:310`1...14:1`0
			/*if ( order.getBetCode().indexOf(':') > -1 ) {
				String tmpCode = "";
				String[] _betCodes = order.getBetCode().split(";");
				for ( String bc : _betCodes ) {
					if ( bc.indexOf(':') > -1 ) {
						String[] splitC = bc.split(",");
						for ( String sc : splitC ) {
							if ( "0".equals(sc.split("`")[1]) ) {
								tmpCode += sc.split("`")[0].split(":")[1] + "(胆),";
							} else {
								tmpCode += sc.split("`")[0].split(":")[1] + ",";
							}
						}
						tmpCode = tmpCode.substring(0, tmpCode.length()-1) + ";";
					} else {
						tmpCode += bc + ";";
					}
				}
				
				tmpCode = tmpCode.substring(0, tmpCode.length()-1);
				order.setSchInfo(order.getBetCode());
				order.setBetCode(tmpCode);
			}*/
		}
		
		return retList;
	}
	
	public static void main(String[] args) {
		LotteryServiceImpl.maxMultiple.set(99);
		LotteryOrder o = new LotteryOrder();
		o.setLicenseId(227);
		o.setUserid(123456);
		//o.setBetCode("1,3,1,1,3,1,1,3,1,1,3,1,1,3;1,3,1,1,3,1,1,3,1,1,3,1,1,3;1,3,1,1,3,1,1,3,1,1,3,1,1,3;1,3,1,1,3,1,1,3,1,1,3,1,1,3;1,3,1,1,3,1,1,3,1,1,3,1,1,3;1,3,1,1,3,1,1,3,1,1,3,1,1,3");
		o.setBetCode("1,1,0,3,1,1,0,1,3,#,#,#,#,#;3,0,3,3,3,1,3,3,0,1,1,1,1,1");
		o.setMultiple(100);
		o.setPlayType("1");
		o.setSingleFlag("0");
		o.setBetState("1");
		o.setId(1);
		
		o.setIssue("1");
		o.setUsername("zhangsan");
		o.setStoreid(1);
		
		TicketSplitor t = new FootballSfcTicketSplitor();
		List<LotteryTicket> l = t.split(o);
		System.out.println(l);
		
		String s = "1:3`0,2:10`1,3:#`#,4:#`#,5:30`1,6:310`1,7:1`1,14:1`0";
		String tmpCode = "";
		String[] splitC = s.split(",");
		for ( String sc : splitC ) {
			tmpCode += sc.split("`")[0].split(":")[1] + ",";
		}
		tmpCode = tmpCode.substring(0, tmpCode.length()-1);
		System.out.println(tmpCode);
	}

}
