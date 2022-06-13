/**
 * <p>Desc:北京单场</p>
 * 普通玩法，上下单双：主客队的进球数之和≥3个，为上盘，俗称大球，总进球＜3个，为下盘，俗称小球。单数指主客队进球数之和是奇数，双数指主客队进球数之和是偶数。 
		过关投注 	一关 	两关 	三关 	四关 	五关 	六关
	1 	2串1 		1 				
	2 	2串3 	2 	1 				
	3 	3串1 			1 			
	4 	3串4 		3 	1 			
	5 	3串7 	3 	3 	1 			
	6 	4串1 				1 		
	7 	4串5 			4 	1 		
	8 	4串11 		6 	4 	1 		
	9 	4串15 	4 	6 	4 	1 		
	10 	5串1 					1 	
	11 	5串6 				5 	1 	
	12 	5串16 			10 	5 	1 	
	13 	5串26 		10 	10 	5 	1 	
	14 	5串31 	5 	10 	10 	5 	1 	
	15 	6串1 						1
	16 	6串7 					6 	1
	17 	6串22 				15 	6 	1
	18 	6串42 			20 	15 	6 	1
	19 	6串57 		15 	20 	15 	6 	1
	20 	6串63 	6 	15 	20 	15 	6 	1
		一、胜平负， "3"：表示主队胜，客队负；"1"：表示主队与客队平；"0"：表示主队负，客队胜。最多15关，7串1^15串1
		二、总进球，最多6关
		三、比分，最多3关
		四、半全场，最多6关
		五、上下单双，最多6关
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2015</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/8/11 Version 1.0
 */
function SingleSchedule(playId) {
	/* 组合过关到自由过关转化表 */
	var combCrMap = new Hashtable();
	combCrMap.put("2c3", new Array("2c1", "1c1"));
	combCrMap.put("3c4", new Array("3c1", "2c1"));
	combCrMap.put("3c7", new Array("3c1", "2c1", "1c1"));
	combCrMap.put("4c5", new Array("4c1", "3c1"));
	combCrMap.put("4c11", new Array("4c1", "3c1", "2c1"));
	combCrMap.put("4c15", new Array("4c1", "3c1", "2c1", "1c1"));
	combCrMap.put("5c6", new Array("5c1", "4c1"));
	combCrMap.put("5c16", new Array("5c1", "4c1", "3c1"));
	combCrMap.put("5c26", new Array("5c1", "4c1", "3c1","2c1"));
	combCrMap.put("5c31", new Array("5c1", "4c1", "3c1","2c1", "1c1"));
	combCrMap.put("6c7", new Array("6c1", "5c1"));
	combCrMap.put("6c22", new Array("6c1", "5c1", "4c1"));
	combCrMap.put("6c42", new Array("6c1", "5c1", "4c1", "3c1"));
	combCrMap.put("6c57", new Array("6c1", "5c1", "4c1", "3c1", "2c1"));
	combCrMap.put("6c63", new Array("6c1", "5c1", "4c1", "3c1", "2c1", "1c1"));
	
	var permit = 0.65;
	/*
	 * 玩法：1-胜负过关，2-胜平负，3-比分，4-半全场，5-总进球，6-上下单双， 胜负过关@see SfPassSingleSchedule
	 */
	this.playId = playId;
	
	/*比分投注项定义*/
	var bfMap = new Hashtable();
	bfMap.put("10","1:0");
	bfMap.put("20","2:0");
	bfMap.put("21","2:1");
	bfMap.put("30","3:0");
	bfMap.put("31","3:1");
	bfMap.put("32","3:2");
	bfMap.put("40","4:0");
	bfMap.put("41","4:1");
	bfMap.put("42","4:2");
	bfMap.put("9A","胜其它");
	bfMap.put("00","0:0");
	bfMap.put("11","1:1");
	bfMap.put("22","2:2");
	bfMap.put("33","3:3");
	bfMap.put("99","平其它");
	bfMap.put("01","0:1");
	bfMap.put("02","0:2");
	bfMap.put("12","1:2");
	bfMap.put("03","0:3");
	bfMap.put("13","1:3");
	bfMap.put("23","2:3");
	bfMap.put("04","0:4");
	bfMap.put("14","1:4");
	bfMap.put("24","2:4");
	bfMap.put("0A","负其它");
	
	var bfMapIndex = new Hashtable();
	bfMapIndex.put("10","0");
	bfMapIndex.put("20","1");
	bfMapIndex.put("21","2");
	bfMapIndex.put("30","3");
	bfMapIndex.put("31","4");
	bfMapIndex.put("32","5");
	bfMapIndex.put("40","6");
	bfMapIndex.put("41","7");
	bfMapIndex.put("42","8");
	bfMapIndex.put("9A","9");
	bfMapIndex.put("00","10");
	bfMapIndex.put("11","11");
	bfMapIndex.put("22","12");
	bfMapIndex.put("33","13");
	bfMapIndex.put("99","14");
	bfMapIndex.put("01","15");
	bfMapIndex.put("02","16");
	bfMapIndex.put("12","17");
	bfMapIndex.put("03","18");
	bfMapIndex.put("13","19");
	bfMapIndex.put("23","20");
	bfMapIndex.put("04","21");
	bfMapIndex.put("14","22");
	bfMapIndex.put("24","23");
	bfMapIndex.put("0A","24");
	
	var bqcMapIndex = new Hashtable();
	bqcMapIndex.put("33","0");
	bqcMapIndex.put("31","1");
	bqcMapIndex.put("30","2");
	bqcMapIndex.put("13","3");
	bqcMapIndex.put("11","4");
	bqcMapIndex.put("10","5");
	bqcMapIndex.put("03","6");
	bqcMapIndex.put("01","7");
	bqcMapIndex.put("00","8");
	
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
			var g = new BjDcObject(schedules[i].issue,schedules[i].uuid,schedules[i].leageType,
					schedules[i].leageName,schedules[i].raceStartTime,schedules[i].betEndTime,schedules[i].hostTeam,
					schedules[i].guestTeam,schedules[i].schudlesNO,schedules[i].spfOdds,schedules[i].bfOdds,
					schedules[i].zjqOdds,schedules[i].bqcOdds,schedules[i].sxdsOdds,
					schedules[i].trend,schedules[i].rq);
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
	 * 获取过关赔率（玩法的所有赔率）
	 */
	this.getOdds = function(scheduleId) {
		var odds = "0.0";
		switch( this.playId ) {
		case 2:
			odds = this.scheduleMap.get(scheduleId).spfodds;
			break;
		case 3:
			odds = this.scheduleMap.get(scheduleId).bfodds;
			break;
		case 4:
			odds = this.scheduleMap.get(scheduleId).bqcodds;
			break;
		case 5:
			odds = this.scheduleMap.get(scheduleId).zjqodds;
			break;
		case 6:
			odds = this.scheduleMap.get(scheduleId).sxdsodds;
			break;
		}
		return odds;
	}
	
	/**
	 * 获取过关彩果的赔率(单个)
	 * @param scheduleId,对阵编号
	 * @param bet,彩果
	 */
	this.getBetOdds = function(scheduleId, bet) {
		var odds = [];
		var odd = "";
		switch ( playId ) {
		case 2:
			odds = this.scheduleMap.get(scheduleId).spfodds.split(",");
			if ( bet == "3" ) {
				odd = odds[0];
			} else if ( bet == "1" ) {
				odd = odds[1];
			} else {
				odd = odds[2];
			}
			break;
		case 3:
			odds = this.scheduleMap.get(scheduleId).bfodds.split(",");
			var index = parseInt(bfMapIndex.get(bet),10);
			odd = odds[index];
			break;
		case 4:
			odds = this.scheduleMap.get(scheduleId).bqcodds.split(",");
			var index = parseInt(bqcMapIndex.get(bet),10);
			odd = odds[index];
			break;
		case 5:
			odds = this.scheduleMap.get(scheduleId).zjqodds.split(",");
			var index = parseInt(bet,10);
			odd = odds[index];
			break;
		case 6:
			odds = this.scheduleMap.get(scheduleId).sxdsodds.split(",");
			var index = parseInt(bet,10);
			odd = odds[index];
			break;
		}
		return odd;
	}
	
	/**
	 * 玩法的最大过关数
	 */
	this.getMaxPass = function() {
		var pass = 6;
		switch ( playId ) {
		case 2:
			pass = 15;
			break;
		case 3:
			pass = 3;
			break;
		}
		return pass;
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
		var pass = this.getMaxPass(); // 从2串1开始
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
	
	/**
	 * 生成奖金优化单, Optimization类对象
	 * @param betCode,投注码
	 * @param passString,过关串
	 */
	this.createOptList = function(betCode, passString) {
		var codeList = this.tsfCmp2Sngl(betCode, passString);
		var retList = new Array();
		for ( var i = 0; i < codeList.length; i++ ) {
			var om = new Optimization();
			var cInfo = codeList[i].split("|");
			var bonus = 1;
			for ( var j = 0; j < cInfo.length; j++ ) {
				var ccInfo = cInfo[j].split(":");
				bonus *= parseFloat(this.getBetOdds(ccInfo[0], ccInfo[1]));
			}
			bonus = parseFloat(new Number(bonus*2).toFixed(2));
			om.baseBonus = bonus;
			om.betCode = codeList[i];
			om.multiple = 1;
			
			retList.push(om);
		}
		return retList;
	}
	
	this.tsfCmp2Sngl = function(betCode, passString) {
		var bets = betCode.split("|");
		var codeArray = new Array();
		for ( var i = 0; i < bets.length; i++ ) {
			var subArray = new Array();
			var split = bets[i].split(":");
			var codes = split[1].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				subArray.push(split[0] + ":" + codes[j] + ":0");
			}
			codeArray.push(subArray);
		}
		
		var retArray = new Array();
		var pts = passString.split(",");
		for ( var i = 0; i < pts.length; i++ ) {
			var cLen = parseInt(pts[i].split("c")[0]);
			var calcArrays = combAlg.findComb(codeArray, codeArray.length, cLen);
			for ( var j = 0; j < calcArrays.length; j++ ) {
				var splitArray = combAlg.findNmComb(calcArrays[j]);
				
				for ( var k = 0; k < splitArray.length; k++ ) {
					var releaseCode = "";
					
					for ( var kk = 0; kk < splitArray[k].length; kk++ ) {
						releaseCode += splitArray[k][kk] + "|";
					}
					releaseCode = releaseCode.substring(0, releaseCode.length - 1);
					retArray.push(releaseCode);
				}
			}
		}
		return retArray;
	}
}

function BjDcObject(issue,id,leageType,leageName,startTime,stopTime,hostName,guestName,schudlesNO,spfodds,
		bfodds,zjqodds,bqcodds,sxdsodds,trend,rq) {
	this.issue = issue;	// 期号
	this.id = id;	// 编号：日期（8位）+序号
	this.leageType = leageType;// 类型：足彩/篮球/羽毛球
	this.leageName = leageName;// 联赛名称
	this.startTime = startTime;// 比赛开始时间
	this.stopTime = stopTime;	// 比赛截止时间
	this.hostName = hostName;	// 主队名称
	this.guestName = guestName;	// 客队名称
	this.schudlesNO = schudlesNO;//对阵号，用于显示亚欧析
	this.spfodds = spfodds;	// 赔率 1.20,3.00
	this.bfodds = bfodds;
	this.zjqodds = zjqodds;
	this.bqcodds = bqcodds;
	this.sxdsodds = sxdsodds;
	this.trend = trend; // 赔率上升或下降趋势，[0,1],1-上升，0-下降
	this.rq	= rq;	// 让球或让分
}

function Optimization(betCode, baseBonus, multiple) {
	this.betCode = betCode;
	this.baseBonus = baseBonus;
	this.multiple = multiple;
	this.even = 0;	// 	0-非保本，1-保本
}