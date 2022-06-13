/**
 * 
 */
package com.jingc.busi.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>File: SessionInterceptor.java</p>
 * <p>Desc: session校验</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-5-7
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class SessionInterceptor implements HandlerInterceptor {

	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		if ( null == request.getSession().getAttribute("member") ) {
			response.sendRedirect("/");
			return false;
		}
		return true;
	}

}
