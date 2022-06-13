/**
 * 
 */
package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.List;

import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitor;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: QxcTicketSplitor.java</p>
 * <p>Desc: 七星彩拆单实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class QxcTicketSplitor extends TicketSplitor {

	/**
	 * 单式/复式可同时投注
	 * 格式：12,23,23,1,0,12,9;5,6,7,8,9,2,3
	 * 1-单式，2-复式
	 */
	@Override
	public List<LotteryTicket> split(LotteryOrder order) {
		
		List<LotteryTicket> retList = new ArrayList<LotteryTicket>();
		
		List<String> singleList = new ArrayList<String>();//存放单式串
		List<String> complexList = new ArrayList<String>();//存放复式串
		
		String[] betCodes = order.getBetCode().split(";");
		for ( String betCode : betCodes ) {
			if ( isNumberArrangleDsString(betCode) ) {
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
				super.createSingleTicket(order, retList, singleList, singleTicketLimit, singleTicketLimit, i, "" + GameUtil.QXCDS);
			}
			if ( mod != 0 ) {
				super.createSingleTicket(order, retList, singleList, mod, singleTicketLimit, loop, "" + GameUtil.QXCDS);
			}
		}
		
		for ( String complex : complexList ) {
			int betNum = calcNumberArrangleDsString(complex);
			if ( betNum > 10000 ) {
				// 拆分号码
				String[] splitCode = complex.split(",");
				betNum = splitCode[0].length() * splitCode[1].length() * splitCode[2].length() * splitCode[3].length() * splitCode[4].length();
				if ( betNum > 10000 ) {
					betNum = splitCode[0].length() * splitCode[1].length() * splitCode[2].length() * splitCode[3].length();
					char[] fiveCodes = splitCode[4].toCharArray();
					char[] sixCodes = splitCode[5].toCharArray();
					char[] sevenCodes = splitCode[6].toCharArray();
					for ( char fiveCode : fiveCodes ) {
						for ( char sixCode : sixCodes ) {
							for ( char sevenCode : sevenCodes ) {
								String subComplexCode = splitCode[0] + "|" + splitCode[1] + "|" + splitCode[2] + "|" + splitCode[3] + "|" + fiveCode + "|" + sixCode + "|" + sevenCode;
								createComplexTicket(order,retList, subComplexCode, betNum, "" + GameUtil.QXCFS);
							}
						}
					}
				} else {
					betNum *= splitCode[5].length();
					if ( betNum > 10000 ) {
						betNum = splitCode[0].length() * splitCode[1].length() * splitCode[2].length() * splitCode[3].length() * splitCode[4].length();
						char[] sixCodes = splitCode[5].toCharArray();
						char[] sevenCodes = splitCode[6].toCharArray();
						for ( char sixCode : sixCodes ) {
							for ( char sevenCode : sevenCodes ) {
								String subComplexCode = splitCode[0] + "|" + splitCode[1] + "|" + splitCode[2] + "|" + splitCode[3] + "|" + splitCode[4] + "|" + sixCode + "|" + sevenCode;
								createComplexTicket(order,retList, subComplexCode, betNum, "" + GameUtil.QXCFS);
							}
						}
					} else {
						char[] lastCodes = splitCode[6].toCharArray();
						for ( char lastCode : lastCodes ) {
							String subComplexCode = splitCode[0] + "|" + splitCode[1] + "|" + splitCode[2] + "|" + splitCode[3] + "|" + splitCode[4] + "|" + splitCode[5] +"|" + lastCode;
							createComplexTicket(order,retList, subComplexCode, betNum, "" + GameUtil.QXCFS);
						}
					}
				}
			} else {
				createComplexTicket(order,retList, complex, betNum, "" + GameUtil.QXCFS);
			}
		}
		
		return retList;
	}

}
