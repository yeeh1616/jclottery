/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.CombAlgorithm;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.busi.util.member.PlayerTypes;

/**
 * <p>File: C11x5TicketSplitor.java</p>
 * <p>Desc: 11选5拆单实现</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-21
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class C11x5TicketSplitor extends TicketSplitor {
	
	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 网页类型转换
	 */
	private static final Map<String, Integer> WEB_TYPE = new Hashtable<String, Integer>();
	static {
		WEB_TYPE.put("q1pt", 1);	// 前一
		WEB_TYPE.put("x2r2pt", 2);	// 任二
		WEB_TYPE.put("x3r3pt", 3);	// 任三
		WEB_TYPE.put("r4pt", 4);	// 任四
		WEB_TYPE.put("r5pt", 5);	// 任五
		WEB_TYPE.put("r6pt", 6);	// 任六
		WEB_TYPE.put("r7pt", 7);	// 任七
		WEB_TYPE.put("r8pt", 8);	// 任八
		WEB_TYPE.put("x2r2dt", 9);	// 任二胆拖
		WEB_TYPE.put("x3r3dt", 10);	// 任三胆拖
		WEB_TYPE.put("r4dt", 11);	// 任四胆拖
		WEB_TYPE.put("r5dt", 12);	// 任五胆拖
		WEB_TYPE.put("r6dt", 13);	// 任六胆拖
		WEB_TYPE.put("r7dt", 14);	// 任七胆拖
		WEB_TYPE.put("r8dt", 15);	// 任八胆拖
		WEB_TYPE.put("x2q2zxdt", 16);	// 前二组选胆拖
		WEB_TYPE.put("x3q3zxdt", 17);	// 前三组选胆拖
		WEB_TYPE.put("x2q2zxpt", 18);	// 前二组选
		WEB_TYPE.put("x3q3zxpt", 19);	// 前三组选
		WEB_TYPE.put("x2q2zhx", 20);	// 前二直选
		WEB_TYPE.put("x3q3zhx", 21);	// 前三直选
	}

	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		int type = WEB_TYPE.get(playType).intValue();
		switch ( type ) {
		case 1:
			retList = this.splitQ1(order);
			break;
		case 2:
			retList =  this.splitR5(order, 2, PlayerTypes.C11x5Player.R2DS, PlayerTypes.C11x5Player.R2FS);
			break;
		case 5:
			// 任选5，单式/复式
			retList =  this.splitR5(order, 5, PlayerTypes.C11x5Player.R5DS, PlayerTypes.C11x5Player.R5FS);
			break;
		case 3:
			retList =  this.splitR5(order, 3, PlayerTypes.C11x5Player.R3DS, PlayerTypes.C11x5Player.R3FS);
			break;
		case 4:
			retList =  this.splitR5(order, 4, PlayerTypes.C11x5Player.R4DS, PlayerTypes.C11x5Player.R4FS);
			break;
		case 6:
			retList =  this.splitR5(order, 6, PlayerTypes.C11x5Player.R6DS, PlayerTypes.C11x5Player.R6FS);
			break;
		case 7:
			retList =  this.splitR5(order, 7, PlayerTypes.C11x5Player.R7DS, PlayerTypes.C11x5Player.R7FS);
			break;
		case 8:
			retList = this.splitR8(order, PlayerTypes.C11x5Player.R8DS);
			//retList =  this.splitR5(order, 8, PlayerTypes.C11x5Player.R8DS, PlayerTypes.C11x5Player.R8FS);
			break;
		case 9:
			retList = this.splitR5Dt(order, 2, PlayerTypes.C11x5Player.R2DT);
			break;
		case 10:
			retList = this.splitR5Dt(order, 3, PlayerTypes.C11x5Player.R3DT);
			break;
		case 11:
			retList = this.splitR5Dt(order, 4, PlayerTypes.C11x5Player.R4DT);
			break;
		case 12:
			retList = this.splitR5Dt(order, 5, PlayerTypes.C11x5Player.R5DT);
			break;
		case 13:
			retList = this.splitR5Dt(order, 6, PlayerTypes.C11x5Player.R6DT);
			break;
		case 14:
			retList = this.splitR5Dt(order, 7, PlayerTypes.C11x5Player.R7DT);
			break;
		case 15:
			// 拆分成单式票
			retList = this.splitR8(order, PlayerTypes.C11x5Player.R8DS);
			break;
		case 16:
			retList = this.splitR5Dt(order, 2, PlayerTypes.C11x5Player.Q2ZX_DT);
			break;
		case 17:
			retList = this.splitR5Dt(order, 3, PlayerTypes.C11x5Player.Q3ZX_DT);
			break;
		case 18:
			retList =  this.splitR5(order, 2, PlayerTypes.C11x5Player.Q2ZX_DS, PlayerTypes.C11x5Player.Q2ZX_FS);
			break;
		case 19:
			retList =  this.splitR5(order, 3, PlayerTypes.C11x5Player.Q3ZX_DS, PlayerTypes.C11x5Player.Q3ZX_FS);
			break;
		case 20:
			retList = this.splitQ2(order, PlayerTypes.C11x5Player.Q2ZX, PlayerTypes.C11x5Player.Q2ZXFS);
			break;
		case 21:
			retList = this.splitQ2(order, PlayerTypes.C11x5Player.Q3ZX, PlayerTypes.C11x5Player.Q3ZXFS);
			break;
		}
		return retList;
	}
	
	/**
	 * 前一玩法拆分
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitQ1(LotteryOrder order) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> dsList = new ArrayList<String>();
		for ( String complex : betCodes ) {
			int betNum = complex.split(",").length;
			if ( betNum == 1 ) {
				dsList.add(complex);
			} else {
				createComplexTicket(order, retList, complex, betNum, "" + PlayerTypes.C11x5Player.Q1FS);
			}
		}
		{
			// 生成直选单式票
			int singleLen = dsList.size();
			int loop = singleLen / singleTicketLimit;
			int mod = singleLen % singleTicketLimit;
			for ( int i = 0; i < loop; i++ ) {
				super.createSingleTicket(order, retList, dsList, singleTicketLimit, singleTicketLimit, i, "" + PlayerTypes.C11x5Player.Q1DS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, dsList, mod, singleTicketLimit, loop, "" + PlayerTypes.C11x5Player.Q1DS);
			}
		}
		return retList;
	}
	
	/**
	 * 前二/前三玩法拆分
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitQ2(LotteryOrder order, int dsType, int fsType) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> dsList = new ArrayList<String>();	// 直选普通单式
		List<String> fsList = new ArrayList<String>();	// 直选普通复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( betCode.indexOf(",") == -1 ) {
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
				super.createSingleTicket(order, retList, dsList, singleTicketLimit, singleTicketLimit, i, "" + dsType);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, dsList, mod, singleTicketLimit, loop, "" + dsType);
			}
		}
		
		for ( String complex : fsList ) {
			String[] codes = complex.split("\\|");
			int betNum = 1;
			for ( String code : codes ) {
				betNum *= code.split(",").length;
			}
			createComplexTicket(order,retList, complex, betNum, "" +fsType);
		}
		
		return retList;
	}
	
	/**
	 * 任选五票拆分(任选玩法皆调用此方法)
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitR5(LotteryOrder order, int len, int dsType, int fsType) {
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
				super.createSingleTicket(order, retList, dsList, singleTicketLimit, singleTicketLimit, i, "" + dsType);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, dsList, mod, singleTicketLimit, loop, "" + dsType);
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

	private List<LotteryTicket> splitR8(LotteryOrder order, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> dsList = new ArrayList<String>();	// 直选普通单式
		for ( String complex : betCodes ) {
			List<String> list = this.combAlg.findQlcSingComb(complex, 8);
			for ( String s : list ) {
				dsList.add(sortBetCode(s));
			}
		}
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
		return retList;
	}
	
	private String sortBetCode(String source) {
		String[] ss = source.split(",");
		Arrays.sort(ss);
		String s = "";
		for ( String i : ss ) {
			s += i + ",";
		}
		s = s.substring(0, s.length() - 1);
		return s;
	}
	
}
