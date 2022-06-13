/**
 * 
 */
package com.jingc.busi.recommend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.recommend.service.RecommendService;

/**
 * <p>File: RecommendController.java</p>
 * <p>Desc: 本店推荐Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/recommend/")
public class RecommendController {
	@Resource
	private RecommendService recommendService;
	
	@RequestMapping("/index.jhtml")
	public ModelAndView index(HttpSession session,Integer type,
								Integer pageNo,Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Pagination pagination= this.recommendService.getNewsList(((Store)session.getAttribute("domain")).getStoreId() , type ,  pageNo, pageSize);
		
		mv.addObject("pagination", pagination);
		mv.setViewName("recommend/index");
		return mv;
	}
}
