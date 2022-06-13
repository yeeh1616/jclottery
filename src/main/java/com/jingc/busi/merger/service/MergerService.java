/**
 * 
 */
package com.jingc.busi.merger.service;

import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;

/**
 * <p>File: MergerService.java</p>
 * <p>Desc: 合买业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface MergerService {

	/**
	 * 发起合买
	 * @param order
	 */
	public void merger(MergerOrder order);
	
	/**
	 * 先发起，后上传
	 * @param order
	 */
	public void frsupmerge(MergerOrder order);
	
	/**
	 * 参与合买
	 * @param mj
	 * @param isEndJoin-保底参与
	 */
	public void joinMerger(MergerJoin mj, boolean isEndJoin);
	
    /**
     * 追加保底
     * @param orderId
     * @param insNum
     */
	public void appendIns(Member mb, Integer orderId, Integer insNum);
	
	/**
	 * 在合买未满员之前撤销合买单
	 * @param orderId，合买单ID
	 */
	public void cancelOrder(Member mb, Integer orderId);
}
