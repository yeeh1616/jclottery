/**
 * 
 */
package com.jingc.busi.intercepter;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.common.util.PropertiesTool;

/**
 * <p>File: DomainInterceptor.java</p>
 * <p>Desc: 获取域名对应的店铺</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-4-30
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public class DomainInterceptor implements HandlerInterceptor {
	
	@Resource
	private LoginService loginService;
	
	@Resource private LotteryService lotteryService;

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception exp)
			throws Exception {
		if ( null != exp  ) {
			if ( exp instanceof BaseException ) {
				request.setAttribute("errorMsg", ((BaseException)exp).getErrMsg());
			}
		}
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		String url = request.getRequestURL().toString();
		if (url.contains("error3notfound.jhtml")) {
			return true;
		}
		url = url.substring(url.indexOf("//")+2);
		url = url.substring(0, url.indexOf("/"));
		
		if ( null == request.getSession().getAttribute("domain") ) {
			Store s = this.loginService.getStore(url);
			// 查询彩种
			if ( null != s ) {
				s = setStoreExtendMessage(s);//一些扩展信息
				List<StoreLicense> sls = this.lotteryService.getStoreLicenses(s.getStoreId());
				s.setSls(sls);
			}
			PropertiesTool pt = new PropertiesTool("/page_config.properties");
			request.getSession().setAttribute("pageConfigs", pt.getMap());
			request.getSession().setAttribute("parentName", pt.getValue("web_name"));
			request.getSession().setAttribute("enName", "cp020");
			request.getSession().setAttribute("domain", s);
		}
		// 创建店铺彩种文件
		Store s = (Store)request.getSession().getAttribute("domain");
		if(s != null)
		{
		} else{
			String errorMessage = "您输入的店铺地址有误！";
			String[] urlArr = url.split("\\.");
			if((url.indexOf("www") > -1) && (urlArr.length > 3))
				errorMessage = errorMessage + "店铺地址不能有‘www’前缀。";
			
			StringBuffer currURL = request.getRequestURL();
			String contextUrl = currURL.delete(
					currURL.length() - request.getRequestURI().length(), currURL.length())
					.append("/").toString();
			
			request.setAttribute("errorMsg", errorMessage);
			response.sendRedirect(contextUrl + "error3notfound.jhtml");
		}
		return true;
	}
	
	public Store setStoreExtendMessage(Store store){
		PropertiesTool pt = new PropertiesTool("/jc.properties");
		String centerHost = pt.getValue("centerHost") == null ? "" : pt.getValue("centerHost");
		String storeHost = pt.getValue("storeHost") == null ? "" : pt.getValue("storeHost");
		String canUseCusterHost = pt.getValue("canUseCusterHost") == null ? "" : pt.getValue("canUseCusterHost");
		String mobileHost = pt.getValue("mobileHost") == null ? "" : pt.getValue("mobileHost");
		String collectionHost = pt.getValue("collectionHost") == null ? "" : pt.getValue("collectionHost");
		String bonusHost = pt.getValue("bonusHost") == null ? "" : pt.getValue("bonusHost");
		
		store.setCenterHost(centerHost);
		store.setStoreHost(storeHost);
		store.setCanUseCusterHost(canUseCusterHost);
		store.setMobileHost(mobileHost);
		store.setCollectionHost(collectionHost);
		store.setBonusHost(bonusHost);
		
		return store;
	}

}
