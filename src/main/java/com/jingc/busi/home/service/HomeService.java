/**
 * 
 */
package com.jingc.busi.home.service;

import java.util.List;

import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.NewsInfo;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreImage;
import com.jingc.busi.common.table.StoreSatis;

/**
 * <p>File: HomeService.java</p>
 * <p>Desc: 首页业务</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface HomeService {

	/**
	 * 创建首页数据文件(定期创建)
	 */
	public void createHomeFile();
	
	/**
	 * 本期信息及其上期奖池
	 * @param licenseId
	 * @param aheadTime
	 * @return
	 */
	public Game getCurrentGame(Integer licenseId, Integer aheadTime);
	
	public NewsInfo getOneNews(Integer newsId);
	
	/**
	 * 查询彩民
	 * @param id
	 * @return
	 */
	public Member getLoginMember(Integer id);
	/**
	 * 查询图片
	 */
	public List<StoreImage> oldpictureByStoreid(Store store);
	
	/**
	 * 满意度评价
	 * @param ss
	 * @return 1-评价成功，0-已经评价
	 */
	public int evalSatis(StoreSatis ss);
}
