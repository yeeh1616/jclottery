/**
 * 
 */
package com.jingc.busi.copyorder.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.copyorder.service.CopyOrderService;

/**
 * <p>File: MemberCopyOrderController.java</p>
 * <p>Desc: 复制跟单查询Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-24
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
public class MemberCopyOrderController {
	
	@Resource
	private CopyOrderService copyOrderService;
	
	/*
	 * 我的定制复制
	 */
	@RequestMapping("/memberCenter/mycopyCust.jhtml")
	public ModelAndView myCopyCust(HttpSession session,Integer licenseId, Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Pagination pagination = this.copyOrderService.queryMyCopyCust(mb.getId(), licenseId, pageNo, pageSize);
		mv.addObject("pagination",pagination);
		mv.setViewName("copyorder/mycopycust");
		return mv;
	}
	
	/*
	 * 我被定制的定制复制
	 */
	@RequestMapping("/memberCenter/mycopyedCust.jhtml")
	public ModelAndView myCopyedCust(HttpSession session,Integer licenseId, Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Pagination pagination = this.copyOrderService.queryMyCopyedCust(mb.getId(), licenseId, pageNo, pageSize);
		mv.addObject("pagination",pagination);
		mv.setViewName("copyorder/mycopyedcust");
		return mv;
	}
	
	/*
	 * 我被定制的定制复制
	 */
	@RequestMapping("/memberCenter/cancelCopy.json")
	@ResponseBody
	public String cancel(HttpSession session,Integer id) {
		Member mb = (Member) session.getAttribute("member");
		try {
			this.copyOrderService.cancelCust(mb, id);
		} catch ( BaseException be ) {
			return be.getErrMsg();
		}
		return "取消定制成功";
	}

	/*
	 * 我复制的订单
	 */
	@RequestMapping("/memberCenter/mycopyorder.jhtml")
	public ModelAndView myCopyOrder(HttpSession session,Integer licenseId, Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Pagination pagination = this.copyOrderService.queryMyCopyOrders(mb.getStoreId(), mb.getId(), licenseId, pageNo, pageSize);
		mv.addObject("pagination",pagination);
		mv.setViewName("copyorder/mycopyorder");
		return mv;
	}
	
	/*
	 * 复制我的的订单
	 */
	@RequestMapping("/memberCenter/mycopyedorder.jhtml")
	public ModelAndView myCopyedOrder(HttpSession session,Integer licenseId, Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Member mb = (Member) session.getAttribute("member");
		Pagination pagination = this.copyOrderService.queryMyCopyedOrders(mb.getStoreId(), mb.getId(), licenseId, pageNo, pageSize);
		mv.addObject("pagination",pagination);
		mv.setViewName("copyorder/mycopyedorder");
		return mv;
	}
}
