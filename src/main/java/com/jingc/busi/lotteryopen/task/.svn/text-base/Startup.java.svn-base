package com.jingc.busi.lotteryopen.task;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.busi.collection.cache.LocalCache;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.core.service.CommonService;

public class Startup extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3242853736711422045L;
	
	public static String ROOT_PATH;
	
	private static WebApplicationContext springContext;
	
	public static WebApplicationContext getSpringContext() {
		return springContext;
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		ROOT_PATH = this.getServletContext().getRealPath("/").replaceAll("\\\\", "/");
		springContext = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
		
		CommonService s = (CommonService)springContext.getBean("commonService");
		System.out.println("正在重置网站登陆/游客人数...\t");
		List<Store> list = s.getAllStore();
		for ( Store st : list ) {
			CacheUtil.resetStoreOnlineStatistics(st.getStoreId(), 1, 0);
			CacheUtil.resetStoreOnlineStatistics(st.getStoreId(), 2, 0);
		}
		System.out.println("重置网站登陆/游客人数！！！\t");
		
		LocalCache.startClearGuessCacheThread();
		LocalCache.startClearBjDcCacheThread();
	}
}
