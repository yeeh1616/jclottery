/**
 * 
 */
package com.jingc.busi.merger.controller;

import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.SwapStringInputStream;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.merger.service.MergerQueryService;

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
public class MergerQueryController {
	
	@Resource
	private MergerQueryService mergerQueryService;

	/**
	 * 合买记录
	 */
	//@RequestMapping("/merger.jhtml")
	@RequestMapping("/index.jhtml")
	public ModelAndView getMergerOrder(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 MergerOrder param){		
		ModelAndView mv = new ModelAndView();
		Store mb = (Store)session.getAttribute("domain");//获取发起人用户名
		
		if(param.getState() == "" || param.getState() == null){
			param.setState("1");
			mv.addObject("state","1");
		}else{
			mv.addObject("state",param.getState());
		}
		
		Integer storeid = mb.getStoreId();
		param.setStoreid(storeid);
		
		param.setStoreid(mb.getStoreId());
		Pagination pagination = this.mergerQueryService.getMergerOrder(param, pageNo, pageSize);
		if(param.getLicenseId() != null){
			mv.addObject("selectItemOfLicenseId",param.getLicenseId());
		}
		mv.addObject("param",param);
		mv.addObject("pagination", pagination);//分页记录
		mv.setViewName("merger/index");
		return mv;
	}
	/**
	 * 合买记录
	 */
	@RequestMapping("/selectMergerOrdersByLicenseId.jhtml")
	public ModelAndView selectMergerOrdersByLicenseId(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 MergerOrder param,
									 Integer licenseId) {
		ModelAndView mv = new ModelAndView();
		Pagination pagination = this.mergerQueryService.getMergerOrder(param, pageNo, pageSize);
		
		mv.addObject("pagination", pagination);//分页记录
		mv.setViewName("merger/index");
		return mv;
	}
	
	/**
	 * 详情页
	 */
	//@RequestMapping("/merger.jhtml")
	@RequestMapping("/mergerOrderDetails.jhtml")
	public ModelAndView mergerDetails(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 Integer mergerOrderId) {
		ModelAndView mv = new ModelAndView();
		MergerJoin param = new MergerJoin();
		param.setOrderId(mergerOrderId);
		LotteryOrder lo = this.mergerQueryService.selectLotteryOrderByPartnerNoOnly(mergerOrderId);
		MergerOrder mo = new MergerOrder();
		mo.setId(mergerOrderId);
		mo = this.mergerQueryService.selectMergerOrder(mo);
		int storeId = ((Store)session.getAttribute("domain")).getStoreId();
		if ( storeId != mo.getStoreid() ) {
			throw new BaseException("您不是该店铺的彩民，不能查看此单");
		}
		mo.setSinglePrice(mo.getSinglePrice());
		mv = this.mergerQueryService.groupsByLicenseId(lo,mo,mv);
		//int numOfMergerJoinMember = this.mergerQueryService.selectCountOfMergerJoinRecords();
		Pagination pagination = this.mergerQueryService.getMergerJoin(param, pageNo, pageSize);
		
		//Integer temp = getIsPassDeadline(session,mo.getId());
		if(mo.getShowLevel() == 1){//所有人可见
			mv.addObject("IsShowContent","show");
		}else if(getIsLanucher(session,mo.getId()) != -1 ){//如果当前账号是发起人，则可见
			mv.addObject("IsShowContent","show");
		}else{//如果当前账号不是发起人
			if(mo.getShowLevel() == 2 && getIsJoiner(session,mo.getId()) != -1){//参与人可见，且当前账号是参与人
				mv.addObject("IsShowContent","show");
			}else if(mo.getShowLevel() == 4 && getIsPassDeadline(session,mo.getId()) != -1){//截止后可见
				mv.addObject("IsShowContent","show");
			}else{
				mv.addObject("IsShowContent","hide");
			}
		}
		//mv.addObject("numOfMergerJoinMember",numOfMergerJoinMember);
		mv.addObject("lo",lo);
		mv.addObject("mo",mo);
		mv.addObject("pagination", pagination);//分页记录
		return mv;
	}
	/**
	 * 保存投注内容
	 * @param request
	 * @param response
	 */
	@RequestMapping("saveInTxt.jhtml")
	public String saveInTxt(HttpServletRequest request,HttpServletResponse response,String betCode){
		StringBuilder sb = new StringBuilder();
		String[] betCodeArr = betCode.split(";");
		for (int i = 0; i < betCodeArr.length; i++) {
			sb.append(betCodeArr[i] + "\r\n");
		}		
		String templateContent = sb.toString();
    	try {
    		//String linkName = "betCode";
    		String fileName = "betCode.txt";
    		response.setHeader("Content-Type","application/x-msdownload");
    		response.setHeader("Content-Disposition", "attachment;filename=\"" +new String(fileName.getBytes("GBK"),"ISO8859_1")+ "\"");
            InputStream inStream = SwapStringInputStream.getStringStream(templateContent,null);
            FileCopyUtils.copy(inStream, response.getOutputStream());
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
	}
	//参与合买弹出层
	@RequestMapping("/mergerjoin.jhtml")
	public ModelAndView mergerPopupOfBuy(Integer buyNum) {
		//Integer prices = 0;
		//Integer temp = param.getTotalNum();
		//if(temp!=null && temp!=0){
			//prices = param.getBetPrice()/param.getTotalNum()*buyNum;
		//}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("buyNum",buyNum);
		//mv.addObject("prices",prices);
		//mv.addObject(param);
		mv.setViewName("merger/mergerPopupOfBuy");
		return mv;
	}

	//判断可见级别
	@RequestMapping("/getIsJoiner.jhtml")
	@ResponseBody
	public Integer getIsJoiner(HttpSession session,Integer orderId) {
		//Integer result = 0;
		Member mb = (Member)session.getAttribute("member");//获取用户userId
		if(mb != null){
			Integer userId = mb.getId();
			Integer isJoiner = this.mergerQueryService.getIsJoiner(userId,orderId);
			if(isJoiner>0){
				return isJoiner;
			}else{
				return -1;
			}
		}else{
			return -1;
		}
	}
	
	//判断可见级别
	@RequestMapping("/getIsLanucher.jhtml")
	@ResponseBody
	public Integer getIsLanucher(HttpSession session,Integer orderId) {
		//Integer result = 0;
		Member mb = (Member)session.getAttribute("member");//获取用户userId
		if(mb != null){
			Integer userId = mb.getId();
			
			Integer isLanucher = this.mergerQueryService.getIsLanucher(userId,orderId);
			//return this.mergerQueryService.getIsLanucher(userId,orderId);
			if( isLanucher > 0){
				return isLanucher;
			}else{
				return -1;
			}
		}else{
			return -1;
		}
	}
	
	//判断是否超过截止日期
	@RequestMapping("/getIsPassDeadline.jhtml")
	@ResponseBody
	public Integer getIsPassDeadline(HttpSession session,Integer orderId) {
		
		//Member mb = (Member)session.getAttribute("member");//获取用户userId
		//Integer userId = mb.getId();
		MergerOrder param = new MergerOrder();
		param.setId(orderId);
		Integer isPassDeadLine = this.mergerQueryService.getIsPassDeadline(param);
		
		return isPassDeadLine;
	}
	
	/**
	 * 个人合买记录
	 */
	@RequestMapping("/pindex.jhtml")
	public ModelAndView getPMergerOrder(HttpSession session,
									 Integer pageNo, 
									 Integer pageSize,
									 Integer uuid){		
		ModelAndView mv = new ModelAndView();
		Store mb = (Store)session.getAttribute("domain");//获取发起人用户名
		
		MergerOrder param = new MergerOrder();
		param.setUserid(uuid);
		
		Integer storeid = mb.getStoreId();
		param.setStoreid(storeid);
		
		Pagination pagination = this.mergerQueryService.getMergerOrder(param, pageNo, pageSize);
		mv.addObject("pagination", pagination);//分页记录
		mv.setViewName("merger/pindex");
		return mv;
	}
}
