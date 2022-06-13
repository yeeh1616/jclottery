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
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.busi.util.member.PlayerTypes;

/**
 * <p>File: SscTicketSplitor.java</p>
 * <p>Desc: 时时彩拆单实现</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-21
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class SscTicketSplitor extends TicketSplitor {
	
	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 网页类型转换
	 */
	private static final Map<String, Integer> WEB_TYPE = new Hashtable<String, Integer>();
	static {
		WEB_TYPE.put("5xzhx", 1);
		WEB_TYPE.put("5xtx", 2);
		WEB_TYPE.put("4xzhx", 3);
		WEB_TYPE.put("3xzhx", 4);
		WEB_TYPE.put("3xhz", 5);
		WEB_TYPE.put("3xz3bh", 6);
		WEB_TYPE.put("3xz3zhx", 7);
		WEB_TYPE.put("3xz6bh", 8);
		WEB_TYPE.put("2xzhx", 9);
		WEB_TYPE.put("2xhz", 10);
		WEB_TYPE.put("2xzx", 11);
		WEB_TYPE.put("1xzhx", 12);
		WEB_TYPE.put("dxds", 13);
		WEB_TYPE.put("r1x", 14);
		WEB_TYPE.put("r2x", 15);
	}
	
	public static int[] SX_ZXHZ = {1,3,6,10,15,21,28,36,45,55,63,69,73,75,75,73,69,63,55,45,36,28,21,15,10,6,3,1};//三星直选和值
	
	public static int[] EXZX_HZ_NUM = {1,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1};	// 二星直选和值,0-18

	/**
	 *  SS_B2_2	时时彩	二星包点
		SS_D1_1	时时彩	单式一星
		SS_D2_1	时时彩	单式二星
		SS_D2_2	时时彩	单式二星组选
		SS_D3_1	时时彩	单式三星
		SS_D3_2	时时彩	单式三星组选
		SS_D4_1	时时彩	单式四星
		SS_D5_1	时时彩	单式五星
		SS_T5_1	时时彩	五星通选
		SS_W2_2	时时彩	二星位选
		SS_W3_2	时时彩	三星位选
		SS_W4_2	时时彩	四星位选
		SS_W5_2	时时彩	五星位选
		SS_Z2_2	时时彩	二星组选复式
		SS_Z3_2	时时彩	三星组三复式
		SS_Z6_2	时时彩	三星组六复式
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		int type = WEB_TYPE.get(playType).intValue();
		switch ( type ) {
		case 1:
			retList = this.splitWxZhx(order);
			break;
		case 2:
			retList = this.splitWxZhx(order);
			break;
		case 3:
			retList = this.splitSxZhx(order, PlayerTypes.Ssc.S4XZHXDS, PlayerTypes.Ssc.S4XZHXFS);
			break;
		case 4:
			retList = this.splitSxZhx(order, PlayerTypes.Ssc.SXZHXDS, PlayerTypes.Ssc.SXZHXFS);
			break;
		case 5:
			retList = this.splitSxHz(order);
			break;
		case 6:
			retList = this.splitSxZ3Bh(order);
			break;
		case 7:
			retList = this.splitSxZ3Zhx(order);
			break;
		case 8:
			retList = this.splitSxZ6Bh(order);
			break;
		case 9:
			retList = this.splitSxZhx(order, PlayerTypes.Ssc.EXZHXDS, PlayerTypes.Ssc.EXZHXFS);
			break;
		case 10:
			retList = this.splitExHz(order);
			break;
		case 11:
			retList = this.splitExZx(order);
			break;
		case 12:
			retList = this.splitSxZhx(order, PlayerTypes.Ssc.YXZHXDS, PlayerTypes.Ssc.YXZHXFS);
			break;
		case 13:
			retList = this.splitSxZhx(order, PlayerTypes.Ssc.DXDSDS, PlayerTypes.Ssc.DXDSFS);
			break;
		case 14:
			retList = this.splitRx(order, 1, PlayerTypes.Ssc.RX1);
			break;
		case 15:
			retList = this.splitRx(order, 2, PlayerTypes.Ssc.RX2);
			break;
		}
		return retList;
	}
	
	private void addSingTicket(LotteryOrder order, List<LotteryTicket> retList, List<String> singleList, int type) {
		// 生成单式票
		int singleLen = singleList.size();
		int loop = singleLen / singleTicketLimit;
		int mod = singleLen % singleTicketLimit;
		for ( int i = 0; i < loop; i++ ) {
			super.createSingleTicket(order, retList, singleList, singleTicketLimit, singleTicketLimit, i, "" + type);
		}
		if ( mod != 0 ) {
			super.createSingleTicket(order, retList, singleList, mod, singleTicketLimit, loop, "" + type);
		}
	}

	private List<LotteryTicket> splitWxZhx(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		
		List<String> singleList = new ArrayList<String>();//存放单式串
		List<String> complexList = new ArrayList<String>();//存放复式串
		
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( isNumberArrangleDsString2(betCode) ) {
				singleList.add(betCode);
			} else {
				complexList.add(betCode);
			}
		}
		
		addSingTicket(order, retList, singleList, PlayerTypes.Ssc.WXZHXDS);
		
		for ( String complex : complexList ) {
			int betNum = calcNumberArrangleDsString2(complex);
			if ( betNum > 10000 ) {
				// 拆分号码,只有把最后一行拆分成单式，单倍不会超过2万
				String[] splitCode = complex.split(",");
				char[] lastCodes = splitCode[4].toCharArray();
				for ( char lastCode : lastCodes ) {
					String subComplexCode = splitCode[0] + "," + splitCode[1] + "," + splitCode[2] + "," + splitCode[3] + "," + lastCode;
					int subBetNum = calcNumberArrangleDsString2(subComplexCode);
					createComplexTicket(order,retList, subComplexCode, subBetNum, "" + PlayerTypes.Ssc.WXZHXFS);
				}
			} else {
				createComplexTicket(order,retList, complex, betNum, "" + PlayerTypes.Ssc.WXZHXFS);
			}
		}
		
		return retList;
	}
	
	/**
	 * 四星、三星、二星、一星直选
	 * @param order
	 * @param singTyle
	 * @param complexType
	 * @return
	 */
	private List<LotteryTicket> splitSxZhx(LotteryOrder order, int singTyle, int complexType) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		
		List<String> singleList = new ArrayList<String>();//存放单式串
		List<String> complexList = new ArrayList<String>();//存放复式串
		
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( isNumberArrangleDsString2(betCode) ) {
				singleList.add(betCode);
			} else {
				complexList.add(betCode);
			}
		}
		
		addSingTicket(order, retList, singleList, singTyle);
		
		for ( String complex : complexList ) {
			int betNum = calcNumberArrangleDsString2(complex);
			createComplexTicket(order,retList, complex, betNum, "" + complexType);
		}
		
		return retList;
	}
	
	// 三星和值拆分
	private List<LotteryTicket> splitSxHz(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(",");
		int betNum = 0;
		for ( String complex : betCodes ) {
			betNum += SX_ZXHZ[Integer.parseInt(complex)];
		}
		createComplexTicket(order,retList, order.getBetCode(), betNum, "" + PlayerTypes.Ssc.SXHZ);
		return retList;
	}
	
	// 三星组三包号拆分
	private List<LotteryTicket> splitSxZ3Bh(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		for ( String complex : betCodes ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 2) * 2;
			createComplexTicket(order,retList, complex, betNum, "" + PlayerTypes.Ssc.Z3BH);
		}
		return retList;
	}
	
	// 三星组三直选拆分
	private List<LotteryTicket> splitSxZ3Zhx(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		for ( String complex : betCodes ) {
			int betNum = super.calcNumberArrangleDsString2(complex);
			createComplexTicket(order,retList, complex, betNum, "" + PlayerTypes.Ssc.Z3ZHX);
		}
		return retList;
	}
	
	// 三星组六包号拆分
	private List<LotteryTicket> splitSxZ6Bh(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> singleList = new ArrayList<String>();//存放单式串
		for ( String complex : betCodes ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 3);
			if ( betNum == 1 ) {
				singleList.add(complex);
			} else {
				createComplexTicket(order,retList, complex, betNum, "" + PlayerTypes.Ssc.Z6BHFS);
			}
		}
		addSingTicket(order, retList, singleList, PlayerTypes.Ssc.Z6BHDS);
		return retList;
	}
	
	// 二星和值拆分
	private List<LotteryTicket> splitExHz(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(",");
		int betNum = 0;
		for ( String complex : betCodes ) {
			betNum += EXZX_HZ_NUM[Integer.parseInt(complex)];
		}
		createComplexTicket(order,retList, order.getBetCode(), betNum, "" + PlayerTypes.Ssc.EXHZ);
		return retList;
	}
	
	// 二星组选拆分
	private List<LotteryTicket> splitExZx(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> singleList = new ArrayList<String>();//存放单式串
		for ( String complex : betCodes ) {
			int betNum = this.combAlg.findCombNum(complex.split(",").length, 2);
			if ( betNum == 1 ) {
				singleList.add(complex);
			} else {
				createComplexTicket(order,retList, complex, betNum, "" + PlayerTypes.Ssc.EXZXFS);
			}
		}
		addSingTicket(order, retList, singleList, PlayerTypes.Ssc.EXZXDS);
		return retList;
	}
	
	// 任选拆分
	private List<LotteryTicket> splitRx(LotteryOrder order, int len, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		for ( String complex : betCodes ) {
			List<String> calc = new ArrayList<String>();
			String[] codes = complex.split("\\|");
			for ( String code : codes ) {
				if ( !"-".equals(code) ) {
					calc.add(code.split(",").length+"");
				}
			}
			int betNum = 0;
			List<List<String>> lists = this.combAlg.findJcComb(calc.toArray(new String[0]), calc.size(), len);
			for ( List<String> lst : lists ) {
				int subNum = 1;
				for ( String b : lst ) {
					subNum *= Integer.parseInt(b);
				}
				betNum += subNum;
			}
			
			createComplexTicket(order,retList, complex, betNum, "" + type);
		}
		return retList;
	}
}
