/**
 * 
 */
package com.jingc.busi.merger.service;

import java.util.List;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerAppoint;
import com.jingc.busi.common.table.MergerCustom;

/**
 * <p>File: CustomService.java</p>
 * <p>Desc: 定制跟单业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-5-11
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface CustomService {

	/**
	 * 邀请彩民跟单
	 * @param member，彩民
	 * @param licenseId，彩种
	 * @param appointMemberIdlist，被指定彩民ID列表
	 */
	public void appointMembers(Member member, Integer licenseId, List<Integer> appointMemberIdlist);
	
	/**
	 * 彩民同意作为邀请人的指定跟单人
	 * @param member
	 * @param appointId
	 * @param custom，定制参数
	 */
	public void agreeAppoint(Member member, Integer appointId, MergerCustom custom);
	
	/**
	 * 拒绝接受邀请作为跟单人
	 * @param member
	 * @param appointId
	 */
	public void refuseAppoint(Member member, Integer appointId);
	
	/**
	 * 定制彩民的单子
	 * @param MergerCustom，定制参数
	 */
	public void customize(MergerCustom custom);

	/**
	 * 我定制的跟单
	 * @param MergerCustom，定制参数
	 */
	public Pagination custom(MergerCustom param, Integer pageNo,
			Integer pageSize);

	/**
	 * 我指定的跟单人
	 * @param MergerCustom，定制参数
	 */
	public Pagination mergerAppoint(MergerAppoint param, Integer pageNo,
			Integer pageSize);
	
	/**
     * 插入定制信息
     * @param mc
     */
	public Integer mergerCustomInfo(MergerCustom mc);

	Pagination mergerAppointWithoutBusinessHallAccount(MergerAppoint param,
			Integer pageNo, Integer pageSize);
}
