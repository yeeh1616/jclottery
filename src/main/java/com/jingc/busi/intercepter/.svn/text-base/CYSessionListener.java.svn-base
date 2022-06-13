/**
 * 
 */
package com.jingc.busi.intercepter;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.lotteryopen.task.Startup;

/**
 * <p>File: CYSessionListener.java</p>
 * <p>Desc: Session监听器</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-11-5
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class CYSessionListener implements HttpSessionListener, ServletRequestListener {
	
    private  HttpServletRequest request;  

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		Store s = null;
		if ( null == session.getAttribute("domain") ) {
			s = ((LoginService)Startup.getSpringContext().getBean("loginService")).getStore(request.getHeader("host"));
		} else {
			//s = (Store)session.getAttribute("domain");
		}
		if ( null != s ) {
			CacheUtil.setStoreOnlineStatistics(s.getStoreId(), 1, true);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		// 判断是否存在登录用户
		if ( null != session.getAttribute("member") ) {
			Member m = (Member)session.getAttribute("member");
			CacheUtil.setStoreOnlineStatistics(m.getStoreId(), 2, false);
			CacheUtil.setStoreOnlineStatistics(m.getStoreId(), 1, false);
		} else {
			Store s = (Store)session.getAttribute("domain");
			if ( null != s ) {
				CacheUtil.setStoreOnlineStatistics(s.getStoreId(), 1, false);
			}
		}
	}

	@Override
	public void requestDestroyed(ServletRequestEvent event) {
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent event) {
		request = (HttpServletRequest)event.getServletRequest();
	}

}
