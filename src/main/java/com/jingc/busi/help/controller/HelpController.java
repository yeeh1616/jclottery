/**
 * 
 */
package com.jingc.busi.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>File: MergerController.java</p>
 * <p>Desc: 帮助中心Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/help/")
public class HelpController {

	@RequestMapping("/index.jhtml")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("help/index");
		return mv;
	}
}
