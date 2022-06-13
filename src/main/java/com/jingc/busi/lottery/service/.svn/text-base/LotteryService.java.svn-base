/**
 * 
 */
package com.jingc.busi.lottery.service;

import java.util.List;

import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;

/**
 * <p>File: LotteryService.java</p>
 * <p>Desc: 彩票业务逻辑接口</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-2-28
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface LotteryService {

	/**
	 * 投注接口
	 * ！！！订单记录中有扣除账户金额，扣除红包金额，撤单的时候，需要把红包和资金分别返回彩民账户
	 * @param order
	 */
	public void bet(LotteryOrder order);
	
	/**
	 * 数字彩种复制号码投注到当前期
	 * @param orderId
	 * @param multiple
	 */
	public void copyMathOrder2Bet(Member m, Integer orderId, Integer multiple);
	
	/**
	 * 足彩，数字彩当前期次
	 * @param licenseId
	 * @param aheadTime
	 * @return
	 */
	public Game getCurrentGame(Integer licenseId, Integer aheadTime);
	
	/**
	 * 查询预售期
	 * @param licenseId
	 * @return
	 */
	public List<Game> getSaleGame(Integer licenseId);
	
	/**
	 * 查询预售期（追号期数）
	 * @param licenseId
	 * @param issueNum,期数
	 * @return
	 */
	public List<Game> getSaleGame2Chasing(Integer licenseId, Integer issueNum);
	
	/**
	 * 足彩，数字彩上期期次
	 * @param licenseId
	 * @param aheadTime
	 * @return
	 */
	public Game getPreGame(Integer licenseId);
	
	/**
	 * 足彩，数字彩上期期次，通过彩种，期号查询
	 * @param licenseId
	 * @param issue
	 * @return
	 */
	public Game getOneGame(Integer licenseId, String issue);
	
	/**
	 * 获取店铺销售彩种列表
	 * @param storeId
	 * @return
	 */
	public List<StoreLicense> getStoreLicenses(Integer storeId);
	
	/**
	 * 获取店铺某一彩种的配置信息
	 * @param key
	 * @return
	 */
	public StoreLicense getStoreLicense(StoreLicenseKey key);
	
}
