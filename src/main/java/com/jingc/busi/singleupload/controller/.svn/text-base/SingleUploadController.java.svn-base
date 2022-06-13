/**
 * 
 */
package com.jingc.busi.singleupload.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.UnicodeReader;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.lotteryopen.task.Startup;
import com.jingc.busi.singleupload.service.UploadService;
import com.jingc.busi.singleupload.service.UploadService.BetObject;
import com.jingc.busi.singleupload.service.UploadService.JSONData;
import com.jingc.busi.singleupload.service.UploadService.MergerBetObject;

/**
 * <p>File: SingleUploadController.java</p>
 * <p>Desc: 单式上传Controller类</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩游天下网络有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-12-17
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
public class SingleUploadController {
	
	@Resource
	private UploadService uploadService;

	@RequestMapping("/lottery/singleUpload.do")
	@ResponseBody
	public String upload(
			@RequestParam(required=false) MultipartFile file, 	//上传文件列表(赛程)
			@RequestParam(required=true) Integer licenseId, 	//彩种类别
			Integer schNum,	//	场次数
			Integer passNum,	// 过关方式（竞彩）,2x1,3x1等
			Integer playId,	// 竞彩子玩法
			HttpServletRequest request,
			HttpSession session
	) {
		JSONData data = new JSONData();
		//最大不超过10M
		if( file.getSize() > 10000000 ){
			data.setMessage("文件超过10M");
			return JSONObject.fromObject(data).toString();
		}
		//不可为空
		if( file.isEmpty() ){
			data.setMessage("文件为null");
			return JSONObject.fromObject(data).toString();
		}
    	
    	String filePath = Startup.ROOT_PATH+"/temp" ;
        String fileName = DateUtil.getNowDateByFmt("yyyyMMddHHmmssSSS") + licenseId + file.getOriginalFilename();
        
        data.setFileName(fileName);
        
		File path = new File(filePath);
		if( !path.exists() ){
			path.mkdirs();
		}
		File fileObj = new File( path , fileName );
		if( fileObj.exists() ){
			fileObj.delete();
		}
		try {
			fileObj.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		PrintWriter write = null;
		BufferedReader bufferedReader = null;
		
		//累计注数
		int lineNum = 0;
		try {
			write = new PrintWriter(fileObj);
	
			bufferedReader = new BufferedReader(new UnicodeReader(file.getInputStream(), Charset.defaultCharset().name()));
			
			String testCode = "";
			while ( ( testCode = bufferedReader.readLine() ) != null ){
				if ("".equals(testCode.trim())) {
					continue;
				}
				if ( licenseId == Constants.LICENSE_PLS ||  licenseId == Constants.LICENSE_3D  ) {
					testCode = this.uploadService.parsePls(licenseId, playId, testCode);
				} else if ( licenseId > 100 ) {
					testCode = this.uploadService.parseS11x5(licenseId, playId, testCode);
				}
				else if ( licenseId == Constants.LICENSE_JCZQ || licenseId == Constants.LICENSE_JCLQ ||
						licenseId == Constants.LICENSE_BJDC || licenseId == Constants.LICENSE_SFGG) {
					testCode = this.uploadService.parseGuessLine(licenseId, playId, testCode, schNum, passNum, false);
				} else {
					testCode = this.uploadService.parse(licenseId, testCode);
				}
				if ( null != testCode ) {
					lineNum++;
				} else {
					data.setMessage("第"+(lineNum+1)+"行格式有误");
					return JSONObject.fromObject(data).toString();
				}
				write.write(testCode + "\n");
			}
		} catch ( Exception ex ) {
			ex.printStackTrace();
		} finally {
			if ( null != write ) {
				write.flush();
				write.close();
			}
			if ( null != bufferedReader ) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		data.setBetNum(lineNum);
		data.setErrCode(1);
		return JSONObject.fromObject(data).toString();
	}
	
	/**
	 * 带场次上传（竞彩）
	 * @param file
	 * @param licenseId
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/lottery/singleUpload2Sch.do")
	@ResponseBody
	public String upload2Sch(
			@RequestParam(required=false) MultipartFile file, 	//上传文件列表(赛程)
			@RequestParam(required=true) Integer licenseId, 	//彩种类别
			@RequestParam(required=true) Integer playId, 	//玩法类别
			HttpServletRequest request,
			HttpSession session
	) {
		JSONData data = new JSONData();
		//最大不超过10M
		if( file.getSize() > 10000000 ){
			data.setMessage("文件超过10M");
			return JSONObject.fromObject(data).toString();
		}
		//不可为空
		if( file.isEmpty() ){
			data.setMessage("文件为null");
			return JSONObject.fromObject(data).toString();
		}
    	
		BufferedReader bufferedReader = null;
		List<String> list = new ArrayList<String>();
		//累计注数
		int lineNum = 0;
		try {
	
			bufferedReader = new BufferedReader(new UnicodeReader(file.getInputStream(), Charset.defaultCharset().name()));
			
			String testCode = "";
			while ( ( testCode = bufferedReader.readLine() ) != null ){
				
				if ( null != testCode ) {
					list.add(testCode);
					lineNum++;
				} 
			}
		} catch ( Exception ex ) {
			ex.printStackTrace();
		} finally {
			if ( null != bufferedReader ) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		this.uploadService.uploadWithSch(licenseId, playId, list);
		
		data.setBetNum(lineNum);
		data.setErrCode(1);
		return JSONObject.fromObject(data).toString();
	}
	
	/**
	 * 先发起，后上传
	 */
	@RequestMapping("/lottery/frsSingleFstUpload.do")
	@ResponseBody
	public String frsupload(
			@RequestParam(required=false) MultipartFile file, 	//上传文件列表(赛程)
			@RequestParam(required=true) Integer licenseId, 	//彩种类别
			BetObject bo,
			HttpSession session,
			Integer orderId	// 订单编号
	) {
		JSONData data = new JSONData();
		//最大不超过10M
		if( file.getSize() > 10000000 ){
			data.setMessage("文件超过10M");
			return JSONObject.fromObject(data).toString();
		}
		//不可为空
		if( file.isEmpty() ){
			data.setMessage("文件为null");
			return JSONObject.fromObject(data).toString();
		}
		
		BufferedReader bufferedReader = null;
		
		List<String> codeList = new ArrayList<String>();
		int lineNum = 0;
		try {
	
			bufferedReader = new BufferedReader(new UnicodeReader(file.getInputStream(), Charset.defaultCharset().name()));
			
			String testCode = "";
			while ( ( testCode = bufferedReader.readLine() ) != null ){
				if ("".equals(testCode.trim())) {
					continue;
				}
				
				if ( licenseId == Constants.LICENSE_JCZQ || licenseId == Constants.LICENSE_JCLQ ||
						licenseId == Constants.LICENSE_BJDC || licenseId == Constants.LICENSE_SFGG) {
					if ( null == bo.getSchs() ) {
						data.setMessage("[请先选择场次]");
						return JSONObject.fromObject(data).toString();
					}
					if ( null == bo.getPassType() || "undefinedc1".equals(bo.getPassType())) {
						data.setMessage("[请先选择过关方式]");
						return JSONObject.fromObject(data).toString();
					}
					int schNum = bo.getSchs().split(",").length;
					int passNum = Integer.valueOf(bo.getPassType().split("c")[0]);
					testCode = this.uploadService.parseGuessLine(licenseId, Integer.valueOf(bo.getPlayId()), testCode, schNum, passNum, false);
				} else {
					testCode = this.uploadService.parse(licenseId, testCode);
				}
				if ( null != testCode ) {
					lineNum++;
				} else {
					data.setMessage("第"+(lineNum+1)+"行格式有误");
					return JSONObject.fromObject(data).toString();
				}
				codeList.add(testCode);
			}
		} catch ( Exception ex ) {
			ex.printStackTrace();
		} finally {
			if ( null != bufferedReader ) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		Member mb = (Member)session.getAttribute("member");
		try {
			this.uploadService.frsMerger(orderId, bo, mb, codeList);
			data.setBetNum(lineNum);
			data.setErrCode(1);
		} catch (Exception ex){
			if ( ex instanceof BaseException ) {
				data.setMessage(((BaseException) ex).getErrMsg());
			}
			ex.printStackTrace();
		}
		
		return JSONObject.fromObject(data).toString();
	}
	
	/**
	 * 先发起，后上传（复式）
	 */
	@RequestMapping("/lottery/frsFsUpload.do")
	@ResponseBody
	public String frsFsupload(
			@RequestParam(required=true) Integer licenseId, 	//彩种类别
			BetObject bo,
			HttpSession session,
			String betCode,
			Integer orderId	// 订单编号
	) {
		JSONData data = new JSONData();
		
		List<String> codeList = new ArrayList<String>();
		String[] betCodes = betCode.split(";");
		for ( String cd : betCodes ) {
			codeList.add(cd);
		}
		int lineNum = 0;
		try {} catch ( Exception ex ) {
			ex.printStackTrace();
		} finally {}
		
		Member mb = (Member)session.getAttribute("member");
		try {
			this.uploadService.frsMerger(orderId, bo, mb, codeList);
			data.setBetNum(lineNum);
			data.setErrCode(1);
		} catch (Exception ex){
			if ( ex instanceof BaseException ) {
				data.setMessage(((BaseException) ex).getErrMsg());
			}
			ex.printStackTrace();
		}
		
		return JSONObject.fromObject(data).toString();
	}
	
	@RequestMapping("/lottery/singleBet.jhtml")
	public ModelAndView bet(BetObject bo, HttpServletRequest request,HttpSession session, ModelMap modelmap ) {
		Member mb = (Member)session.getAttribute("member");
		LotteryOrder order = this.uploadService.bet(bo, mb);
		modelmap.put("username", order.getUsername());
		modelmap.put("id", order.getId());
		modelmap.put("betPrice", order.getBetPrice());
		modelmap.put("reserved10", order.getReserved10());
		modelmap.put("licenseId", order.getLicenseId());
		
		//mv.setView(new RedirectView("/lottery/success.jhtml"),modelmap);
		return new ModelAndView(new RedirectView("/lottery/success.jhtml"),modelmap); 
	}
	
	// 单式合买提交
	@RequestMapping("/lottery/singleMerger.jhtml")
	public ModelAndView merger(MergerBetObject mbo, HttpServletRequest request,HttpSession session, ModelMap modelmap ) {
		Member mb = (Member)session.getAttribute("member");
		LotteryOrder order = this.uploadService.merger(mbo, mb);
		modelmap.put("username", order.getUsername());
		modelmap.put("id", order.getId());
		modelmap.put("betPrice", order.getBetPrice());
		modelmap.put("reserved10", order.getReserved10());
		modelmap.put("reserved20", order.getReserved20());
		modelmap.put("licenseId", order.getLicenseId());
		
		//mv.setView(new RedirectView("/lottery/success.jhtml"),modelmap);
		return new ModelAndView(new RedirectView("/merger/success.jhtml"),modelmap); 
	}
}
