/**
 * <p>Desc:胜负过关</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2015</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/8/11 Version 1.0
 */
function SfPassSingleSchedule() {
	/*
	 * 至少3场至多15场比赛投注为过关投注。
	 * 序 	过关投注 	3关 	4关 	5关 	6关 	7关 	8关 	9关 	10关 	11关 	12关 	13关 	14关 	15关
		1 	3*1 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		2 	4*1 	　 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		3 	4*5 	4 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		4 	5*1 	　 	　 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		5 	5*6 	　 	5 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		6 	5*16 	10 	5 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　
		7 	6*1 	　 	　 	　 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　
		8 	6*7 	　 	　 	6 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　
		9 	6*22 	　 	15 	6 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　
		10 	6*42 	20 	15 	6 	1 	　 	　 	　 	　 	　 	　 	　 	　 	　
		11 	7*1 	　 	　 	　 	　 	1 	　 	　 	　 	　 	　 	　 	　 	　
		12 	8*1 	　 	　 	　 	　 	　 	1 	　 	　 	　 	　 	　 	　 	　
		13 	9*1 	　 	　 	　 	　 	　 	　 	1 	　 	　 	　 	　 	　 	　
		14 	10*1 	　 	　 	　 	　 	　 	　 	　 	1 	　 	　 	　 	　 	　
		15 	11*1 	　 	　 	　 	　 	　 	　 	　 	　 	1 	　 	　 	　 	　
		16 	12*1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	1 	　 	　 	　
		17 	13*1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	1 	　 	　
		18 	14*1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	1 	　
		19 	15*1 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	　 	1
		单场胜负过关游戏设一个奖级，为浮动奖：单注奖金=单注本金×所选场次的单场SP值连乘×65%，单场胜负过关游戏单注彩票中奖奖金最高限额500万元。
		“3”：表示主队胜，客队负；“0”：表示主队负，客队胜。
		单场胜负过关游戏以国家体育总局体育彩票管理中心选定的运动项目的比赛为竞猜对象，包括足球、篮球、网球、橄榄球、排球、
		羽毛球、乒乓球、沙滩排球、冰球、曲棍球、手球、水球比赛 。“3”：表示主队胜，客队负；“0”：表示主队负，客队胜。
	 */
	var minPassLen = 3, maxPassLen = 15;	// 最小过关数与最大过关数
	var permit = 0.65;
	
	/* 胜负过关 组合过关到自由过关转化表 */
	var combCrMap = new Hashtable();
	combCrMap.put("4c5", new Array("4c1", "3c1"));
	combCrMap.put("5c6", new Array("5c1", "4c1"));
	combCrMap.put("5c16", new Array("5c1", "4c1", "3c1"));
	combCrMap.put("6c7", new Array("6c1", "5c1"));
	combCrMap.put("6c22", new Array("6c1", "5c1", "4c1"));
	combCrMap.put("6c42", new Array("6c1", "5c1", "4c1", "3c1"));
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 对阵映射表
	 */
	this.scheduleMap = new Hashtable();
	
	/**
	 * 初始化对阵信息
	 */
	this.init = function(schedules) {
		for ( var i = 0; i < schedules.length; i++ ) {
			var g = new SfPassObject(schedules[i].issue,schedules[i].uuid,schedules[i].leageType,
					schedules[i].leageName,schedules[i].raceStartTime,schedules[i].betEndTime,schedules[i].hostTeam,
					schedules[i].guestTeam,schedules[i].schudlesNO,schedules[i].odds,schedules[i].trend,schedules[i].rq);
			this.scheduleMap.put(schedules[i].uuid, g);
		}
	}
	
	/**
	 * 获取对阵比赛截止时间
	 */
	this.getStopTime = function(scheduleId) {
		return this.scheduleMap.get(scheduleId).stopTime;
	}
	
	/**
	 * 获取对阵比赛开赛时间
	 */
	this.getStartTime = function(scheduleId) {
		return this.scheduleMap.get(scheduleId).startTime;
	}
	
	/**
	 * 获取足球让球，篮球让分/预设总分
	 */
	this.getGgRqOrRf = function(scheduleId) {
		return this.scheduleMap.get(scheduleId).rq;
	}
	
	/**
	 * 获取过关彩果的赔率(单个)
	 * @param scheduleId,对阵编号
	 * @param bet,彩果
	 */
	this.getBetOdds = function(scheduleId, bet) {
		var odds = this.scheduleMap.get(scheduleId).odds.split(",");
		var odd = bet == "3" ? odds[0] : odds[1];
		return odd;
	}
	
	/**
	 * 计算自由过关注数
	 * @param betArray,彩果，二维数组 new Array(new Array("3"),new Array("3","1"),new Array("3","1","0"))
	 * @param passType,自由过关方式
	 * @return 注数
	 */
	this.calcFreePassNum = function(betArray, passType) {
		var betNum = 0;
		var cLen = parseInt(passType.split("c")[0]);
		/* 返回三维数组 */
		var calcArrays = combAlg.findComb(betArray, betArray.length, cLen);
		
		for ( var i = 0; i < calcArrays.length; i++ ) {
			var betN = 1;
			for ( var j = 0; j < calcArrays[i].length; j++ ) {
				betN *= calcArrays[i][j].length;
			}
			betNum += betN;
		}
		return betNum;
	}
	
	/**
	 * 计算组合过关过关注数
	 * @param betArray,彩果，二维数组 new Array(new Array("3"),new Array("3","1"),new Array("3","1","0"))
	 * @param passType,组合过关方式
	 * @return 注数
	 */
	this.calcCombPassNum = function(betArray, passType) {
		var betNum = 0;
		var cLen = parseInt(passType.split("c")[0]);
		if ( cLen == betArray.length ) {
			var freeArray = combCrMap.get(passType);
			for ( var i = 0; i < freeArray.length; i++ ) {
				betNum += this.calcFreePassNum(betArray, freeArray[i]);
			}
		} else {
			var calcArrays = combAlg.findComb(betArray, betArray.length, cLen);
			var freeArray = combCrMap.get(passType);
			for ( var i = 0; i < calcArrays.length; i++ ) {
				for ( var j = 0; j < freeArray.length; j++ ) {
					betNum += this.calcFreePassNum(calcArrays[i], freeArray[j]);
				}
			}
		}
		return betNum;
	}
	
	/**
	 * 根据投注码计算注数(组合过关与自由过关通用,胆拖、非胆拖统一调用)，页面统一调用此方法计算
	 * @param betCode,投注码：20140402001:3,1:0|20140402002:3,1:0
	 * @param passString,过关方式串："2c1,3c1"
	 * @return 注数
	 */
	this.calcBetNum = function(betCode, passString) {
		var betArray = new Array();
		var danBetArray = new Array();
		var bets = betCode.split("|");
		var pts = passString.split(",");
		var betNum = 0;
		for ( var i = 0; i < bets.length; i++ ) {
			var subBetArray = new Array();
			var pbts = bets[i].split(":")[1].split(",");
			for ( var j = 0; j < pbts.length; j++ ) {
				subBetArray.push(pbts[j]);
			}
			if ( bets[i].split(":")[2] == "2") {
				// 胆
				danBetArray.push(subBetArray);
			} else {
				betArray.push(subBetArray);
			}
		}
		if ( danBetArray.length == 0 ) {
			for ( var i = 0; i < pts.length; i++ ) {
				if ( parseInt(pts[i].split("c")[1]) > 1 ) {
					betNum += this.calcCombPassNum(betArray, pts[i]);
				} else {
					betNum += this.calcFreePassNum(betArray, pts[i]);
				}
			}
		} else {
			// 胆拖注数计算
			var passArray = new Array();
			for ( var i = 0; i < pts.length; i++ ) {
				passArray.push(pts[i]);
			}
			betNum = this.calcDanTuoBetNum(danBetArray, betArray, passArray);
		}
		return betNum;
	}
	
	/**
	 * 计算胆拖注数(胆拖只支持自由过关)，页面统一调用此方法计算
	 * @param danBetArray,胆彩果，二维数组 new Array(new Array("3"),new Array("3","1"),new Array("3","1","0"))
	 * @param tuoBetArray,拖，二维数组 new Array(new Array("3"),new Array("3","1"))
	 * @param passArray,一维数组，存放过关方式
	 * @return 注数
	 */
	this.calcDanTuoBetNum = function(danBetArray, tuoBetArray, passArray) {
		var betNum = 0;
		for ( var k = 0; k < passArray.length; k++ ) {
			var cLen = parseInt(passArray[k].split("c")[0]);
			/* 返回三维数组 */
			var calcArrays = combAlg.findComb(tuoBetArray, tuoBetArray.length, cLen - danBetArray.length);
			for ( var i = 0; i < calcArrays.length; i++ ) {
				var betN = 1;
				for ( var j = 0; j < calcArrays[i].length; j++ ) {
					betN *= calcArrays[i][j].length;
				}
				for ( var j = 0; j < danBetArray.length; j++ ) {
					betN *= danBetArray[j].length;
				}
				betNum += betN;
			}
		}
		return betNum;
	}
	
	/**
	 * 计算自由过关奖金
	 * @param bonusArray，一维数组(数组存储每一个对阵的最大奖金或最小奖金)
	 * @param passType，过关方式，2x1,3x1...
	 * @param multiple,倍数
	 */
	this.calcFreePassBonus = function(bonusArray, passType, multiple) {
		var bonus = 0;
		var cLen = parseInt(passType.split("c")[0]);
		
		var calcArrays = combAlg.findComb(bonusArray, bonusArray.length, cLen);
		
		for ( var i = 0; i < calcArrays.length; i++ ) {
			var betN = 1;
			for ( var j = 0; j < calcArrays[i].length; j++ ) {
				betN *= parseFloat(calcArrays[i][j]);
			}
			bonus += betN;
		}
		var bns = new Number(bonus * 2 * multiple);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算组合过关奖金
	 * @param bonusArray，一维数组(数组存储每一个对阵的最大奖金或最小奖金)
	 * @param passType，过关方式，3x3,3x4...
	 * @param multiple,倍数
	 */
	this.calcCombPassBonus = function(bonusArray, passType, multiple) {
		var bonus = 0;
		var cLen = parseInt(passType.split("c")[0]);
		if ( cLen == bonusArray.length ) {
			var freeArray = combCrMap.get(passType);
			for ( var i = 0; i < freeArray.length; i++ ) {
				bonus += parseFloat(this.calcFreePassBonus(bonusArray, freeArray[i], multiple));
			}
		} else {
			var calcArrays = combAlg.findComb(bonusArray, bonusArray.length, cLen);
			var freeArray = combCrMap.get(passType);
			for ( var i = 0; i < calcArrays.length; i++ ) {
				for ( var j = 0; j < freeArray.length; j++ ) {
					bonus += parseFloat(this.calcFreePassBonus(calcArrays[i], freeArray[j], multiple));
				}
			}
		}
		var bns = new Number(bonus);
		return bns.toFixed(2);	
	}
	
	/**
	 *	数组降序排序函数
	 */
	this.compare = function (_val1,_val2) {
		if ( parseFloat(_val1) < parseFloat(_val2) ) {
			return 1;
		} else if ( parseFloat(_val1) > parseFloat(_val2) ) {
			return -1;
		} else {
			return 0;
		}
	}
	
	/**
	 *	数组升序排序函数
	 */
	this.compareASC = function (_val1,_val2) {
		if ( parseFloat(_val1) > parseFloat(_val2) ) {
			return 1;
		} else if ( parseFloat(_val1) < parseFloat(_val2) ) {
			return -1;
		} else {
			return 0;
		}
	}
	
	/**
	 * 计算最小奖金，最小过关数的最低赔率
	 */
	this.calcMinBonus = function(betCode, passString, multiple) {
		var pts = passString.split(",");
		var pass = 15; // 从2串1开始
		for ( var i = 0; i < pts.length; i++ ) {
			if ( pts[i].split("c")[1] != "1" ) {
				var parray = combCrMap.get(pts[i]);
				if ( parseInt(parray[parray.length-1].split("c")[0],10) < pass ) {
					pass = parseInt(parray[parray.length-1].split("c")[0],10);
				}
			} else {
				if ( parseInt(pts[i].split("c")[0],10) < pass ) {
					pass = parseInt(pts[i].split("c")[0],10)
				}
			}
		}
		
		var codes = betCode.split("|");
		var minArray = new Array();
		for ( var i = 0; i < codes.length; i++ ) {
			var bets = codes[i].split(":")[1].split(",");
			var od = 0;
			od =  parseFloat(this.getBetOdds(codes[i].split(":")[0],bets[0]));
			for ( var oo = 0; oo < bets.length; oo++ ) {
				if ( parseFloat(this.getBetOdds(codes[i].split(":")[0],bets[oo])) < od ) {
					od = parseFloat(this.getBetOdds(codes[i].split(":")[0],bets[oo]));
				}
			}
			minArray.push(od);
		}
		var bonus = 1;
		minArray.sort(this.compareASC);
		for ( var i = 0; i < pass; i++ ) {
			bonus *= minArray[i];
		}
		var bns = new Number(bonus*multiple*2*permit);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算奖金，页面统一调用此方法计算
	 * @param betCode,投注码：20140402001:3,1:0|20140402002:3,1:0
	 * @param passString,过关方式串："2c1,3c1"
	 * @param multiple,倍数
	 * @return 奖金
	 */
	this.calcBonus = function(betCode, passString, multiple) {
		var bets = betCode.split("|");
		var pts = passString.split(",");
		
		var passArray = new Array();
		for ( var i = 0; i < pts.length; i++ ) {
			passArray.push(pts[i]);
		}
		
		var bonusArray = new Array();
		var bonusDanArray = new Array();
		
		for ( var i = 0; i < bets.length; i++ ) {
			var pbts = bets[i].split(":");
			var aps = pbts[1].split(",");
			var subArray = new Array();
			for ( var j = 0; j < aps.length; j++ ) {
				subArray.push(this.getBetOdds(pbts[0], aps[j]));
			}
			if ( pbts[2] == "2") {
				// 胆
				bonusDanArray.push(subArray);
			} else {
				bonusArray.push(subArray);
			}
		}
		var bonus = 0;
		if ( bonusDanArray.length == 0 ) {
			bonus = this.calcBonus0(bonusArray, passArray, multiple);
		} else {
			bonus = this.calcDanTuoBonus(bonusDanArray, bonusArray, passArray, multiple);
		}
		return bonus;
	}
	
	/**
	 * 计算奖金(最高奖金、最低奖金计算，组合过关与自由过关通用)
	 * @param bonusArray,2维数组，如：array = new Array(new Array(1.70,9.10),new Array(2.01));
	 * @param passArray,一维数组，存放过关方式
	 * @param multiple,倍数
	 * @return 奖金
	 */
	this.calcBonus0 = function(bonusArray, passArray, multiple) {
		var calcArray = new Array();
		for ( var i = 0; i < bonusArray.length; i++ ) {
			bonusArray[i].sort(this.compare);
			calcArray.push(bonusArray[i][0]);
		}
		var bonus = 0;
		for ( var i = 0; i < passArray.length; i++ ) {
			if ( parseInt(passArray[i].split("c")[1]) > 1 ) {
				bonus += parseFloat(this.calcCombPassBonus(calcArray, passArray[i], multiple));
			} else {
				bonus += parseFloat(this.calcFreePassBonus(calcArray, passArray[i], multiple));
			}
		}
		var bns = new Number(bonus*permit);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算胆拖奖金(最高奖金、最低奖金计算，胆拖只支持自由过关)，页面统一调用此方法计算
	 * @param bonusDanArray,2维数组，如：array = new Array(new Array(1.70,9.10),new Array(2.01));
	 * @param bonusTuoArray,2维数组，如：array = new Array(new Array(1.70,9.10),new Array(2.01));
	 * @param passArray,一维数组，存放过关方式
	 * @return 注数
	 */
	this.calcDanTuoBonus = function(bonusDanArray, bonusTuoArray, passArray, multiple) {
		var bonus = 0;
		var danCalcArray = new Array();
		for ( var i = 0; i < bonusDanArray.length; i++ ) {
			bonusDanArray[i].sort(this.compare);
			danCalcArray.push(bonusDanArray[i][0]);
		}
		var tuoCalcArray = new Array();
		for ( var i = 0; i < bonusTuoArray.length; i++ ) {
			bonusTuoArray[i].sort(this.compare);
			tuoCalcArray.push(bonusTuoArray[i][0]);
		}
		for ( var i = 0; i < passArray.length; i++ ) {
			var cLen = parseInt(passArray[i].split("c")[0]);
			var calcArrays = combAlg.findComb(tuoCalcArray, tuoCalcArray.length, cLen - danCalcArray.length);
			for ( var k = 0; k < calcArrays.length; k++ ) {
				var betN = 1;
				for ( var j = 0; j < calcArrays[k].length; j++ ) {
					betN *= parseFloat(calcArrays[k][j]);
				}
				for ( var j = 0; j < danCalcArray.length; j++ ) {
					betN *= parseFloat(danCalcArray[j]);
				}
				bonus += betN;
			}
		}
		var bns = new Number(bonus * 2 * multiple*permit);
		return bns.toFixed(2);	
	}
}

function SfPassObject(issue,id,leageType,leageName,startTime,stopTime,hostName,guestName,schudlesNO,odds,trend,rq) {
	this.issue = issue;	// 期号
	this.id = id;	// 编号：日期（8位）+序号
	this.leageType = leageType;// 类型：足彩/篮球/羽毛球
	this.leageName = leageName;// 联赛名称
	this.startTime = startTime;// 比赛开始时间
	this.stopTime = stopTime;	// 比赛截止时间
	this.hostName = hostName;	// 主队名称
	this.guestName = guestName;	// 客队名称
	this.schudlesNO = schudlesNO;//对阵号，用于显示亚欧析
	this.odds = odds;	// 赔率 1.20,3.00
	this.trend = trend; // 赔率上升或下降趋势，[0,1],1-上升，0-下降
	this.rq	= rq;	// 让球或让分
}
