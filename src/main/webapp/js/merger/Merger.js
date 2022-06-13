/**
 * <p>Desc:合买类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/3/18 Version 1.0
 */
function Hemai() {
	
	/**
	 * 是否可以设置份数
	 * <br>订单总额%份数 == 0 ，true
	 */
	this.canDivise = function() {
		/*var totalMoney = parseInt($("#betMoneyId").html()); // 订单金额
		var totalNum = parseInt($("#totalHemaiNumId").val()); // 总份数
		var result = false;
		if ( totalMoney % totalNum == 0 ) {
			result = true;
		}
		return result;*/
		return true;
	}
	
	/**
	 * 每份价格
	 */
	this.getUnitPrice = function() {
		/*var totalMoney = parseInt($("#betMoneyId").html()); // 订单金额
		var totalNum = parseInt($("#totalHemaiNumId").val()); // 总份数
		var unitPr = 0;
		if ( this.canDivise() ) {
			unitPr = parseInt(totalMoney/totalNum);
			$("#unitPrId").html(unitPr);
		} else {
		}
		return unitPr;*/
		return 1;
	}
	
	/**
	 * 发起人认购份数
	 */
	this.offerBuy = function() {
		var offerBM = 0;
		if ( this.canDivise() ) {
			offerBM = parseInt($("#offerBuyId").val())*this.getUnitPrice();
			//var totalMoney = offerBM + parseInt($("#offerBaoDiId").val())*this.getUnitPrice();
			var oMoney = parseInt($("#totalBetMoneyId").html()); // 订单金额
			if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" ||  $("#licenseId").val() == "21" || $("#licenseId").val() == "22"  ) {
				oMoney = parseInt($("#betMoneyId").html()); // 订单金额
			}  
			if ( $("#pageNameId").val() == "xfhc" ) {
				var betNum = $("#yjTotalBuyNumId").val();
				var betMult = $("#yjTotalBuyMulId").val();
				if ( isNaN(betMult) ) {
					betMult = 1;
					$("#yjTotalBuyMulId").val(1);
				}
				oMoney = parseInt(betNum,10) * parseInt(betMult,10) * 2;
			}
			if ( offerBM > oMoney ) {
				alert("份数大于订单总份数！");
				offerBM = 1;
				$("#offerBuyId").val("1");
				$("#offerBuyId").blur();
				//return 0;
			}
			// 显示百分比
			//$("#offerBMId").html(new Number(parseFloat(offerBM/oMoney)*100).toFixed(0));
			$("#offerBMId").html(parseInt(offerBM/oMoney*100));
			
			// 最多保底
			var tm = parseInt($("#betMoneyId").html()); // 订单金额
			$("#maxBaoDiId").html(tm - offerBM);
		} 
		return offerBM;
	}
	
	/**
	 * 保底设置
	 */
	this.setBaoDi = function() {
		var offerBM = 0;
		if ( this.canDivise() ) {
			offerBM = parseInt($("#offerBaoDiId").val())*this.getUnitPrice();
			
			var totalMoney = offerBM + parseInt($("#offerBuyId").val())*this.getUnitPrice();
			var oMoney = parseInt($("#totalBetMoneyId").html()); // 订单金额
			if ( totalMoney > oMoney ) {
				alert("份数大于订单总份数！");
				return 0;
			}
			$("#offerBdId").html(offerBM);
			
		}
		return offerBM;
	}
	
	/**
	 * 订单总额：认购金额+保底金额
	 */
	this.calcOrderMoney = function() {
		var buyNum = parseInt($("#offerBuyId").val());
		var insNum = 0;
		var v = $("input[name=baodiType]:checked").val();
		var oMoney = parseInt($("#totalBetMoneyId").html()); // 订单金额
		if ( $("#licenseId").val() == 9 || $("#licenseId").val() == 10 ||  $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
			oMoney = parseInt($("#betMoneyId").html()); // 订单金额
		} else if ( $("#licenseId").val() == 5 || $("#licenseId").val() == 6 || $("#licenseId").val() == 7 || $("#licenseId").val() == 8 ) {
			// 单式上传总金额
			if ( $("#pageNameId").val() == "xfhc" ) {
				var betMult = $("#yjTotalBuyMulId").val();
				if ( isNaN(betMult) ) {
					betMult = 1;
				}
				oMoney = parseInt($("#yjTotalBuyNumId").val(),10)*parseInt(betMult,10)*2;
			}
			
		}
		switch (v) {
		case "2":
			insNum = oMoney - buyNum;
			// 显示比例和支付金额
			$("#baoFullMoneyId").html(insNum);
			$("#baoFullPerId").html(parseInt(insNum/oMoney*100));
			break;
		case "3":
			insNum = parseInt($("#baoPartMoneyId").html());
			var va = parseInt($("#partBaoInputId").val());
			$("#baoPartPerId").html(parseInt(va/oMoney*100));
			break;
		}
		var totalMoney = buyNum + insNum;
		$("#totalHmMoneyId").html(totalMoney);
		return totalMoney;
	}
	
	/**
	 * 订单提交
	 */
	this.submitForm = function() {
		// 不为空判断
		/*if ( $("#partTitileId").val() == "" ) {
			alert("方案标题没有输入！");
			return false;
		}
		if ( $("#partDetailId").val() == "" ) {
			alert("方案描述没有输入！");
			return false;
		}*/
		/*if ( $("#totalHemaiNumId").val() == "" ) {
			alert("总份数没有输入！");
			return false;
		}*/
		if ( $("#offerBuyId").val() == "" ) {
			alert("认购份数没有输入！");
			return false;
		}
		// 发起人需要支付的金额
		var payMoney = this.calcOrderMoney();
		$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$(".openlogin").click();
					} else {
						//var pay = parseFloat($("#betMoneyId").html());
						var balance = parseFloat(data);
						if ( payMoney > balance ) {
							layer.alert("余额不足，请您先充值！",0);
							return false;
						} else {
							// 提交表单
							var form = $("#mergerBuyFormId");
							var betCode = "";
							
							if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" || $("#licenseId").val() == "21" || $("#licenseId").val() == "22") {
								var passString = "";
								$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
									var selected = parseInt($("#schudleSelId").html());
									var cLen = parseInt($(this).val().split("c")[0]);
									if ( cLen <= selected ) {
										passString += $(this).val() + ",";
									}
								});
								
								var multiple = $("#multipleId").val();
								$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple)/2);
								$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
								
								if ( $("#licenseId").val() == "22" ) {
									$(form).find("input[name=playType]").val("1");
								} else {
									$(form).find("input[name=playType]").val(guess.playId);
								}
								$("#partTitileId").val($("#licenseNameId").val()+"合买方案");
								//总份数
								$(form).find("input[name=totalNum]").val($("#betMoneyId").html());
								if($("#highestBonusId").html() == '--')
									$("#highestBonusId").html('0.00');
										
								$(form).find("input[name=theoryBonus]").val($("#highestBonusId").html());
								
								$("#betSelAreaId").find("tr").each(function(index){
									betCode += $(this).attr("id") + ":";
									
									$(this).find("td").eq(2).children().each(function(index){
										betCode += $(this).attr("bet") + ",";
									});
									
									if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
										betCode = betCode.substring(0, betCode.length - 1) + ":2|";
									} else {
										betCode = betCode.substring(0, betCode.length - 1) + ":0|";
									}
								});
								
								passString = passString.substring(0, passString.length - 1);
								if ( passString != "" ) {
									var cbetCode = betCode.substring(0, betCode.length - 1);
									// 如果全是自由过关，优化成组合过关 modified at 2015/03/26
									if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" ) {
										passString =  guess.optimizePassType(cbetCode.split("|").length, passString, cbetCode);
									}
								}
								if ( $("#pageNameId").val() == "hhdg" || $("#pageNameId").val().indexOf("dg") > -1) { 
									// 单关
									passString = "1c1";
								}
								$(form).find("input[name=passType]").val(passString);
								/*if ( guess.playId != 6 ) {
									betCode = "";
									$("#betSelAreaId").children().each(function(index){
										betCode += $(this).attr("id") + ":";
										
										$(this).find("font").each(function(index){
											betCode += $(this).attr("bet") + ",";
										});
										
										if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
											betCode = betCode.substring(0, betCode.length - 1) + ":2|";
										} else {
											betCode = betCode.substring(0, betCode.length - 1) + ":0|";
										}
									});
								}*/
							} else {
								if ( $("#pageNameId").val() != "filter"  ) {
									$("#betListAreaId").children().each(function(index){
										betCode += $(this).attr("betCode") + ";";
									});
								} else {
									for ( var o = 0; o < globallist.length; o++ ) {
										betCode += globallist[o].join(",").split(",") + ";";
										
									}
								}
								$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html()));
								$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
								$("#partTitileId").val($("#licenseNameId").val()+$("#issuecid").val()+"期");
								//总份数
								$(form).find("input[name=totalNum]").val($("#totalBetMoneyId").html());
							}
							betCode = betCode.substring(0, betCode.length - 1);
							
							var multiple = $("#multipleId").val();
							
							$(form).find("input[name=singleFlag]").val("0");
							$(form).find("input[name=betCode]").val(betCode);
							$(form).find("input[name=multiple]").val(multiple);
//							$(form).find("input[name=issue]").val($("#currIssueId").html());
							$(form).find("input[name=betState]").val("1");
							$(form).find("input[name=betType]").val("1");
							var base = "0";
							if ( $("#zjBoxId").attr("checked") ) {
								base = "1";
							}
							$(form).find("input[name=zjFlag]").val(base);
							
							//合买内容
							//合买标题
							//if ( $("#partTitileId").val() == "" ) {
								
							//}
							if ( $("#partDetailId").val() == "" ) {
								$("#partDetailId").val("大奖就在眼前，不要错过哦!");
							}
							$(form).find("input[name=partTitile]").val($("#partTitileId").val());
							//方案描述
							$(form).find("input[name=partDetail]").val($("#partDetailId").val());
							
							//发起人购买份数
							$(form).find("input[name=launchNum]").val($("#offerBuyId").val());
							//保密级别
							$(form).find("input[name=showLevel]").val($("input[type=radio][name=showLevel]:checked").val());
							//佣金
							$(form).find("input[name=brokerage]").val($("#brokerageId").val());
							//保底份数
							var baodi = 0;
							var o = $("input[name=baodiType][type=radio]:checked").val();
							if ( o == "2" ) {
								var totalNum = 0;
								if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" ||  $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
									totalNum = parseInt($("#betMoneyId").html());
								} else {
									totalNum = parseInt($("#totalBetMoneyId").html());
								}
								var buyNum = parseInt($("#offerBuyId").val());
								baodi = totalNum - buyNum;
							} else if ( o == "3" ) {
								baodi = parseInt($("#partBaoInputId").val());
							} 
							$(form).find("input[name=insNum]").val(baodi);
							
							var oMoney = parseInt($("#totalBetMoneyId").html()); // 订单金额
							if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10"  || $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
								oMoney = parseInt($("#betMoneyId").html()); // 订单金额
							}
							
							if ( baodi + parseInt($("#offerBuyId").val(),10) > oMoney ) {
								alert("认购份数+保底>总份数，请重新设置保底");
								return false;
							}
							$(form).submit();
						}
						
					}
			    }
			});
	}
	
	/**
	 * 奖金优化订单提交
	 */
	this.submitBonusForm = function() {
		if ( $("#offerBuyId").val() == "" ) {
			alert("认购份数没有输入！");
			return false;
		}
		// 发起人需要支付的金额
		var payMoney = this.calcOrderMoney();
		$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$(".openlogin").click();
					} else {
						//var pay = parseFloat($("#betMoneyId").html());
						var balance = parseFloat(data);
						if ( payMoney > balance ) {
							layer.alert("余额不足，请您先充值！",0);
							return false;
						} else {
							// 提交表单
							var form = $("#mergerBuyFormId");
							var betCode = $("#betCodeId").val();
							var odds = "";////下单赔率 20140420001:3@2.10,1@1.11:1|20140420002:3@2.10:2
							var stopTimes = "";// 对阵的比赛截止时间
							var betCodes = betCode.split("|");
							for( var i = 0; i < betCodes.length; i++ ) {
								var cInfo = betCodes[i].split(":");
								var bets = cInfo[1].split(",");
								odds += cInfo[0] + ":";
								stopTimes += cInfo[0] + "`" + guess.getStopTime(cInfo[0]) + "|";
								for ( var j = 0; j < bets.length; j++ ) {
									odds += bets[j] + "@" + guess.getBetOdds(cInfo[0], bets[j]) + ",";
								}
								odds = odds.substring(0, odds.length - 1) + ":"+guess.getGgRqOrRf(cInfo[0])+ "|";
							}
							
							odds = odds.substring(0, odds.length - 1);
							stopTimes = stopTimes.substring(0, stopTimes.length - 1);
							
							var multiple = 0;
							var betInfo = "";
							if ( $("#coldFDivId").length > 0 ) {
								multiple = $("#multipleId").val();
								$("#filterResultId").find("tr").each(function(index){
									betInfo += $(this).attr("code") + "`" + multiple + ";";
								});
							} else {
								$("#singleAreaId").children().each(function(index){
									multiple += parseInt($(this).find("input[name=betNum]").val());
									betInfo += $(this).attr("code") + "`" + $(this).find("input[name=betNum]").val() + ";";
								});
							}
							betInfo = betInfo.substring(0, betInfo.length - 1);
							
							//$(form).find("input[name=licenseId]").val(guess.licenseId);
							$(form).find("input[name=playType]").val(guess.playId);
							//$(form).find("input[name=passType]").val(passString);
							$(form).find("input[name=singleFlag]").val("1");
							//$(form).find("input[name=betCode]").val(betCode);
							$(form).find("input[name=orderOdds]").val(odds);
							$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple)/2);
							$(form).find("input[name=multiple]").val(-1);
							$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
							$(form).find("input[name=betState]").val("1");
							if ( $("#licenseId").val() == "21" ) {
								$(form).find("input[name=issue]").val(schedules[0].issue);
							} else {
								$(form).find("input[name=issue]").val("1");
							}
							$(form).find("input[name=betType]").val("1");
							$(form).find("input[name=schInfo]").val(betInfo);
							$(form).find("input[name=reserved8]").val(stopTimes);
							
							var theryB = 0;
							$("#singleAreaId").children().each(function(index){
								var bb = parseFloat($(this).find(".jj").html());
								if ( bb > theryB ) {
									theryB = bb;	
								}
							});
									
							$(form).find("input[name=theoryBonus]").val(theryB);
							
							//合买内容
							//合买标题
							//if ( $("#partTitileId").val() == "" ) {
								
							//}
							if ( $("#partDetailId").val() == "" ) {
								$("#partDetailId").val("大奖就在眼前，不要错过哦!");
							}
							$(form).find("input[name=partTitile]").val($("#partTitileId").val());
							//方案描述
							$(form).find("input[name=partDetail]").val($("#partDetailId").val());
							//总份数
							$(form).find("input[name=totalNum]").val($("#betMoneyId").html());
							//发起人购买份数
							$(form).find("input[name=launchNum]").val($("#offerBuyId").val());
							//保密级别
							$(form).find("input[name=showLevel]").val($("input[type=radio][name=showLevel]:checked").val());
							//佣金
							$(form).find("input[name=brokerage]").val($("#brokerageId").val());
							//保底份数
							var baodi = 0;
							var o = $("input[name=baodiType][type=radio]:checked").val();
							if ( o == "2" ) {
								var totalNum = 0;
								if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10"  || $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
									totalNum = parseInt($("#betMoneyId").html());
								} else {
									totalNum = parseInt($("#totalBetMoneyId").html());
								}
								var buyNum = parseInt($("#offerBuyId").val());
								baodi = totalNum - buyNum;
							} else if ( o == "3" ) {
								baodi = parseInt($("#partBaoInputId").val());
							} 
							$(form).find("input[name=insNum]").val(baodi);
							
							var oMoney = parseInt($("#totalBetMoneyId").html()); // 订单金额
							if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" || $("#licenseId").val() == 21 || $("#licenseId").val() == 22 ) {
								oMoney = parseInt($("#betMoneyId").html()); // 订单金额
							}
							
							if ( baodi + parseInt($("#offerBuyId").val(),10) > oMoney ) {
								alert("认购份数+保底>总份数，请重新设置保底");
								return false;
							}
							$(form).submit();
						}
						
					}
			    }
			});
	}
	
	/**
	 * 单式上传订单提交
	 */
	this.dsSubmitForm = function() {
		if ( $("#offerBuyId").val() == "" ) {
			alert("认购份数没有输入！");
			return false;
		}
		// 发起人需要支付的金额
		var payMoney = this.calcOrderMoney();
		$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$(".openlogin").click();
					} else {
						var balance = parseFloat(data);
						if ( payMoney > balance ) {
							layer.alert("余额不足，请您先充值！",0);
							return false;
						} else {
							// 提交表单
							var form = $("#mergerSingleFormId");
							$(form).find("input[name=multiple]").val($("#multipleId").val());
							var oMoney = 0;
							if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" ||  $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
								$("#partTitileId").val($("#licenseNameId").val()+"合买方案");
								//总份数
								oMoney = parseInt($("#betMoneyId").html()); // 订单金额
								
								// 场次编号
								var schInfo = "";
								$("#dsSchDivId").find("input[type=checkbox]:checked").each(function(index){
									schInfo += $(this).attr("id") + ",";
								});
								schInfo = schInfo.substring(0, schInfo.length-1);
								$(form).find("input[name=schs]").val(schInfo);
								$(form).find("input[name=playId]").val($("input[name=playTypeName]:checked").val());
								if ( $("#licenseId").val() == "21" ) {
									$(form).find("input[name=playId]").val("2");
									if ( $("#pageNameId").val() == "zjqdssc" ) {
										$(form).find("input[name=playId]").val("5");
									} 
									if ( $("#pageNameId").val() == "bqcdssc" ) {
										$(form).find("input[name=playId]").val("4");
									}
									if ( $("#pageNameId").val() == "sxdsdssc" ) {
										$(form).find("input[name=playId]").val("6");
									}
								}
							} else {
								$("#partTitileId").val($("#licenseNameId").val()+$("#issuecid").val()+"期");
								oMoney = parseInt($("#totalBetMoneyId").html());
							}
							$(form).find("input[name=totalNum]").val(oMoney);
							if ( $("#partDetailId").val() == "" ) {
								$("#partDetailId").val("大奖就在眼前，不要错过哦!");
							}
							$(form).find("input[name=partTitile]").val($("#partTitileId").val());
							//方案描述
							$(form).find("input[name=partDetail]").val($("#partDetailId").val());
							
							//发起人购买份数
							$(form).find("input[name=launchNum]").val($("#offerBuyId").val());
							//保密级别
							$(form).find("input[name=showLevel]").val($("input[type=radio][name=showLevel]:checked").val());
							//佣金
							$(form).find("input[name=brokerage]").val($("#brokerageId").val());
							//保底份数
							var baodi = 0;
							var o = $("input[name=baodiType][type=radio]:checked").val();
							if ( o == "2" ) {
								var buyNum = parseInt($("#offerBuyId").val());
								baodi = oMoney - buyNum;
							} else if ( o == "3" ) {
								baodi = parseInt($("#partBaoInputId").val());
							} 
							$(form).find("input[name=insNum]").val(baodi);
							
							if ( baodi + parseInt($("#offerBuyId").val(),10) > oMoney ) {
								alert("认购份数+保底>总份数，请重新设置保底");
								return false;
							}
							$(form).submit();
						}
						
					}
			    }
			});
	}
	
	/**
	 * 先发起后上传，订单提交
	 */
	this.frsHupSubmitForm = function() {
		var betNum = $("#yjTotalBuyNumId").val();
		if ( isNaN(betNum) ) {
			layer.alert("注数输入有误！",0);
			return false;
		}
		var betMult = $("#yjTotalBuyMulId").val();
		if ( isNaN(betMult) ) {
			betMult = 1;
			$("#yjTotalBuyMulId").val(1);
		}
		// 发起人需要支付的金额
		var payMoney = this.calcOrderMoney();
		$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$(".openlogin").click();
					} else {
						var balance = parseFloat(data);
						if ( payMoney > balance ) {
							layer.alert("余额不足，请您先充值！",0);
							return false;
						} else {
							// 提交表单
							var form = $("#frsUpmergerBuyFormId");
							var oMoney = 0;
							if ( $("#licenseId").val() == "9" || $("#licenseId").val() == "10" ||  $("#licenseId").val() == 21 || $("#licenseId").val() == 22) {
								$("#partTitileId").val($("#licenseNameId").val()+"合买方案");
							} else {
								$("#partTitileId").val($("#licenseNameId").val()+$("#issuecid").val()+"期");
							}
							var betMult = $("#yjTotalBuyMulId").val();
							if ( isNaN(betMult) ) {
								betMult = 1;
							}
							oMoney = parseInt($("#yjTotalBuyNumId").val(),10)*parseInt(betMult,10)*2;
							
							$(form).find("input[name=totalNum]").val(oMoney);
							$(form).find("input[name=multiple]").val($("#dsMultipleId").val());
							if ( $("#partDetailId").val() == "" ) {
								$("#partDetailId").val("大奖就在眼前，不要错过哦!");
							}
							$(form).find("input[name=partTitile]").val($("#partTitileId").val());
							//方案描述
							$(form).find("input[name=partDetail]").val($("#partDetailId").val());
							
							//发起人购买份数
							$(form).find("input[name=launchNum]").val($("#offerBuyId").val());
							//保密级别
							$(form).find("input[name=showLevel]").val($("input[type=radio][name=showLevel]:checked").val());
							//佣金
							$(form).find("input[name=brokerage]").val($("#brokerageId").val());
							//保底份数
							var baodi = 0;
							var o = $("input[name=baodiType][type=radio]:checked").val();
							if ( o == "2" ) {
								var buyNum = parseInt($("#offerBuyId").val());
								baodi = oMoney - buyNum;
							} else if ( o == "3" ) {
								baodi = parseInt($("#partBaoInputId").val());
							} 
							$(form).find("input[name=insNum]").val(baodi);
							
							if ( baodi + parseInt($("#offerBuyId").val(),10) > oMoney ) {
								alert("认购份数+保底>总份数，请重新设置保底");
								return false;
							}
							
							$(form).find("input[name=betNum]").val($("#yjTotalBuyNumId").val());
							$(form).find("input[name=multiple]").val($("#yjTotalBuyMulId").val());
							$(form).submit();
						}
						
					}
			    }
			});
	}
	
}