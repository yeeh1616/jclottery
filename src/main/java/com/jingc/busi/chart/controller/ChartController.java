/**
 * 
 */
package com.jingc.busi.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>File: ChartController.java</p>
 * <p>Desc: 走势图Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/chart/")
public class ChartController {

	@RequestMapping("/index.jhtml")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/index");
		return mv;
	}
	
	/******************************************
	 * *************排列三*******************
	 ******************************************/
	@RequestMapping("/ps_index.jhtml")
	public ModelAndView psIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/index");
		return mv;
	}
	@RequestMapping("/ps_kd.jhtml")
	public ModelAndView psKd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/kd");
		return mv;
	}
	@RequestMapping("/ps_zx.jhtml")
	public ModelAndView psZx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/zx");
		return mv;
	}
	@RequestMapping("/ps_wx.jhtml")
	public ModelAndView pxWx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/wx");
		return mv;
	}
	@RequestMapping("/ps_dx.jhtml")
	public ModelAndView pxDx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/dx");
		return mv;
	}
	@RequestMapping("/ps_jou.jhtml")
	public ModelAndView psJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/jou");
		return mv;
	}
	@RequestMapping("/ps_dzx.jhtml")
	public ModelAndView psDzx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/dzx");
		return mv;
	}
	@RequestMapping("/ps_wh.jhtml")
	public ModelAndView psWh() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/wh");
		return mv;
	}
	@RequestMapping("/ps_ys5.jhtml")
	public ModelAndView psYs5() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/ys5");
		return mv;
	}
	@RequestMapping("/ps_ys7.jhtml")
	public ModelAndView psYs7() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/ys7");
		return mv;
	}
	@RequestMapping("/ps_hz.jhtml")
	public ModelAndView psHz() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/pls/hz");
		return mv;
	}
	
	/******************************************
	 * *************排列五*******************
	 ******************************************/
	@RequestMapping("/pw_index.jhtml")
	public ModelAndView pwIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/index");
		return mv;
	}
	@RequestMapping("/pw_wx.jhtml")
	public ModelAndView pwWx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/wx");
		return mv;
	}
	@RequestMapping("/pw_dx.jhtml")
	public ModelAndView pwDx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/dx");
		return mv;
	}
	@RequestMapping("/pw_jou.jhtml")
	public ModelAndView pwJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/jou");
		return mv;
	}
	@RequestMapping("/pw_zot.jhtml")
	public ModelAndView pwZot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/zot");
		return mv;
	}
	@RequestMapping("/pw_dzx.jhtml")
	public ModelAndView pwDzx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/dzx");
		return mv;
	}
	@RequestMapping("/pw_ys5.jhtml")
	public ModelAndView pwYs5() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/ys5");
		return mv;
	}
	@RequestMapping("/pw_ys7.jhtml")
	public ModelAndView pwYs7() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/ys7");
		return mv;
	}
	@RequestMapping("/pw_hz.jhtml")
	public ModelAndView pwHz() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/hz");
		return mv;
	}
	@RequestMapping("/pw_zh.jhtml")
	public ModelAndView pwZh() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/plw/zh");
		return mv;
	}
	
	/******************************************
	 * *************七星彩*******************
	 ******************************************/
	@RequestMapping("/qx_index.jhtml")
	public ModelAndView qxcIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/index");
		return mv;
	}
	@RequestMapping("/qx_wx.jhtml")
	public ModelAndView qxcWx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/wx");
		return mv;
	}
	@RequestMapping("/qx_dx.jhtml")
	public ModelAndView qxcDx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/dx");
		return mv;
	}
	@RequestMapping("/qx_jou.jhtml")
	public ModelAndView qxcJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/jou");
		return mv;
	}
	@RequestMapping("/qx_zot.jhtml")
	public ModelAndView qxcZot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/zot");
		return mv;
	}
	@RequestMapping("/qx_dzx.jhtml")
	public ModelAndView qxcDzx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/dzx");
		return mv;
	}
	@RequestMapping("/qx_ys5.jhtml")
	public ModelAndView qxcYs5() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/ys5");
		return mv;
	}
	@RequestMapping("/qx_ys7.jhtml")
	public ModelAndView qxcYs7() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/ys7");
		return mv;
	}
	@RequestMapping("/qx_hz.jhtml")
	public ModelAndView qxcHz() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/hz");
		return mv;
	}
	@RequestMapping("/qx_zh.jhtml")
	public ModelAndView qxcZh() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qxc/zh");
		return mv;
	}
	
	/******************************************
	 * *************大乐透*******************
	 ******************************************/
	@RequestMapping("/dlt_index.jhtml")
	public ModelAndView dltIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/dlt/index");
		return mv;
	}
	@RequestMapping("/dlt_jmfb.jhtml")
	public ModelAndView dltJmfb() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/dlt/jmfb");
		return mv;
	}
	@RequestMapping("/dlt_tmfb.jhtml")
	public ModelAndView dltTmfb() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/dlt/tmfb");
		return mv;
	}
	@RequestMapping("/dlt_jofb.jhtml")
	public ModelAndView dltJofb() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/dlt/jofb");
		return mv;
	}
	@RequestMapping("/dlt_ysfb.jhtml")
	public ModelAndView dltYsfb() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/dlt/ysfb");
		return mv;
	}
	
	/******************************************
	 * *************双色球*******************
	 ******************************************/
	@RequestMapping("/ssq_index.jhtml")
	public ModelAndView ssqIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/ssq/index");
		return mv;
	}
	@RequestMapping("/ssq_lq.jhtml")
	public ModelAndView ssqLq() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/ssq/lq");
		return mv;
	}
	@RequestMapping("/ssq_hq.jhtml")
	public ModelAndView ssqHp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/ssq/hq");
		return mv;
	}
	@RequestMapping("/ssq_jou.jhtml")
	public ModelAndView ssqJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/ssq/jou");
		return mv;
	}
	@RequestMapping("/ssq_ys.jhtml")
	public ModelAndView ssqYs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/ssq/ys");
		return mv;
	}
	
	/******************************************
	 * ************七乐彩*******************
	 ******************************************/
	@RequestMapping("/qlc_index.jhtml")
	public ModelAndView qlcIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qlc/index");
		return mv;
	}
	@RequestMapping("/qlc_jou.jhtml")
	public ModelAndView qlJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qlc/jou");
		return mv;
	}
	@RequestMapping("/qlc_ys.jhtml")
	public ModelAndView qlcYs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/qlc/ys");
		return mv;
	}
	
	/******************************************
	 * *************福彩3d*******************
	 ******************************************/
	@RequestMapping("/f3d_index.jhtml")
	public ModelAndView f3dIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/index");
		return mv;
	}
	@RequestMapping("/f3d_dx.jhtml")
	public ModelAndView f3dDx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/dx");
		return mv;
	}
	@RequestMapping("/f3d_dzx.jhtml")
	public ModelAndView f3Dzx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/dzx");
		return mv;
	}
	@RequestMapping("/f3d_hz.jhtml")
	public ModelAndView f3dHz() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/hz");
		return mv;
	}
	@RequestMapping("/f3d_jou.jhtml")
	public ModelAndView f3dJou() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/jou");
		return mv;
	}
	@RequestMapping("/f3d_kd.jhtml")
	public ModelAndView f3dKd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/kd");
		return mv;
	}
	@RequestMapping("/f3d_wh.jhtml")
	public ModelAndView f3dWh() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/wh");
		return mv;
	}
	@RequestMapping("/f3d_wx.jhtml")
	public ModelAndView f3dWx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/wx");
		return mv;
	}
	@RequestMapping("/f3d_ys5.jhtml")
	public ModelAndView f3dYs5() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/ys5");
		return mv;
	}
	@RequestMapping("/f3d_ys7.jhtml")
	public ModelAndView f3dYs7() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/ys7");
		return mv;
	}
	@RequestMapping("/f3d_zh.jhtml")
	public ModelAndView f3dZh() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/zh");
		return mv;
	}
	@RequestMapping("/f3d_zot.jhtml")
	public ModelAndView f3dZot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/zot");
		return mv;
	}
	@RequestMapping("/f3d_zx.jhtml")
	public ModelAndView f3dZx() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/f3d/zx");
		return mv;
	}
	/**
	 * 返回头部
	 * @return
	 */
	@RequestMapping("/top.jhtml")
	public ModelAndView top() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/header");
		return mv;
	}
	/**
	 * 返回尾部
	 * @return
	 */
	@RequestMapping("/footer.jhtml")
	public ModelAndView footer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chart/cytxfooter");
		return mv;
	}
}
