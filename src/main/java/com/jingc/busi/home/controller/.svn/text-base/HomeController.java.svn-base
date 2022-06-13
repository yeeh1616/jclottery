/**
 * 
 */
package com.jingc.busi.home.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jingc.afc.util.CheckMobile;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.NewsInfo;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreImage;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.common.table.StoreSatis;
import com.jingc.busi.freq.FreqPeriod;
import com.jingc.busi.freq.FreqPeriodFactory;
import com.jingc.busi.home.service.HomeService;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.common.util.PropertiesTool;
import com.jingc.file.util.ParseString;

/**
 * <p>File: HomeController.java</p>
 * <p>Desc: 首页Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
public class HomeController {
	
	@Resource
	private HomeService homeService;
	
	@Resource
	private LotteryService lotteryService;
	
	@Resource
	private LoginService loginService;
	
	/**
	 * 手机首页
	 * @return
	 */
	/*@RequestMapping("/wap/index.do")
	public ModelAndView indexMobile(HttpServletRequest request,
							  HttpServletResponse response,
							  HttpSession session, String uuid) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("mobile/home/index");
        return mv;
	}*/
	
	/**
	 * cp020网站首页
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/index")
	public ModelAndView index(HttpSession session,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  String uuid, ModelMap modelmap)  throws Exception {
		ModelAndView mv = new ModelAndView();
		//主站不到店铺页
		String url = request.getHeader("host");
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
		String doMain = pTool.getValue("doMain");
		
		//System.out.println("doMain:" + doMain + ";member:" + request.getSession().getAttribute("member"));
		if( doMain.equals(url) ) {
			/*if ( null == request.getSession().getAttribute("member") ) {
				mv.setViewName("home/homePage");
			} else {
				mv.setViewName("home/newindex");
			}*/
			//response.sendRedirect("/cytx/index.html");
			mv.setViewName("redirect:http://" + doMain + "/cytx/index.html");
		} else {
			// 移动端判断
			String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();    
	        if ( null == userAgent ) {    
	            userAgent = "";    
	        }  
	        boolean isFromMobile = CheckMobile.check(userAgent);  
	        mv.addObject("isFromMobile", isFromMobile);
	        //判断是否为移动端访问  
	        //System.out.print(isFromMobile + ";");
	        if ( isFromMobile ) {  
	        	Store s = (Store)session.getAttribute("domain");
	        	modelmap.put("storeId", s.getStoreId());
	        	modelmap.put("mfrom", "4");
	        	
	        	//System.out.println(s.getNetUrl());
	        	if(s != null && (s.getNetUrl().indexOf("cp020") > -1 || s.getNetUrl().indexOf("CP020") > -1)){
					return new ModelAndView(new RedirectView("http://m.cp020.com/"),modelmap); 
				}else{
					PropertiesTool pt = new PropertiesTool("/jc.properties");
					String mobileHost = pt.getValue("mobileHost") == null ? "" : pt.getValue("mobileHost");
					System.out.println("mobileHost=" + mobileHost);
					if(mobileHost == null) mobileHost = "m.cp020.com";
					return new ModelAndView(new RedirectView("http://" + mobileHost),modelmap); 
				}
	        	//return new ModelAndView(new RedirectView("http://m.cp020.com/"),modelmap); 
	        } 
			Game game = this.lotteryService.getCurrentGame(Constants.LICENSE_14SFC, 0);
			mv.addObject("game", game);
			mv.setViewName("home/newindex");
		}
		
		//代理推广
		String agent = "";
		Enumeration en = request.getParameterNames();  
		while(en.hasMoreElements()){  
			agent = (String)request.getParameter("agent");
			break;
		}  
		if(agent == null) agent="";
		Integer agentId = -1;
		if( agent.length() > 0 ){
			try{
				agentId = Integer.valueOf(agent,8);
				//验证是否存在这个代理
				Member member = this.loginService.getOneMember(agentId);
				if(member != null && MemberUtil.AGENT.equals(member.getReserved3())){
					session.setAttribute("agentId", agentId+"");
				}
			} catch(Exception e){
			}
		}
		
		return mv;
	}
	/**
	 * 获取中奖图片
	 * @param licenseId
	 * @return
	 */
	@RequestMapping("/getpicture.jhtml")
	@ResponseBody
	public JSONArray getPicture(HttpSession session, Integer licenseId) {
		Store store = ((Store)session.getAttribute("domain"));
		List<StoreImage> storeImage=new ArrayList<StoreImage>();
		if(store!=null){
			storeImage=this.homeService.oldpictureByStoreid(store);
		}
		return JSONArray.fromObject(storeImage);
	}
	/**
	 * 获取当前期次信息
	 * @param licenseId
	 * @return
	 */
	@RequestMapping("/getCurrentGame.json")
	@ResponseBody
	public String getCurrentGame(HttpSession session, Integer licenseId) {
		int aheadset = 0;	// 分钟
		StoreLicenseKey key = new StoreLicenseKey();
		key.setStoreId(((Store)session.getAttribute("domain")).getStoreId());
		key.setLicenseId(licenseId);
		StoreLicense csl = this.lotteryService.getStoreLicense(key);
		// 设置提前截止时间
		if ( null != csl.getBuyAheadTime() && !"".equals(csl.getBuyAheadTime()) ) {
			aheadset = Integer.parseInt(csl.getBuyAheadTime());
		} else {
			try {
				key.setStoreId(-1);
				aheadset = Integer.parseInt(this.lotteryService.getStoreLicense(key).getBuyAheadTime());
			} catch ( Exception ex ) {
				aheadset = 2;
			}
		}
		if ( aheadset > 30 || aheadset < 0 ) {
			aheadset = 2;
		}
		Game game = null;
		if ( licenseId < 100 ) {
			game = this.homeService.getCurrentGame(licenseId, 0);
			Date nextTime = DateUtil.getDate(game.getStopTime(), "yyyy-MM-dd HH:mm:ss");
			Calendar c = Calendar.getInstance();
			c.setTime(nextTime);
			c.add(Calendar.MINUTE, -aheadset);
			Date date = c.getTime();
			game.setStopTime(DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", date));
		} else {
			game = new Game();
			if ( aheadset > 5 ) {
				aheadset = 0;
			}
			FreqPeriod fq = FreqPeriodFactory.getFreqPeriod(licenseId, aheadset);
			game.setLicenseId(licenseId);
			game.setIssue(fq.getCurrentIssue());
			game.setStopTime(fq.getCurrIssueStopTime());
		}
		return JSONObject.fromObject(game).toString();
	}
	
	/**
	 * 错误界面
	 * @return
	 */
	@RequestMapping("/error.jhtml")
	public ModelAndView error() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error");
		return mv;
	}
	
	/**
	 * 错误界面
	 * @return
	 */
	@RequestMapping("/error2notfound.jhtml")
	public ModelAndView error2notfound() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error2notfound");
		return mv;
	}
	
	/**
	 * 错误界面
	 * @return
	 */
	@RequestMapping("/error3notfound.jhtml")
	public ModelAndView error3notfound() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error3notfound");
		return mv;
	}
	
	@RequestMapping("/news.jhtml")
	public ModelAndView news(Integer conid) {
		ModelAndView mv = new ModelAndView();
		NewsInfo info = this.homeService.getOneNews(conid);
		mv.addObject("info", info);
		mv.setViewName("home/news");
		return mv;
	}
	
	/***
	 * 用户服务协议
	 * @return
	 */
	@RequestMapping("/common/agreement.jhtml")
	public ModelAndView agreement() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("help/xy");
		return mv;
	}
	
	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	} 
	
	/**
	 * 满意度评价
	 * @return
	 */
	@RequestMapping("/evalSatis.json")
	@ResponseBody
	public int evalSatis(HttpSession session, HttpServletRequest request, StoreSatis ss) {
		ss.setStoreId(((Store)session.getAttribute("domain")).getStoreId());
		ss.setIpAddr(getRemortIP(request));
		ss.setSatisDate(DateUtil.getDateFormat2());
		return this.homeService.evalSatis(ss);
	}
	
	/************************************************************************
	 * ************************常用的common*************************************
	 *************************************************************************/
	/***
	 * 财经网图表头
	 */
	@RequestMapping("/common/cjwTop.jhtml")
	public ModelAndView cjwTop(String homeurl) {
		ModelAndView mv = new ModelAndView();
		Store s = this.loginService.getStore(homeurl);
		String storeUrl = s.getNetUrl();
		if(s.getOneStoreId().intValue() == 1){//福彩店
			mv.setViewName("redirect:http://" + storeUrl + "/chart/top.jhtml");
		}else{
			mv.addObject("store", s);
			mv.setViewName("include/cjwheader");
			//mv.setViewName("redirect:http://" + storeUrl + "/include/cjwheader.jhtml");
		}
		//return "redirect:http://20109.cp020.com/common/cjwTop.jhtml";
		return mv;
	} 
	
	/***
	 * 财经网图表头
	 */
	@RequestMapping("/common/cjwBottom.jhtml")
	public ModelAndView cjwBottom(String homeurl) {
		ModelAndView mv = new ModelAndView();
		Store s = this.loginService.getStore(homeurl);
		String storeUrl = s.getNetUrl();
		if(s.getOneStoreId().intValue() == 1){//福彩店
			mv.setViewName("redirect:http://" + storeUrl + "/chart/footer.jhtml");
		}else{
			mv.addObject("store", s);
			mv.setViewName("include/cjwfooter");
			//mv.setViewName("redirect:http://" + storeUrl + "/include/cjwfooter.jhtml");
		}
		return mv;
	} 
	
	/**
	 * 编码格式转换
	 * @param request
	 * @param sid
	 * @param mid
	 * @param key
	 * @param limit
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/strs.json")
	@ResponseBody
	public String changeCode(HttpServletRequest request,@RequestParam(required = false) String sid,@RequestParam(required = false) String mid,@RequestParam(required = false)	String key,@RequestParam(required = false)	String limit) throws UnsupportedEncodingException{
		String nurl = "http://info.sporttery.cn/football/info/fb_his_interface.php?action=order&sid="+sid+"&mid="+mid+"&key="+key+"&order="+key+"&limit="+limit+"&hid="+552+"&aid="+1019;
		String str = ParseString.getPageContent(nurl, "gb2312");
		String str1 = ParseString.RangeOuter(str, "<table", "</table>");
		byte[] bs = str1.getBytes();
		String strs = new String(bs,"gbk");
		return strs;
	}
	
	/***
	 * 首页扫描
	 * @return
	 */
	/*@RequestMapping("/mobile/index.jhtml")
	public ModelAndView mobile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mobile/wap");
		return mv;
	} */
	
	/***
	 * 手机频道
	 * @param request
	 * @param storeUrl  店铺地址
	 * @return
	 */
	@RequestMapping("/wap/index.jhtml")
	public ModelAndView wap(HttpServletRequest request,HttpSession session,String storeUrl) {
		ModelAndView mv = new ModelAndView();
		// 移动端判断
		String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();    
        if ( null == userAgent ) {    
            userAgent = "";    
        }  
        boolean isFromMobile = CheckMobile.check(userAgent);  
        //判断是否为移动端访问  
        if ( isFromMobile ) {  
        	Store s = loginService.getStore(storeUrl);
        	mv.addObject("homeUrl", s.getNetUrl());
        	mv.setViewName("mobile/wap");//wap
        }else{
        	mv.setViewName("mobile/web");//web
        }
		return mv;
	} 
	
	/***********************************************************************
	 ************热点项目*******************
	 **********************************************************************/
	/**
	 * cp020网站首页
	 * @return
	 */
	/*@SuppressWarnings("unchecked")
	@RequestMapping("/rdIndex")
	public ModelAndView rdIndex(HttpSession session,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  String uuid, ModelMap modelmap) {
		ModelAndView mv = new ModelAndView();
		//主站不到店铺页
		String url = request.getHeader("host");
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
		String doMain = pTool.getValue("doMain");
		
		if( doMain.equals(url) ) {
			if ( null == request.getSession().getAttribute("member") ) {
				mv.setViewName("home/homePage");
			} else {
				mv.setViewName("home/newindex");
			}
		} else {
			// 移动端判断
			String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();    
	        if ( null == userAgent ) {    
	            userAgent = "";    
	        }  
	        boolean isFromMobile = CheckMobile.check(userAgent);  
	        mv.addObject("isFromMobile", isFromMobile);
	        //判断是否为移动端访问  
	        if ( isFromMobile ) {  
	        	Store s = (Store)session.getAttribute("domain");
	        	modelmap.put("storeId", s.getStoreId());
	        	modelmap.put("mfrom", "4");
	        	return new ModelAndView(new RedirectView("http://m.cyrd360.com/"),modelmap); 
	        } 
			Game game = this.lotteryService.getCurrentGame(Constants.LICENSE_14SFC, 0);
			mv.addObject("game", game);
			mv.setViewName("home/newrdindex");
		}
		
		//代理推广
		String agent = "";
		Enumeration en = request.getParameterNames();  
		while(en.hasMoreElements()){  
			agent = (String)request.getParameter("agent");
			break;
		}  
		if(agent == null) agent="";
		Integer agentId = -1;
		if( agent.length() > 0 ){
			try{
				agentId = Integer.valueOf(agent,8);
				//验证是否存在这个代理
				Member member = this.loginService.getOneMember(agentId);
				if(member != null && MemberUtil.AGENT.equals(member.getReserved3())){
					session.setAttribute("agentId", agentId+"");
				}
			} catch(Exception e){
			}
		}
		
		return mv;
	}*/
}
