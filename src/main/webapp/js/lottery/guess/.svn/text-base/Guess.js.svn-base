/**
 * <p>Desc:竞彩类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/6 Version 1.0
 */
function Guess(lienseId, playId) {
	
	this.licenseId = lienseId;	// 彩种，9-竞彩足球，10-竞彩篮球
	this.playId = playId;	// 玩法，足球：1-胜平负，2-让球，3-总进球，4-半全场，5-比分，6-混合过关
								// 篮球：1-胜负，2-让分胜负，3-胜分差，4-大小分，6-混合过关
	
	/**
	 * 组合过关到自由过关转化表
	 */
	var combCrMap = new Hashtable();
	/**
	 * 自由过关到组合过关转化
	 */
	var freeCrMap = new Hashtable();
	
	combCrMap.put("3c3", new Array("2c1"));								// 3串3
	combCrMap.put("3c4", new Array("3c1", "2c1"));						// 3串4
	
	freeCrMap.put("3_2","3c3");		// 3场3串3
	freeCrMap.put("3_23","3c4");	// 3场3串4

	combCrMap.put("4c4", new Array("3c1"));								// 4串4
	combCrMap.put("4c5", new Array("4c1", "3c1"));						// 4串5
	combCrMap.put("4c6", new Array("2c1"));								// 4串6
	combCrMap.put("4c11", new Array("4c1", "3c1", "2c1"));				// 4串11
	
	freeCrMap.put("4_3","4c4");		// 4场4串4
	freeCrMap.put("4_34","4c5");	// 4场4串5
	freeCrMap.put("4_2","4c6");	// 4场4串6
	freeCrMap.put("4_234","4c11");	// 4场4串11

	combCrMap.put("5c5", new Array("4c1"));								// 5串5
	combCrMap.put("5c6", new Array("5c1", "4c1"));						// 5串6
	combCrMap.put("5c10", new Array("2c1"));							// 5串10
	combCrMap.put("5c16", new Array("5c1", "4c1", "3c1"));				// 5串16
	combCrMap.put("5c20", new Array("3c1", "2c1"));						// 5串20
	combCrMap.put("5c26", new Array("5c1", "4c1", "3c1", "2c1"));		// 5串26
	
	freeCrMap.put("5_4","5c5");		// 5场5串5
	freeCrMap.put("5_45","5c6");		// 5场5串6
	freeCrMap.put("5_2","5c10");		// 5场5串10
	freeCrMap.put("5_345","5c16");		// 5场5串16
	freeCrMap.put("5_23","5c20");		// 5场5串20
	freeCrMap.put("5_2345","5c26");		// 5场5串26

	combCrMap.put("6c6", new Array("5c1"));								// 6串6
	combCrMap.put("6c7", new Array("6c1", "5c1"));						// 6串7
	combCrMap.put("6c15", new Array("2c1"));							// 6串15
	combCrMap.put("6c20", new Array("3c1"));							// 6串20
	combCrMap.put("6c22", new Array("6c1", "5c1", "4c1"));				// 6串22
	combCrMap.put("6c35", new Array("3c1", "2c1"));						// 6串35
	combCrMap.put("6c42", new Array("6c1", "5c1", "4c1", "3c1"));		// 6串42
	combCrMap.put("6c50", new Array("4c1", "3c1", "2c1"));				// 6串50
	combCrMap.put("6c57", new Array("6c1", "5c1", "4c1", "3c1", "2c1"));// 6串57
	
	freeCrMap.put("6_5","6c6");		// 6场6串6
	freeCrMap.put("6_56","6c7");		// 6场6串7
	freeCrMap.put("6_2","6c15");		// 6场6串15
	freeCrMap.put("6_3","6c20");		// 6场6串20
	freeCrMap.put("6_456","6c22");		// 6场6串22
	freeCrMap.put("6_23","6c35");		// 6场6串35
	freeCrMap.put("6_3456","6c42");		// 6场6串42
	freeCrMap.put("6_234","6c50");		// 6场6串50
	freeCrMap.put("6_23456","6c57");		// 6场6串57

	combCrMap.put("7c7", new Array("6c1"));										// 7串7
	combCrMap.put("7c8", new Array("7c1", "6c1"));								// 7串8
	combCrMap.put("7c21", new Array("5c1"));									// 7串21
	combCrMap.put("7c35", new Array("4c1"));									// 7串35
	combCrMap.put("7c120", new Array("7c1", "6c1", "5c1", "4c1", "3c1", "2c1"));// 7串120
	
	freeCrMap.put("7_6","7c7");		// 7场7串7
	freeCrMap.put("7_67","7c8");		// 7场7串8
	freeCrMap.put("7_5","7c21");		// 7场7串21
	freeCrMap.put("7_4","7c35");		// 7场7串35
	freeCrMap.put("7_234567","7c120");		// 7场7串120

	combCrMap.put("8c8", new Array("7c1"));												// 8串8
	combCrMap.put("8c9", new Array("8c1", "7c1"));										// 8串9
	combCrMap.put("8c28", new Array("6c1"));											// 8串28
	combCrMap.put("8c56", new Array("5c1"));											// 8串56
	combCrMap.put("8c70", new Array("4c1"));											// 8串70
	combCrMap.put("8c247", new Array("8c1", "7c1", "6c1", "5c1", "4c1", "3c1", "2c1")); // 8串247
	
	freeCrMap.put("8_7","8c8");		// 8场8串8
	freeCrMap.put("8_78","8c9");		// 8场8串9
	freeCrMap.put("8_6","8c28");		// 8场8串28
	freeCrMap.put("8_5","8c56");		// 8场8串56
	freeCrMap.put("8_4","8c70");		// 8场8串70
	freeCrMap.put("8_2345678","8c247");		// 8场8串247
	
	var PPMAP = new Hashtable();	// 	每种自由过关对应的组合过关方式，奖金明细中使用
	PPMAP.put("2c1", new Array("3c3", "3c4" ,"4c6", "4c11", "5c10", "5c20", "5c26", "6c15", "6c35", "6c50", "6c57", "7c120", "8c247"));
	PPMAP.put("3c1", new Array("3c4", "4c4", "4c5", "4c11", "5c16", "5c20", "5c26", "6c20", "6c35", "6c42", "6c50", "6c57", "7c120", "8c247"));
	PPMAP.put("4c1", new Array("4c5", "4c11", "5c5", "5c6", "5c16", "5c26", "6c22", "6c42", "6c50", "6c57", "7c35", "7c120", "8c70", "8c247"));
	PPMAP.put("5c1", new Array("5c6", "5c16", "5c26", "6c6", "6c7", "6c22", "6c42", "6c57", "7c21", "7c120", "8c56", "8c247"));
	PPMAP.put("6c1", new Array("6c7", "6c22", "6c42", "6c57", "7c7", "7c8", "7c120", "8c28", "8c247"));
	PPMAP.put("7c1", new Array("7c8", "7c120", "8c8", "8c9", "8c247"));
	PPMAP.put("8c1", new Array("8c9", "8c247"));
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 对阵映射表
	 */
	this.scheduleMap = new Hashtable();
	
	/**
	 * 初始化对阵信息
	 */
	this.init = function() {
		if ( this.licenseId == 9 ) {
			for ( var i = 0; i < schedules.length; i++ ) {
				var g = new GuessFootballSchedule(schedules[i].id, schedules[i].leaguename, schedules[i].hostname,
						schedules[i].guestname, schedules[i].overodds, schedules[i].starttime, schedules[i].stoptime,
						schedules[i].spfdgodds, schedules[i].spfggodds, schedules[i].rqspfdgodds, schedules[i].rqspfggodds,
						schedules[i].zjqdgodds, schedules[i].zjqggodds, schedules[i].bqcdgodds, schedules[i].bqcggodds,
						schedules[i].bfodds, schedules[i].dgrq, schedules[i].ggrq, schedules[i].schudlesno, schedules[i].bgcolor);
				this.scheduleMap.put(schedules[i].id, g);
			}
			//alert(scheduleMap.get('20140402007').getSpfGgBetOdd("3"));
		} else if ( this.licenseId == 10 ) {
			for ( var i = 0; i < schedules.length; i++ ) {
				var g = new GuessBasketballSchedule(schedules[i].id, schedules[i].leaguename, schedules[i].hostname,
						schedules[i].guestname, schedules[i].overodds, schedules[i].starttime, schedules[i].stoptime,
						schedules[i].sfdgodds, schedules[i].sfggodds, schedules[i].rfsfdgodds, schedules[i].rfsfggodds,
						schedules[i].sfcodds, schedules[i].dxfdgodds, schedules[i].dxfggodds, schedules[i].dgrf,
						schedules[i].ggqf, schedules[i].dgyszf, schedules[i].ggyszf, schedules[i].bgcolor);
				this.scheduleMap.put(schedules[i].id, g);
			}
			
			//alert(scheduleMap.get('20140402301').getSfGgBetOdd("3"));
		}
	}
	
	/**
	 * 自由过关转化成组合过关，减少票的输出 added at 2015/03/25
	 * @param schLen,选择场次数
	 * @param passTypeArray,过关方式串,逗号隔开
	 * return 优化后的过关，逗号隔开
	 */
	this.optimizePassType = function(schLen, passTypeArray, betCode) {
		var maxLen = this.getMaxPassNum();
		if ( this.playId == 6 ) {
			// 判断是否每个对阵都选一种玩法
			var single = true;
			var cInfo = betCode.split("|");
			for (var i = 0; i < cInfo.length; i++ ) {
				var p = cInfo[i].split(":")[1].split(",")[0].split("-")[0];
				var pp = cInfo[i].split(":")[1].split(",");
				for ( var j = 0; j < pp.length; j++ ) {
					if ( pp[j].split("-")[0] != p ) {
						 single = false;
						 break;
					 }
				}
				if ( !single ) {
					break;
				}
			}
			if ( single ) {
				// 取最大过关数
				maxLen = this.getMixedMaxPassNum(betCode);
			} else {
				return passTypeArray;
			}
		}
		if ( schLen > maxLen || schLen < 2 ) {
			return passTypeArray;
		}
		
		// 含有设胆不能合单
		var codes = betCode.split("|");
		for ( var i = 0; i < codes.length; i++ ) {
			var dd = codes[i].split(":");
			if ( dd[2] == "2" ) {
				return passTypeArray;
			}
		}
		
		var pts = passTypeArray.split(",");
		var retPtArray = new Array();
		var retSPtArray = new Array();
		var fryPsArray = new Array();
		for ( var i = 0; i < pts.length; i++ ) {
			if ( pts[i].split("c")[1] == "1" ) {
				fryPsArray.push(pts[i].split("c")[0]);
			} else {
				retSPtArray.push(pts[i]);
			}
		}
		var count = fryPsArray.length;
		if ( count > 0 ) {
			this.joinFreePt(schLen, retPtArray, fryPsArray);
		}
		// 合并之后剩下的自由过关
		for ( var o = 0; o < fryPsArray.length; o++ ) {
			var exist = false;
			for ( var i = 0; i < retPtArray.length; i++ ) {
				var localArrayString = combCrMap.get(retPtArray[i]).toString();
				if ( localArrayString.indexOf(fryPsArray[o]+"c1") > -1 ) {
					exist = true;
					break;
				}
			}
			if ( !exist ) {
				retPtArray.push(fryPsArray[o]+"c1");
			}
		}
		var retPt = "";
		for ( var i = 0; i < retPtArray.length; i++ ) {
			retPt += retPtArray[i] + ",";
		}
		for ( var i = 0; i < retSPtArray.length; i++ ) {
			retPt += retSPtArray[i] + ",";
		}
		retPt = retPt.substring(0, retPt.length - 1);
		return retPt;
	}
	
	/**
	 * 合并自由过关成组合过关
	 */
	this.joinFreePt = function(schLen, retPtArray, fryPsArray) {
		var count = fryPsArray.length;
		while ( count > 0 ) {
			var list = combAlg.findComb(fryPsArray, fryPsArray.length, count);
			var exist = false;
			for ( var i = 0; i < list.length; i++ ) {
				var pstring = "";
				for ( var j = 0; j < list[i].length; j++ ) {
					pstring += list[i][j];
				}
				if ( freeCrMap.get(schLen+"_"+pstring) != 'undefined' ) {
					// 重新设置fryPsArray数组
					retPtArray.push(freeCrMap.get(schLen+"_"+pstring));
					
					var nPsArray = new Array();
					for ( var o = 0; o < fryPsArray.length; o++ ) {
						if ( pstring.indexOf(fryPsArray[o]) == -1 ) {
							nPsArray.push(fryPsArray[o]);
						}
					}
					this.joinFreePt(schLen, retPtArray, nPsArray);
					exist = true;
					break;
				} 
			}
			if ( exist ) {
				break;
			}
			count--;
		}
	}
	
	/**
	 * 获取混合关的最大过关数
	 */
	this.getMixedMaxPassNum = function(betCode) {
		var pn = 8;
		var codes = betCode.split("|");
		if ( this.licenseId == 9 ) {
			for ( var i = 0; i < codes.length; i++ ) {
				var pp = codes[i].split(":")[1].split(",");
				for ( var j = 0; j < pp.length; j++ ) {
					var p = parseInt(pp[j].split("-")[0],10);
					switch( p ) {
					case 3:
						pn = pn > 6 ? 6 : pn;
						break;
					case 4:
						pn = pn > 4 ? 4 : pn;
						break;
					case 5:
						pn = pn > 4 ? 4 : pn;
						break;
					}
				}
			}
		} else if ( this.licenseId == 10 ) {
			for ( var i = 0; i < codes.length; i++ ) {
				var pp = codes[i].split(":")[1].split(",");
				for ( var j = 0; j < pp.length; j++ ) {
					var p = parseInt(pp[j].split("-")[0],10);
					switch( p ) {
					case 3:
						pn = pn > 4 ? 4 : pn;
						break;
					}
				}
			}
		} 
		return pn;
	}
	
	/**
	 * 获取玩法最大过关数
	 */
	this.getMaxPassNum = function() {
		var pn = 8;
		if ( this.licenseId == 9 ) {
			switch( this.playId ) {
			case 1:
				pn = 8;
				break;
			case 2:
				pn = 8;
				break;
			case 3:
				pn = 6;
				break;
			case 4:
				pn = 4;
				break;
			case 5:
				pn = 4;
				break;
			}
		} else if ( this.licenseId == 10 ) {
			switch( this.playId ) {
			case 1:
				pn = 8;
				break;
			case 2:
				pn = 8;
				break;
			case 3:
				pn = 4;
				break;
			case 4:
				pn = 8;
				break;
			}
		} 
		return pn;
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
		var result = 0;
		if ( this.licenseId == 9 ) {
			result = this.scheduleMap.get(scheduleId).ggrq;
		} else if ( this.licenseId == 10 ) {
			result = this.scheduleMap.get(scheduleId).ggrf + "`" + this.scheduleMap.get(scheduleId).ggyszf;
		}
		return result;
	}
	
	/**
	 * 获取过关赔率（玩法的所有赔率）
	 */
	this.getOdds = function(scheduleId) {
		var odds = "0.0";
		if ( this.licenseId == 9 ) {
			switch( this.playId ) {
			case 1:
				odds = this.scheduleMap.get(scheduleId).spfGgOdds;
				break;
			case 2:
				odds = this.scheduleMap.get(scheduleId).rqspfGgOdds;
				break;
			case 3:
				odds = this.scheduleMap.get(scheduleId).zjqGgOdds;
				break;
			case 4:
				odds = this.scheduleMap.get(scheduleId).bqcGgOdds;
				break;
			case 5:
				odds = this.scheduleMap.get(scheduleId).bfGgOdds;
				break;
			}
		} else if ( this.licenseId == 10 ) {
			switch( this.playId ) {
			case 1:
				odds = this.scheduleMap.get(scheduleId).sfGgOdds;
				break;
			case 2:
				odds = this.scheduleMap.get(scheduleId).rfsfGgOdds;
				break;
			case 3:
				odds = this.scheduleMap.get(scheduleId).sfcGgOdds;
				break;
			case 4:
				odds = this.scheduleMap.get(scheduleId).dxfGgOdds;
				break;
			}
		} 
		return odds;
	}
	
	/**
	 * 获取过关彩果的赔率(单个)
	 * @param scheduleId,对阵编号
	 * @param bet,彩果
	 */
	this.getBetOdds = function(scheduleId, bet) {
		var odds = "0.0";
		
		var swt = this.playId;
		
		if ( this.playId == 6 ) {
			// 混合过关
			var splitBet = bet.split("-");
			swt = parseInt(splitBet[0]);
			bet = splitBet[1];
		}
		
		if ( this.licenseId == 9 ) {
			switch( swt ) {
			case 1:
				odds = this.scheduleMap.get(scheduleId).getSpfGgBetOdd(bet);
				break;
			case 2:
				odds = this.scheduleMap.get(scheduleId).getRqspfGgBetOdd(bet);
				break;
			case 3:
				odds = this.scheduleMap.get(scheduleId).getZjqGgBetOdd(bet);
				break;
			case 4:
				odds = this.scheduleMap.get(scheduleId).getBqcGgBetOdd(bet);
				break;
			case 5:
				odds = this.scheduleMap.get(scheduleId).getBfBetOdd(bet);
				break;
			}
		} else if ( this.licenseId == 10 ) {
			switch( swt ) {
			case 1:
				odds = this.scheduleMap.get(scheduleId).getSfGgBetOdd(bet);
				break;
			case 2:
				odds = this.scheduleMap.get(scheduleId).getRfsfGgBetOdd(bet);
				break;
			case 3:
				odds = this.scheduleMap.get(scheduleId).getSfcGgBetOdd(bet);
				break;
			case 4:
				odds = this.scheduleMap.get(scheduleId).getDxfGgBetOdd(bet);
				break;
			}
		} 
		return odds;
	}
	
	/**
	 * 滤出混合串投注码（计算混合过关奖金调用） added by luochang at 2014/08/11
	 * @param betCode
	 * @param type 1-最大赔率，2-最小赔率
	 * @return 过滤之后的betCode
	 */
	this.filteMutexs = function(betCode, type) {
		var betCodes = betCode.split("|");
		var nBetCode = "";
		for ( var i = 0; i < betCodes.length; i++ ) {
			var lineInfo = betCodes[i].split(":");
			nBetCode += lineInfo[0] + ":";
			var bets = lineInfo[1].split(",");
			var betInfo = "";
			// 取得最大的赔率，将与该赔率互斥的选项去掉
			var maxOdd = parseFloat(this.getBetOdds(lineInfo[0], bets[0]));
			var maxBet = bets[0];
			for ( var j = 0; j < bets.length; j++ ) {
				if ( type == 1 ) {
					if ( parseFloat(this.getBetOdds(lineInfo[0], bets[j])) > maxOdd ) {
						maxOdd = parseFloat(this.getBetOdds(lineInfo[0], bets[j]));
						maxBet = bets[j];
					}
				} else {
					if ( parseFloat(this.getBetOdds(lineInfo[0], bets[j])) < maxOdd ) {
						maxOdd = parseFloat(this.getBetOdds(lineInfo[0], bets[j]));
						maxBet = bets[j];
					}
				}
			}
			// 获取最大赔率的投注项的互斥项
			var mutex = this.getMutexMixedBets(lineInfo[0], maxBet);
			for ( var j = 0; j < bets.length; j++ ) {
				var isRemoved = false;
				for ( var k = 0; k < mutex.length; k++ ) {
					if ( (bets[j] == mutex[k]) && (bets[j] != maxBet) ) {
						isRemoved = true;
						break;
					}
				}
				if ( !isRemoved ) {
					nBetCode += bets[j] + ",";
				}
			}
			nBetCode = nBetCode.substring(0, nBetCode.length - 1) + ":";
			nBetCode += lineInfo[2] + "|";
		}
		nBetCode = nBetCode.substring(0, nBetCode.length - 1);
		return nBetCode;
	}
	
	/**
	 * 获取混合过关互斥投注项  added by luochang at 2014/08/11
	 * @param id, 对阵编号
	 * @param bet, 投注项
	 * @return arraylist
	 */
	this.getMutexMixedBets = function(id, bet) {
		var mutexBets = new Array();
		var desc = bet.split("-");
		if ( this.licenseId == 9 ) {	// 竞彩足球
			var type = parseInt(desc[0]);
			var rq = parseInt(this.getGgRqOrRf(id));
			switch(type) {
			case 1:
			{
				switch( desc[1] ) {
				case "3":
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					} else if ( rq == -1 ) {
						mutexBets.push("2-0");
					}
					for ( var i = 13; i < 31; i++ ) {
						mutexBets.push("5-" + i);
					}
					mutexBets.push("4-31");
					mutexBets.push("4-30");
					mutexBets.push("4-11");
					mutexBets.push("4-10");
					mutexBets.push("4-01");
					mutexBets.push("4-00");
					break;
				case "1":
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					for ( var i = 0; i < 13; i++ ) {
						mutexBets.push("5-" + i);
					}
					for ( var i = 18; i < 31; i++ ) {
						mutexBets.push("5-" + i);
					}
					mutexBets.push("4-33");
					mutexBets.push("4-30");
					mutexBets.push("4-13");
					mutexBets.push("4-10");
					mutexBets.push("4-03");
					mutexBets.push("4-00");
					break;
				case "0":
					if ( rq > 0 ) {
						if ( rq == 1 ) {
							mutexBets.push("2-3");
						}
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					for ( var i = 0; i < 18; i++ ) {
						mutexBets.push("5-" + i);
					}
					mutexBets.push("4-33");
					mutexBets.push("4-31");
					mutexBets.push("4-13");
					mutexBets.push("4-11");
					mutexBets.push("4-03");
					mutexBets.push("4-01");
					break;
				}
				break;
			}
			case 2:
			{
				switch( desc[1] ) {
				case "3":
					if ( rq > 0 ) {
						mutexBets.push("1-0");
						for ( var i = 18; i < 31; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-30");
						mutexBets.push("4-10");
						mutexBets.push("4-00");
					} else {
						mutexBets.push("1-1");
						mutexBets.push("1-0");
						for ( var i = 13; i < 31; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-31");
						mutexBets.push("4-11");
						mutexBets.push("4-01");
						mutexBets.push("4-30");
						mutexBets.push("4-10");
						mutexBets.push("4-00");
					}
					break;
				case "1":
					if ( rq > 0 ) {
						mutexBets.push("1-3");
						mutexBets.push("1-1");
						for ( var i = 0; i < 18; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-33");
						mutexBets.push("4-13");
						mutexBets.push("4-03");
						mutexBets.push("4-31");
						mutexBets.push("4-11");
						mutexBets.push("4-01");
					} else {
						mutexBets.push("1-1");
						mutexBets.push("1-0");
						for ( var i = 13; i < 31; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-31");
						mutexBets.push("4-11");
						mutexBets.push("4-01");
						mutexBets.push("4-30");
						mutexBets.push("4-10");
						mutexBets.push("4-00");
					}
					break;
				case "0":
					if ( rq > 0 ) {
						mutexBets.push("1-3");
						mutexBets.push("1-1");
						for ( var i = 0; i < 18; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-33");
						mutexBets.push("4-13");
						mutexBets.push("4-03");
						mutexBets.push("4-31");
						mutexBets.push("4-11");
						mutexBets.push("4-01");
					} else {
						if ( rq == -1 ) {
							mutexBets.push("1-3");
						} else {
							mutexBets.push("1-1");
							mutexBets.push("1-0");
						}
						for ( var i = 13; i < 31; i++ ) {
							mutexBets.push("5-" + i);
						}
						mutexBets.push("4-31");
						mutexBets.push("4-11");
						mutexBets.push("4-01");
						mutexBets.push("4-30");
						mutexBets.push("4-10");
						mutexBets.push("4-00");
					}
					break;
				}
				break;
			}
			case 5:
			{
				var ibet = parseInt(desc[1]);
				if ( ibet < 13 ) {
					mutexBets.push("1-1");
					mutexBets.push("1-0");
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					}
					mutexBets.push("4-31");
					mutexBets.push("4-11");
					mutexBets.push("4-01");
					mutexBets.push("4-30");
					mutexBets.push("4-10");
					mutexBets.push("4-00");
				} else if ( ibet < 18 ) {
					mutexBets.push("1-3");
					mutexBets.push("1-0");
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					mutexBets.push("4-33");
					mutexBets.push("4-30");
					mutexBets.push("4-13");
					mutexBets.push("4-10");
					mutexBets.push("4-03");
					mutexBets.push("4-00");
				} else {
					mutexBets.push("1-3");
					mutexBets.push("1-1");
					if ( rq > 0 ) {
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					mutexBets.push("4-33");
					mutexBets.push("4-31");
					mutexBets.push("4-13");
					mutexBets.push("4-11");
					mutexBets.push("4-03");
					mutexBets.push("4-01");
				}
				break;
			}
			case 4:
			{
				if ( desc[1] == "33" || desc[1] == "13" || desc[1] == "03" ) {
					mutexBets.push("1-1");
					mutexBets.push("1-0");
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					}
					for ( var i = 13; i < 31; i++ ) {
						mutexBets.push("5-" + i);
					}
				} else if ( desc[1] == "33" || desc[1] == "13" || desc[1] == "03" ) {
					mutexBets.push("1-3");
					mutexBets.push("1-0");
					if ( rq > 0 ) {
						mutexBets.push("2-1");
						mutexBets.push("2-0");
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					for ( var i = 0; i < 13; i++ ) {
						mutexBets.push("5-" + i);
					}
					for ( var i = 18; i < 31; i++ ) {
						mutexBets.push("5-" + i);
					}
				} else {
					mutexBets.push("1-3");
					mutexBets.push("1-1");
					if ( rq > 0 ) {
					} else {
						mutexBets.push("2-3");
						mutexBets.push("2-1");
					}
					for ( var i = 0; i < 18; i++ ) {
						mutexBets.push("5-" + i);
					}
				}
				break;
			}
			case 3:
				break;
			}
		} else if (this.licenseId == 10) {
			var type = parseInt(desc[0]);
			var rf = parseFloat(this.getGgRqOrRf(id));
			switch(type) {
			case 1:
			{
				if ( desc[0] == "3" ) {
					if ( rf > 0 ) {
						mutexBets.push("2-0");
					}
					for ( var i = 0; i < 6; i++ ) {
						mutexBets.push("3-" + i);
					}
				} else {
					if ( rf > 0 ) {
					} else {
						mutexBets.push("2-3");
					}
					for ( var i = 6; i < 12; i++ ) {
						mutexBets.push("3-" + i);
					}
				}
				break;
			}
			case 2:
			{
				if ( desc[0] == "3" ) {
					if ( rf > 0 ) {
					} else {
						mutexBets.push("2-0");
						for ( var i = 0; i < 6; i++ ) {
							mutexBets.push("3-" + i);
						}
					}
				} else {
					if ( rf > 0 ) {
						mutexBets.push("2-3");
						for ( var i = 6; i < 12; i++ ) {
							mutexBets.push("3-" + i);
						}
					} else {
					}
				}
				break;
			}
			case 3:
			{
				if ( parseInt(desc[1]) > 5 ) {
					mutexBets.push("1-0");
					if ( rf > 0 ) {
						mutexBets.push("2-0");
					}
				} else {
					mutexBets.push("1-3");
					if ( rf > 0 ) {
					} else {
						mutexBets.push("2-3");
					}
				}
				break;
			}
			}
		}
		return mutexBets;
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
	 * 计算注数
	 * @param betArray,彩果，二维数组 new Array(new Array("3"),new Array("3","1"),new Array("3","1","0"))
	 * @param passArray,一维数组，存放过关方式
	 * @return 注数
	 */
	this.calcBetNum0 = function(betArray, passArray) {
		var betNum = 0;
		for ( var i = 0; i < passArray.length; i++ ) {
			if ( parseInt(passArray[i].split("c")[1]) > 1 ) {
				betNum += this.calcCombPassNum(betArray, passArray[i]);
			} else {
				betNum += this.calcFreePassNum(betArray, passArray[i]);
			}
		}
		return betNum;
	}
	
	/**
	 * 单关注数计算
	 */
	this.calcDgBetNum = function(betCode) {
		var codes = betCode.split("|");
		var lent = 0;
		for ( var i = 0; i < codes.length; i++ ) {
			lent += codes[i].split(":")[1].split(",").length;
		}
		return lent;
	}
	
	/**
	 * 根据投注码计算注数(组合过关与自由过关通用,胆拖、非胆拖统一调用)，页面统一调用此方法计算
	 * @param betCode,投注码：20140402001:3,1:0|20140402002:3,1:0
	 * @param passString,过关方式串："2c1,3c1"
	 * @return 注数
	 */
	this.calcBetNum = function(betCode, passString) {
		if ( passString == "1c1" ) {
			return this.calcDgBetNum(betCode);
		}
		var betArray = new Array();
		var danBetArray = new Array();
		var bets = betCode.split("|");
		var pts = passString.split(",");
		var betNum = 0;
		if ( this.playId != 6 ) {	// 非混关
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
		} else { // 混关
			for ( var i = 0; i < bets.length; i++ ) {
				var subBetArray = new Array();
				
				var pointerArray = new Array();
				var pbts = bets[i].split(":")[1].split(",");
				var pointer = pbts[0].split("-")[0];;
				for ( var j = 0; j < pbts.length; j++ ) {
					if ( pointer != pbts[j].split("-")[0]) {
						var nArray = new Array();
						for ( var k = 0; k < pointerArray.length; k++ ) {
							nArray.push(pointerArray[k]);
						}
						subBetArray.push(nArray);
						pointer = pbts[j].split("-")[0];
						pointerArray = new Array();
						pointerArray.push(pbts[j]);
						if ( j == pbts.length - 1) {
							var nArray = new Array();
							for ( var k = 0; k < pointerArray.length; k++ ) {
								nArray.push(pointerArray[k]);
							}
							subBetArray.push(nArray);
						}
					} else {
						pointerArray.push(pbts[j]);
						if ( j == pbts.length - 1) {
							var nArray = new Array();
							for ( var k = 0; k < pointerArray.length; k++ ) {
								nArray.push(pointerArray[k]);
							}
							subBetArray.push(nArray);
						}
					}
				}
				if ( bets[i].split(":")[2] == "2") {
					// 胆
					danBetArray.push(subBetArray);
				} else {
					betArray.push(subBetArray);
				}
				
			}
			
			var passArray = new Array();
			for ( var i = 0; i < pts.length; i++ ) {
				passArray.push(pts[i]);
			}
			
			if ( danBetArray.length == 0 ) {
				betNum = this.calcMixedBetNum(betArray, passArray);
			} else {
				betNum = this.calcMixedDanTuoBetNum(danBetArray, betArray, passArray);
			}
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
	 * 获取上限奖金
	 * @param cLen，过关数
	 * @param bonus，奖金
	 * 2串1 3串1单注封顶20万
	 * 4-5串1封顶50万
	 * 6-8串1封顶100万
	 */
	this.limitedBonus = function(cLen, bonus) {
		if ( cLen == 2 || cLen == 3 ) {
			if ( bonus > 200000 ) {
				bonus = 200000;
			}
		}
		if ( cLen == 4 || cLen == 5 ) {
			if ( bonus > 500000 ) {
				bonus = 500000;
			}
		}
		if ( cLen == 6 || cLen == 7 || cLen == 8 ) {
			if ( bonus > 1000000 ) {
				bonus = 1000000;
			}
		}
		return bonus;
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
		bonus *= 2;
		bonus = this.limitedBonus(cLen, bonus);
		var bns = new Number(bonus * multiple);
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
		var bns = new Number(bonus);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算单关最小奖金
	 */
	this.calcDgMinBonus = function(betCode, multiple) {
		var codes = betCode.split("|");
		var minArray = new Array();
		for ( var i = 0; i < codes.length; i++ ) {
			var slist = this.toSingleCode(codes[i].split(":")[1]);
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
		minArray.sort(this.compareASC);
		var bns = new Number(minArray[0]*multiple*2);
		return bns.toFixed(2);		
	}
	
	/**
	 * 计算最小奖金，最小过关数的最低赔率
	 */
	this.calcMinBonus = function(betCode, passString, multiple) {
		if ( passString == "1c1" ) {
			return this.calcDgMinBonus(betCode, multiple);
		}
		var pts = passString.split(",");
		var pass = 8; // 从2串1开始
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
			var slist = this.toSingleCode(codes[i].split(":")[1]);
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
		bonus *= 2;
		bonus = this.limitedBonus(pass, bonus);
		var bns = new Number(bonus*multiple);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算单关奖金
	 */
	this.calcDgBonus = function(betCode, multiple) {
		var bonus = 0;
		//if ( this.playId == 6 ) {
			var codes = betCode.split("|");
			for ( var i = 0; i < codes.length; i++ ) {
				var slist = this.toSingleCode(codes[i].split(":")[1]);
				for ( var j = 0; j < slist.length; j++ ) {
					// 找出单玩法的最大赔率值
					var od = 0;
					var ods = slist[j].split(",");
					od =  parseFloat(this.getBetOdds(codes[i].split(":")[0],ods[0]));
					for ( var oo = 0; oo < ods.length; oo++ ) {
						if ( parseFloat(this.getBetOdds(codes[i].split(":")[0],ods[oo])) > od ) {
							od = parseFloat(this.getBetOdds(codes[i].split(":")[0],ods[oo]));
						}
					}
					bonus += od;
				}
			}
		//}
		var bns = new Number(bonus*multiple*2);
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
		if ( passString == "1c1" ) {
			return this.calcDgBonus(betCode, multiple);
		}
		
		if ( this.playId == 6 ) {
			// 混合过关
			betCode = this.filteMutexs(betCode, 1);
		}
		var bets = betCode.split("|");
		var pts = passString.split(",");
		
		var passArray = new Array();
		for ( var i = 0; i < pts.length; i++ ) {
			passArray.push(pts[i]);
		}
		
		var bonusArray = new Array();
		var bonusDanArray = new Array();
		
		if ( this.playId != 6 ) {
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
		} else {
			for ( var i = 0; i < bets.length; i++ ) {
				var subBetArray = new Array();
				
				var pointerArray = new Array();
				var pbts = bets[i].split(":")[1].split(",");
				var pointer = pbts[0].split("-")[0];;
				for ( var j = 0; j < pbts.length; j++ ) {
					if ( pointer != pbts[j].split("-")[0]) {
						var nArray = new Array();
						for ( var k = 0; k < pointerArray.length; k++ ) {
							nArray.push(pointerArray[k]);
						}
						subBetArray.push(nArray);
						pointer = pbts[j].split("-")[0];
						pointerArray = new Array();
						pointerArray.push(this.getBetOdds(bets[i].split(":")[0], pbts[j]));
						if ( j == pbts.length - 1) {
							var nArray = new Array();
							for ( var k = 0; k < pointerArray.length; k++ ) {
								nArray.push(pointerArray[k]);
							}
							subBetArray.push(nArray);
						}
					} else {
						pointerArray.push(this.getBetOdds(bets[i].split(":")[0], pbts[j]));
						if ( j == pbts.length - 1) {
							var nArray = new Array();
							for ( var k = 0; k < pointerArray.length; k++ ) {
								nArray.push(pointerArray[k]);
							}
							subBetArray.push(nArray);
						}
					}
				}
				if ( bets[i].split(":")[2] == "2") {
					// 胆
					bonusDanArray.push(subBetArray);
				} else {
					bonusArray.push(subBetArray);
				}
				
			}
			
			if ( bonusDanArray.length == 0 ) {
				bonus = this.calcMixedMaxBonus(bonusArray, passArray, multiple);
			} else {
				bonus = this.calcMixedDanTuoMaxBonus(bonusDanArray, bonusArray, passArray, multiple);
			}
		}
		return bonus;
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
		var bns = new Number(bonus * 2 * multiple);
		return bns.toFixed(2);	
	}
	
	/**
	 * 计算混合过关注数(组合过关与自由过关通用)
	 * @param betArray,彩果，3维数组 new Array(new Array(new Array("1-3"),new Array("2-3","2-1")),new Array(new Array("1-3"),new Array("2-1")))
	 * @param passArray,一维数组，存放过关方式
	 * @return 注数
	 */
	this.calcMixedBetNum = function(betArray, passArray) {
		var betNum = 0;
		for ( var i = 0; i < passArray.length; i++ ) {
			var cLen = parseInt(passArray[i].split("c")[0]);
			var combArray = combAlg.findComb(betArray, betArray.length, cLen);
			
			for ( var j = 0; j < combArray.length; j++ ) {
				var splitArray = combAlg.findNmComb(combArray[j]);
				for ( var k = 0; k < splitArray.length; k++ ) {
					
					//betNum += this.calcBetNum(splitArray[i], passArray);
					if ( parseInt(passArray[i].split("c")[1]) > 1 ) {
						betNum += this.calcCombPassNum(splitArray[k], passArray[i]);
					} else {
						betNum += this.calcFreePassNum(splitArray[k], passArray[i]);
					}
				}
			}
			
		}
		
		return betNum;
	}
	
	/**
	 * 计算混合过关胆拖注数(胆拖只支持自由过关)，页面统一调用此方法计算
	 * @param danBetArray,胆彩果，三维数组 new Array(new Array("1-3"),new Array("1-3","2-1"),new Array("1-3","1-1","1-0"))
	 * @param tuoBetArray,拖，三维数组 new Array(new Array("3-3"),new Array("1-3","1-1"))
	 * @param passArray,一维数组，存放过关方式
	 * @return 注数
	 */
	this.calcMixedDanTuoBetNum = function(danBetArray, tuoBetArray, passArray) {
		var betNum = 0;
		var danSplitArray = combAlg.findNmComb(danBetArray);
		for ( var k = 0; k < passArray.length; k++ ) {
			var cLen = parseInt(passArray[k].split("c")[0]);
			var calcArrays = combAlg.findComb(tuoBetArray, tuoBetArray.length, cLen - danBetArray.length);
			for ( var i = 0; i < calcArrays.length; i++ ) {
				var splitArray = combAlg.findNmComb(calcArrays[i]);
				for ( var kk = 0; kk < splitArray.length; kk++ ) {
					var betN = 1;
					for ( var j = 0; j < splitArray[kk].length; j++ ) {
						betN *= splitArray[kk][j].length;
					}
					for ( var j = 0; j < danSplitArray.length; j++ ) {
						var betM = betN;
						for ( var jj = 0; jj < danSplitArray[j].length; jj++ ) {
							betM *= danSplitArray[j][jj].length;
						}
						betNum += betM;
					}
				}
			}
		}
		return betNum;
	}
	
	/**
	 * 计算混合过关最大奖金，最小奖金计算通用
	 * @param betBonusArray,奖金数组，三维数组
	 * @param passArray,一维数组，存放过关方式
	 * @param multiple,倍数
	 */
	this.calcMixedMaxBonus = function(betBonusArray, passArray, multiple) {
		var bonus = 0;
		for ( var i = 0; i < passArray.length; i++ ) {
			var cLen = parseInt(passArray[i].split("c")[0]);
			var combArray = combAlg.findComb(betBonusArray, betBonusArray.length, cLen);
			
			for ( var j = 0; j < combArray.length; j++ ) {
				var splitArray = combAlg.findNmComb(combArray[j]);
				for ( var k = 0; k < splitArray.length; k++ ) {
					var calcArray = new Array();
					for ( var kk = 0; kk < splitArray[k].length; kk++ ) {
						splitArray[k][kk].sort(this.compare);
						calcArray.push(splitArray[k][kk][0]);
					}
					if ( parseInt(passArray[i].split("c")[1]) > 1 ) {
						bonus += parseFloat(this.calcCombPassBonus(calcArray, passArray[i], multiple));
					} else {
						bonus += parseFloat(this.calcFreePassBonus(calcArray, passArray[i], multiple));
					}
				}
			}
			
		}
		var bns = new Number(bonus);
		return bns.toFixed(2);
	}
	
	/**
	 * 计算混合过关胆拖最大奖金，最小奖金计算通用(只有自由过关)
	 * @param betDanBonusArray,胆码奖金数组，三维数组
	 * @param betTuoBonusArray,拖码奖金数组，三维数组
	 * @param passArray,一维数组，存放过关方式
	 * @param multiple,倍数
	 */
	this.calcMixedDanTuoMaxBonus = function(betDanBonusArray, betTuoBonusArray, passArray, multiple) {
		var bonus = 0;
		var danSplitArray = combAlg.findNmComb(betDanBonusArray);
		for ( var k = 0; k < passArray.length; k++ ) {
			var cLen = parseInt(passArray[k].split("c")[0]);
			var calcArrays = combAlg.findComb(betTuoBonusArray, betTuoBonusArray.length, cLen - betDanBonusArray.length);
			for ( var i = 0; i < calcArrays.length; i++ ) {
				var splitArray = combAlg.findNmComb(calcArrays[i]);
				for ( var kk = 0; kk < splitArray.length; kk++ ) {
					
					var calcArray = new Array();
					for ( var kkk = 0; kkk < splitArray[kk].length; kkk++ ) {
						splitArray[kk][kkk].sort(this.compare);
						calcArray.push(splitArray[kk][kkk][0]);
					}
					
					var betN = 1;
					for ( var j = 0; j < calcArray.length; j++ ) {
						betN *= parseFloat(calcArray[j]);
					}
					for ( var j = 0; j < danSplitArray.length; j++ ) {
						var betM = betN;
						for ( var jj = 0; jj < danSplitArray[j].length; jj++ ) {
							danSplitArray[j][jj].sort(this.compare);
							betM *= parseFloat(danSplitArray[j][jj][0]);
						}
						bonus += betM;
					}
				}
			}
		}
		var bns = new Number(bonus * 2 * multiple);
		return bns.toFixed(2);	
	}
	
	/**
	 * 复式投注号码转换成单式号码,只支持自由过关
	 * @param betCode,投注号码 20140402001:3,1:0|20140402001:3:0
	 *        转换之后：--> 20140402001:3:0|20140402001:3:0
	 *                   20140402001:1:0|20140402001:3:0
	 * @param passString,过关方式串 "2c1,3c1"
	 * 
	 * @return 返回一维数组，格式：20140402001:1:0|20140402001:3:0
	 */
	this.tsfCmp2Sngl = function(betCode, passString) {
		var bets = betCode.split("|");
		var codeArray = new Array();
		var dan = 0;
		for ( var i = 0; i < bets.length; i++ ) {
			var subArray = new Array();
			var split = bets[i].split(":");
			var codes = split[1].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				subArray.push(split[0] + ":" + codes[j] + ":"+split[2]);
			}
			if ( split[2] == "2" ) {
				dan++;
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
		if ( dan == 0 ) {
			return retArray;
		} else {
			var danArray = new Array();
			for ( var i = 0; i < retArray.length; i++ ) {
				var sd = 0;
				var split = retArray[i].split("|");
				for ( var j = 0; j < split.length; j++ ) {
					if ( split[j].split(":")[2] == "2") {
						sd++;
					}
				}
				if ( sd == dan ) {
					danArray.push(retArray[i]);
				}
			}
			return danArray;
		}
	}
	
	/**
	 * 混关的一关，投注码变成单一玩法 added by luochang at 2014/08/14
	 * return list
	 */
	this.toSingleCode = function(mixedCode) {
		if ( this.playId != 6 ) {
			return new Array(mixedCode);
		}
		var list = new Array();
		var source = "";
		var perCode = mixedCode.split(",");
		for ( var i = 0; i < perCode.length; i++ ) {
			var code = perCode[i];
			if ( source == "" ) {
				source = code + ",";
				
				if ( i == perCode.length - 1 ) {
					source = source.substring(0, source.length -1 );
					list.push(source);
				}
			} else {
				if ( parseInt(source.split(",")[0].split("-")[0]) == parseInt(code.split("-")[0]) ) {
					source += code + ",";
					if ( i == perCode.length - 1 ) {
						source = source.substring(0, source.length -1 );
						list.push(source);
					}
				} else {
					source = source.substring(0, source.length -1 );
					list.push(source);
					
					source = code + ",";
					
					if ( i == perCode.length - 1 ) {
						source = source.substring(0, source.length -1 );
						list.push(source);
					}
				}
			}
		}
		return list;
	}
	
	/**
	 * 
	 * 混合过关投注码切换成每一场单一玩法(拆号) added at 2014/08/14
	 * return list
	 */
	this.splitHhCode = function(betCode) {
		var betCodes = new Array();
		var ops = betCode.split("|");
		var before = ops[0].split(":");
		var codes = this.toSingleCode(before[1]);
		for ( var i = 0; i < codes.length; i++ ) {
			var code = codes[i];
			var _tArr = before[0] + ":" + code + ":"+before[2]+"|";
			this.findSubHhNmComb( betCodes, _tArr, ops, ops.length-1 );
		}
		return betCodes;
	}
	
	this.findSubHhNmComb = function(result, tArr, ops, n) {
		if ( n == 0 ) {
			result.push(tArr.substring(0, tArr.length-1));
		} else {
			var before = ops[ops.length-n].split(":");
			var codes = this.toSingleCode(before[1]);
			for ( var i = 0; i < codes.length; i++ ) {
				var code = codes[i];
				var _tArr = tArr;
				_tArr += before[0] + ":" + code + ":"+before[2]+"|";
				this.findSubHhNmComb( result, _tArr, ops, n-1 );
			}
			
		}
	}
	
	/**
	 * 生成奖金预测明细列表 added at 2014/08/14
	 */
	this.createBonusList = function(betCode, passString, multiple) {
		if ( this.playId == 6 ) {// 组合过关奖金还存在问题
			return this.createMixedBonusList(betCode, passString, multiple);
		} else {
			return this.a(betCode, passString, multiple);
		}
	}
	
	this.a = function(betCode, passString, multiple) {
		var list = new Array();
		var pts = passString.split(",");
		var freePs = new Array();	// 2串1到8串1
		var psMap = new Hashtable();	// 存储2串1~8串1对应的选择的过关方式
		for ( var i = 0; i < pts.length; i++ ) {
			if ( pts[i].split("c")[1] == "1" ) {
				var nexist = 0;
				for ( var j = 0; j < freePs.length; j++ ) {
					if ( freePs[j] == pts[i] ) {
						nexist = 1;
						break;
					}
				}
				if ( nexist == 0 ) {
					freePs.push(pts[i]);
					var pA = new Array();
					pA.push(pts[i]);
					psMap.put(pts[i], pA);
				}
			} else {
				var cArray = combCrMap.get(pts[i]);
				for ( var k = 0; k < cArray.length; k++ ) {
					var nexist = 0;
					for ( var j = 0; j < freePs.length; j++ ) {
						if ( freePs[j] == cArray[k] ) {
							nexist = 1;
							break;
						}
					}
					if ( nexist == 0 ) {
						freePs.push(cArray[k]);
					}
				}
			}
		}
		freePs.sort();
		
		for ( var j = 0; j < freePs.length; j++ ) {
			for ( var i = 0; i < pts.length; i++ ) {
				if ( parseInt(pts[i].split("c")[1]) > 1 ) {
					if ( PPMAP.get(freePs[j]).indexOf(pts[i]) > -1 ) {
						if ( 'undefined' != psMap.get(freePs[j]) ) {
							var pA = psMap.get(freePs[j]);
							pA.push(pts[i]);
						} else {
							var pA = new Array();
							pA.push(pts[i]);
							psMap.put(freePs[j], pA);
						}
					}
				}
			}
		}
		
		var startWinSch = parseInt(freePs[0].split("c")[0]); // 命中场数
		var betCodes = betCode.split("|");
		for ( var i = startWinSch; i <= betCodes.length; i++ ) {
			var po = new BonusYcPojo();
			var detailList = new Array();
			var detailMinList = new Array();
			po.winNum = i;	// 命中场数
			po.multiple = multiple;
			var lowestBonus = 0.0;	//	最小奖金
			var highestBonus = 0.0;	//	最高奖金
			var winBet = "";
			for ( var j = 0; j < freePs.length; j++ ) {
				if ( parseInt(freePs[j].split("c")[0]) > i ) {
					winBet += "0,";
					continue;
				}
				var betNum = 0; // 中奖注数
				// 选出最大的i个命中赔率和最小的i个命中赔率
				//var maxPojo = BonusCalcPojo();
				//var minPojo = BonusCalcPojo();
				var maxArray = new Array();
				var maxDanArray = new Array();
				var minArray = new Array();
				var minDanArray = new Array();
				for ( var o = 0; o < betCodes.length; o++ ) {
					var subArray = new Array();
					var codeInfo = betCodes[o].split(":");
					var bets = codeInfo[1].split(",");
					for ( var oo = 0; oo < bets.length; oo++ ) {
						subArray.push(this.getBetOdds(codeInfo[0], bets[oo]));
					}
					subArray.sort(this.compareASC);
					if ( codeInfo[2] == "2" ) {
						minDanArray.push(subArray[0]);
					} else {
						minArray.push(subArray[0]);
					}
					subArray.sort(this.compare);
					if ( codeInfo[2] == "2" ) {
						maxDanArray.push(subArray[0]);
					} else {
						maxArray.push(subArray[0]);
					}
				}
				maxArray.sort(this.compare);
				minArray.sort(this.compareASC);
				var maxB = new BonusDetail();
				var minB = new BonusDetail();
				maxB.winNum = 0;
				minB.winNum = 0;
				maxB.passType = freePs[j];
				minB.passType = freePs[j];
				var maxBDHtml = "";
				var minBDHtml = "";
				var subDHB = 0;
				var subDLB = 0;
				var pps = psMap.get(freePs[j]);
				for ( var o = 0; o < pps.length; o++ ) {
					if ( parseInt(pps[o].split("c")[1]) == 1 ) {	// 自由过关
						if ( parseInt(pps[o].split("c")[0]) > i ) {
							continue;
						}
						var sbetNumt = combAlg.calcCombNum(i-maxDanArray.length, parseInt(freePs[j].split("c")[0])-maxDanArray.length);
						betNum += sbetNumt;
						maxB.winNum += sbetNumt;
						minB.winNum += sbetNumt;
						
						var bonusHA = new Array();
						for ( var oo = 0; oo < maxDanArray.length; oo++ ) {
							bonusHA.push(maxDanArray[oo]);
						}
						for ( var oo = 0; oo < i - maxDanArray.length; oo++ ) {
							bonusHA.push(maxArray[oo]);
						}
						var calcHA = combAlg.findComb(bonusHA, i - maxDanArray.length, parseInt(freePs[j].split("c")[0]) - maxDanArray.length);
						for ( var jj = 0; jj < calcHA.length; jj++ ) {
							var subLB = 1;
							for ( var jjj = 0; jjj < maxDanArray.length; jjj++ ) {
								subLB *= parseFloat(maxDanArray[jjj]);
								maxBDHtml += maxDanArray[jjj] + ' × ';
							}
							for ( var jjj = 0; jjj < calcHA[jj].length; jjj++ ) {
								subLB *= parseFloat(calcHA[jj][jjj]);
								maxBDHtml += calcHA[jj][jjj] + ' × ';
							}
							
							subDHB += subLB * 2 * multiple;
							highestBonus += subLB * 2 * multiple;
							maxBDHtml = maxBDHtml + "2 × "+multiple+"倍 = " + new Number(subLB * 2 * multiple).toFixed(2) + "元,";
						}
						
						var bonusLA = new Array();
						for ( var oo = 0; oo < minDanArray.length; oo++ ) {
							bonusLA.push(minDanArray[oo]);
						}
						for ( var oo = 0; oo < i - minDanArray.length; oo++ ) {
							bonusLA.push(minArray[oo]);
						}
						var calcLA = combAlg.findComb(bonusLA, i - maxDanArray.length, parseInt(freePs[j].split("c")[0]) - maxDanArray.length);
						for ( var jj = 0; jj < calcHA.length; jj++ ) {
							var subLB = 1;
							for ( var jjj = 0; jjj < minDanArray.length; jjj++ ) {
								subLB *= parseFloat(minDanArray[jjj]);
								minBDHtml += minDanArray[jjj] + ' × ';
							}
							for ( var jjj = 0; jjj < calcLA[jj].length; jjj++ ) {
								subLB *= parseFloat(calcLA[jj][jjj]);
								minBDHtml += calcLA[jj][jjj] + ' × ';
							}
							
							subDLB += subLB * 2 * multiple;
							lowestBonus += subLB * 2 * multiple;
							minBDHtml = minBDHtml + "2 × "+multiple+"倍 = " + new Number(subLB * 2 * multiple).toFixed(2) + "元,";
						}
					} else {	// 组合过关
						var cLen = combAlg.calcCombNum(betCodes.length - parseInt(freePs[j].split("c")[0]), parseInt(pps[o].split("c")[0]) - parseInt(freePs[j].split("c")[0]));
						for ( var kkk = 0; kkk < cLen; kkk++ ) {
							var sbetNumt = combAlg.calcCombNum(i-maxDanArray.length, parseInt(freePs[j].split("c")[0])-maxDanArray.length);
							betNum += sbetNumt;
							maxB.winNum += sbetNumt;
							minB.winNum += sbetNumt;
							
							var bonusHA = new Array();
							for ( var oo = 0; oo < maxDanArray.length; oo++ ) {
								bonusHA.push(maxDanArray[oo]);
							}
							for ( var oo = 0; oo < i - maxDanArray.length; oo++ ) {
								bonusHA.push(maxArray[oo]);
							}
							var calcHA = combAlg.findComb(bonusHA, i - maxDanArray.length, parseInt(freePs[j].split("c")[0]) - maxDanArray.length);
							for ( var jj = 0; jj < calcHA.length; jj++ ) {
								var subLB = 1;
								for ( var jjj = 0; jjj < maxDanArray.length; jjj++ ) {
									subLB *= parseFloat(maxDanArray[jjj]);
									maxBDHtml += maxDanArray[jjj] + ' × ';
								}
								for ( var jjj = 0; jjj < calcHA[jj].length; jjj++ ) {
									subLB *= parseFloat(calcHA[jj][jjj]);
									maxBDHtml += calcHA[jj][jjj] + ' × ';
								}
								
								subDHB += subLB * 2 * multiple;
								highestBonus += subLB * 2 * multiple;
								maxBDHtml = maxBDHtml + "2 × "+multiple+"倍 = " + new Number(subLB * 2 * multiple).toFixed(2) + "元,";
							}
							
							var bonusLA = new Array();
							for ( var oo = 0; oo < minDanArray.length; oo++ ) {
								bonusLA.push(minDanArray[oo]);
							}
							for ( var oo = 0; oo < i - minDanArray.length; oo++ ) {
								bonusLA.push(minArray[oo]);
							}
							var calcLA = combAlg.findComb(bonusLA, i - maxDanArray.length, parseInt(freePs[j].split("c")[0]) - maxDanArray.length);
							for ( var jj = 0; jj < calcHA.length; jj++ ) {
								var subLB = 1;
								for ( var jjj = 0; jjj < minDanArray.length; jjj++ ) {
									subLB *= parseFloat(minDanArray[jjj]);
									minBDHtml += minDanArray[jjj] + ' × ';
								}
								for ( var jjj = 0; jjj < calcLA[jj].length; jjj++ ) {
									subLB *= parseFloat(calcLA[jj][jjj]);
									minBDHtml += calcLA[jj][jjj] + ' × ';
								}
								
								subDLB += subLB * 2 * multiple;
								lowestBonus += subLB * 2 * multiple;
								minBDHtml = minBDHtml + "2 × "+multiple+"倍 = " + new Number(subLB * 2 * multiple).toFixed(2) + "元,";
							}
						}
					}
				}
				maxBDHtml = maxBDHtml.substring(0, maxBDHtml.length - 1);
				maxB.bonus = subDHB;
				maxB.bonusDetail = maxBDHtml;
				detailList.push(maxB);
				minBDHtml = minBDHtml.substring(0, minBDHtml.length - 1);
				minB.bonus = subDLB;
				minB.bonusDetail = minBDHtml;
				detailMinList.push(minB);
				winBet += betNum + ",";
			}
			winBet = winBet.substring(0, winBet.length - 1);
			
			po.winBet = winBet;
			var _bnsl = new Number(lowestBonus);
			var _bnsh = new Number(highestBonus);
			po.maxBonus = _bnsh.toFixed(2);
			po.minBonus = _bnsl.toFixed(2);
			po.passArray = freePs;
			po.bonusMaxDetailArray = detailList;
			po.bonusMinDetailArray = detailMinList;
			list.push(po);
		}
		return list;
	}
	
	/**
	 * 生成混合玩法预测奖金详情列表 Added at 2014/08/14
	 * @param betCode,投注码
	 * @param passString,投注串
	 * @param multiple,倍数
	 */
	this.createMixedBonusList = function(betCode, passString, multiple) {
		var list = new Array();
		var pts = passString.split(",");
		var freePs = new Array();	// 2串1到8串1
		var psMap = new Hashtable();	// 存储2串1~8串1对应的选择的过关方式
		for ( var i = 0; i < pts.length; i++ ) {
			if ( pts[i].split("c")[1] == "1" ) {
				var nexist = 0;
				for ( var j = 0; j < freePs.length; j++ ) {
					if ( freePs[j] == pts[i] ) {
						nexist = 1;
						break;
					}
				}
				if ( nexist == 0 ) {
					freePs.push(pts[i]);
					var pA = new Array();
					pA.push(pts[i]);
					psMap.put(pts[i], pA);
				}
			} else {
				var cArray = combCrMap.get(pts[i]);
				for ( var k = 0; k < cArray.length; k++ ) {
					var nexist = 0;
					for ( var j = 0; j < freePs.length; j++ ) {
						if ( freePs[j] == cArray[k] ) {
							nexist = 1;
							break;
						}
					}
					if ( nexist == 0 ) {
						freePs.push(cArray[k]);
					}
				}
			}
		}
		freePs.sort();
		
		for ( var j = 0; j < freePs.length; j++ ) {
			for ( var i = 0; i < pts.length; i++ ) {
				if ( parseInt(pts[i].split("c")[1]) > 1 ) {
					if ( PPMAP.get(freePs[j]).indexOf(pts[i]) > -1 ) {
						if ( 'undefined' != psMap.get(freePs[j]) ) {
							var pA = psMap.get(freePs[j]);
							pA.push(pts[i]);
						} else {
							var pA = new Array();
							pA.push(pts[i]);
							psMap.put(freePs[j], pA);
						}
					}
				}
			}
		}
		
		var startWinSch = parseInt(freePs[0].split("c")[0]); // 命中场数
		betCode = this.filteMutexs(betCode, 1);
		var betCodes = betCode.split("|");
		var oddsArray = new Array();
		var oddsDanArray = new Array();
		for ( var i = 0; i < betCodes.length; i++ ) {
			var subOddsArray = new Array();
			var oods = this.toSingleCode(betCodes[i].split(":")[1]);
			for ( var j = 0; j < oods.length; j++ ) {
				var pbts = oods[j].split(",");
				var ssArray = new Array();
				for ( var jj = 0; jj < pbts.length; jj++ ) {
					ssArray.push(this.getBetOdds(betCodes[i].split(":")[0], pbts[jj]));
				}
				subOddsArray.push(ssArray);
			}
			if ( betCodes[i].split(":")[2] == "2" ) {
				oddsDanArray.push(subOddsArray);
			} else {
				oddsArray.push(subOddsArray);
			}
		}
		// 赔率从大到小排序
		for ( var i = 0; i < oddsArray.length; i++ ) {
			for ( var j = i + 1; j < oddsArray.length; j++ ) {
				// 取出oddsArray[i]和oddsArray[j]的最大赔率
				var oddi = 0, oddj = 0;
				for ( var o = 0; o < oddsArray[i].length; o++ ) {
					for ( var oo = 0; oo < oddsArray[i][o].length; oo++ ) {
						if ( parseFloat(oddsArray[i][o][oo]) > oddi ) {
							oddi = parseFloat(oddsArray[i][o][oo]);
						}
					}
				}
				for ( var o = 0; o < oddsArray[j].length; o++ ) {
					for ( var oo = 0; oo < oddsArray[j][o].length; oo++ ) {
						if ( parseFloat(oddsArray[j][o][oo]) > oddi ) {
							oddj = parseFloat(oddsArray[j][o][oo]);
						}
					}
				}
				if ( oddi < oddj ) {
					var tm = oddsArray[i];
					oddsArray[i] = oddsArray[j];
					oddsArray[j] = tm;
				}
			}
		}
		for ( var i = startWinSch; i <= betCodes.length; i++ ) {
			var po = new BonusYcPojo();
			var detailList = new Array();
			var detailMinList = new Array();
			po.winNum = i;	// 命中场数
			po.multiple = multiple;
			var lowestBonus = 0.0;	//	最小奖金
			var highestBonus = 0.0;	//	最高奖金
			var winBet = "";
			for ( var j = 0; j < freePs.length; j++ ) {
				if ( parseInt(freePs[j].split("c")[0]) > i ) {
					winBet += "0,";
					continue;
				}
				var betNum = 0; // 中奖注数
				// 选出最大的i个命中赔率和最小的i个命中赔率
				//var maxPojo = BonusCalcPojo();
				//var minPojo = BonusCalcPojo();
				var maxArray = new Array();
				var maxDanArray = new Array();
				var minArray = new Array();
				var minDanArray = new Array();
				for ( var o = 0; o < betCodes.length; o++ ) {}
				maxArray.sort(this.compare);
				minArray.sort(this.compareASC);
				var maxB = new BonusDetail();
				var minB = new BonusDetail();
				maxB.winNum = 0;
				minB.winNum = 0;
				maxB.passType = freePs[j];
				minB.passType = freePs[j];
				var maxBDHtml = "";
				var minBDHtml = "";
				var subDHB = 0;
				var subDLB = 0;
				var pps = psMap.get(freePs[j]);
				for ( var o = 0; o < pps.length; o++ ) {
					if ( parseInt(pps[o].split("c")[1]) == 1 ) {	// 自由过关
						if ( parseInt(pps[o].split("c")[0]) > i ) {
							continue;
						}
						var cLen = parseInt(pps[o].split("c")[0]);
						var _oddsArray = new Array();
						for ( var oo = 0; oo < i - oddsDanArray.length; oo++ ) {
							_oddsArray.push(oddsArray[oo]);
						}
						var danSplitArray = combAlg.findNmComb(oddsDanArray);
						var combArray = combAlg.findComb(_oddsArray, _oddsArray.length, cLen - oddsDanArray.length);
						for ( var oo = 0; oo < combArray.length; oo++ ) {
							
							var splitArray = combAlg.findNmComb(combArray[oo]);
							for ( ooo = 0; ooo < splitArray.length; ooo++ ) {
								betNum++;
								maxB.winNum++;
								minB.winNum++;
								var bonusHA = new Array();
								var bonusLA = new Array();
								for ( var kkk = 0; kkk < splitArray[ooo].length; kkk++ ) {
									splitArray[ooo][kkk].sort(this.compare);
									bonusHA.push(splitArray[ooo][kkk][0]);
									splitArray[ooo][kkk].sort(this.compareASC);
									bonusLA.push(splitArray[ooo][kkk][0]);
								}
								var betN = 1;
								for ( var kkk = 0; kkk < bonusHA.length; kkk++ ) {
									betN *= parseFloat(bonusHA[kkk]);
									maxBDHtml += bonusHA[kkk] + ' × ';
								}
								var betM = betN;
								for ( var kkk = 0; kkk < danSplitArray.length; kkk++ ) {
									for ( var jj = 0; jj < danSplitArray[kkk].length; jj++ ) {
										danSplitArray[kkk][jj].sort(this.compare);
										betM *= parseFloat(danSplitArray[kkk][jj][0]);
										maxBDHtml += danSplitArray[kkk][jj][0] + ' × ';
									}
								}
								subDHB += betM * 2 * multiple;
								highestBonus += betM * 2 * multiple;
								maxBDHtml = maxBDHtml + "2 × "+multiple+"倍 = " + new Number(betM * 2 * multiple).toFixed(2) + "元,";
								
								betN = 1;
								for ( var kkk = 0; kkk < bonusLA.length; kkk++ ) {
									betN *= parseFloat(bonusLA[kkk]);
									minBDHtml += bonusLA[kkk] + ' × ';
								}
								betM = betN;
								for ( var kkk = 0; kkk < danSplitArray.length; kkk++ ) {
									for ( var jj = 0; jj < danSplitArray[kkk].length; jj++ ) {
										danSplitArray[kkk][jj].sort(this.compareASC);
										betM *= parseFloat(danSplitArray[kkk][jj][0]);
										minBDHtml += danSplitArray[kkk][jj][0] + ' × ';
									}
								}
								subDLB += betM * 2 * multiple;
								lowestBonus += betM * 2 * multiple;
								minBDHtml = minBDHtml + "2 × "+multiple+"倍 = " + new Number(betM * 2 * multiple).toFixed(2) + "元,";
							}
						}
						
					} else { // 组合过关计算
						
						var cLen = parseInt(pps[o].split("c")[0]);
						var _combArray = combAlg.findComb(oddsArray, oddsArray.length, cLen);
						for ( var _oo = 0; _oo < _combArray.length; _oo++ ) {
							var _splitArray = combAlg.findNmComb(_combArray[_oo]);
							
							//var ccLen = combAlg.calcCombNum(i, parseInt(freePs[j].split("c")[0]));
							//for ( var ok = 0; ok < ccLen; ok++ ) {
								for ( var okk = 0; okk < _splitArray.length; okk++ ) {
									var bonusHA = new Array();
									var bonusLA = new Array();
									var llen = _splitArray[okk].length > i ? i : _splitArray[okk].length;
									for ( var kk = 0; kk < llen; kk++ ) {
										_splitArray[okk][kk].sort(this.compare);
										bonusHA.push(_splitArray[okk][kk][0]);
										_splitArray[okk][kk].sort(this.compareASC);
										bonusLA.push(_splitArray[okk][kk][0]);
									}
									var calcHA = combAlg.findComb(bonusHA, bonusHA.length, parseInt(freePs[j].split("c")[0]));
									
									for ( var oko = 0 ; oko < calcHA.length; oko++ ) {
										betNum++;
										maxB.winNum++;
										minB.winNum++;
										
										var betN = 1;
										for ( var kkk = 0; kkk < calcHA[oko].length; kkk++ ) {
											betN *= parseFloat(calcHA[oko][kkk]);
											maxBDHtml += calcHA[oko][kkk] + ' × ';
										}
										var betM = betN;
										
										subDHB += betM * 2 * multiple;
										highestBonus += betM * 2 * multiple;
										maxBDHtml = maxBDHtml + "2 × "+multiple+"倍 = " + new Number(betM * 2 * multiple).toFixed(2) + "元,";

									}
																		
									var calcLA = combAlg.findComb(bonusLA, bonusLA.length, parseInt(freePs[j].split("c")[0]));
									
									for ( var oko = 0 ; oko < calcHA.length; oko++ ) {
										var betN = 1;
										for ( var kkk = 0; kkk < calcHA[oko].length; kkk++ ) {
											betN *= parseFloat(calcHA[oko][kkk]);
											minBDHtml += calcHA[oko][kkk] + ' × ';
										}
										var betM = betN;
										
										subDLB += betM * 2 * multiple;
										lowestBonus += betM * 2 * multiple;
										minBDHtml = minBDHtml + "2 × "+multiple+"倍 = " + new Number(betM * 2 * multiple).toFixed(2) + "元,";

									}								}
							//}
						}
					}
				}
				maxBDHtml = maxBDHtml.substring(0, maxBDHtml.length - 1);
				maxB.bonus = subDHB;
				maxB.bonusDetail = maxBDHtml;
				detailList.push(maxB);
				minBDHtml = minBDHtml.substring(0, minBDHtml.length - 1);
				minB.bonus = subDLB;
				minB.bonusDetail = minBDHtml;
				detailMinList.push(minB);
				winBet += betNum + ",";
			}
			winBet = winBet.substring(0, winBet.length - 1);
			
			po.winBet = winBet;
			var _bnsl = new Number(lowestBonus);
			var _bnsh = new Number(highestBonus);
			po.maxBonus = _bnsh.toFixed(2);
			po.minBonus = _bnsl.toFixed(2);
			po.passArray = freePs;
			po.bonusMaxDetailArray = detailList;
			po.bonusMinDetailArray = detailMinList;
			list.push(po);
		}
		return list;
	}
	
	/**
	 * 生成单一玩法预测奖金详情列表 Added at 2014/04/10
	 * @param betCode,投注码
	 * @param passString,投注串
	 * @param multiple,倍数
	 */
	this.createSingleBonusList = function(betCode, passString, multiple) {}
	
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
	
	/**
	 * 平均优化
	 * @param list,待优化的列表，Optimization对象
	 * @param betMoney,投入金额
	 */
	this.averOptimize = function(list, betMoney) {
		if ( betMoney <= list.length * 2 ) {
			return list;// 投入金额小于基本注数，不做优化
		}
		// 找到最大奖金
		var maxBonus = 0;
		for ( var i = 0; i < list.length; i++ ) {
			if ( list[i].baseBonus > maxBonus ) {
				maxBonus = list[i].baseBonus;
			}
		}
		
		var baseMultCalc = 100;
		if ( parseInt(betMoney) >= 10000 ) {
			baseMultCalc = 1000;
		} else if ( parseInt(betMoney) >= 100000 ) {
			baseMultCalc = 10000;
		} else if ( parseInt(betMoney) >= 1000000 ) {
			baseMultCalc = 100000;
		}
		var mult = new Array();
		for ( var i = 0; i < list.length; i++ ) {
			mult[i] = Math.round((maxBonus / list[i].baseBonus) * baseMultCalc);
		}
		var baseDiv = 0;
		for ( var i = 0; i < mult.length; i++ ) {
			baseDiv += mult[i];
		}
		
		var base = parseFloat(parseInt(betMoney)/(baseDiv*2));
		
		var totalNum = 0;
		for ( var i = 0; i < list.length; i++ ) {
			list[i].multiple = Math.round(base*mult[i]);
			if ( list[i].multiple == 0 ) {
				list[i].multiple = 1;
			}
			totalNum += list[i].multiple;
		}
		
		var initialNum = parseInt(betMoney)/2;
		if ( initialNum > totalNum ) {
			while ( initialNum > totalNum ) {
				// 找到最小金额的投注
				var minBonus = parseFloat(list[0].baseBonus*list[0].multiple);
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus < minBonus ) {
						minBonus = bonus;
					}
				}
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus == minBonus ) {
						list[i].multiple = list[i].multiple + 1;
						totalNum++;
						break;
					}
				}
			}
		} else if ( initialNum < totalNum ) {
			while ( initialNum < totalNum ) {
				// 找到最大金额的投注
				/*var maxBonus = parseFloat(list[0].baseBonus*list[0].multiple);
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( (bonus > maxBonus) ) {
						maxBonus = bonus;
					}
				}
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus == maxBonus ) {
						list[i].multiple = list[i].multiple - 1;
						totalNum--;
					}
				}*/
				var maxBonus = list[0].multiple;
				for ( var i = 0; i < list.length; i++ ) {
					if ( (list[i].multiple > maxBonus) ) {
						maxBonus = list[i].multiple;
					}
				}
				for ( var i = 0; i < list.length; i++ ) {
					if ( list[i].multiple == maxBonus ) {
						list[i].multiple = list[i].multiple - 1;
						totalNum--;
						break;
					}
				}
			}
		}
		
		return list;
	}
	
	/**
	 * 博热优化
	 * @param list,待优化的列表，Optimization对象
	 * @param betMoney,投入金额
	 */
	this.hotOptimize = function(list, betMoney) {
		if ( betMoney <= list.length * 2 ) {
			return list;// 投入金额小于基本注数，不做优化
		}
		
		var betNum = 0;
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat((list[i]).baseBonus);
			if ( bonus < betMoney ) {
				var multiple = parseInt(betMoney / bonus) + 1;
				betNum += multiple;
				list[i].multiple = multiple;
			} else {
				betNum++;
				list[i].multiple = 1;
			}
		}
		
		// 找到最小金额的投注
		var minBonus = parseFloat(list[0].baseBonus);
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat(list[i].baseBonus);
			if ( bonus < minBonus ) {
				minBonus = bonus;
			}
		}
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat(list[i].baseBonus);
			if ( bonus == minBonus ) {
				var balNum = parseInt(betMoney)/2 - betNum;
				list[i].multiple = list[i].multiple + balNum;
				break;
			}
		}
		return list;
	}
	
	/**
	 * 博冷优化
	 * @param list,待优化的列表，Optimization对象
	 * @param betMoney,投入金额
	 */
	this.coldOptimize = function(list, betMoney) {
		if ( betMoney <= list.length * 2 ) {
			return list;// 投入金额小于基本注数，不做优化
		}
		var betNum = 0;
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat((list[i]).baseBonus);
			if ( bonus < betMoney ) {
				var multiple = parseInt(betMoney / bonus) + 1;
				betNum += multiple;
				list[i].multiple = multiple;
			} else {
				betNum++;
				list[i].multiple = 1;
			}
		}
		
		// 找到最大奖金的投注
		var minBonus = parseFloat(list[0].baseBonus);
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat(list[i].baseBonus);
			if ( bonus > minBonus ) {
				minBonus = bonus;
			}
		}
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = parseFloat(list[i].baseBonus);
			if ( bonus == minBonus ) {
				var balNum = parseInt(betMoney)/2 - betNum;
				list[i].multiple = list[i].multiple + balNum;
				break;
			}
		}
		return list;
	}
	
	/**
	 * 保本优化
	 * @param list,待优化的列表，Optimization对象
	 * @param betMoney,投入金额
	 */
	this.evenOptimize = function(list, betMoney) {
		if ( betMoney <= list.length * 2 ) {
			return list;// 投入金额小于基本注数，不做优化
		}
		var betNum = 0;
		// 选中的做保本，其余的做平均优化
		for ( var i = 0; i < list.length; i++ ) {
			if ( list[i].even == 1 ) {
				// 保本
				var bonus = parseFloat(list[i].baseBonus);
				if ( bonus < betMoney ) {
					var multiple = parseInt(betMoney / bonus) + 1;
					betNum += multiple;
					list[i].multiple = multiple;
				}
			}
		}
		var baoBenMoeny = betMoney - betNum * 2;
		
		// 找到最大奖金
		var maxBonus = 0;
		for ( var i = 0; i < list.length; i++ ) {
			if ( (parseFloat(list[i].baseBonus) > maxBonus) &&  !(list[i].even != 1) ) {
				maxBonus =  parseFloat(list[i].baseBonus);
			}
		}
		var mult = new Array();
		var baseMultCalc = 100;
		if ( parseInt(betMoney) >= 10000 ) {
			baseMultCalc = 1000;
		} else if ( parseInt(betMoney) >= 100000 ) {
			baseMultCalc = 10000;
		} else if ( parseInt(betMoney) >= 1000000 ) {
			baseMultCalc = 100000;
		}
		for ( var i = 0; i < list.length; i++ ) {
			if ( list[i].even != 1 ) {
				var bonus = parseFloat(list[i].baseBonus);
				mult[i] = Math.round((maxBonus / bonus) * baseMultCalc);
			} else {
				mult[i] = 0;
			}
		}
		
		var baseDiv = 0;
		for ( var i = 0; i < mult.length; i++ ) {
			baseDiv += mult[i];
		}
		
		var base = parseFloat(parseInt(baoBenMoeny)/(baseDiv*2));
		var totalNum = betNum;
		for ( var i = 0; i < list.length; i++ ) {
			if ( list[i].even != 1 ) {
				totalNum += Math.round(base*mult[i]);
				list[i].multiple = Math.round(base*mult[i]);
			}
		}
		
		var initialNum = parseInt(betMoney)/2;
		if ( initialNum > totalNum ) {
			while ( initialNum > totalNum ) {
				// 找到最小金额的投注
				var minBonus = parseFloat(list[0].baseBonus*list[0].multiple);
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus < minBonus ) {
						minBonus = bonus;
					}
				}
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus == minBonus ) {
						list[i].multiple = list[i].multiple + 1;
						totalNum++;
					}
				}
			}
		} else if ( initialNum < totalNum ) {
			while ( initialNum < totalNum ) {
				// 找到最大金额的投注
				var maxBonus = parseFloat(list[0].baseBonus*list[0].multiple);
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( (bonus > maxBonus) ) {
						maxBonus = bonus;
					}
				}
				for ( var i = 0; i < list.length; i++ ) {
					var bonus = parseFloat(list[i].baseBonus*list[i].multiple);
					if ( bonus == maxBonus ) {
						list[i].multiple = list[i].multiple - 1;
						totalNum--;
					}
				}
			}
		}
		return list;
	}
}

/**
 * 奖金预测结构
 * @param winNum,命中场数
 * @param winBet,中奖注数，过关串以“,”隔开
 * @param multiple,倍数
 * @param minBonus,最小奖金
 * @param maxBonus,最大奖金
 * @param passArray,过关 2串1 3串1 4串1 5串1 6串1
 * @param bonusMaxDetailArray,中奖最大明细，BonusDetail对象数组
 * @param bonusMinDetailArray,中奖最小明细，BonusDetail对象数组
 */
function BonusYcPojo(winNum, winBet, multiple, minBonus, maxBonus, passArray, bonusMaxDetailArray, bonusMinDetailArray) {
	this.winNum = winNum;
	this.winBet = winBet;
	this.multiple = multiple;
	this.minBonus = minBonus;
	this.maxBonus = maxBonus;
	this.passArray = passArray;
	this.bonusMaxDetailArray = bonusMaxDetailArray;
	this.bonusMinDetailArray = bonusMinDetailArray;
}

/**
 * 预测奖金详情结构【查看最大或最小奖金的详情】
 * @param passType,过关方式【2串1到8串1，只存在一种过关方式】
 * @param winNum,中奖注数
 * @param bonusDetail,奖金明细，计算的明细
 * @param bonus
 */
function BonusDetail(passType, winNum, bonusDetail, bonus) {
	this.passType = passType;
	this.winNum = winNum;
	this.bonusDetail = bonusDetail;
	this.bonus = bonus;
}

/**
 * 用于计算奖金明细的类
 * @param id
 * @param odd
 * @return
 */
function BonusCalcPojo(id, odd) {
	
}

/**
 * 奖金优化后的结构
 * @param betCode, 优化的投注码（单式）
 * @param baseBonus，单倍的奖金
 * @param multiple，倍数
 */
function Optimization(betCode, baseBonus, multiple) {
	this.betCode = betCode;
	this.baseBonus = baseBonus;
	this.multiple = multiple;
	this.even = 0;	// 	0-非保本，1-保本
}