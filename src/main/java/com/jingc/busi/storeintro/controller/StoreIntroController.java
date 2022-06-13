/**
 * 
 */
package com.jingc.busi.storeintro.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.busi.common.table.Store;
import com.jingc.common.util.PropertiesTool;
import com.jingc.file.util.FileUtil;

/**
 * <p>File: StoreIntroController.java</p>
 * <p>Desc: 彩站介绍Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/storeintro/")
public class StoreIntroController {

	@RequestMapping("/index.jhtml")
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		String storeintroContent = "";
		Integer storeId =  ((Store)session.getAttribute("domain")).getStoreId();//店铺id
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
    	String filePath = pTool.getValue("storeintroPath");
    	filePath = filePath.endsWith("/") ? filePath : filePath + "/";
     	String fileUrl = filePath + "store_" + storeId + "_introduces.txt";
     	File s_file = new File(fileUrl);
		if(s_file.exists())
			storeintroContent = FileUtil.readFileByBufferedReader(s_file);	
		else
			storeintroContent = "我们是一家正规的投注店";
		
		mv.addObject("store", (Store)session.getAttribute("domain"));
		mv.addObject("storeintroContent", storeintroContent);
		mv.setViewName("storeintro/index");
		return mv;
	}
}
