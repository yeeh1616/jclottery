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
 * <p>File: Kl10TicketSplitor</p>
 * <p>Desc: 快乐十分拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2016-9-23
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class Kl10TicketSplitor extends TicketSplitor {

	private CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	
	/**
	 * 网页类型转换
	 */
	private static final Map<String, Integer> WEB_TYPE = new Hashtable<String, Integer>();
	static {
		WEB_TYPE.put("x1st", PlayerTypes.Kl10Player.X1ST);	
		WEB_TYPE.put("x1ht", PlayerTypes.Kl10Player.X1HT);	
		WEB_TYPE.put("x2r2", PlayerTypes.Kl10Player.X2R2);
		WEB_TYPE.put("x2lzh", PlayerTypes.Kl10Player.X2LZH);
		WEB_TYPE.put("x2lz", PlayerTypes.Kl10Player.X2LZ);
		WEB_TYPE.put("x3r3", PlayerTypes.Kl10Player.X3R3);
		WEB_TYPE.put("x3qzh", PlayerTypes.Kl10Player.X3QZH);
		WEB_TYPE.put("x3qz", PlayerTypes.Kl10Player.X3QZ);
		WEB_TYPE.put("x4r4", PlayerTypes.Kl10Player.X4R4);
		WEB_TYPE.put("x5r5", PlayerTypes.Kl10Player.X5R5);	
	}
	
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		List<LotteryTicket> retList = null;
		String playType = order.getPlayType();
		int type = WEB_TYPE.get(playType).intValue();
		switch ( type ) {
		case PlayerTypes.Kl10Player.X1ST:
			retList =  this.splitQ1(order, PlayerTypes.Kl10Player.X1ST);
			break;
		case PlayerTypes.Kl10Player.X1HT:
			retList =  this.splitQ1(order, PlayerTypes.Kl10Player.X1HT);
			break;
		case PlayerTypes.Kl10Player.X2R2:
			retList =  this.splitR5(order, 2, PlayerTypes.Kl10Player.X2R2);
			break;
		case PlayerTypes.Kl10Player.X2LZH:
			retList =  this.splitQ2(order, PlayerTypes.Kl10Player.X2LZH, PlayerTypes.Kl10Player.X2LZH);
			break;
		case PlayerTypes.Kl10Player.X2LZ:
			retList =  this.splitR5(order, 2, PlayerTypes.Kl10Player.X2LZ);
			break;
		case PlayerTypes.Kl10Player.X3R3:
			retList =  this.splitR5(order, 3, PlayerTypes.Kl10Player.X3R3);
			break;
		case PlayerTypes.Kl10Player.X3QZH:
			retList =  this.splitQ2(order, PlayerTypes.Kl10Player.X3QZH, PlayerTypes.Kl10Player.X3QZH);
			break;
		case PlayerTypes.Kl10Player.X3QZ:
			retList =  this.splitR5(order, 3, PlayerTypes.Kl10Player.X3QZ);
			break;
		case PlayerTypes.Kl10Player.X4R4:
			retList =  this.splitR5(order, 4, PlayerTypes.Kl10Player.X4R4);
			break;
		case PlayerTypes.Kl10Player.X5R5:
			retList =  this.splitR5(order, 5, PlayerTypes.Kl10Player.X5R5);
			break;
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
}
