/**
 * 
 */
package com.jingc.busi.home.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.NewsInfoMapper;
import com.jingc.busi.common.mapper.StoreImageMapper;
import com.jingc.busi.common.mapper.StoreSatisMapper;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.NewsInfo;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreImage;
import com.jingc.busi.common.table.StoreSatis;
import com.jingc.busi.lottery.service.LotteryService;

/**
 * <p>File: HomeServiceImpl.java</p>
 * <p>Desc: 首页业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("homeService")
public class HomeServiceImpl implements HomeService {
	
	@Resource
	private LotteryService lotteryService;
	
	@Resource
	private NewsInfoMapper newsinfomapper;
	
	@Resource
	private MemberMapper memberMapper;
	
	@Resource
	private StoreImageMapper storeImageMapper;
	
	@Resource
	private StoreSatisMapper storeSatisMapper;
	
	@Override
	public void createHomeFile() {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 查询图片
	 */
	public List<StoreImage> oldpictureByStoreid(Store store){
		 List<StoreImage> storeImage =new ArrayList<StoreImage>();
		 storeImage=this.storeImageMapper.selectListByStoreId(store.getStoreId());
		 return storeImage;
	};
	/**
	 * 本期信息及其上期奖池
	 * @param licenseId
	 * @param aheadTime
	 * @return
	 */
	public Game getCurrentGame(Integer licenseId, Integer aheadTime) {
		Game game = this.lotteryService.getCurrentGame(licenseId, 0);
		game.setReserved1(getCurrentStopTime(game));
		Game preGame = this.lotteryService.getPreGame(licenseId);
		try {
			String pool = "0";
			String payDes = preGame.getPayDes();
			String[] s = null;
			if(payDes != null)
				s = payDes.split("::");
			if (s !=  null && s.length > 1) {
				String[] arrPools = s[1].split("`");
				if(arrPools != null && arrPools.length > 1){
					pool = arrPools[1] + "";
				}else{
				}
			} 
			game.setReserved2(pool);
		} catch ( Exception ex ) {}
		return game;
	}
	
	/**
	 * 当前期次的截止时间
	 * @return
	 */
	private String getCurrentStopTime(Game game) {
		Date nowTime = new Date();
		Date nextTime = DateUtil.getDate(game.getStopTime(), "yyyy-MM-dd HH:mm:ss");
		long endLTime = nextTime.getTime() - nowTime.getTime();
		int endDay = ((int)endLTime / 1000) / 60 / 60 / 24;
		int endHou = (((int)endLTime / 1000) / 60 / 60) % 24;
		int endMin = ((int)endLTime / 1000) / 60;
		if ( endMin > 60 ) {
			endMin = endMin % 60;
		}
		int endSec = ((int)endLTime / 1000) % 60;
		return String.format("%02d", endDay) + ","+ String.format("%02d", endHou) + "," + String.format("%02d", endMin) + "," + String.format("%02d", endSec);
	}
	
	public NewsInfo getOneNews(Integer newsId){
		return this.newsinfomapper.selectByPrimaryKey(newsId);
	}
	
	/**
	 * 查询彩民
	 * @param id
	 * @return
	 */
	public Member getLoginMember(Integer id) {
		return this.memberMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 满意度评价
	 * @param ss
	 * @return 1-评价成功，0-已经评价
	 */
	public int evalSatis(StoreSatis ss) {
		int result = 0;
		String ip = ss.getIpAddr();
		if ( null != ip ) {
			if ( null == this.storeSatisMapper.selectByIpAddr(ip) ) {
				result = this.storeSatisMapper.insert(ss);
			}
		}
		return result;
	}
}
