/**
 * 
 */
package com.jingc.busi.chasing.service;

import com.jingc.busi.common.table.ChasingOrder;

/**
 * <p>File: ChasingService.java</p>
 * <p>Desc: 追号业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface ChasingService {

	/**
	 * 发起追号
	 * @param order
	 */
	public void chase(ChasingOrder order);
	
	/**
	 * 移动端调用快捷追号，设置连续追x期，使用字段reserved1标示 added at 2015/06/30
	 * @param order
	 */
	public void chase2mobile(ChasingOrder order);
	
	
	/**
	 * 停止一期追号，钱退回彩金账户 added at 2015/03/10
	 * @param orderId，投注单ID，lottery_order表中的id
	 */
	public void cancelOneIssueChasing(Integer orderId);
	
	/**
	 * 取消追号（全部撤单），剩下的钱退回彩金账户
	 * @param orderId
	 */
	public void cancelChasing(Integer orderId);
}
