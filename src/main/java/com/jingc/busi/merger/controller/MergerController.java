/**
 * 
 */
package com.jingc.busi.merger.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jingc.afc.exception.BaseException;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.copyorder.service.CopyOrderService;
import com.jingc.busi.merger.service.MergerService;
import com.jingc.busi.util.member.LotteryOrderState;

/**
 * <p>File: MergerController.java</p>
 * <p>Desc: 合买Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/merger/")
public class MergerController {
	
	@Resource private MergerService mergerService;
	@Resource private CopyOrderService copyOrderService;

	/**
	 * 参与合买
	 * @param session
	 * @param order
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("/join.jhtml")
	@ResponseBody
	public String join(HttpSession session, MergerJoin mj) {
		Member mb = (Member)session.getAttribute("member");//获取发起人用户名
		mj.setJoinUserid(mb.getId());//
		mj.setJoinUsername(mb.getMemberName());
		mj.setStoreid(mb.getStoreId());
		String retMsg = "投注成功";
		try {
			this.mergerService.joinMerger(mj, false);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				BaseException bex = (BaseException)ex;
				retMsg = bex.getErrMsg();
			} else {
				retMsg = "投注失败";
			}
		}
		return retMsg;
	}
	
	/**
	 * 发起合买
	 * @param session
	 * @param order
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("/merge.jhtml")
	public ModelAndView merge(HttpSession session, MergerOrder order, ModelMap modelmap) {
		//ModelAndView mv = new ModelAndView();
		Member mb = (Member)session.getAttribute("member");
		
		if(mb != null){
			if (mb.getMemberFrom() == 5 ) {
				throw new BaseException("[营业厅不允许发起合买]");
			}
		}
		
		order.setMemberFrom(mb.getMemberFrom());	// 彩民来源
		
		/*if ( mb.getMemberFrom() == 5 ) {	// 营业厅用户默认取票
			order.setFetchFlag("0");
		}*/
		order.setFetchFlag("1");
		//如果是营业厅用户，方案暂存； wangheping 0529
		order.setBetState(mb.getMemberFrom()==5?LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "":LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
		//如果是营业厅用户，存入彩民的唯一标识码 
		order.setReserved1(mb.getReserved1());
		
		order.setUserid(mb.getId());
		order.setBetType("3");
		if ( null == order.getBetFrom() ) {
			order.setBetFrom("1");
		}
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		
		this.mergerService.merger(order);
		//mv.addObject("order", order);
		
		modelmap.put("username", order.getUsername());
		modelmap.put("id", order.getId());
		modelmap.put("betPrice", order.getBetPrice());
		modelmap.put("reserved10", order.getReserved10());
		modelmap.put("reserved20", order.getReserved20());
		modelmap.put("licenseId", order.getLicenseId());
		
		// 复制跟单
		if ( "1".equals(order.getReserved15()) ) {
			order.setId(Integer.valueOf(order.getReserved19()));
			this.copyOrderService.copy(order);
		}
		
		//mv.setView(new RedirectView("/lottery/success.jhtml"),modelmap);
		return new ModelAndView(new RedirectView("/merger/success.jhtml"),modelmap); 
		//return mv;
	}
	
	/**
	 * 先发起，后上传
	 * @param session
	 * @param order
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("/frsupmerge.jhtml")
	public ModelAndView frsupmerge(HttpSession session, MergerOrder order, ModelMap modelmap) {
		Member mb = (Member)session.getAttribute("member");
		
		if(mb != null){
			if (mb.getMemberFrom() == 5 ) {
				throw new BaseException("[营业厅不允许发起合买]");
			}
		}
		order.setMemberFrom(mb.getMemberFrom());	// 彩民来源
		
		order.setFetchFlag("1");
		
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(((Store)session.getAttribute("domain")).getStoreId());
		order.setState(MergerOrder.STATE_NO_FILLED+"");
		order.setUploadType(MergerOrder.UP_TYPE_NO_UPLOAD);
		
		this.mergerService.frsupmerge(order);
		
		modelmap.put("username", order.getUsername());
		modelmap.put("id", order.getId());
		modelmap.put("betPrice", order.getBetPrice());
		modelmap.put("reserved10", order.getReserved10());
		modelmap.put("reserved20", order.getReserved20());
		modelmap.put("licenseId", order.getLicenseId());
		
		return new ModelAndView(new RedirectView("/merger/success.jhtml"),modelmap); 
	}
	
	@RequestMapping("/success.jhtml")
	public ModelAndView lotteryBuy(ModelAndView mv, String username, Integer id, Integer betPrice,
			String reserved10, String reserved20, Integer licenseId) {
		// 到投注成功页面
		LotteryOrder order = new LotteryOrder();
		order.setId(id);
		order.setBetPrice(betPrice);
		order.setReserved10(reserved10);
		order.setReserved20(reserved20);
		order.setLicenseId(licenseId);
		try {
			username = new String(username.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		order.setUsername(username);
		mv.addObject("order", order);
		mv.setViewName("/merger/succ");
        return mv;
	}
	
	/**
	 * 追加保底
	 * @return
	 */
	@RequestMapping("/appendIns.jhtml")
	@ResponseBody
	public String appendIns(HttpSession session, Integer orderId, Integer insNum) {
		Member mb = (Member)session.getAttribute("member");
		String retMsg = "追加保底成功";
		try {
			this.mergerService.appendIns(mb, orderId, insNum);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				BaseException bex = (BaseException)ex;
				retMsg = bex.getErrMsg();
			} else {
				retMsg = "追加保底失败";
			}
			ex.printStackTrace();
		}
		return retMsg;
	}
	
	/**
	 * 追加保底
	 * @return
	 */
	@RequestMapping("/cancelOrder.jhtml")
	@ResponseBody
	public String cancelOrder(HttpSession session, Integer orderId) {
		Member mb = (Member)session.getAttribute("member");
		String retMsg = "撤单成功";
		try {
			this.mergerService.cancelOrder(mb, orderId);
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) {
				BaseException bex = (BaseException)ex;
				retMsg = bex.getErrMsg();
			} else {
				retMsg = "撤单失败";
			}
			ex.printStackTrace();
		}
		return retMsg;
	}
}
