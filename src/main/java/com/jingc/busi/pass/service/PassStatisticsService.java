/**
 * 
 */
package com.jingc.busi.pass.service;

import java.util.List;

import com.jingc.afc.pagination.Pagination;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;

/**
 * <p>File: PassStatisticsService.java</p>
 * <p>Desc: 过关统计业务,过关统计是彩票在线合买代购过程中独特的数据统计方式。<br>
 * 将每个用户的投注情况以及开奖后的中奖情况通过一定的规律和顺序排列起来，可以非常<br>
 * 直观地反映出该站点具体某个彩种的中奖用户、中奖注数、中奖金额等多种信息，这就是所谓的过关统计。</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-5-16
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface PassStatisticsService {
	
	public static class BonusObject {
		private String name;	// 一等奖
		private String num;		// 中奖注数
		private String bonus;	// 每注奖金
		public BonusObject(String name, String num, String bonus) {
			this.name = name;
			this.num = num;
			this.bonus = bonus;
		}
		public String getName() {
			return name;
		}
		public String getNum() {
			return num;
		}
		public String getBonus() {
			return bonus;
		}
	}
	
	// 数字彩头部
	public static class MathHeader {
		private String licenseName;	//	彩种名称
		private String issue;	// 期号
		private String openDate;	// 开奖日期
		private String sail;	// 	本期销量
		private String bonusPool;	// 本期奖池
		private List<BonusObject> bos;
		private List<Game> gameList; // 包含期号
		private String[] openCodeList;//开奖号码
		public String getLicenseName() {
			return licenseName;
		}
		public void setLicenseName(String licenseName) {
			this.licenseName = licenseName;
		}
		public String getIssue() {
			return issue;
		}
		public void setIssue(String issue) {
			this.issue = issue;
		}
		public String getOpenDate() {
			return openDate;
		}
		public void setOpenDate(String openDate) {
			this.openDate = openDate;
		}
		public String getSail() {
			return sail;
		}
		public void setSail(String sail) {
			this.sail = sail;
		}
		public String getBonusPool() {
			return bonusPool;
		}
		public void setBonusPool(String bonusPool) {
			this.bonusPool = bonusPool;
		}
		public List<BonusObject> getBos() {
			return bos;
		}
		public void setBos(List<BonusObject> bos) {
			this.bos = bos;
		}
		public List<Game> getGameList() {
			return gameList;
		}
		public void setGameList(List<Game> gameList) {
			this.gameList = gameList;
		}
		public String[] getOpenCodeList() {
			return openCodeList;
		}
		public void setOpenCodeList(String[] openCodeList) {
			this.openCodeList = openCodeList;
		}
	}
	
	// 统计首页足彩头部信息
	public static class FootballHeader extends MathHeader {
		public static class Against {
			private String host;
			private String guest;
			private String result; // 彩果
			public Against(String host, String guest, String result) {
				this.host = host;
				this.guest = guest;
				this.result = result;
			}
			public String getHost() {
				return host;
			}
			public String getGuest() {
				return guest;
			}
			public String getResult() {
				return result;
			}
		}
		private List<Against> againstList;
		public List<Against> getAgainstList() {
			return againstList;
		}
		public void setAgainstList(List<Against> againstList) {
			this.againstList = againstList;
		}
	}

	// 方案对象
	public static class SchemeObject {
		private String schemeType;	//	方案类型：代购/合买
		private String lauchMember;	//	发起人
		private String orderDate;
		private String singleType;
		private String record;		//	战绩，1星-5星
		private Integer betNum;		//	方案注数
		private String allRightNum;	//	全对注数
		private Integer allRight;
		private String wrongOneNum;	//	错一注数
		private Integer wrongOne;
		private String winNum;		//	命中场次
		private String bonus;	//	税前奖金
		private Integer schNum;	// 方案场次数
		private Integer openNum;// 已经开奖场次数
		private String playName;// 玩法名称
		private String passType;	// 过关方式，竞彩
		private String succFlag;	// 方案成功/作废
		
		// 定制跟单使用
		private Integer orderId;
		private Integer userid;
		private Integer licenseId;
		
		private LotteryOrder order;	// 原始信息
		public String getSchemeType() {
			return schemeType;
		}
		public void setSchemeType(String schemeType) {
			this.schemeType = schemeType;
		}
		public String getLauchMember() {
			return lauchMember;
		}
		public void setLauchMember(String lauchMember) {
			this.lauchMember = lauchMember;
		}
		public String getOrderDate() {
			return orderDate;
		}
		public void setOrderDate(String orderDate) {
			this.orderDate = orderDate;
		}
		public String getSingleType() {
			return singleType;
		}
		public void setSingleType(String singleType) {
			this.singleType = singleType;
		}
		public String getRecord() {
			return record;
		}
		public void setRecord(String record) {
			this.record = record;
		}
		public Integer getBetNum() {
			return betNum;
		}
		public void setBetNum(Integer betNum) {
			this.betNum = betNum;
		}
		public String getAllRightNum() {
			return allRightNum;
		}
		public void setAllRightNum(String allRightNum) {
			this.allRightNum = allRightNum;
		}
		public String getWrongOneNum() {
			return wrongOneNum;
		}
		public void setWrongOneNum(String wrongOneNum) {
			this.wrongOneNum = wrongOneNum;
		}
		public Integer getAllRight() {
			return allRight;
		}
		public void setAllRight(Integer allRight) {
			this.allRight = allRight;
		}
		public Integer getWrongOne() {
			return wrongOne;
		}
		public void setWrongOne(Integer wrongOne) {
			this.wrongOne = wrongOne;
		}
		public String getWinNum() {
			return winNum;
		}
		public void setWinNum(String winNum) {
			this.winNum = winNum;
		}
		public String getBonus() {
			return bonus;
		}
		public void setBonus(String bonus) {
			this.bonus = bonus;
		}
		public Integer getSchNum() {
			return schNum;
		}
		public void setSchNum(Integer schNum) {
			this.schNum = schNum;
		}
		public Integer getOpenNum() {
			return openNum;
		}
		public void setOpenNum(Integer openNum) {
			this.openNum = openNum;
		}
		public String getPlayName() {
			return playName;
		}
		public void setPlayName(String playName) {
			this.playName = playName;
		}
		public String getPassType() {
			return passType;
		}
		public void setPassType(String passType) {
			this.passType = passType;
		}
		public String getSuccFlag() {
			return succFlag;
		}
		public void setSuccFlag(String succFlag) {
			this.succFlag = succFlag;
		}
		public Integer getOrderId() {
			return orderId;
		}
		public void setOrderId(Integer orderId) {
			this.orderId = orderId;
		}
		public Integer getUserid() {
			return userid;
		}
		public void setUserid(Integer userid) {
			this.userid = userid;
		}
		public Integer getLicenseId() {
			return licenseId;
		}
		public void setLicenseId(Integer licenseId) {
			this.licenseId = licenseId;
		}
		public LotteryOrder getOrder() {
			return order;
		}
		public void setOrder(LotteryOrder order) {
			this.order = order;
		}
	}
	
	public static class DltSchemeObject extends SchemeObject {
		private int[] prize;	// 一等奖注数-六等奖注数
		public int[] getPrize() {
			return prize;
		}
		public void setPrize(int[] prize) {
			this.prize = prize;
		}
	}
	
	// 大乐透
	@SuppressWarnings("serial")
	public static class MathQueryObject extends Pagination {
		private MathHeader header;
		public MathQueryObject(Integer pageNo, Integer pageSize) {
			super(pageNo, pageSize);
		}
		public MathHeader getHeader() {
			return header;
		}
		public void setHeader(MathHeader header) {
			this.header = header;
		}
	}
	
	// 足彩对象
	@SuppressWarnings("serial")
	public static class FootballQueryObject extends Pagination {
		private FootballHeader header;
		public FootballQueryObject(Integer pageNo, Integer pageSize) {
			super(pageNo, pageSize);
		}
		public FootballHeader getHeader() {
			return header;
		}
		public void setHeader(FootballHeader header) {
			this.header = header;
		}
	}
	
	public MathQueryObject queryMathQueryObject(Integer storeId, Integer licenseId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	public MathQueryObject queryQxcQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	public MathQueryObject queryPlwQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	public MathQueryObject queryPlsQueryObject(Integer storeId, Integer licenseId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	public MathQueryObject querySsqQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	public MathQueryObject queryQlcQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	/**
	 * 查询足彩过关统计信息
	 * @param storeId，店铺ID，必填
	 * @param licenseId，彩种，必填
	 * @param issue，期号，必填
	 * @param singleFlag，是否单式，1为单式，可不填，默认查询所有
	 * @param succFlag，是否为成功方案，1为成功方案，可不填，默认查询所有
	 * @param type，方案类型，1-代购，2-追号，3-合买，可不填，默认查询所有
	 * @param userid，彩民ID，查询固定彩民方案时使用
	 * @param username，彩民账户名，模糊查询
	 * @param pageNo，第几页，必填项
	 * @param pageSize，每页显示几条，必填项
	 * @return
	 */
	public FootballQueryObject queryFootballQueryObject(Integer storeId, Integer licenseId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize);
	
	/**
	 * 竞彩过关查询，默认查询一个星期的数据
	 * @param storeId，店铺ID，必填
	 * @param licenseId，彩种，必填
	 * @param singleFlag
	 * @param succFlag
	 * @param type
	 * @param userid
	 * @param username
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryGuessQueryObject(Integer storeId, Integer licenseId, String selDate, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize); 
}
