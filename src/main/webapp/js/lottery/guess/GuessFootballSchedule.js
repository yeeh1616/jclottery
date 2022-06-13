/**
 * <p>Desc:竞彩足球对阵类，页面装载时装配入Map中</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/6 Version 1.0
 */

function GuessFootballSchedule(id, leageName, hostName, guestName, averageOdds, startTime, stopTime,
		spfDgOdds, spfGgOdds, rqspfDgOdds, rqspfGgOdds, zjqDgOdds, zjqGgOdds, bqcDgOdds, bqcGgOdds,
		bfGgOdds, dgrq, ggrq, bgcolor, schudlesNO) {
	this.id = id;	// 编号：20140317001
	this.leageName = leageName;	// 联赛名称
	this.hostName = hostName;	// 主队名称
	this.guestName = guestName;	// 客队名称
	this.averageOdds = averageOdds;	// 平均赔率
	this.startTime = startTime;	// 比赛开始时间
	this.stopTime = stopTime;	// 比赛截止时间
	this.spfDgOdds = spfDgOdds;	//	胜平负单关赔率,胜票赔率、平赔率、负赔率
	this.spfGgOdds = spfGgOdds;	// 	胜平负过关赔率
	this.rqspfDgOdds = rqspfDgOdds;	// 	让球胜平负单关赔率
	this.rqspfGgOdds = rqspfGgOdds;	//	让球胜平负过关赔率
	this.zjqDgOdds = zjqDgOdds;	//	总进球单关赔率
	this.zjqGgOdds = zjqGgOdds;	//	总进球过关赔率
	this.bqcDgOdds = bqcDgOdds;	//	半全场单关赔率
	this.bqcGgOdds = bqcGgOdds;	//	半全场过关赔率
	this.bfGgOdds = bfGgOdds;	//	比分过关赔率(单关于过关赔率一致)
	this.dgrq = dgrq;	//	单关让球数
	this.ggrq = ggrq;	//	过关让球
	this.bgcolor = bgcolor;
	this.schudlesNO = schudlesNO;//对阵号
	
	/**
	 * 获取胜平负过关彩果的赔率
	 */
	this.getSpfGgBetOdd = function(bet) {
		var odds = this.spfGgOdds.split(",");
		var odd = "0.00";
		switch( bet ) {
		case "3":
			odd = odds[0];
			break;
		case "1":
			odd = odds[1];
			break;
		case "0":
			odd = odds[2];
			break;
		}
		return odd;
	}
	
	/**
	 * 获取让球胜平负过关彩果的赔率
	 */
	this.getRqspfGgBetOdd = function(bet) {
		var odds = this.rqspfGgOdds.split(",");
		var odd = "0.00";
		switch( bet ) {
		case "3":
			odd = odds[0];
			break;
		case "1":
			odd = odds[1];
			break;
		case "0":
			odd = odds[2];
			break;
		}
		return odd;
	}
	
	/**
	 * 获取总进球过关彩果的赔率
	 */
	this.getZjqGgBetOdd = function(bet) {
		var odds = this.zjqGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
	
	
	/**
	 * 获取半全场过关彩果的赔率
	 */
	this.getBqcGgBetOdd = function(bet) {
		var odds = this.bqcGgOdds.split(",");
		var odd = "0.0";
		switch( bet ) {
		case "33":
			odd = odds[0];
			break;
		case "31":
			odd = odds[1];
			break;
		case "30":
			odd = odds[2];
			break;
		case "13":
			odd = odds[3];
			break;
		case "11":
			odd = odds[4];
			break;
		case "10":
			odd = odds[5];
			break;
		case "03":
			odd = odds[6];
			break;
		case "01":
			odd = odds[7];
			break;
		case "00":
			odd = odds[8];
			break;
		}
		return odd;
	}
	
	/**
	 * 获取比分彩果的赔率
	 */
	this.getBfBetOdd = function(bet) {
		var odds = this.bfGgOdds.split(",");
		var odd = odds[parseInt(bet)];
		return odd;
	}
}