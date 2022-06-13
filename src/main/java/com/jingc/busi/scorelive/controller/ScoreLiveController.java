/**
 * 
 */
package com.jingc.busi.scorelive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>File: ScoreLiveController.java</p>
 * <p>Desc: 及时比分Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/scorelive/")
public class ScoreLiveController {

	@RequestMapping("/index.jhtml")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("scorelive/index");
		return mv;
	}
}
