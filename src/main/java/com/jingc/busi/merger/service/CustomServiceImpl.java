/**
 * 
 */
package com.jingc.busi.merger.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MergerAppointMapper;
import com.jingc.busi.common.mapper.MergerCustomMapper;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerAppoint;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerJoin;

/**
 * <p>File: CustomServiceImpl.java</p>
 * <p>Desc: 定制跟单业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-5-13
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("customService")
public class CustomServiceImpl implements CustomService {
	
	@Resource
	private MergerAppointMapper mergerAppointMapper;
	
	@Resource
	private MergerCustomMapper mergerCustomMapper;
	
	@Resource
	private MemberMapper memberMapper;
	
	public static final int APPOINT_MEMBER_MAX = 10;	// 10个跟单人

	/**
	 * 邀请彩民跟单
	 * <li>一个彩民一个彩种最多可以指定10个跟单人</li>
	 */
	@Override
	@Transactional
	public void appointMembers(Member member, Integer licenseId, List<Integer> appointMemberIdlist) {
		MergerAppoint queryObj = new MergerAppoint();
		queryObj.setMemberId(member.getId());
		queryObj.setLicenseId(licenseId);
		
		int size = appointMemberIdlist.size() + this.mergerAppointMapper.getMemberAppointCount(queryObj);
		if ( size > APPOINT_MEMBER_MAX ) {
			throw new BaseException("[最多指定" + APPOINT_MEMBER_MAX + "个跟单人]");
		}
		
		for ( Integer memberId : appointMemberIdlist ) {
			MergerAppoint ma = new MergerAppoint();
			ma.setMemberId(member.getId());
			ma.setMemberName(member.getMemberName());
			ma.setAppointMemberId(memberId);
			ma.setAppontMemberName(this.memberMapper.selectByPrimaryKey(memberId).getMemberName());
			ma.setLicenseId(licenseId);
			ma.setStoreId(member.getStoreId());
			ma.setAppointDate(DateUtil.getDateFormat2());
			ma.setState(MergerAppoint.STATE_NO_ACCEPT);
			this.mergerAppointMapper.insert(ma);
		}
	}
	
	/**
	 * 彩民同意作为邀请人的指定跟单人
	 */
	@Override
	@Transactional
	public void agreeAppoint(Member member, Integer appointId, MergerCustom custom) {
		MergerAppoint ma = this.mergerAppointMapper.selectByPrimaryKey(appointId);
		// 判断是否是同一个人同意
		if ( member.getId().intValue() != ma.getAppointMemberId() ) {
			throw new BaseException("[您不是指定的跟单人]");
		}
		ma.setState(MergerAppoint.STATE_ACCEPT);
		this.mergerAppointMapper.updateAppointState(ma);
		
		// 生成跟单信息
		custom.setCustomizedMemberId(ma.getMemberId());
		custom.setCustomizingMemberId(ma.getAppointMemberId());
		custom.setStoreId(ma.getStoreId());
		custom.setLicenseId(ma.getLicenseId());
		custom.setAppointed(MergerCustom.APPOINT_TYPE_APPOINT);
		
		this.customize(custom);
	}
	
	/**
	 * 拒绝接受邀请作为跟单人
	 */
	public void refuseAppoint(Member member, Integer appointId) {
		MergerAppoint ma = this.mergerAppointMapper.selectByPrimaryKey(appointId);
		// 判断是否是同一个人同意
		if ( member.getId().intValue() != ma.getAppointMemberId() ) {
			throw new BaseException("[您不是指定的跟单人]");
		}
		ma.setState(MergerAppoint.STATE_NO_ACCEPT);
		this.mergerAppointMapper.updateAppointState(ma);
	}

	/**
	 * 定制彩民的单子
	 */
	@Override
	public void customize(MergerCustom custom) {
		custom.setCusDate(DateUtil.getDateFormat2());
		custom.setState(MergerCustom.STATE_MORMAL);
		this.mergerCustomMapper.insert(custom);
	}	
	
	/**
	 * 查询我定制的跟单
	 */
	@Override
	public Pagination custom(MergerCustom param, Integer pageNo,Integer pageSize) {
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int) this.mergerCustomMapper.selectCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MergerCustom> list = this.mergerCustomMapper.selectByParamObjectz(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	/**
	 * 查询我指定的跟单人(不包含营业厅账户)
	 */
	@Override
	public Pagination mergerAppointWithoutBusinessHallAccount(MergerAppoint param, Integer pageNo,Integer pageSize) {
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int) this.mergerAppointMapper.selectCountWithoutBusinessHallAccountByParamObject(param);
		pagination.setTotalCount(count);
		List<MergerAppoint> list = this.mergerAppointMapper.selectWithoutBusinessHallAccountByParamObject(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	/**
	 * 查询我指定的跟单人
	 */
	@Override
	public Pagination mergerAppoint(MergerAppoint param, Integer pageNo,Integer pageSize) {
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int) this.mergerAppointMapper.selectCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MergerAppoint> list = this.mergerAppointMapper.selectByParamObject(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	
	/**
     * 插入定制信息
     * @param mc
     */
	@Override
	public Integer mergerCustomInfo(MergerCustom mc) {
		if(mc.getCustomizedMemberId() != null
		 &&mc.getCustomizingMemberId() != null
		 &&mc.getLicenseId() != null){
			int result = this.mergerCustomMapper.selectMergerCustomCountByParamObject(mc);
			if(result <= 0){
				if(mc.getState() != null){
					Integer isSuccess = this.mergerCustomMapper.insert(mc);
					return isSuccess;//插入一条MergerCustom成功
				}else{
					return 0;
				}
			}else{
				return -2;//已经存在这个MergerCustom
			}
		}else{
			return -1;//错误
		}
	}
}
