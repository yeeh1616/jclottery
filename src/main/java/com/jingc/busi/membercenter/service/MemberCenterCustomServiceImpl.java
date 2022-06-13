/**
 * 
 */
package com.jingc.busi.membercenter.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MergerAppointMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerAppoint;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: MemberCenterServiceImpl.java</p>
 * <p>Desc: 个人中心业务（充值、取款、安全设置、购彩查询等）实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("memberCenterCustomService")
public class MemberCenterCustomServiceImpl implements MemberCenterCustomService {
	@Resource
	private MergerAppointMapper mergerAppointMapper;
	@Resource
	private MemberMapper memberMapper;
	/** 店铺可销售彩票种类表*/
	@Resource
	private StoreLicenseMapper storeLicenseMapper;
	
	/**
	 * author yuanye
	 * 获取当前店铺所有用户名列表(不包含已指定的跟单人ID和当前用户ID)
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	@Override
	public Integer appointedNum(MergerAppoint param) {
		
		return this.mergerAppointMapper.selectAppointedNum(param);
	}
	
	/**
	 * author yuanye
	 * 获取用户已经指定跟单的人数
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	@Override
	public Pagination appointMembers(MergerAppoint param, Integer pageNo,
			Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int)this.memberMapper.selectCountAppointMember(param);
		pagination.setTotalCount(count);
		List<Member> list = this.memberMapper.selectAppointMember(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	
	/**
	 * author yuanye
	 * 指定我的跟单人(不能指定自己的ID和已经指定过的跟单人ID)
	 * @param param
	 * @return
	 */
	@Override
	public Integer appoint(MergerAppoint param) {
		MergerAppoint temp = new MergerAppoint();
		temp.setMemberId(param.getMemberId());
		temp.setLicenseId(param.getLicenseId());
		temp.setAppointMemberId(param.getAppointMemberId());
		int isAlreadyAppointed = this.mergerAppointMapper.selectCountByParamObject(temp);
		if(isAlreadyAppointed > 0){
			return -2;//-2代表指定
		}
		param.setAppointDate(DateUtil.getDateFormat2());
		param.setState(MergerAppoint.STATE_NO_ACCEPT);
		return this.mergerAppointMapper.insert(param);
	}

	/**
	 * author yuanye
	 * 获取彩种列表，包含每个彩种已经指定的人数
	 * @param param
	 * @return
	 */
	@Override
	public List<StoreLicense> getStoreLicenseListWithAppointedNum(Integer memberId,Integer storeId,Integer licenseId) {
		MergerAppoint ma = new MergerAppoint();
		ma.setMemberId(memberId);
		List<StoreLicense> list = this.storeLicenseMapper.getStoreLicenseWithAppointedNum(memberId,storeId,licenseId);
		List<StoreLicense> list2 = new ArrayList<StoreLicense>();
		StoreLicense lic;
		for(int i = 0;i < list.size();i++)
		{
			lic = new StoreLicense();
			lic.setAppointedNum(list.get(i).getAppointedNum());
			lic.setLicenseId(list.get(i).getLicenseId());
			lic.setLicenseString(GameUtil.GAMESMAP.get(lic.getLicenseId()+""));
			list2.add(lic);
		}
		return list2;
	}

	@Override
	public Integer updateAppoint(MergerAppoint param) {
		return this.mergerAppointMapper.updateAppointState(param);
	}
}
