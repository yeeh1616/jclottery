/**
 * 
 */
package com.jingc.busi.singleupload.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.Constants;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.singleupload.parser.BjDcSingleUploadParser;
import com.jingc.busi.singleupload.parser.DltSingleUploadParser;
import com.jingc.busi.singleupload.parser.FootballBqcSingleUploadParser;
import com.jingc.busi.singleupload.parser.FootballJqcSingleUploadParser;
import com.jingc.busi.singleupload.parser.FootballRxjSingleUploadParser;
import com.jingc.busi.singleupload.parser.FootballSfcSingleUploadParser;
import com.jingc.busi.singleupload.parser.GuessBasketballSingleUploadParser;
import com.jingc.busi.singleupload.parser.GuessFootballSingleUploadParser;
import com.jingc.busi.singleupload.parser.PlsSingleUploadParser;
import com.jingc.busi.singleupload.parser.PlwSingleUploadParser;
import com.jingc.busi.singleupload.parser.QlcSingleUploadParser;
import com.jingc.busi.singleupload.parser.QxcSingleUploadParser;
import com.jingc.busi.singleupload.parser.S11x5SingleUploadParser;
import com.jingc.busi.singleupload.parser.SingleUploadParser;
import com.jingc.busi.singleupload.parser.SsqSingleUploadParser;
import com.jingc.busi.util.member.FreqLicenseId;

/**
 * <p>File: UploadService.java</p>
 * <p>Desc: 单式上传业务</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: 北京彩游天下网络有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-12-17
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface UploadService {
	
	public static class JSONData {
		private Integer betNum;	//	注数
		private Integer errCode = 0;
		private String message;	//	错误消息
		private String fileName;
		public Integer getBetNum() {
			return betNum;
		}
		public void setBetNum(Integer betNum) {
			this.betNum = betNum;
		}
		public Integer getErrCode() {
			return errCode;
		}
		public void setErrCode(Integer errCode) {
			this.errCode = errCode;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
	}
	
	// 表单
	public static class BetObject {
		private Integer licenseId;
		private String issue;
		private String stopTime;
		private String fileName;
		private String schs;	//	对阵编号列表，逗号隔开
		private String playId;	//	竞彩玩法编号
		private String passType; // 过关方式
		private String rqs;	//	竞彩让球/让分
		private Integer multiple = 1;//倍数
		private String zjFlag;	// 大乐透追加
		private String reserved15;
		private String reserved16;
		private String fsscFlag = "0";	// 1为复式上传+
		private int betNum;
		public Integer getLicenseId() {
			return licenseId;
		}
		public void setLicenseId(Integer licenseId) {
			this.licenseId = licenseId;
		}
		public String getIssue() {
			return issue;
		}
		public void setIssue(String issue) {
			this.issue = issue;
		}
		public String getStopTime() {
			return stopTime;
		}
		public void setStopTime(String stopTime) {
			this.stopTime = stopTime;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getSchs() {
			return schs;
		}
		public void setSchs(String schs) {
			this.schs = schs;
		}
		public String getPlayId() {
			return playId;
		}
		public void setPlayId(String playId) {
			this.playId = playId;
		}
		public String getPassType() {
			return passType;
		}
		public void setPassType(String passType) {
			this.passType = passType;
		}
		public String getRqs() {
			return rqs;
		}
		public void setRqs(String rqs) {
			this.rqs = rqs;
		}
		public Integer getMultiple() {
			return multiple;
		}
		public void setMultiple(Integer multiple) {
			this.multiple = multiple;
		}
		public String getZjFlag() {
			return zjFlag;
		}
		public void setZjFlag(String zjFlag) {
			this.zjFlag = zjFlag;
		}
		public String getReserved15() {
			return reserved15;
		}
		public void setReserved15(String reserved15) {
			this.reserved15 = reserved15;
		}
		public String getReserved16() {
			return reserved16;
		}
		public void setReserved16(String reserved16) {
			this.reserved16 = reserved16;
		}
		public String getFsscFlag() {
			return fsscFlag;
		}
		public void setFsscFlag(String fsscFlag) {
			this.fsscFlag = fsscFlag;
		}
		public int getBetNum() {
			return betNum;
		}
		public void setBetNum(int betNum) {
			this.betNum = betNum;
		}
	}
	
	// 单式上传->合买表单
	public static class MergerBetObject extends BetObject {
		private String partTitile;	// 方案标题
	    private String partDetail;	// 方案描述
	    private Integer totalNum;	// 总份数
	    private Integer launchNum;	// 发起人认购份数，同时生成一条参与合买数据
	    private Integer showLevel;	// 保密设置
	    private Double brokerage;	// 佣金
	    private Integer insType;	// 	保底方式 added at 2015/03/17
	    private Integer insNum;	//保底份数
	    private Integer scope;	// 方案可见范围 added at 2015/04/02
		public String getPartTitile() {
			return partTitile;
		}
		public void setPartTitile(String partTitile) {
			this.partTitile = partTitile;
		}
		public String getPartDetail() {
			return partDetail;
		}
		public void setPartDetail(String partDetail) {
			this.partDetail = partDetail;
		}
		public Integer getTotalNum() {
			return totalNum;
		}
		public void setTotalNum(Integer totalNum) {
			this.totalNum = totalNum;
		}
		public Integer getLaunchNum() {
			return launchNum;
		}
		public void setLaunchNum(Integer launchNum) {
			this.launchNum = launchNum;
		}
		public Integer getShowLevel() {
			return showLevel;
		}
		public void setShowLevel(Integer showLevel) {
			this.showLevel = showLevel;
		}
		public Double getBrokerage() {
			return brokerage;
		}
		public void setBrokerage(Double brokerage) {
			this.brokerage = brokerage;
		}
		public Integer getInsType() {
			return insType;
		}
		public void setInsType(Integer insType) {
			this.insType = insType;
		}
		public Integer getInsNum() {
			return insNum;
		}
		public void setInsNum(Integer insNum) {
			this.insNum = insNum;
		}
		public Integer getScope() {
			return scope;
		}
		public void setScope(Integer scope) {
			this.scope = scope;
		}
	}
	
	public static class SingleUploadParserFactory {
		private static Map<Integer, SingleUploadParser> map = new Hashtable<Integer, SingleUploadParser>();
		static {
			map.put(Constants.LICENSE_14SFC, new FootballSfcSingleUploadParser());
			map.put(Constants.LICENSE_R9, new FootballRxjSingleUploadParser());
			map.put(Constants.LICENSE_6CBQ, new FootballBqcSingleUploadParser());
			map.put(Constants.LICENSE_4JQ, new FootballJqcSingleUploadParser());
			map.put(Constants.LICENSE_PLS, new PlsSingleUploadParser());
			map.put(Constants.LICENSE_PLW, new PlwSingleUploadParser());
			map.put(Constants.LICENSE_QXC, new QxcSingleUploadParser());
			map.put(Constants.LICENSE_LJY, new QxcSingleUploadParser());
			map.put(Constants.LICENSE_DLT, new DltSingleUploadParser());
			
			map.put(Constants.LICENSE_JCZQ, new GuessFootballSingleUploadParser());
			map.put(Constants.LICENSE_JCLQ, new GuessBasketballSingleUploadParser());
			
			map.put(Constants.LICENSE_BJDC, new BjDcSingleUploadParser());
			
			map.put(Constants.LICENSE_SSQ, new SsqSingleUploadParser());
			map.put(Constants.LICENSE_3D, new PlsSingleUploadParser());
			map.put(Constants.LICENSE_QLC, new QlcSingleUploadParser());
			map.put(FreqLicenseId.LICENSE_FREQ_SD11X5, new S11x5SingleUploadParser());
		}
		public static SingleUploadParser getSingleUploadParser(Integer licenseId) {
			if ( licenseId > 101 ) {
				licenseId = FreqLicenseId.LICENSE_FREQ_SD11X5;
			}
			return map.get(licenseId);
		}
	}
	
	public String parse(Integer licenseId, String line);
	
	/**
	 * 排列三校验
	 * @param licenseId
	 * @param playId，1-直选单式，2-组三单式，3-组六单式
	 * @param line
	 * @return
	 */
	public String parsePls(Integer licenseId, int playId, String line);
	
	/**
	 * 11选5校验
	 * @param licenseId
	 * @param playId
	 * @param line
	 * @return
	 */
	public String parseS11x5(Integer licenseId, int playId, String line);
	
	public String parseGuessLine(Integer licenseId, int playId, String fileContent, int schNum, int passLen, boolean withSch);
	
	/**
	 * 提交订单
	 * @param bo
	 */
	public LotteryOrder bet(BetObject bo, Member m);
	
	/**
	 * 带场次上传，上传成功直接提交
	 * @param licenseId
	 * @param playId
	 * @param list
	 */
	public void uploadWithSch(Integer licenseId, Integer playId, List<String> list);
	
	/**
	 * 合买提交订单
	 * @param mbo
	 */
	public LotteryOrder merger(MergerBetObject mbo, Member m);
	
	/**
	 * 先发起，后上传
	 * @param orderId
	 * @param m
	 * @param codeList
	 * @return
	 */
	public void frsMerger(Integer orderId, BetObject bo, Member m, List<String> codeList);
	

}
