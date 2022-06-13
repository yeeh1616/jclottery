package com.jingc.busi.collectiondata.service;

import org.springframework.stereotype.Service;

import com.jingc.afc.util.DateUtil;
import com.jingc.common.util.PropertiesTool;
import com.jingc.file.util.FileUtil;

import net.sf.json.JSONArray;

@Service("collectiondataService")
public class CollectionDataServiceImpl implements CollectionDataService {

	@Override
	public JSONArray asiaDataFrom500wan(String schudlesNO) {
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
    	String path = pTool.getValue("odds_savepath");
		path = path.endsWith("/") ? path : path + "/";
		String file = FileUtil.readFileByBufferedReader(FileUtil.getFile(path+"/500wan/asia/"+DateUtil.getDateFormat1()+"/", schudlesNO+".json"));
		return JSONArray.fromObject(file);
	}

	@Override
	public JSONArray europDataFrom500wan(String schudlesNO) {
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
    	String path = pTool.getValue("odds_savepath");
		path = path.endsWith("/") ? path : path + "/";
		String file = FileUtil.readFileByBufferedReader(FileUtil.getFile(path+"500wan/europ/"+DateUtil.getDateFormat1()+"/", schudlesNO+".json"));
		return JSONArray.fromObject(file);
	}

	@Override
	public JSONArray analyseDataFrom500wan(String schudlesNO, String type) {
		PropertiesTool pTool = new PropertiesTool("/jc.properties");
    	String path = pTool.getValue("odds_savepath");
		path = path.endsWith("/") ? path : path + "/";
		String file = FileUtil.readFileByBufferedReader(FileUtil.getFile(path+"500wan/xi/"+type+"/"+DateUtil.getDateFormat1()+"/", schudlesNO+".json"));
		return JSONArray.fromObject(file);
	}
}
