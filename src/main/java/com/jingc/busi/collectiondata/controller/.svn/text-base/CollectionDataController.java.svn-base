package com.jingc.busi.collectiondata.controller;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.busi.collectiondata.service.CollectionDataService;

@Controller
@RequestMapping("/collectiondata/")
public class CollectionDataController {
	@Resource
	private CollectionDataService collectiondataService;
	
	/**
	 * 进入亚赔赔率页面
	 * @return
	 */
	@RequestMapping("/gueesfootball/asia.jhtml")
	public ModelAndView asiaView(String schudlesNO){
		ModelAndView mv = new ModelAndView();
		mv.addObject("schudlesNO", schudlesNO);
		mv.setViewName("lottery/guess/guessfootball/asiadata");
		return mv;
	}
	
	/**
	 * 进入分析数据页面
	 * @return
	 */
	@RequestMapping("/gueesfootball/analyse.jhtml")
	public ModelAndView analyseView(String schudlesNO){
		ModelAndView mv = new ModelAndView();
		mv.addObject("schudlesNO", schudlesNO);
		mv.setViewName("lottery/guess/guessfootball/analyse");
		return mv;
	}
	
	/**
	 * 进入欧赔赔率页面
	 * @param schudlesNO
	 * @return
	 */
	@RequestMapping("/gueesfootball/europ.jhtml")
	public ModelAndView europView(String schudlesNO){
		ModelAndView mv = new ModelAndView();
		mv.addObject("schudlesNO", schudlesNO);
		mv.setViewName("lottery/guess/guessfootball/europdata");
		return mv;
	}
	
	/**
	 * 读取亚赔赔率文件
	 * @param schudlesNO
	 * @return
	 */
	@RequestMapping("/guessfootball/asiadata.json")
	@ResponseBody
	public JSONArray asiaDataFrom500wan(String schudlesNO){
		return collectiondataService.asiaDataFrom500wan(schudlesNO);
	}
	
	/**
	 * 读取欧赔赔率文件
	 * @param schudlesNO
	 * @return
	 */
	@RequestMapping("/guessfootball/europdata.json")
	@ResponseBody
	public JSONArray europDataFrom500wan(String schudlesNO){
		return collectiondataService.europDataFrom500wan(schudlesNO);
	}
	
	/**
	 * 读取分析数据文件
	 * @param schudlesNO
	 * @param type
	 * @return
	 */
	@RequestMapping("/guessfootball/analysedata.json")
	@ResponseBody
	public JSONArray analyseDataFrom500wan(String schudlesNO, String type){
		return collectiondataService.analyseDataFrom500wan(schudlesNO, type);
	}
}
