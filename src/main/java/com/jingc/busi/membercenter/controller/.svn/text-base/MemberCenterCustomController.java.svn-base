/**
 * 
 */
package com.jingc.busi.membercenter.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerAppoint;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.membercenter.service.MemberCenterCustomService;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.merger.service.CustomService;

/**
 * <p>
 * File: MemberCenterController.java
 * </p>
 * <p>
 * Desc: 个人中心Controller
 * </p>
 * <p>
 * Copyright: Copyright (c) 2013
 * </p>
 * <p>
 * Company: 北京中科易达科技发展有限责任公司
 * </p>
 * 
 * @author yuanye
 * @version 1.0 2015-5-26
 *          <p>
 *          修改者姓名 修改内容说明
 *          </p>
 * @see 参考类1
 */
@Controller
@RequestMapping("/memberCenterCustom/")
public class MemberCenterCustomController {
	@Resource
	private CustomService customService;
	@Resource
	private MemberCenterService memberCenterService;
	@Resource
	private MemberCenterCustomService memberCenterCustomService;
	/**
	 * 定制跟单
	 */
	@RequestMapping("/custom.jhtml")
	@ResponseBody
	public ModelAndView custom(HttpSession session,
							   Integer type,//type:1.我定制的跟单 2.我被定制的记录 3.我指定的跟单
							   Integer licenseId,
							   Integer pageNo,
							   Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		MergerCustom mc = new MergerCustom();
		MergerAppoint ma = new MergerAppoint();
		//Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		
		if(licenseId != null){
			mc.setLicenseId(licenseId);
			ma.setLicenseId(licenseId);
		}
		
		if(type == 1){
			mc.setCustomizingMemberId(mb.getId());
			pagination = this.customService.custom(mc,pageNo,pageSize);
			// 取到彩票种类类别
			List<StoreLicense> types = this.memberCenterService.getStoreLicenseList(storeId);
			mv.addObject("ltype", types);
			mv.addObject("pagination", pagination);
			if(licenseId != null){
				mv.addObject("licenseId", licenseId);
			}
			mv.setViewName("membercenter/myCustoming");
			return mv;
		}else if(type == 2){
			mc.setCustomizedMemberId(mb.getId());
			pagination = this.customService.custom(mc,pageNo,pageSize);
			// 取到彩票种类类别
			List<StoreLicense> types = this.memberCenterService.getStoreLicenseList(storeId);
			mv.addObject("ltype", types);
			mv.addObject("pagination", pagination);
			if(licenseId != null){
				mv.addObject("licenseId", licenseId);
			}
			mv.setViewName("membercenter/myCustomed");
			return mv;
		}else if(type == 3){
//			MergerAppoint temp = new MergerAppoint();
//			temp.setMemberId(mb.getId());
			ma.setMemberId(mb.getId());
			pagination = this.customService.mergerAppoint(ma, pageNo, pageSize);
			// 取到彩票种类类别
			List<StoreLicense> types = this.memberCenterCustomService.getStoreLicenseListWithAppointedNum(mb.getId(),storeId,licenseId);
			mv.addObject("ltype", types);
			mv.addObject("pagination",pagination);
			if(licenseId != null){
				mv.addObject("licenseId", licenseId);
			}
			mv.setViewName("membercenter/myAppointed");
			return mv;
		}else if(type == 4){
			MergerAppoint temp = new MergerAppoint();
			temp.setAppointMemberId(mb.getId());
			temp.setStoreId(storeId);
			temp.setState(MergerAppoint.STATE_NO_ACCEPT);
			
			pagination = this.customService.mergerAppoint(temp, pageNo, pageSize);
			// 取到彩票种类类别
			List<StoreLicense> types = this.memberCenterService.getStoreLicenseList(storeId);
			mv.addObject("ltype", types);
			mv.addObject("pagination",pagination);
			mv.setViewName("membercenter/myAppointToMe");
			return mv;
		}else{
			return null;
		}
	}
	
	/**
	 * 查询我指定的跟单人列表(不包含营业厅账户)
	 */
	@RequestMapping("/appointedByMePopup.do")
	public ModelAndView appointedByMe(HttpSession session,
			 Integer licenseId,
			 Integer pageNo,
			 Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");//发起人
		MergerAppoint ma = new MergerAppoint();
		ma.setMemberId(mb.getId());//发起人id
		ma.setLicenseId(licenseId);
		ma.setStoreId(mb.getStoreId());//店铺id
		Integer appointedNum = this.memberCenterCustomService.appointedNum(ma);
		pagination = this.customService.mergerAppointWithoutBusinessHallAccount(ma,pageNo,pageSize);
		mv.addObject("licenseId", licenseId);
		mv.addObject("memberId", mb.getId());
		mv.addObject("memberName", mb.getMemberName());
		mv.addObject("storeId", mb.getStoreId());
		mv.addObject("appointedNum",appointedNum);
		mv.addObject("pagination",pagination);
		mv.setViewName("membercenter/appointedByMePopup");
		return mv;
	}
	
	/**
	 * 指定我的跟单人弹出层
	 */
	@RequestMapping("/appointPopup.do")
	public ModelAndView appointPopup(HttpSession session,
									 Integer licenseId,
									 Integer pageNo,
									 Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");//发起人
		MergerAppoint ma = new MergerAppoint();
		ma.setMemberId(mb.getId());//发起人id
		ma.setLicenseId(licenseId);
		ma.setStoreId(mb.getStoreId());//店铺id
		Integer appointedNum = this.memberCenterCustomService.appointedNum(ma);
		pagination = this.memberCenterCustomService.appointMembers(ma,pageNo,pageSize);
		mv.addObject("licenseId", licenseId);
		mv.addObject("memberId", mb.getId());
		mv.addObject("memberName", mb.getMemberName());
		mv.addObject("storeId", mb.getStoreId());
		mv.addObject("appointedNum",appointedNum);
		mv.addObject("pagination",pagination);
		mv.setViewName("membercenter/appointPopup");
		return mv;
	}
	/**
	 * 判断是否指定人数已满(最多10人)
	 */
	@RequestMapping("/isAppointedFull.do")
	@ResponseBody
	public Integer isAppointedFull(HttpSession session,
									 Integer licenseId){
		Member mb = (Member) session.getAttribute("member");//发起人
		MergerAppoint ma = new MergerAppoint();
		ma.setMemberId(mb.getId());//发起人id
		ma.setLicenseId(licenseId);
		ma.setStoreId(mb.getStoreId());//店铺id
		Integer appointedNum = this.memberCenterCustomService.appointedNum(ma);
		if(appointedNum >= 10){
			return 0;//满员
		}else if(appointedNum < 10 && appointedNum >= 0){
			return 1;//可指定
		}else{
			return -1;//错误
		}
	}
	/**
	 * 指定我的跟单人
	 */
	@RequestMapping("/appoint.do")
	@ResponseBody
	public Integer appoint(HttpSession session,
								MergerAppoint ma){
		//ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		//Integer userId = mb.getId();
		Integer storeId = mb.getStoreId();
		ma.setMemberId(mb.getId());
		ma.setStoreId(storeId);

		return this.memberCenterCustomService.appoint(ma);
	}
	
	/**
	 * 接受指定我为跟单人的跟单
	 */
	@RequestMapping("/acceptAppoint.do")
	@ResponseBody
	public Integer acceptAppoint(HttpSession session,			
								 MergerOrder mo,
								 MergerCustom mc,
								 MergerAppoint ma){
		Member mb = (Member) session.getAttribute("member");
		ma.setMemberId(mo.getUserid());
		ma.setAppointMemberId(mb.getId());
		ma.setStoreId(mb.getStoreId());
		ma.setState(MergerAppoint.STATE_ACCEPT);
		
		if(mo != null && mc!= null){
			mc.setStoreId(mb.getStoreId());			//	店铺ID
			mc.setCustomizedMemberId(mo.getUserid());//	被定制彩民ID
			mc.setCustomizingMemberId(mb.getId());	//	定制彩民ID
//			if(mc.getAppointed() == 0){//(未指定)如果是被指定的定制跟单，则session的userID为被指定彩民Id
//				mc.setCustomizedMemberId(mo.getUserid());//	被定制彩民ID
//				mc.setCustomizingMemberId(mb.getId());	//	定制彩民ID
//			}else if(mc.getAppointed() == 1){//(被指定)
//				mc.setCustomizedMemberId(mb.getId());	//	被定制彩民ID
//				mc.setCustomizingMemberId(mo.getUserid());//	定制彩民ID
//			}
			mc.setLicenseId(mo.getLicenseId());		//	定制彩种
			mc.setCustomMode(mc.getCustomMode());	//	跟单方式:1-固定金额跟单，2-按照比例跟单
			mc.setPerNum(0);						//	0-无限制，如果被定制人一期发起多次，则跟单多次
			//mc.setAppointed(MergerCustom.APPOINT_TYPE_NO_APPOINT);						//	是否被指定,0-未指定，1-指定，最多指定10个
			mc.setCusDate(DateUtil.getDateFormat2());
			mc.setState(MergerCustom.STATE_MORMAL);
			if(this.customService.mergerCustomInfo(mc) == 1){
				return this.memberCenterCustomService.updateAppoint(ma);
			}else
				return -1;
		}else{
			return -1;
		}
	}
	
	/**
	 * 拒绝指定我为跟单人的跟单
	 */
	@RequestMapping("/refuseAppoint.do")
	@ResponseBody
	public Integer refuseAppoint(HttpSession session,
								MergerAppoint ma){
		//ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		ma.setAppointMemberId(mb.getId());
		ma.setStoreId(mb.getStoreId());
		ma.setState(MergerAppoint.STATE_REFUSE);
		//Integer result = this.memberCenterCustomService.updateAppoint(ma);
		return this.memberCenterCustomService.updateAppoint(ma);
	}
	
	//判断定制信息是否已经存在，如果不存在插入一条MC
	@RequestMapping("/isExist.do")
	@ResponseBody
	public Integer isExist(HttpSession session,
			MergerAppoint ma){		
		if(ma != null){
			MergerCustom mc = new MergerCustom();
			Member mb = (Member)session.getAttribute("member");
			mc.setStoreId(mb.getStoreId());
			mc.setCustomizedMemberId(mb.getId());//	被定制彩民ID
			mc.setCustomizingMemberId(ma.getMemberId());	//	定制彩民ID
			mc.setLicenseId(ma.getLicenseId());		//	定制彩种
			return this.customService.mergerCustomInfo(mc);
		}else{
			return -1;
		}
	}
}
