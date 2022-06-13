/**
 * 
 */
package com.jingc.busi.datacenter.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.common.util.PropertiesTool;
import com.jingc.file.util.ParseString;

/**
 * <p>
 * File: MemberCenterController.java
 * </p>
 * <p>
 * Desc: 足彩数据中心
 * </p>
 * <p>
 * Copyright: Copyright (c) 2013
 * </p>
 * <p>
 * Company: 北京中科易达科技发展有限责任公司
 * </p>
 * 
 * @author 王和平
 * @version 1.0 2014-3-4
 *          <p>
 *          修改者姓名 修改内容说明
 *          </p>
 * @see 参考类1
 */
@Controller
@RequestMapping("/datacenter/")
public class DataCenterController {
	//@Resource
	//private DataCenterService dataCenterService;
	public String doGet( String url, String  encoding ) throws Exception {
    	URL _url = new URL(url);
		//InputStream in = _url.openStream();
		URLConnection conn = _url.openConnection();
        InputStream in = conn.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(in,encoding));
		String readLine = "";
		String retObj = "";
		while ( (readLine = reader.readLine()) != null ) {
			retObj += readLine + "\n";
		}
		reader.close();
		in.close();
		return retObj;
    }
	
	/*
	 * 欧洲赔率
	 */
	@RequestMapping("/europ.jhtml")
	public ModelAndView oup(HttpSession session,String schudlesNo) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("schudleId", getLeidaDateId(schudlesNo));
		//schudlesNo = "67244";
		mv.addObject("schudlesNo", schudlesNo);
		try {
			String html = doGet("http://101.200.213.247:9380/global/oyx/9/file/ou_"+schudlesNo+".html", "utf-8");
			mv.addObject("fileHtml", html);
		} catch (Exception e) {
		}
		//mv.addObject("fileurl",  "/data/lottery/guess/foot/file/ou_" + schudlesNo + ".jsp");
		mv.setViewName("datacenter/oup");
		return mv;
	}
	
	/*
	 * 亚洲赔率
	 */
	@RequestMapping("/asia.jhtml")
	public ModelAndView yap(HttpSession session,String schudlesNo) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("schudleId", getLeidaDateId(schudlesNo));
		//schudlesNo = "67244";
		mv.addObject("schudlesNo", schudlesNo);
		try {
			String html = doGet("http://101.200.213.247:9380/global/oyx/9/file/ya_"+schudlesNo+".html", "utf-8");
			mv.addObject("fileHtml", html);
		} catch (Exception e) {
		}
		//mv.addObject("fileurl",  "/data/lottery/guess/foot/file/ya_" + schudlesNo + ".jsp");
		mv.setViewName("datacenter/yap");
		return mv;
	}
	
	/*
	 * 数据分析
	 */
	@RequestMapping("/analyse.jhtml")
	public ModelAndView fx(HttpSession session,String schudlesNo) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("schudleId", getLeidaDateId(schudlesNo));
		//schudlesNo = "67244";
		mv.addObject("schudlesNo", schudlesNo);
		try {
			String html = doGet("http://101.200.213.247:9380/global/oyx/9/file/xi_"+schudlesNo+".html", "utf-8");
			mv.addObject("fileHtml", html);
		} catch (Exception e) {
		}
		//mv.addObject("fileurl",  "/data/lottery/guess/foot/file/xi_" + schudlesNo + ".jsp");
		mv.setViewName("datacenter/fx");
		return mv;
	}
	
	/*
	 * 即时比分
	 */
	@RequestMapping("/jsbf.jhtml")
	public ModelAndView jsbf(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("fileurl",  "/data/lottery/guess/foot/jsbf.jsp");
		mv.setViewName("datacenter/jsbf");
		return mv;
	}
	
	public String getLeidaDateId(String schudlesNo){
		HashMap<String,String> map_ = new HashMap<String,String>();
		String xmlContent = ParseString.getPageContent("http://www.leida310.com/sporttery_file/fhwc/match.xml", "utf-8");
		ArrayList<String> trList = ParseString.arrayByRange(xmlContent, 
				                   "Match num=", "dateOfMatch", "", "", false, 500);
		if(trList != null){
			for(String trContent:trList){
				String id = ParseString.RangeInner(trContent, "ID=\"", "\"");
				String UniqueMatchId = ParseString.RangeInner(trContent, "UniqueMatchId=\"", "\"");
				//System.out.println(id+":"+UniqueMatchId);
				map_.put(id, UniqueMatchId);
			}
		} 
		return map_.get(schudlesNo);
	}
	
	public static void main(String[] args){
		System.out.println(new DataCenterController().getLeidaDateId("67229"));
		/*try{
			Date date = new SimpleDateFormat("yyyyMMddHHmm").parse("20150317192900");
			System.out.println(date);
		}catch(Exception e){}*/
		
	}
}
