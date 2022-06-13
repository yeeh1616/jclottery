/**
 * 
 */
package com.jingc.busi.lotteryopen.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>File: LotteryOpenController.java</p>
 * <p>Desc: 彩票开奖Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/lotteryopen/")
public class LotteryOpenController {
	
	@RequestMapping("/index.jhtml")
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/index");
		return mv;
	}
	
	@RequestMapping("/ps.jhtml")
	public ModelAndView ps(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/ps");
		return mv;
	}
	
	@RequestMapping("/pw.jhtml")
	public ModelAndView pw(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/pw");
		return mv;
	}
	
	@RequestMapping("/qx.jhtml")
	public ModelAndView qx(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/qx");
		return mv;
	}
	
	@RequestMapping("/dlt.jhtml")
	public ModelAndView dlt(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/dlt");
		return mv;
	}
	
	@RequestMapping("/tc61.jhtml")
	public ModelAndView fc_61(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/tc61");
		return mv;
	}
	
	@RequestMapping("/sfc.jhtml")
	public ModelAndView sfc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/sfc");
		return mv;
	}
	
	@RequestMapping("/bqc.jhtml")
	public ModelAndView bqc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/bqc");
		return mv;
	}
	
	@RequestMapping("/jqc.jhtml")
	public ModelAndView jqc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/jqc");
		return mv;
	}
	
	@RequestMapping("/jc.jhtml")
	public ModelAndView jc(HttpSession session , String currDate) {
		ModelAndView mv = new ModelAndView();
		if(currDate == null)
			currDate = (getSenvenDate().get(0))[1];
		//当前天前一个周的时间
		mv.addObject("beforeWeek",getSenvenDate());
		mv.addObject("currDate",currDate);
		mv.setViewName("lotteryopen/jc");
		return mv;
	}
	
	@RequestMapping("/jclq.jhtml")
	public ModelAndView jclq(HttpSession session , String currDate) {
		ModelAndView mv = new ModelAndView();
		if(currDate == null)
			currDate = (getSenvenDate().get(0))[1];
		//当前天前一个周的时间
		mv.addObject("beforeWeek",getSenvenDate());
		mv.addObject("currDate",currDate);
		
		mv.setViewName("lotteryopen/jclq");
		return mv;
	}
	
	/**
	 * 胜负过关 zh
	 * @return
	 */
	@RequestMapping("/sfgg.jhtml")
	public ModelAndView sfgg(HttpSession session, String currDate){
		ModelAndView mv = new ModelAndView();
		if(currDate == null)
			currDate = (getSenvenDate().get(0))[1];
		//当前天前一个周的时间
		mv.addObject("beforeWeek",getSenvenDate());
		mv.addObject("currDate",currDate);
		
		mv.setViewName("lotteryopen/sfgg");

		return mv;
	}
	
	/**
	 * 北京单场 zh
	 * @return
	 */
	@RequestMapping("/bjdc.jhtml")
	public ModelAndView bjdc(HttpSession session, String currDate){
		ModelAndView mv = new ModelAndView();
		if(currDate == null)
			currDate = (getSenvenDate().get(0))[1];
		//当前天前一个周的时间
		mv.addObject("beforeWeek",getSenvenDate());
		mv.addObject("currDate",currDate);
		
		mv.setViewName("lotteryopen/bjdc");
		return mv;
	}
	
	@RequestMapping("/ssq.jhtml")
	public ModelAndView ssq(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/ssq");
		return mv;
	}
	
	@RequestMapping("/f3d.jhtml")
	public ModelAndView f3d(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/f3d");
		return mv;
	}
	
	@RequestMapping("/qlc.jhtml")
	public ModelAndView qlc(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lotteryopen/ql");
		return mv;
	}
	public static ArrayList<String[]> getSenvenDate(){
		ArrayList<String[]> date_ = new ArrayList<String[]>();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd"); 
		Calendar c = null;
		for(int i = 0 ; i < 8 ; i++){
			c = Calendar.getInstance();
			int nowDay = c.get(Calendar.DAY_OF_MONTH);
			c.set(Calendar.DATE, nowDay - i);
			Date date = c.getTime(); 
			date_.add(new String[]{format1.format(date),format2.format(date)});
		}
		return date_;
	}
}
