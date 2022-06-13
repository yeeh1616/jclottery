/**
 * 
 */
package com.jingc.busi.findpassword.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.mail.MailUtil;
import com.jingc.afc.util.DES;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.VerificationCode;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.findpassword.service.FindpasswordService;
import com.jingc.busi.lotteryopen.task.Startup;
import com.jingc.busi.util.member.MemberState;

/**
 * <p>File: ChartController.java</p>
 * <p>Desc: 走势图Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  ChenXin
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 ChenXin修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/findpassword")
public class FindpasswordController {

	@Resource
	private FindpasswordService findpasswordService;
	
	/**
	 * 找回密码第一步
	 * @param model
	 * @return
	 */
	@RequestMapping("/index.jhtml")
	public ModelAndView find1(
			ModelAndView model
			) {
		
		model.setViewName("findpassword/index");
		return model;
	}
	
	/**
	 * 找回密码第二步
	 * @param model
	 * @return
	 */
	@RequestMapping("/findtype.jhtml")
	public ModelAndView findtype(
			HttpSession session,
			ModelAndView model
			) {
		
		Member member = (Member)session.getAttribute("memberByFindpassword");
  
		
		model.addObject("memberByFindpassword",member);//获取session里的username
		model.setViewName("findpassword/findtype");
		return model;
	}
	
	/**
	 * 找回密码第三步提示页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/findrelmail.jhtml")
	public ModelAndView findrelmail(
			HttpSession session,
			ModelAndView model
			) {
	
		model.setViewName("findpassword/findrelmail");
		return model;
	}
	
	/**
	 * 判断邮箱
	 * @param session
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/findtypemail.jhtml")
	@ResponseBody //ajax
	public Integer findtypeMail(
			HttpSession session,
			Member param,
			ModelAndView model
			) {
		
		Member member = (Member)session.getAttribute("memberByFindpassword");
		if(member.getEmail().equals(param.getEmail()))
		{
			//发送邮件
			
			if(MailUtil.sendMail(member.getId() ,member.getMemberName(), member.getEmail(),((Store)session.getAttribute("domain")).getNetUrl(),Startup.ROOT_PATH))
			{
				return 1;
			}else{
				return -1;
			}
		}else{
			//邮箱不对
			return 0;
		}
	}
	
	
	/**
	 * 判断密保问题答案
	 * @param session
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/findtypquestion.jhtml")
	@ResponseBody //ajax
	public Integer findtypeQuestion(
			HttpSession session,
			Member param,
			ModelAndView model
			) {
		
		Member member = (Member)session.getAttribute("memberByFindpassword");
  
		if(member.getPassAnswer().equals(param.getPassAnswer()))
		{
			//答对了
			session.setAttribute("findPasswordQuestionState", DateUtil.getDateFormat2());
			return 1;
		}else{
			//答错了
			return 0;
		}
	}
	
	
	/**
	 * 找回密码-重置密码
	 * @param session
	 * @param s 邮件url参数，密文
	 * @param model
	 * @return
	 */
	@RequestMapping("/findpassword.jhtml")
	public ModelAndView findpassword(
			HttpSession session,
			String s,
			ModelAndView model
			) {
		String relStr = "";//您的密码已重置：${relStr}<br />建议您立刻修改
		Member param = new Member();
		if(session.getAttribute("findPasswordQuestionState") != null)
		{
			param.setId(((Member)session.getAttribute("memberByFindpassword")).getId());
			String pass = this.findpasswordService.updatePass(param);
			session.removeAttribute("findPasswordQuestionState");
			relStr = "您的密码已重置："+pass+"<br />建议您立刻修改";
		}else if(s != null)
		{
			
			try {
				String temp = DES.Decode(s.replace('$', '+'), DES.DESKEY);
				if(temp.split("\\|").length == 2)
				{
					//判断时间
					DateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date date = dd.parse(temp.split("\\|")[1]);
					Date date2 = dd.parse(DateUtil.getDateFormat2());
					if((date2.getTime() - date.getTime()) / 1000 / 60 > 5)
					{
						//超时
						relStr = "已经超时，请重新找回密码";
					}else
					{
						param.setId(Integer.parseInt(temp.split("\\|")[0]));
						String pass = this.findpasswordService.updatePass(param);
						relStr = "您的密码已重置："+pass+"<br />建议您立刻修改";
					}
				}else{
					relStr = "错误，请联系管理员。";
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			relStr = "错误，请联系管理员。";
		}
		model.addObject("relStr",relStr);
		model.setViewName("findpassword/findpassword");
		return model;
	}
	
	/**
	 * 查询帐号是否存在
	 * @param session
	 * @param request
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/doindex.jhtml")
	@ResponseBody //ajax
	public Integer getMemberName(
			HttpSession session, 
			HttpServletRequest request,
			String username,
			String yzm,
			ModelAndView model){
		
		if(!yzm.equals(session.getAttribute("captcha")))
		{
			//验证码错误
			return 0;
		}
		
		Integer storeid = ((Store)session.getAttribute("domain")).getStoreId();//店铺ID
		Member member = this.findpasswordService.getMember(storeid, username);
		
		if(member == null)
		{
			//该店铺没有该帐号
			return MemberState.MemberIDState.DELETE;
		}
		
		if(member.getState() == MemberState.MemberIDState.NORMAL)
		{
			//正常
			session.setAttribute("memberByFindpassword", member);
			return MemberState.MemberIDState.NORMAL;
		}
		
		if(member.getState() == MemberState.MemberIDState.FROZEN)
		{
			//冻结
			return MemberState.MemberIDState.FROZEN;
		}

		if(member.getState() == MemberState.MemberIDState.DELETE)
		{
			//删除
			return MemberState.MemberIDState.DELETE;
		}
		return MemberState.MemberIDState.DELETE;
	}
	
	
	/**
	 * 获取验证码
	 */
	@RequestMapping("/captcha.do")
	public void captcha(HttpSession session, 
			HttpServletResponse response,String propety){
		VerificationCode verificationCode = VerificationCode.getInstance(120,40,4,1,28);
		if(null == propety || "".equals(propety)){
			propety = "captcha";
		}
		// 将认证码存入session
		session.setAttribute(propety,verificationCode.getString());
		// 设置页面不缓存
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 输出图象到页面
		try{
			ImageIO.write(verificationCode.getImage(), "JPEG", response.getOutputStream()); 
		}catch(IOException e){
		}
	}
	
}
