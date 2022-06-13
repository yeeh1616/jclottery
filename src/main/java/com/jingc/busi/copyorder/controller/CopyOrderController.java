/**
 * 
 */
package com.jingc.busi.copyorder.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.LotteryOrderCustom;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.copyorder.service.CopyOrderService;

/**
 * <p>File: CopyOrderController.java</p>
 * <p>Desc: 复制跟单控制器</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-20
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/copyorder/")
public class CopyOrderController {
	
	@Resource private CopyOrderService copyOrderService;

	/**
	 * 跟单大厅
	 * @return
	 */
	@RequestMapping("/index.jhtml")
	public ModelAndView halt(HttpSession session, HttpServletRequest request, Integer licenseId, String username, Integer pageNo, Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		Integer storeId = ((Store)session.getAttribute("domain")).getStoreId();
		Pagination pagination = this.copyOrderService.queryCopyOrders(storeId, licenseId, username, pageNo, pageSize);
		mv.addObject("pagination", pagination);
		mv.setViewName("copyorder/index");
		return mv;
	}
	
	/**
	 * 复制
	 * @return
	 */
	@RequestMapping("/copy.json")
	@ResponseBody
	public String copy(HttpSession session, Integer orderId, Integer multiple) {
		Member m = (Member)session.getAttribute("member");
		String result = "跟单成功";
		try {
			this.copyOrderService.copy(m, orderId, multiple);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				result = ((BaseException)ex).getErrMsg();
			} else {
				result = "跟单失败";
			}
		}
		return result;
	}
	
	/**
	 * 重复投注
	 * @return
	 */
	@RequestMapping("/repeat.json")
	@ResponseBody
	public String repeat(HttpSession session, Integer orderId) {
		Member m = (Member)session.getAttribute("member");
		String result = "重复投注成功";
		try {
			this.copyOrderService.repeatBet(m, orderId);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				result = ((BaseException)ex).getErrMsg();
			} else {
				result = "重复投注失败";
			}
		}
		return result;
	}
	
	/**
	 * 定制复制
	 * @return
	 */
	@RequestMapping("/copyCust.json")
	@ResponseBody
	public String custom(HttpSession session, LotteryOrderCustom loc) {
		Member m = (Member)session.getAttribute("member");
		loc.setStoreId(m.getStoreId());
		loc.setCustomingId(m.getId());
		loc.setCustomingName(m.getMemberName());
		String result = "定制成功";
		try {
			this.copyOrderService.custom(loc);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				result = ((BaseException)ex).getErrMsg();
			} else {
				result = "定制失败";
			}
		}
		return result;
	}
}
