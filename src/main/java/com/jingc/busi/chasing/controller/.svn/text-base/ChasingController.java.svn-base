/**
 * 
 */
package com.jingc.busi.chasing.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.busi.chasing.service.ChasingService;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.Member;

/**
 * <p>File: ChasingController.java</p>
 * <p>Desc: 追号Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/chasing/")
public class ChasingController {
	
	@Resource
	private ChasingService chasingService;
	
	/**
	 * 发起追号
	 * @return
	 */
	@RequestMapping("/chase.jhtml")
	public ModelAndView chase(HttpSession session, ChasingOrder order) {
		Member mb = (Member)session.getAttribute("member");
		if(mb != null){
			if (mb.getMemberFrom() == 5 ) {
				throw new BaseException("[营业厅不允许追号投注]");
			}
		}
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		this.chasingService.chase(order);
		ModelAndView mv = new ModelAndView();
		mv.addObject("order", order);
		mv.setViewName("chasing/succ");
		return mv;
	}
	
	/**
	 * 移动端请求
	 * @return
	 */
	@RequestMapping("/chase2mobile.jhtml")
	public ModelAndView chase2mobile(HttpSession session, ChasingOrder order) {
		Member mb = (Member)session.getAttribute("member");
		if(mb != null){
			if (mb.getMemberFrom() == 5 ) {
				throw new BaseException("[营业厅不允许追号投注]");
			}
		}
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		this.chasingService.chase2mobile(order);
		ModelAndView mv = new ModelAndView();
		mv.addObject("order", order);
		mv.setViewName("lottery/succ");
		return mv;
	}

}
