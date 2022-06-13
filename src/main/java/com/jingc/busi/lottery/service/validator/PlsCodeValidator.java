/**
 * 
 */
package com.jingc.busi.lottery.service.validator;

import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.lottery.service.LotteryServiceImpl.CodeValidator;

/**
 * <p>File: PlsCodeValidator.java</p>
 * <p>Desc: 排列三号码校验器</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩通汇众科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2014-8-26
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class PlsCodeValidator extends CodeValidator {

	@Override
	public boolean valiedate(LotteryOrder order) {
		String playType = order.getPlayType();
		String[] betCodes = order.getBetCode().split(";");
		boolean retObj = true;
		if ( "zxpt".equals(playType) ) {
			retObj = super.validateNumberArrangle(order, 3);
		} else if ( "zxzh".equals(playType) ) {
			for ( String betCode : betCodes ) {
				String[] codes = betCode.split(",");
				for ( String code : codes ) {
					if ( code.length() != 1 || !isNumber(code) ) 
						return false;
				}
			}
		} else if ( "zxhz".equals(playType) ) {
			for ( String betCode : betCodes ) {
				String[] codes = betCode.split(",");
				for ( String code : codes ) {
					if ( !isNumber(code) ) 
						return false;
				}
			}
		} else if ( "zxdt".equals(playType) ) {
			
		} else if ( "z3ds".equals(playType) ) {
		} else if ( "z3fs".equals(playType) ) {
		} else if ( "z3hz".equals(playType) ) {
		} else if ( "z3dt".equals(playType) ) {
		} else if ( "z6pt".equals(playType) ) {
		} else if ( "z6hz".equals(playType) ) {
		} else if ( "z6dt".equals(playType) ) {
		} else {
			retObj = false;
		}
		return retObj;
	}

}
