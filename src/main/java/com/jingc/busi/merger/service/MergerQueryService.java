/**
 * 
 */
package com.jingc.busi.merger.service;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.GameJcAgainst;
import com.jingc.busi.common.table.GameZcAgainst;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;

/**
 * <p>File: MergerService.java</p>
 * <p>Desc: 合买查询业务（与发起，参与分开）</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface MergerQueryService {

	
    /**
     * 查询合买订单记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public MergerOrder selectMergerOrder(MergerOrder param);
    /**
     * 获取合买订单记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMergerOrder(MergerOrder param, Integer pageNo, Integer pageSize);
    
    /**
     * 获取合买订单记录(by licenseId)
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMergerOrderByLicenseId(MergerOrder param, Integer pageNo, Integer pageSize, Integer licenseId);
    /**
     * 获取参与合买记录(MergerJoin)
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMergerJoin(MergerJoin param, Integer pageNo, Integer pageSize);
    
    /**
	 * 获取合买记录
	 * @param pageNo
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public Pagination getMergerJoinRecord(Integer pageNo, Integer pageSize, MergerJoin param);
    
	
    /**
     * 获取LotteryOrder表(通过PartnerNo)
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
	public LotteryOrder selectLotteryOrderByPartnerNoOnly(Integer orderId);
	
    /**
     * 获取静态对阵表(用于投注详情页展示投注内容)
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
	public GameJcAgainst selectGameJcAgainstByScheduleId(Integer licenseId,String raceTime,String number);
	
    /**
     * 获取参与合买人数
     * @param
     * @return
     */
	public Integer selectCountOfMergerJoinRecords();
	
    /**
     * 查询传统足彩对阵表
     * @param licenseId
     * @param issue
     * @return
     */
	public List<GameZcAgainst> getGameZcAgainstByLicenseAndIssueOrderByGameId(Integer licenseId,
			String issue);

    /**
     * 处理数字彩的betCode
     * @param betCode
     * @return
     */
	public List<String> getListOfBetCodeSZC(String betCode);

    /**
     * 合买详情页的分类(数字彩，竞技彩，足彩)
     * @param LotteryOrder
     * @param MergerOrder
     * @param ModelAndView
     * @return
     */
	public ModelAndView groupsByLicenseId(LotteryOrder lo, MergerOrder mo,
			ModelAndView mv);
	
	 /**
     * 我的团队——合买详情页的分类(数字彩，竞技彩，足彩)
     * @param LotteryOrder
     * @param MergerOrder
     * @param ModelAndView
     * @return
     */
	public ModelAndView myTeamGroupsByLicenseId(LotteryOrder lo, MergerOrder mo,ModelAndView mv);
    
	/**
     * 判读用户是不是合买发起人
     * @param userId
     * @param mergerOrderId
     * @return
     */
	public Integer getIsLanucher(Integer userId,Integer orderId);

	/**
     * 判读用户是不是合买参与人
     * @param userId
     * @param mergerOrderId
     * @return
     */
	public Integer getIsJoiner(Integer userId, Integer orderId);

	/**
     * 判读合买单是否超过截止日期
     * @param userId
     * @param mergerOrderId
     * @return
     */
	public Integer getIsPassDeadline(MergerOrder param);    
	
	// 发起人详细
	public static class HrbDetail {
		private Integer level;	// 级别, 1星，2星...5星
		private Integer lastLevel;
		private Integer cusNum;	// 定制人数
		/** 购彩信息 */
		private Integer schNum;	// 场次
		private String passType;	// 过关方式
		private Integer winNum;	// 中奖注数
		private String bonusBefTax;	// 税前奖金
		private String bonusAftTax;	// 税后奖金
		private String brok;	// 发起人提成
		private String perBonus;	// 每元奖金
		public Integer getLevel() {
			return level;
		}
		public void setLevel(Integer level) {
			this.level = level;
		}
		public Integer getLastLevel() {
			return lastLevel;
		}
		public void setLastLevel(Integer lastLevel) {
			this.lastLevel = lastLevel;
		}
		public Integer getCusNum() {
			return cusNum;
		}
		public void setCusNum(Integer cusNum) {
			this.cusNum = cusNum;
		}
		public Integer getSchNum() {
			return schNum;
		}
		public void setSchNum(Integer schNum) {
			this.schNum = schNum;
		}
		public String getPassType() {
			return passType;
		}
		public void setPassType(String passType) {
			this.passType = passType;
		}
		public Integer getWinNum() {
			return winNum;
		}
		public void setWinNum(Integer winNum) {
			this.winNum = winNum;
		}
		public String getBonusBefTax() {
			return bonusBefTax;
		}
		public void setBonusBefTax(String bonusBefTax) {
			this.bonusBefTax = bonusBefTax;
		}
		public String getBonusAftTax() {
			return bonusAftTax;
		}
		public void setBonusAftTax(String bonusAftTax) {
			this.bonusAftTax = bonusAftTax;
		}
		public String getBrok() {
			return brok;
		}
		public void setBrok(String brok) {
			this.brok = brok;
		}
		public String getPerBonus() {
			return perBonus;
		}
		public void setPerBonus(String perBonus) {
			this.perBonus = perBonus;
		}
	}
}
