/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.jingc.afc.util.CombAlgorithm;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: Pl3TicketSplitor.java</p>
 * <p>Desc: 排列3拆分实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-3
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class Pl3TicketSplitor extends TicketSplitor {
	
	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 直选和值注数，0-27
	 */
	private final int[] ZXHZ = {1,3,6,10,15,21,28,36,45,55,63,69,73,75,75,73,69,63,55,45,36,28,21,15,10,6,3,1};
	
	/**
	 * 组3和值注数，1-26
	 */
	private final int[] Z3HZ = {1,2,1,3,3,3,4,5,4,5,5,4,5,5,4,5,5,4,5,4,3,3,3,1,2,1};
	
	/**
	 * 组6和值注数，3-24
	 */
	private final int[] Z6HZ = {1,1,2,3,4,5,7,8,9,10,10,10,10,9,8,7,5,4,3,2,1,1};
	
	/**
	 * 组选可选号码
	 */
	private final String[] S0_9 = {"0","1","2","3","4","5","6","7","8","9"};

	/**
	 * 多种玩法同时存在‘;’隔开
	 * 1-直选单式，2-直选复式，3-直选组合复式，4-直选和值，5-直选胆拖，6-组3单式，7-组3复式，8-组3和值，9-组3胆拖
	 * 10-组6单式，11-组6复式，12-组6和值，13-组6胆拖
	 * 
	 * 使用play_type来区分玩法，直选普通：zxpt，直选组合复式：zxzh，直选和值：zxhz，直选胆拖：zxdt
	 * 组3单式：z3ds，组3复式：z3fs，组3和值：z3hz，组3胆拖：z3dt，组6普通：z6pt，组6和值：z6hz，组6胆拖：z6dt
	 * 格式：
	 * 直选普通：11,3,34;11,3,34;
	 * 直选组合复式：1,2,4,5
	 * 直选和值：20,24
	 * 直选胆拖：(0,2)3,4
	 * 组3单式：1,1,2
	 * 组3复式：3,4,5
	 * 组3和值：10,20
	 * 组3胆拖：(0,1)2,3,4
	 * 组6普通：1,2,3,4
	 * 组6和值：10,20
	 * 组6胆拖：(0,1)2,3,4,5
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		if ( "zxpt".equals(playType) ) {
			retList = splitZxpt(order);
		} else if ( "zxzh".equals(playType) ) {
			retList = splitZxzh(order);
		} else if ( "zxhz".equals(playType) ) {
			retList = splitZxhz(order);
		} else if ( "zxdt".equals(playType) ) {
			retList = splitZxdt(order);
		} else if ( "z3ds".equals(playType) ) {
			retList = splitZ3ds(order);
		} else if ( "z3fs".equals(playType) ) {
			retList = splitZ3fs(order);
		} else if ( "z3hz".equals(playType) ) {
			retList = splitZ3hz(order);
		} else if ( "z3dt".equals(playType) ) {
			retList = splitZ3dt(order);
		} else if ( "z6pt".equals(playType) ) {
			retList = splitZ6pt(order);
		} else if ( "z6hz".equals(playType) ) {
			retList = splitZ6hz(order);
		} else if ( "z6dt".equals(playType) ) {
			retList = splitZ6dt(order);
		}
		
		return retList;
	}
	
	/**
	 * 直选普通投注拆票
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitZxpt(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> zxPtDsList = new ArrayList<String>();	// 直选普通单式
		List<String> zxPtFsList = new ArrayList<String>();	// 直选普通复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( isNumberArrangleDsString(betCode) ) {
				zxPtDsList.add(betCode);
			} else {
				zxPtFsList.add(betCode);
			}
		}
		{
			// 生成直选单式票
			int singleLen = zxPtDsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, zxPtDsList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.PLSZHXDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, zxPtDsList, mod, singleTicketLimit, loop, "" + GameUtil.PLSZHXDS);
			}
		}
		// 直选复式票
		for ( String complex : zxPtFsList ) {
			int betNum = 1;
			String[] codes = complex.split(",");
			for ( String code : codes ) {
				betNum *= code.length();
			}
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZHXFS);
		}
		
		return retList;
	}
	
	private List<LotteryTicket> splitZxzh(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> zxZhFsList = new ArrayList<String>();	// 直选组合复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			zxZhFsList.add(betCode);
		}
		// 直选组合复式票
		for ( String complex : zxZhFsList ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 3)*6;
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZHXZHFS);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZxhz(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> zxHzList = new ArrayList<String>();	// 直选和值
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			zxHzList.add(betCode);
		}
		// 直选和值票
		for ( String complex : zxHzList ) {
			int betNum = 0;
			String[] hzCodes = complex.split(",");
			for ( String code : hzCodes ) {
				betNum += ZXHZ[Integer.valueOf(code)];
			}
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZHXHZ);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZxdt(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> zxDtList = new ArrayList<String>();	// 直选胆拖
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			zxDtList.add(betCode);
		}
		// 直选胆拖票
		for ( String complex : zxDtList ) {
			String[] dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			String[] tuos = complex.substring(complex.indexOf(')')+1).split(",");
			int betNum = this.combAlg.findCombNum(tuos.length, 3-dans.length)*6;
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZHXZHDT);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ3ds(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z3DsList = new ArrayList<String>();	// 组3单式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z3DsList.add(sortBetCode(betCode));
		}
		{
			// 组3单式票
			int singleLen = z3DsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, z3DsList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.PLSZXDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, z3DsList, mod, singleTicketLimit, loop, "" + GameUtil.PLSZXDS);
			}
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ3fs(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z3FsList = new ArrayList<String>();	// 组3复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z3FsList.add(betCode);
		}
		// 组3复式票
		for ( String complex : z3FsList ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 2)*2;
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZSFS);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ3hz(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z3HzList = new ArrayList<String>();	// 组3和值
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z3HzList.add(betCode);
		}
		// 组3和值票
		/*for ( String complex : z3HzList ) {
			int betNum = 0;
			String[] hzCodes = complex.split(",");
			for ( String code : hzCodes ) {
				betNum += Z3HZ[Integer.valueOf(code)-1];
			}
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZSHZ);
		}*/
		List<String> z3DsList = new ArrayList<String>();	// 组3单式
		/* 拆分成组3单式 modified at 2014/08/20 */
		for ( String complex : z3HzList ) {
			String[] hzCodes = complex.split(",");
			List<List<String>> retArray = this.combAlg.findP3C3Comb(S0_9);
			int len = retArray.size();
			for ( String codes : hzCodes ) {
				//String[] oneCodes = codes.split(",");
				//for ( String oneCode : oneCodes ) {
					for ( int j = 0; j < len; j++ ) {
						if ( Integer.parseInt(retArray.get(j).get(0)) + Integer.parseInt(retArray.get(j).get(1)) + Integer.parseInt(retArray.get(j).get(2)) == Integer.parseInt(codes) ) {
							String oneBetCode = sortBetCode(retArray.get(j).get(0) + "," + retArray.get(j).get(1) + "," + retArray.get(j).get(2));	// 转成单式后需要排序
							z3DsList.add( oneBetCode );
						}
					}
				//}
				/** Modified by Luochang for 组选和值需要转成单式票 at 2013/04/19 begin*/
				/*if ( lt.getLicenseId() == 163 ) {
					complexHandFs( conn, lt, hoList, codes, betNum, betMult, theMaxMult, Constants.SYSTEMID_163_ZXHZ3 );
				}*/
			}
			
		}
		{
			// 组3单式票
			int singleLen = z3DsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, z3DsList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.PLSZXDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, z3DsList, mod, singleTicketLimit, loop, "" + GameUtil.PLSZXDS);
			}
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ3dt(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z3DtList = new ArrayList<String>();	// 组3胆拖
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z3DtList.add(betCode);
		}
		// 组3胆拖票
		for ( String complex : z3DtList ) {
			String[] dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			String[] tuos = complex.substring(complex.indexOf(')')+1).split(",");
			int betNum = this.combAlg.findCombNum(tuos.length, 2-dans.length)*2;
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZSDT);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ6pt(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z6PtList = new ArrayList<String>();	// 组6普通
		List<String> z6PtDsList = new ArrayList<String>();	// 组6普通单式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( betCode.split(",").length > 3 ) {
				z6PtList.add(betCode);
			} else {
				z6PtDsList.add(betCode);
			}
		}
		{
			// 生成直选单式票
			int singleLen = z6PtDsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, z6PtDsList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.PLSZLDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, z6PtDsList, mod, singleTicketLimit, loop, "" + GameUtil.PLSZLDS);
			}
		}
		// 组6复式票
		for ( String complex : z6PtList ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 3);
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZLFS);
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ6hz(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z6HzList = new ArrayList<String>();	// 组6和值
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z6HzList.add(betCode);
		}
		// 组6和值票
		/*for ( String complex : z6HzList ) {
			int betNum = 0;
			String[] hzCodes = complex.split(",");
			for ( String code : hzCodes ) {
				betNum += Z6HZ[Integer.valueOf(code)-3];
			}
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZLHZ);
		}*/
		/* Modified for 转换成组选单式票 at 2014/08/20*/
		List<String> z3DsList = new ArrayList<String>();	// 组3单式
		List<List<String>> retArray = combAlg.findJcComb(S0_9, 3);
		int len = retArray.size();
		for ( String codes : z6HzList ) {
			String[] oneCodes = codes.split(",");
			for ( String oneCode : oneCodes ) {
				for ( int j = 0; j < len; j++ ) {
					if ( Integer.parseInt(retArray.get(j).get(0)) + Integer.parseInt(retArray.get(j).get(1)) + Integer.parseInt(retArray.get(j).get(2)) == Integer.parseInt(oneCode) ) {
						String oneBetCode = sortBetCode(retArray.get(j).get(0) + "," + retArray.get(j).get(1) + "," + retArray.get(j).get(2));	// 转成单式后需要排序
						z3DsList.add(oneBetCode);
					}
				}
			}
		}
		{
			// 组3单式票
			int singleLen = z3DsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, z3DsList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.PLSZXDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, z3DsList, mod, singleTicketLimit, loop, "" + GameUtil.PLSZXDS);
			}
		}
		return retList;
	}
	
	private List<LotteryTicket> splitZ6dt(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> z6DtList = new ArrayList<String>();	// 组6胆拖
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			z6DtList.add(betCode);
		}
		// 组6胆拖票
		for ( String complex : z6DtList ) {
			String[] dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			String[] tuos = complex.substring(complex.indexOf(')')+1).split(",");
			int betNum = this.combAlg.findCombNum(tuos.length, 3-dans.length);
			createComplexTicket(order,retList, complex, betNum, "" + GameUtil.PLSZLDT);
		}
		return retList;
	}
	
	private String sortBetCode(String betCode) {
		String[] splitCode = betCode.split(",");
		Arrays.sort(splitCode);
		String retObj = "";
		for ( String s : splitCode) {
			retObj += s + ",";
		}
		retObj = retObj.substring(0, retObj.length() - 1);
		return retObj;
	}
	
	public static void main(String[] args) {
		LotteryOrder o = new LotteryOrder();
		o.setLicenseId(1);
		o.setPlayType("zxpt");
		o.setBetCode("<a");
		o.setMultiple(1);
		o.setBetState("1");
		o.setBetType("1");
		o.setReserved8("2015-08-20 20:00:00");
		LotteryServiceImpl.maxMultiple.set(99);
		List<LotteryTicket> list = new Pl3TicketSplitor().split(o);
		System.out.println(list);
	}
}
