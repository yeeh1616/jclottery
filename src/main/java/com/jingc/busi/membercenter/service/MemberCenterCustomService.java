/**
 * 
 */
package com.jingc.busi.membercenter.service;

import java.util.List;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.MergerAppoint;
import com.jingc.busi.common.table.StoreLicense;

/**
 * <p>File: MemberCenterService.java</p>
 * <p>Desc: 个人中心业务（充值、取款、安全设置、购彩查询等）</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface MemberCenterCustomService {
	/**
	 * author yuanye
	 * 获取用户已经指定跟单的人数
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	Integer appointedNum(MergerAppoint param);
	
	/**
	 * author yuanye
	 * 获取当前店铺所有用户名列表(不包含已指定的跟单人ID和当前用户ID)
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	Pagination appointMembers(MergerAppoint param, Integer pageNo, Integer pageSize);
	
	/**
	 * author yuanye
	 * 指定我的跟单人(不能指定自己的ID和已经指定过的跟单人ID)
	 * @param param
	 * @return
	 */
	Integer appoint(MergerAppoint param);

	/**
	 * author yuanye
	 * 获取彩种列表，包含该彩种已指定的人数
	 * @param param
	 * @return
	 */
	List<StoreLicense> getStoreLicenseListWithAppointedNum(Integer memberId,Integer storeId,Integer licenseId);

	/**
	 * author yuanye
	 * 更新merger_appoint表
	 * @param param
	 * @return
	 */
	Integer updateAppoint(MergerAppoint param);
	
}
