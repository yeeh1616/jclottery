/**
 * 
 */
package com.jingc.busi.recommend.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.mapper.NewsInfoMapper;
import com.jingc.busi.common.table.NewsInfo;

/**
 * <p>File: RecommendServiceImpl.java</p>
 * <p>Desc: 本店推荐业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("recommendService")
public class RecommendServiceImpl implements RecommendService {
	@Resource
	private NewsInfoMapper newsinfomapper;
	
	public Pagination getNewsList(Integer storeId , Integer type , Integer pageNo,Integer pageSize){
		Pagination p = new Pagination(pageNo,pageSize);
		List<Integer> storeIdList = new ArrayList<Integer>();
		storeIdList.add(storeId);
		storeIdList.add(-1);
		
		NewsInfo newsinfo = new NewsInfo();
		newsinfo.setStoreIdList(storeIdList);
		if(type != null)
			newsinfo.setType(type);
		
		//newsinfo.setStoreId(storeId);
		//公告列表
		//newsinfo.setType(StoreNewsType.RECOMMENDATION); selectRecomByParamObject
		int count = this.newsinfomapper.selectRecomWaitCount(newsinfo);
		p.setTotalCount(count);
		List<NewsInfo> list =	this.newsinfomapper.selectRecomByParamObject(newsinfo, p);
		p.setList(list);
		
		return p;
	}
}
