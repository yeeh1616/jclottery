/**
 * 
 */
package com.jingc.busi.merger.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.merger.service.CustomService;
import com.jingc.busi.merger.service.MergerQueryService;

/**
 * <p>File: CustomController.java</p>
 * <p>Desc: 定制跟单Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  yuanye
 * @version 1.0 2015-5-16
 * <p>          修改者姓名 修改内容说明</p>
 */
@Controller
@RequestMapping("/merger/")
public class CustomController {
	
	@Resource
	private MergerQueryService mergerQueryService;
	
	@Resource
	private CustomService customService;
	
	/**
	 * 返回定制弹出层
	 */
	@RequestMapping("/customPage.jhtml")
	@ResponseBody
	public ModelAndView customPage(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 MergerOrder mo,
									 Integer appointed){
		ModelAndView mv = new ModelAndView();
		mo = this.mergerQueryService.selectMergerOrder(mo) == null?mo:this.mergerQueryService.selectMergerOrder(mo);
		if(appointed == 0){
			LotteryOrder lo = this.mergerQueryService.selectLotteryOrderByPartnerNoOnly(mo.getId());
			mv.addObject("lo",lo);
		}
		mv.addObject("mo",mo);
		mv.addObject("appointed",appointed);
		mv.setViewName("merger/mergerCustomPopup");
		return mv;
	}
	
	//判断定制信息是否已经存在
	@RequestMapping("/isExist.jhtml")
	@ResponseBody
	public Integer isExist(HttpSession session,
			MergerOrder mo){
		if(mo != null){
			MergerCustom mc = new MergerCustom();
			Member mb = (Member)session.getAttribute("member");
			if(!(mo.getUserid().equals(mb.getId()))){
				mc.setCustomizedMemberId(mo.getUserid());//	被定制彩民ID
				mc.setCustomizingMemberId(mb.getId());	//	定制彩民ID
			}else{
				return -3;
			}
			mc.setLicenseId(mo.getLicenseId());		//	定制彩种
			Integer isCustomSucces = this.customService.mergerCustomInfo(mc);
			return isCustomSucces;
		}else{
			return -1;
		}
	}
	
	//插入定制信息是否成功
	@RequestMapping("/getIsCustomSuccess.jhtml")
	@ResponseBody
	public Integer getIsCustomSucces(HttpSession session,
			MergerOrder mo,
			MergerCustom mc){
//		public static final int STATE_MORMAL = 1;	//	正常
//		public static final int STATE_CANCEL = 2;	//	取消
//		
//		public static final int APPOINT_TYPE_NO_APPOINT = 0;	//	未被指定为跟单人
//		public static final int APPOINT_TYPE_APPOINT = 1;		//	指定跟单人
//		
//	    private Integer id;						//	主键ID
//	    private Integer customizedMemberId;		//	被定制彩民ID --发起人
//	    private Integer customizingMemberId;	//	定制彩民ID
//	    private Integer storeId;				//	店铺ID
//	    private Integer licenseId;				//	定制彩种
//	    private Integer customMode;				//	跟单方式:1-固定金额跟单，2-按照比例跟单v
//	    private Double fixedCusMoney;			//	固定跟单金额,跟单方式1是有效v
//	    private Double cusProp;					//	跟单比例,跟单方式2时有效
//	    private Integer perNum;					//	0-无限制，如果被定制人一期发起多次，则跟单多次
//	    private Integer appointed;				//	是否被指定,0-未指定，1-指定，最多指定10个
//	    private String cusDate;					//	定制时间
//	    private Integer state;					//	状态,1-正常，2-取消，跟单3次失败后自动取消跟单
//	    private String cancelDate;				//	取消定制时间
		if(mo != null && mc!= null){
			Member mb = (Member)session.getAttribute("member");
			mc.setStoreId(mb.getStoreId());			//	店铺ID
			if(mc.getAppointed() == 0){//如果是被指定的定制跟单，则session的userID为被指定彩民Id
				mc.setCustomizedMemberId(mo.getUserid());//	被定制彩民ID
				mc.setCustomizingMemberId(mb.getId());	//	定制彩民ID
			}else{
				mc.setCustomizedMemberId(mb.getId());	//	被定制彩民ID
				mc.setCustomizingMemberId(mo.getUserid());//	定制彩民ID
			}
			mc.setLicenseId(mo.getLicenseId());		//	定制彩种
			mc.setCustomMode(mc.getCustomMode());	//	跟单方式:1-固定金额跟单，2-按照比例跟单
			mc.setPerNum(0);						//	0-无限制，如果被定制人一期发起多次，则跟单多次
			//mc.setAppointed(MergerCustom.APPOINT_TYPE_NO_APPOINT);						//	是否被指定,0-未指定，1-指定，最多指定10个
			mc.setCusDate(DateUtil.getDateFormat2());
			mc.setState(MergerCustom.STATE_MORMAL);
			//Integer isCustomSucces = this.customService.mergerCustomInfo(mc);
			return this.customService.mergerCustomInfo(mc);
		}else{
			return -1;
		}
	}
}
