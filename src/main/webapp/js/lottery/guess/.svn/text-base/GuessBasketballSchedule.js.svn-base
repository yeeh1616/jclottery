/**
 * <p>Desc:竞彩篮球对阵类，页面装载时装配入Map中</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/6 Version 1.0
 */

function GuessBasketballSchedule(id, leageName, hostName, guestName, averageOdds, startTime, stopTime,
		sfDgOdds, sfGgOdds, rfsfDgOdds, rfsfGgOdds, sfcGgOdds, dxfDgOdds, dxfGgOdds, dgrf, ggrf,
		dgyszf, ggyszf, bgcolor) {
	this.id = id;	// 编号：20140317001
	this.leageName = leageName;	// 联赛名称
	this.hostName = hostName;	// 主队名称
	this.guestName = guestName;	// 客队名称
	this.averageOdds = averageOdds;	// 平均赔率
	this.startTime = startTime;	// 比赛开始时间
	this.stopTime = stopTime;	// 比赛截止时间
	
	this.sfDgOdds = sfDgOdds;	// 胜负单关赔率
	this.sfGgOdds = sfGgOdds;	// 胜负过关赔率
	this.rfsfDgOdds = rfsfDgOdds;	// 让分胜负单关赔率
	this.rfsfGgOdds = rfsfGgOdds;	// 让分胜负过关赔率
	this.sfcGgOdds = sfcGgOdds;	// 胜分差过关赔率（单关/过关一致）
	this.dxfDgOdds = dxfDgOdds;	// 大小分单关赔率
	this.dxfGgOdds = dxfGgOdds;	// 大小分过关赔率
	
	this.dgrf = dgrf;	//	让分
	this.ggrf = ggrf;	// 	过关让分
	this.dgyszf = dgyszf;	//	预设总分
	this.ggyszf = ggyszf;	//  过关总分
	
	this.bgcolor = bgcolor;
	
	/**
	 * 获取胜负过关彩果赔率
	 */
	this.getSfGgBetOdd = function(bet) {
		bet = bet == "3" ? "0" : "1";
		var odds = this.sfGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
	
	/**
	 * 获取让分胜负过关彩果赔率
	 */
	this.getRfsfGgBetOdd = function(bet) {
		bet = bet == "3" ? "0" : "1";
		var odds = this.rfsfGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
	
	/**
	 * 获取胜分差彩果赔率
	 */
	this.getSfcGgBetOdd = function(bet) {
		var odds = this.sfcGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
	
	/**
	 * 获取大小分彩果赔率
	 */
	this.getDxfGgBetOdd = function(bet) {
		var odds = this.dxfGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
	
	this.getGgrf = function() {
		return this.ggrf;
	}
	
	this.getGgyszf = function() {
		return this.ggyszf;
	}
}