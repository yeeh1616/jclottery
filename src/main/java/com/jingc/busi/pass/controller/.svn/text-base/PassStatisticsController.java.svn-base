/**
 * 
 */
package com.jingc.busi.pass.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.pass.service.PassStatisticsService;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: PassStatisticsController.java</p>
 * <p>Desc: 过关统计控制器</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-22
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/pass/")
public class PassStatisticsController {

	@Resource private PassStatisticsService passStatisticsService;
	
	/**
	 * 默认是胜负彩
	 * @return
	 */
	@RequestMapping("index.jhtml")
	public ModelAndView halt(HttpSession session, Integer licenseId, String issue, String selDate,
			String singleFlag, String succFlag, String type, Integer uuid, String username, 
			Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Integer storeId = ((Store)session.getAttribute("domain")).getStoreId();
		if ( null == licenseId ) {
			licenseId = 5;
		}
		if ( null == succFlag ) {
			succFlag = "1";
		}
		mv.addObject("licenseId", licenseId);
		mv.addObject("licenseName", GameUtil.GAMESMAP.get(licenseId+""));
		Pagination pagination = null;
		if ( licenseId == 9 || licenseId == 10 || licenseId == 21 || licenseId == 22 ) {
			String[] days = new String[7];	
			for ( int i = 0; i < days.length; i++ ) {
				days[i] = DateUtil.getDayBefore("yyyy-MM-dd", i);
			}
			if ( null == selDate ) {
				selDate = days[1];
			}
			pagination = this.passStatisticsService.queryGuessQueryObject(storeId, 
					licenseId, selDate, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
			mv.addObject("days", days);
			mv.addObject("selDate", selDate);
			mv.addObject("pagination", pagination);
			mv.setViewName("pass/jcindex");
		} else if ( licenseId == 5 || licenseId == 6 || licenseId == 7 || licenseId == 8 ){
			pagination = this.passStatisticsService.queryFootballQueryObject(storeId, 
				licenseId, issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
			mv.addObject("pagination", pagination);
			mv.setViewName("pass/index");
		} else {
			if ( licenseId == 4 ) {
				pagination = this.passStatisticsService.queryMathQueryObject(storeId, 
					licenseId, issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
				mv.addObject("pagination", pagination);
			} else if ( licenseId == 3 ) {
				pagination = this.passStatisticsService.queryQxcQueryObject(storeId, 
						issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
					mv.addObject("pagination", pagination);
			} else if ( licenseId == 2 ) {
				pagination = this.passStatisticsService.queryPlwQueryObject(storeId, 
						issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
					mv.addObject("pagination", pagination);
			} else if ( licenseId == 1 || licenseId == 12 ) {
				pagination = this.passStatisticsService.queryPlsQueryObject(storeId, licenseId, 
						issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
					mv.addObject("pagination", pagination);
			} else if ( licenseId == 11 ) {
				pagination = this.passStatisticsService.querySsqQueryObject(storeId,
						issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
					mv.addObject("pagination", pagination);
			} else if ( licenseId == 13 ) {
				pagination = this.passStatisticsService.queryQlcQueryObject(storeId,
						issue, singleFlag, succFlag, type, uuid, username, pageNo, pageSize);
					mv.addObject("pagination", pagination);
			}
			mv.setViewName("pass/mathindex");
		}
		
		return mv;
	}
}
