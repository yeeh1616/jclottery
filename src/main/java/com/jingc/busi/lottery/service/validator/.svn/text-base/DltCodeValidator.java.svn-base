/**
 * 
 */
package com.jingc.busi.lottery.service.validator;

import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.lottery.service.LotteryServiceImpl.CodeValidator;

/**
 * <p>File: PlsCodeValidator.java</p>
 * <p>Desc: 大乐透号码校验器</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩通汇众科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-5-5
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class DltCodeValidator extends CodeValidator {

	@Override
	public boolean valiedate(LotteryOrder order) {
		String[] betCodes = order.getBetCode().replaceAll("\\(", "").replaceAll("\\)", ",").split(";");
		boolean retObj = true;
		String createCode = "";
		for ( String betCode : betCodes ) {
			String[] qhSp = betCode.split("\\+");
			String[] qianLines = qhSp[0].split(",");// 前区
			String[] houLines = qhSp[1].split(",");//后区
			//遍历前区号码
			for ( String qianLine : qianLines ) {
				//前区号码长度为2，且在01-35之间
				if ( qianLine.length() == 2
						&& (Integer.parseInt(qianLine) <= 35 && Integer
								.parseInt(qianLine) > 0) ) {
				} else {
					return false;
				}
			}
			//遍历后区号码
			for ( String houLine : houLines ) {
				//后区号码长度为2，且在01-12之间
				if ( houLine.length() == 2
						&& (Integer.parseInt(houLine) <= 12 && Integer
								.parseInt(houLine) > 0) ) {
				} else {
					return false;
				}
			}
			createCode += sortBetCode(qhSp[0]) + "+" + sortBetCode(qhSp[1]) + ";";
		}
		createCode = createCode.substring(0, createCode.length() - 1);
		//order.setBetCode(createCode);
		return retObj;
	}

	public static void main(String[] args) {
		String s = "(1)2,3+(3)4";
		s = s.replaceAll("\\(", "").replaceAll("\\)", ",");
		System.out.println(s);
	}
}
