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
 * <p>File: LuckyRacingTicketSplitor.java</p>
 * <p>Desc: 幸运赛车拆单实现</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-21
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class LuckyRacingTicketSplitor extends TicketSplitor {
	
	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 网页类型转换
	 */
	private static final Map<String, Integer> WEB_TYPE = new Hashtable<String, Integer>();
	static {
		WEB_TYPE.put("q1", 1);	// 前一
		WEB_TYPE.put("q2zx", 2);	// 前二标准
		WEB_TYPE.put("q2fs", 3);	// 前二包号
		WEB_TYPE.put("q2dt", 4);	// 前二胆拖包号
		WEB_TYPE.put("q3zx", 5);	// 前三标准
		WEB_TYPE.put("q3fs", 6);	// 前三包号
		WEB_TYPE.put("q3dt", 7);	// 前三胆拖包号
		WEB_TYPE.put("wzdc", 8);	// 位置单车选号
		WEB_TYPE.put("wzsc", 9);	// 位置双车选号
		WEB_TYPE.put("wzdt", 10);	// 位置双车胆拖
		WEB_TYPE.put("ysq1", 11);	// 颜色前一
		WEB_TYPE.put("ysq2", 12);	// 颜色前二直选
		WEB_TYPE.put("ysq2bh", 13);	// 颜色前二包号
		WEB_TYPE.put("ysq2dt", 14);	// 颜色前二胆拖
		WEB_TYPE.put("ysq3", 15);	// 颜色前三直选
		WEB_TYPE.put("ysq3bh", 16);	// 颜色前三包号
		WEB_TYPE.put("ysq3dt", 17);	// 颜色前三胆拖
		WEB_TYPE.put("g2gbz", 18);	// 过两关标准
		WEB_TYPE.put("g2gbh", 19);	// 过两关包号
		WEB_TYPE.put("g2gdtbh", 20);	// 过两关胆拖包号
		WEB_TYPE.put("g3gbz", 21);	// 过三关标准
		WEB_TYPE.put("g3gbh", 22);	// 过三关包号
		WEB_TYPE.put("g3gdtbh", 23);	// 过三关胆拖包号
		WEB_TYPE.put("dxjo", 24);	// 大小奇偶
		WEB_TYPE.put("z2fs", 25);	// 组二标准选号
		WEB_TYPE.put("z2dt", 26);	// 组二胆拖包号
		WEB_TYPE.put("z3fs", 27);	// 组三标准选号
		WEB_TYPE.put("z3dt", 28);	// 组三胆拖包号
	}
	
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		int type = WEB_TYPE.get(playType).intValue();
		switch ( type ) {
		case 1:	// 前一
			retList = this.splitQ1(order, PlayerTypes.LuckyRacingPlayer.Q1DS, PlayerTypes.LuckyRacingPlayer.Q1FS);
			break;
		case 2:	// 前二标准选号
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.Q2DS, PlayerTypes.LuckyRacingPlayer.Q2FS);
			break;
		case 3:	// 前二包号
			retList = this.splitQ2Bh(order, 2, PlayerTypes.LuckyRacingPlayer.Q2BH);
			break;
		case 4:	// 前二胆拖包号
			retList = this.splitQ2DtBh(order, 2, PlayerTypes.LuckyRacingPlayer.Q2BHDT);
			break;
		case 5: // 前三标准选号
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.Q3DS, PlayerTypes.LuckyRacingPlayer.Q3FS);
			break;
		case 6:	// 前三包号
			retList = this.splitQ2Bh(order, 3, PlayerTypes.LuckyRacingPlayer.Q3BH);
			break;
		case 7:	// 前三胆拖包号
			retList = this.splitQ2DtBh(order, 3, PlayerTypes.LuckyRacingPlayer.Q3BHDT);
			break;
		case 8:	// 位置单车选号
			retList = this.splitWzDc(order, 1, PlayerTypes.LuckyRacingPlayer.WZDCDS, PlayerTypes.LuckyRacingPlayer.WZDCFS);
			break;
		case 9:	// 位置双车选号
			retList = this.splitWzDc(order, 2, PlayerTypes.LuckyRacingPlayer.WZSCDS, PlayerTypes.LuckyRacingPlayer.WZSCFS);
			break;
		case 10:	// 位置双车胆拖
			retList = this.splitWzScDt(order, 2, PlayerTypes.LuckyRacingPlayer.WZSCDT);
			break;
		case 11:	// 颜色前一
			retList = this.splitQ1(order, PlayerTypes.LuckyRacingPlayer.YSQ1DS, PlayerTypes.LuckyRacingPlayer.YSQ1FS);
			break;
		case 12: 	// 颜色前二直选
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.YSQ2DS, PlayerTypes.LuckyRacingPlayer.YSQ2FS);
			break;
		case 13:	// 颜色前二包号
			retList = this.splitQ2Bh(order, 2, PlayerTypes.LuckyRacingPlayer.YSQ2BH);
			break;
		case 14:	// 颜色前二胆拖
			retList = this.splitQ2DtBh(order, 2, PlayerTypes.LuckyRacingPlayer.YSQ2BHDT);
			break;
		case 15: 	// 颜色前三直选
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.YSQ3DS, PlayerTypes.LuckyRacingPlayer.YSQ3FS);
			break;
		case 16:	// 颜色前三包号
			retList = this.splitQ2Bh(order, 3, PlayerTypes.LuckyRacingPlayer.YSQ3BH);
			break;
		case 17:	// 颜色前三胆拖
			retList = this.splitQ2DtBh(order, 3, PlayerTypes.LuckyRacingPlayer.YSQ3BHDT);
			break;
		case 18:	// 过两关标准
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.G2GDS, PlayerTypes.LuckyRacingPlayer.G2GFS);
			break;
		case 19:	// 过两关包号
			retList = this.splitQ2Bh(order, 2, PlayerTypes.LuckyRacingPlayer.G2GBH);
			break;
		case 20:	// 过两关胆拖
			retList = this.splitQ2DtBh(order, 2, PlayerTypes.LuckyRacingPlayer.G2GBHDT);
			break;
		case 21:	// 过三关标准
			retList = this.splitQ2(order, PlayerTypes.LuckyRacingPlayer.G3GDS, PlayerTypes.LuckyRacingPlayer.G3GFS);
			break;
		case 22:	// 过三关包号
			retList = this.splitQ2Bh(order, 3, PlayerTypes.LuckyRacingPlayer.G3GBH);
			break;
		case 23:	// 过三关胆拖
			retList = this.splitQ2DtBh(order, 3, PlayerTypes.LuckyRacingPlayer.G3GBHDT);
			break;
		case 24:	// 大小奇偶
			retList = this.splitQ1(order, PlayerTypes.LuckyRacingPlayer.DXJODS, PlayerTypes.LuckyRacingPlayer.DXJOFS);
			break;
		case 25:	// 组二标准选号
			retList = this.splitWzDc(order, 2, PlayerTypes.LuckyRacingPlayer.Z2DS, PlayerTypes.LuckyRacingPlayer.Z2FS);
			break;
		case 26:	// 组二胆拖包号
			retList = this.splitWzScDt(order, 2, PlayerTypes.LuckyRacingPlayer.Z2DT);
			break;
		case 27:	// 组三标准选号
			retList = this.splitWzDc(order, 3, PlayerTypes.LuckyRacingPlayer.Z3DS, PlayerTypes.LuckyRacingPlayer.Z3FS);
			break;
		case 28:	// 组三胆拖包号
			retList = this.splitWzScDt(order, 3, PlayerTypes.LuckyRacingPlayer.Z3DT);
			break;
		}
		return retList;
	}
	
	private List<LotteryTicket> splitQ1(LotteryOrder order, int dsType, int fsType) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		List<String> dsList = new ArrayList<String>();
		for ( String complex : betCodes ) {
			int betNum = complex.split(",").length;
			if ( betNum == 1 ) {
				dsList.add(complex);
			} else {
				//createComplexTicket(order, retList, complex, betNum, "" + fsType);
				// 全部转成单式
				String[] ss = complex.split(",");
				for ( String singl : ss ) {
					dsList.add(singl);
				}
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
		return retList;
	}
	
	/**
	 * 前二/前三玩法拆分
	 * 前二（冠亚军）单式，格式：01|02;02|03 前二复式，格式：01,02|03,04
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
	 * 前二/前三包号
	 * // 前二（冠亚军）单式，格式：01,02,04
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitQ2Bh(LotteryOrder order, int len, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		int die = len == 2 ? 2 : 6;
		for ( String betCode : betCodes ) {
			String[] codes = betCode.split(",");
			int betNum = this.combAlg.findCombNum(codes.length, len) * die;
			createComplexTicket(order,retList, betCode, betNum, "" +type);
		}
		return retList;
	}
	
	/**
	 * 前二/前三胆拖包号
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitQ2DtBh(LotteryOrder order, int len, int type) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		String[] betCodes = order.getBetCode().split(";");
		int die = len == 2 ? 2 : 6;
		for ( String complex : betCodes ) {
			String[] dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			String[] tuos = complex.substring(complex.indexOf(')')+1).split(",");
			int betNum = this.combAlg.findCombNum(tuos.length, len - dans.length) * die;
			createComplexTicket(order,retList, complex, betNum, "" + type);
		}
		return retList;
	}
	
	/**
	 * 位置单/双车选号玩法拆分
	 * 前二（冠亚军）单式，格式：05,06,07
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitWzDc(LotteryOrder order, int len, int dsType, int fsType) {
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		List<String> dsList = new ArrayList<String>();	// 直选普通单式
		List<String> fsList = new ArrayList<String>();	// 直选普通复式
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( betCode.split(",").length == len ) {
				dsList.add(betCode);
			} else {
				if ( len == 1 ) {
					// 转成单式[位置单车]
					String[] ss = betCode.split(",");
					for ( String singl : ss ) {
						dsList.add(singl);
					}
				} else {
					fsList.add(betCode);
				}
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
			String[] codes = complex.split(",");
			int betNum = this.combAlg.findCombNum(codes.length, len);
			createComplexTicket(order,retList, complex, betNum, "" +fsType);
		}
		
		return retList;
	}

	/**
	 * 位置双车胆拖玩法
	 * @param order
	 * @return
	 */
	private List<LotteryTicket> splitWzScDt(LotteryOrder order, int len, int type) {
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
}
