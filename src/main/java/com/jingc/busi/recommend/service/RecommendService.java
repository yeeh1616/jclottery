/**
 * 
 */
package com.jingc.busi.recommend.service;

import java.util.List;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.NewsInfo;

/**
 * <p>File: RecommendService.java</p>
 * <p>Desc: 本店推荐业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface RecommendService {
	
	public Pagination getNewsList(Integer storeId , Integer type , Integer pageNo,Integer pageSize);
	
}
