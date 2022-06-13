/**
 * 
 */
package com.jingc.busi.copyorder.service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryOrderCustom;
import com.jingc.busi.common.table.Member;

/**
 * <p>File: CopyOrderService.java</p>
 * <p>Desc: 复制跟单业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-20
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface CopyOrderService {

	/**
	 * 复制订单
	 * @param orderId，订单号
	 * @param multiple，投注倍数
	 */
	public void copy(Member m, Integer orderId, Integer multiple);
	
	/**
	 * 查询可复制订单
	 * @param storeId，店铺号
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo，第几页
	 * @param pageSize，每页显示几条
	 * @return
	 */
	public Pagination queryCopyOrders(Integer storeId, Integer licenseId, String username, Integer pageNo, Integer pageSize);
	
	/**
	 * 查询我复制的订单
	 * @param storeId，店铺号
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyOrders(Integer storeId, Integer userid, Integer licenseId, Integer pageNo, Integer pageSize);
	
	/**
	 * 查询我被复制的订单
	 * @param storeId，店铺号
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyedOrders(Integer storeId, Integer userid, Integer licenseId, Integer pageNo, Integer pageSize);
	
	/**
	 * 重複下單
	 * @param m
	 * @param orderId
	 */
	public void repeatBet(Member m, Integer orderId);
	
	/**
	 * 定制复制，即自动复制的定制
	 * @param loc
	 */
	public void custom(LotteryOrderCustom loc);
	
	/**
	 * 取消定制
	 * @param m
	 * @param custId
	 */
	public void cancelCust(Member m, Integer custId);
	
	/**
	 * 查询我的定制复制
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyCust(Integer userid, Integer licenseId, Integer pageNo, Integer pageSize);
	
	/**
	 * 查询我被定制的定制复制
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyedCust(Integer userid, Integer licenseId, Integer pageNo, Integer pageSize);
	
	/**
	 * 执行定制的复制
	 * @param order
	 */
	public void copy(LotteryOrder order);

}
