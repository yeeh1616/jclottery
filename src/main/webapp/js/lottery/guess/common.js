/**
 * <p>Desc:竞彩页面公用处理</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/31 Version 1.0
 */

function calculate() {
	if ( $("#pageNameId").length == 0 ) {
		return false;
	}
	if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
		var betNum = parseInt($("#betNumId").html());
		var mult = parseInt($("#multipleId").val());
		$("#betMoneyId").html(betNum * 2 * mult);
	} else {
		var betCode = "";
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
		betCode = betCode.substring(0, betCode.length - 1);
		var passString = "";
		$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
			var selected = parseInt($("#schudleSelId").html());
			var cLen = parseInt($(this).val().split("c")[0]);
			if ( cLen <= selected ) {
				passString += $(this).val() + ",";
			}
		});
		if ( passString != "") {
			passString = passString.substring(0, passString.length - 1);
		}
		if ( $("#pageNameId").val() == "hhdg" || $("#pageNameId").val().indexOf("dg") > -1 ) { 
			// 单关
			passString = "1c1";
		}
		if ( $("#multipleId").val() == "" ) {
			$("#multipleId").val(1);
		}
		if ( betCode != "" && passString != "" ) {
			var multiple = parseInt($("#multipleId").val());
			var betNum = guess.calcBetNum(betCode, passString);
			var highestBonus = guess.calcBonus(betCode, passString, multiple);
			var minBonus = guess.calcMinBonus(betCode, passString, multiple);
			$("#betMoneyId").html(betNum * 2 * multiple);
			$("#highestBonusId").html(highestBonus);
			$("#lowestBonusId").html(minBonus);
		} else {
			$("#betMoneyId").html("0");
			$("#lowestBonusId").html("0");
			$("#highestBonusId").html("0");
		}
	}
}

function setDan(obj) {
	$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
		var selected = parseInt($("#schudleSelId").html());
		var cLen = parseInt($(this).val().split("c")[1]);
		if ( cLen > 1 ) {
			$(this).removeAttr("checked");
		}
	});
	var danLen = 0;
	$("#betSelAreaId").find("tr").each(function(index){
		if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
			danLen++;
		} 
	});
	$("#passAreaId").find("input[type=checkbox]").each(function(index){
		var selected = parseInt($("#schudleSelId").html());
		var cLen = parseInt($(this).val().split("c")[1]);
		if ( cLen == 1 ) {
			if ( parseInt($(this).val().split("c")[0]) <= danLen ) {
				$(this).removeAttr("checked");
				$(this).attr("disabled", "disabled");
			} else {
				$(this).removeAttr("disabled");
			}
		} 
	});
	if ( danLen > 0 ) {
		$("#passAreaId").find("input[type=checkbox]").each(function(index){
			var cLen = parseInt($(this).val().split("c")[1]);
			if ( cLen > 1 ) {
				$(this).removeAttr("checked");
				$(this).attr("disabled", "disabled");
			} 
		});
	} else {
		$("#passAreaId").find("input[type=checkbox]").each(function(index){
			var cLen = parseInt($(this).val().split("c")[1]);
			if ( cLen > 1 ) {
				$(this).removeAttr("disabled");
			} 
		});
	}
	calculate();
}

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

var hem = new Hemai();

$(document).ready(function () {
	// 合买事件begin
	$("#offerBuyId").keyup(function(){
		if ( $(this).val() != '' ) {
			$(this).val($(this).val().replace(/\D/g,''));
			hem.offerBuy();
			hem.calcOrderMoney();
		}
	});
	// 发起人认购设置end
	// 保底设置begin
	// 保底类型选择
	$("input[name=baodiType][type=radio]").click(function(){
		var v = $(this).val();
		switch( v ) {
		case "1":
			$("#baoFullMoneyId").html(0);
			$("#baoFullPerId").html(0);
			$("#partBaoInputId").val(0);
			$("#baoPartMoneyId").html(0);
			$("#baoPartPerId").html(0);
			$("#partBaoInputId").attr("disabled","disabled");
			break;
		case "2":// 全额保底
			$("#partBaoInputId").val(0);
			$("#baoPartMoneyId").html(0);
			$("#baoPartPerId").html(0);
			$("#partBaoInputId").attr("disabled","disabled");
			
			var totalNum = parseInt($("#betMoneyId").html());
			var buyNum = parseInt($("#offerBuyId").val(),10);
			var insNum = totalNum - buyNum;
			// 显示比例和支付金额
			$("#baoFullMoneyId").html(insNum);
			$("#baoFullPerId").html(parseInt(insNum/totalNum*100));
			break;
		case "3"://	部分保底
			$("#baoFullMoneyId").html(0);
			$("#baoFullPerId").html(0);

			$("#partBaoInputId").removeAttr("disabled");
			break;
		}
		hem.calcOrderMoney();
	});
	// 部分保底设置事件
	$("#partBaoInputId").keyup(function(event){
		if ( isNaN($(this).val()) ) {
			$(this).val(1);
		}
		var v = $(this).val();
		var totalNum = parseInt($("#betMoneyId").html());
		// 显示比例和支付金额
		$("#baoPartMoneyId").html(v);
		$("#baoPartPerId").html(parseInt(v/totalNum*100));
		hem.calcOrderMoney();
	});
	$("#offerBaoDiId").keyup(function(){
		if ( $(this).val() != '' ) {
			$(this).val($(this).val().replace(/\D/g,''));
			hem.setBaoDi();
			hem.calcOrderMoney();
		}
	});
	// 保底设置end
	
	// 合买事件end
	
	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			// 查询余额
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						// 登录
						$(".openlogin").click();
					} else {
						var pay = parseFloat($("#betMoneyId").html());
						/*var balance = parseFloat(data);
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {*/
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							$("#showBalDivId").html(formatCurrency(data)+"元");// 余额显示
							
							$("#sureSchPanalId").empty();
							if ( $("#pageNameId").length == 0 ) {
								var betName = "奖金优化";
								if ( $("#coldFDivId").length > 0 ) {
									betName = "在线过滤";
									$("#sureMultipleId").html($("#multipleId").val()+"倍");
									$("#sureBetNumId").html($("#filterResultId").find("tr").length+"注");
								} else {
									$("#sureMultipleId").html("-倍");
									$("#sureBetNumId").html($("#singleAreaId").find("tr").length+"注");
								}
								$('<tr><td align=left><font color=red>*方案为'+betName+'</font></td></tr>').appendTo($("#sureSchPanalId"));
								$("#passShowId").html($("#passTypeId").val().replaceAll("c","串"));
								$("#sureBetMoneyId").html($("#betMoneyId").html()+"元");
								
							}
							else {
								var passString = "";
								if ( $("#pageNameId").val() != "dssc" ) { // 单式上传
									// 填充数据
									var hag = '主队 VS 客队';
									if ( $("#licenseId").val() == "10" ) {
										hag = '客队 VS 主队';
									}
									var html = '<tr>'+
									    '<th width="15%">赛事编号</th>'+
									    '<th width="25%">'+hag+'</th>'+
									    '<th width="52%">投注内容</th>'+
									    '<th width="8%">胆</th>'+
									  '</tr>';	// 头部
									$("#betSelAreaId").find("tr").each(function(index){
										html += '<tr>'+
										    '<td>'+$(this).children().eq(0).html()+'</td>'+
										    '<td>'+$(this).children().eq(1).html()+'</td><td>';
										$(this).children().eq(2).children().each(function(index){
											html += '<i>'+$(this).html()+'</i>';
										});
										html += '</td>';
										if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
											html += '<td>胆</td></tr>';
										} else {
											html += '<td></td></tr>';
										}
									});
									$(html).appendTo($("#sureSchPanalId"));
									$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
										var selected = parseInt($("#schudleSelId").html());
										var cLen = parseInt($(this).val().split("c")[0]);
										if ( cLen <= selected ) {
											passString += $(this).val() + ",";
										}
									});
									passString = passString.substring(0, passString.length - 1);
								} else {
									$('<tr><td align=left><font color=red>*方案为文件上传</font></td></tr>').appendTo($("#sureSchPanalId"));
									$("#passShowId").html($("input[type=radio][name=dsPtName]:checked").val()+"串1");
								}
								
								if ( "" != passString ) {
									$("#passShowId").html(passString.replaceAll("c", "串"));
								}
								if ( $("#pageNameId").val() == "hhdg" || $("#pageNameId").val().indexOf("dg") > -1 ) { 
									// 单关
									$("#passShowId").html("单关");
								}
								
								var multiple = $("#multipleId").val();
								
								$("#sureBetNumId").html(parseInt($("#betMoneyId").html())/parseInt(multiple)/2+"注");
								$("#sureMultipleId").html(multiple + "倍");
								$("#sureBetMoneyId").html($("#betMoneyId").html()+"元");
							}
							$("input[name=buyType]").eq(0).click();
						//}
						
					}
			    }
			});
			
		} else {
			layer.alert("请先投注！",0);
		}
	});
	
	$("#returnModId").click(function(){
		$("#betPanalId").show();
		$("#surePanalId").hide();
	});
	
	$("#sureBetBtnId").click(function(){
		if ( !$("#agreeChkId").attr("checked") ) {
			layer.alert("请同意彩店与彩民交易协议！",0);
			return false;
		}
		// 先判断余额，如果未登录，先登录
		$.ajax({
		    type: "post",
		    url: "/common/getAccountUsable.json",
		    async: false,
		    //data: "licenseId=" + licenseId,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == '-1' ) {
					// 尚未登录
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#betMoneyId").html());
					var oo = $("input[name=buyType]:checked").val();
					var balance = parseFloat(data);
					if ( (pay > balance) && oo == "1") {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						if ( oo == "1" ) {
							if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
								dsscFormSubmit();
							} else {
								if ( $("#pageNameId").length != 0 ) {
									formSubmit();
								} else {
									formFSubmit();
								}
							}
						} else if ( oo == "3" ) {
							if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
								hem.dsSubmitForm();
							} else {
								if ( $("#pageNameId").length != 0 ) {
									hem.submitForm();
								} else {
									// 奖金优化
									hem.submitBonusForm();
								}
							}
						}
						$("#loginCloseBtnId").click();
						$("#returnModId").click();
					}
				}
		    }
		});
		
	});
	
	// 进入奖金优化
	$("#bonusBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			var betCode = "";
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
			betCode = betCode.substring(0, betCode.length - 1);
			var passString = "";
			if ( $("#pageNameId").val() == "hhdg" || $("#pageNameId").val().indexOf("dg") > -1 ) {
				passString = "1c1,";
			}
			else {
				var hasCombP = "0";
				$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
					var selected = parseInt($("#schudleSelId").html());
					var cLen = parseInt($(this).val().split("c")[0]);
					if ( cLen <= selected ) {
						passString += $(this).val() + ",";
					}
					if ( parseInt($(this).val().split("c")[1]) > 1 ) {
						hasCombP = "1";
					}
				});
				if ( hasCombP == "1" ) {
					layer.alert("不支持组合过关优化！",0);
					return false;
				}
				if ( passString == "" ) {
					return false;
				}
			} 
			passString = passString.substring(0, passString.length - 1);
			var betNum = guess.calcBetNum(betCode, passString);
			if ( betNum == 1 ) {
				return false;
			}
			var form = $("<form action='/lottery/indexBonus.jhtml' method='post' target='_blank'>" +
					"<input type='hidden' name='betCode' value='"+betCode+"'/>"+
					"<input type='hidden' name='passType' value='"+passString+"'/>"+
					"<input type='hidden' name='playId' value='"+guess.playId+"'/>"+
					"<input type='hidden' name='licenseId' value='"+guess.licenseId+"'/>"+
					"</form>");
			$(form).appendTo($("body"));
			$(form).submit();
			$(form).remove();
		} else {
			layer.alert("请先投注！",0);
		}
	});
	
	// 进入在线过滤
	$("#filterBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			var betCode = "";
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
			betCode = betCode.substring(0, betCode.length - 1);
			var passString = "";
			var hasCombP = "0";
			$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
				var selected = parseInt($("#schudleSelId").html());
				var cLen = parseInt($(this).val().split("c")[0]);
				if ( cLen <= selected ) {
					passString += $(this).val() + ",";
				}
				if ( parseInt($(this).val().split("c")[1]) > 1 ) {
					hasCombP = "1";
				}
			});
			if ( hasCombP == "1" ) {
				layer.alert("不支持组合过关！",0);
				return false;
			}
			if ( passString == "" ) {
				return false;
			}
			passString = passString.substring(0, passString.length - 1);
			var playIdd = guess.playId;
			if ( guess.playId == 6 ) {
				// 判断是否为同一玩法
				var pcodes = betCode.split("|");
				var ppid = pcodes[0].split(":")[1].split(",")[0].split("-")[0];
				var siF = true;
				for ( var i = 0; i < pcodes.length; i++ ) {
					var cInfo = pcodes[i].split(":")[1].split(",");
					for ( var j = 0; j < cInfo.length; j++ ) {
						if ( ppid != cInfo[j].split("-")[0] ) {
							siF = false;
							break;
						}
					}
				}
				if ( siF ) {
					playIdd = ppid;
					var nc = "";
					for ( var i = 0; i < pcodes.length; i++ ) {
						nc += pcodes[i].split(":")[0] + ":";
						var cInfo = pcodes[i].split(":")[1].split(",");
						for ( var j = 0; j < cInfo.length; j++ ) {
							nc += cInfo[j].split("-")[1] + ",";
						}
						nc = nc.substring(0, nc.length - 1) + ":0|";
					}
					betCode = nc.substring(0, nc.length - 1);
				}
			}
			var form = $("<form action='/lottery/indexFilter.jhtml' method='post' target='_blank'>" +
					"<input type='hidden' name='betCode' value='"+betCode+"'/>"+
					"<input type='hidden' name='passType' value='"+passString+"'/>"+
					"<input type='hidden' name='playId' value='"+playIdd+"'/>"+
					"<input type='hidden' name='licenseId' value='"+guess.licenseId+"'/>"+
					"</form>");
			$(form).appendTo($("body"));
			$(form).submit();
			$(form).remove();
		} else {
			layer.alert("请先投注！",0);
		}
	});
	
	// 倍数控制事件 begin
	$("#multipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			calculate();
		}
	});
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v) > 1 ) {
			$("#multipleId").val(parseInt(v)-1);
			calculate();
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v)+1);
		calculate();
	});
	// 倍数控制事件 end
	
	$("#passAreaId").find("input[type=checkbox]").click(function(){
		calculate();
	});
	// 已选择区域投注项全删
	$("#removeAllSelId").click(function(){
		$("#accordion").find(".active").removeClass("active");
		$("#accordion").find(".zk_s").hide();
		$("#betSelAreaId").empty();
		guessHhgg.calc();
	});
	
	// 赛事选择 begin
	
	// 五大联赛
	$("#wdlsId").live('click', function() {
		$("#accordion").find(".sai_c").hide();
		$("#navbox_tz").find("input[type=checkbox]:checked").removeAttr("checked");
		$("#navbox_tz").find("input[type=checkbox]").each(function(index){
			if ( $(this).val() == "德甲" || $(this).val() == "德国甲级" ||
					$(this).val() == "意甲" || $(this).val() == "意大利甲级" || 
					$(this).val() == "英超" || 
					$(this).val() == "西甲" || $(this).val() == "西班牙甲级" ||
					$(this).val() == "法甲" || $(this).val() == "法国甲级") {
				$(this).attr("checked", "checked");
				showOrHiddleSch();
			} 
			
		});
		
	});
	// 全选
	$("#schAllSelId").live('click', function(){
		$("#navbox_tz").find("input[type=checkbox]").attr("checked", "checked");
		showOrHiddleSch();
	});
	$("#schAllSelRId").live('click', function(){
		$("#navbox_tz").find("input[type=checkbox]").each(function(index){
			if ( $(this).attr("checked") ) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr("checked", "checked");
			}	
		});
		showOrHiddleSch();
	});
	$("#schAllClrId").live('click', function(){
		$("#navbox_tz").find("input[type=checkbox]").attr("checked", "checked");
		showOrHiddleSch();
	});
	// 最低赔率
	$("#odSsAreaId").find("input[type=checkbox]").live('click',function(){
		showOrHiddleSch();
	});
	// 让球数
	$("#rqSsAreaId").find("input[type=checkbox]").live('click',function(){
		showOrHiddleSch();
	});
	// 联赛
	$("#lsSsAreaId").find("input[type=checkbox]").live('click',function(){
		showOrHiddleSch();
	});
	// 赛事选择 end
	// 显示已截止
	$(".sais_ct_r").find("input[type=checkbox]").live('click', function(){
		var ndate = $("#ndateValId").val();
		if ( $(this).attr("checked") ) {
			$(this).parent().parent().parent().find(".sai_c").each(function(index){
				if ( dateUtils.formatGuessDate(guess.getStopTime($(this).attr("id")), $("#aheadTimeId").val()) <= ndate ) {
					$(this).show();
				}
			});
		} else {
			$(this).parent().parent().parent().find(".sai_c").each(function(index){
				if ( dateUtils.formatGuessDate(guess.getStopTime($(this).attr("id")), $("#aheadTimeId").val()) <= ndate ) {
					$(this).hide();
				}
			});
		}
	});
	// 代购/合买切换
	$("input[name=buyType]").click(function(){
		var oo = $(this).val();
		if ( oo == "1" ) {
			$("#mergerPanelId").hide();
		} else if ( oo == "3" ) {
			$("#mergerPanelId").show();
			// 显示合买配置项
			$("#betPanalId").hide();
			$("div[name=mergerPanel]").show();
			$("#megerPanelDivId").show();
			// 合买数据填充
			$("#totalHemaiNumId").html($("#betMoneyId").html());

			// 合买默认购买份数 1%
			var lbuy = parseInt(parseInt($("#betMoneyId").html())/100);
			if ( parseInt($("#betMoneyId").html())%100 != 0 ) {
				lbuy++;
			}
			$("#offerBuyId").val(lbuy);
			// 合买发起人总额
			$("#totalHmMoneyId").html(lbuy);
			$("#partDetailId").val("大奖就在眼前，不要错过哦");
			
			// 默认无保底
			$("input[name=baodiType][type=radio]").eq(0).click();
			$("#offerBMId").html(parseInt(new Number(lbuy/parseInt($("#betMoneyId").html())).toFixed(2))*100);
		}
	});
});

function dsscFormSubmit() {
	var form = $("#singleFormId");
	$(form).find("input[name=playId]").val($("input[type=radio][name=playTypeName]:checked").val());
	// 对阵编号
	var sch = "";
	// 截止时间
	var stopTime = "";
	// 让球数
	var rqs = "";
	$("#dsSchDivId").find("input[type=checkbox]:checked").each(function(index){
		sch += $(this).attr("id") + ",";
	});
	sch = sch.substring(0, sch.length-1);
	$(form).find("input[name=schs]").val(sch);
	$(form).find("input[name=stopTime]").val(stopTime);
	$(form).find("input[name=rqs]").val(rqs);
	
	var mult = $("#multipleId").val();
	if ( isNaN(mult) ) {
		mult = 1;
	}
	$(form).find("input[name=multiple]").val(mult);
	
	// 过关方式
	$("#singleFormId").submit();
}

// 生成联赛信息
function createLsHtml() {
	// 生成赛事 联赛
	var lsMap = new Hashtable();
	var lsList = new Array();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		if ( lsMap.get(obj.leaguename) != 'undefined' ) {
			lsMap.put(obj.leaguename, parseInt(lsMap.get(obj.leaguename))+1);
		} else {
			lsMap.put(obj.leaguename, 1);
			lsList.push(obj.leaguename);
		}
	}
	$("#lsSsAreaId").empty();
	for ( var i = 0; i < lsList.length; i++ ) {
		$('<li>'+
             '<input type="checkbox" class="dzm_chx" value="'+lsList[i]+'" checked/>'+
              '<a href="javascript:void 0">'+lsList[i]+'【'+lsMap.get(lsList[i])+'场】</a></li>'+
        '').appendTo($("#lsSsAreaId"));
	}
	$('<div class="clear"></div>').appendTo($("#lsSsAreaId"));
	
	if ( $("#licenseId").val() == "9" ) {
		// 生成赛事 让球
		var rqMap = new Hashtable();
		var rqList = new Array();
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			if ( rqMap.get(obj.ggrq) != 'undefined' ) {
				rqMap.put(obj.ggrq, parseInt(rqMap.get(obj.ggrq))+1);
			} else {
				rqMap.put(obj.ggrq, 1);
				rqList.push(obj.ggrq);
			}
		}
		$("#rqSsAreaId").empty();
		for ( var i = 0; i < rqList.length; i++ ) {
			$('<li>'+
	             '<input type="checkbox" class="dzm_chx" value="'+rqList[i]+'" checked/>'+
	              '<a href="javascript:void 0">主让'+rqList[i]+'球【'+rqMap.get(rqList[i])+'场】</a></li>'+
	        '').appendTo($("#rqSsAreaId"));
		}
		$(' <div class="clear"></div>').appendTo($("#rqSsAreaId"));
		
		// 最低赔率对阵数
		var odd15 = 0,odd1523 = 0, odd20 = 0;
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			// 从胜平负找出最小赔率
			var spfOdds = [];
			if ( obj.spfggodds == 'null' ) {
				continue;
			} else {
				spfOdds = obj.spfggodds.split(",");
			}
			var sArray = new Array();
			for ( var j = 0; j < 3; j++ ) {
				sArray.push(parseFloat(spfOdds[j]));
			}
			sArray.sort();
			if ( sArray[0] < 1.5 ) {
				odd15++;
			}
			if ( sArray[0] >= 1.5 && sArray[0] <= 2.3 ) {
				odd1523++;
			}
			if ( sArray[0] > 2.3 ) {
				odd20++;
			}
		}
		$("#odSsAreaId").empty();
		$('<li>'+
	          '<input type="checkbox" class="dzm_chx" value="1" checked/>'+
	          '<a href="javascript:void 0" >1.50以下【'+odd15+'场】</a></li>'+
	    '<li>'+
	          '<input type="checkbox" class="dzm_chx" value="2" checked/>'+
	          '<a href="javascript:void 0">1.50-2.30【'+odd1523+'场】</a></li>'+
	    '<li style="width:150px;">'+
	          '<input type="checkbox" class="dzm_chx" value="3" checked/>'+
	          '<a href="javascript:void 0">2.30以上【'+odd20+'场】</a></li>'+
	    '<div class="clear"></div>').appendTo($("#odSsAreaId"));
	}
}

function showOrHiddleSch() {
	$("#accordion").find(".sai_c").hide();
	$("#accordion").find(".sai_c_sc").hide();
	$("#odSsAreaId").find("input[type=checkbox]:checked").each(function(index){
		var t = $(this).val();
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			// 从胜平负找出最小赔率
			var spfOdds = [];
			if ( obj.spfggodds == 'null' ) {
				continue;
			} else {
				spfOdds = obj.spfggodds.split(",");
			}
			var sArray = new Array();
			for ( var j = 0; j < 3; j++ ) {
				sArray.push(parseFloat(spfOdds[j]));
			}
			sArray.sort();
			if ( t == "1" ) {
				if ( sArray[0] < 1.5 ) {
					$("#accordion").find("div[id="+obj.id+"]").show();
				} 
			} else if ( t == "2" ){
				if ( sArray[0] >= 1.5 && sArray[0] <= 2.3 ) {
					$("#accordion").find("div[id="+obj.id+"]").show();
				} 
			} else {
				if ( sArray[0] > 2.3 ) {
					$("#accordion").find("div[id="+obj.id+"]").show();
				} 
			}
		}
	});
	$("#rqSsAreaId").find("input[type=checkbox]:checked").each(function(index){
		var t = $(this).val();
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			if ( obj.ggrq == t ) {
				$("#accordion").find("div[id="+obj.id+"]").show();
			}
		}
	});
	$("#lsSsAreaId").find("input[type=checkbox]:checked").each(function(index){
		var t = $(this).val();
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			if ( obj.leaguename == t ) {
				$("#accordion").find("div[id="+obj.id+"]").show();
			}
		}
	});
}

function removeT(obj) {
	var id = $(obj).parent().parent().attr("id");
	$("#accordion").find("div[id="+id+"]").find(".active").removeClass("active");
	$("#accordion").find("div[id="+id+"]").find(".zk_s").hide();
	$("#accordion").find("div[id="+id+"]").find(".lq_sz").hide();
	$(obj).parent().parent().remove();
	guessHhgg.calc();
}
// 删除一个投注项
function removeOneT(obj) {
	var id = $(obj).parent().parent().attr("id");
	var t = $(obj).attr("bet").split("-")[0];
	if ( t == "1" || t == "2" ) {
		if ( $("#licenseId").val() == "9" ) {
			$("#accordion").find("div[id="+id+"]").find("span[bet="+$(obj).attr("bet")+"]").click();
		} else {
			$("#accordion").find("div[id="+id+"]").find("div[bet="+$(obj).attr("bet")+"]").click();
		}
	} else {
		$("#accordion").find("div[id="+id+"]").find("div[bet="+$(obj).attr("bet")+"]").click();
	}
	guessHhgg.calc();
}

function formSubmit() {
	// 判断第一场比赛是否过期 modified at 2015/03/27
	$.ajax( {
		type : "POST",
		url : "/lottery/getServerDateTime.jhtml",
		async:false, //同步请求方式
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			layer.alert("与服务器通讯失败，请检查本地网络环境！",0);
		},
		success : function(data) {
        	var firstTime = guess.getStopTime($("#betSelAreaId").children().eq(0).attr("id"));
        	if ( firstTime <= data ) {
        		layer.alert("第一场比赛已截止！",0);
			} else {
				var form = $("#lotteryBuyFormId");
				
				var betCode = "";
				var odds = "";//下单赔率 20140420001:3@2.10,1@1.11:1|20140420002:3@2.10:2
				var stopTimes = "";// 对阵的比赛截止时间
				var dan = false;
				// 格式：对阵:彩果@赔率:让球
				$("#betSelAreaId").find("tr").each(function(index){
					betCode += $(this).attr("id") + ":";
					$(this).find("td").eq(2).children().each(function(index){
						betCode += $(this).attr("bet") + ",";
					});
					if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
						betCode = betCode.substring(0, betCode.length - 1) + ":2|";
						dan = true;
					} else {
						betCode = betCode.substring(0, betCode.length - 1) + ":0|";
					}
				});
				betCode = betCode.substring(0, betCode.length - 1);
				
				var passString = "";
				$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
					var selected = parseInt($("#schudleSelId").html());
					var cLen = parseInt($(this).val().split("c")[0]);
					if ( cLen <= selected ) {
						passString += $(this).val() + ",";
					}
				});
				if ( passString != "" && !dan ) {
					passString = passString.substring(0, passString.length - 1);
					// 如果全是自由过关，优化成组合过关 modified at 2015/03/26
					passString =  guess.optimizePassType(betCode.split("|").length, passString, betCode);
				} else if ( passString != ""){
					passString = passString.substring(0, passString.length - 1);
				}
				if ( $("#pageNameId").val() == "hhdg" || $("#pageNameId").val().indexOf("dg") > -1) { 
					// 单关
					passString = "1c1";
				}
				
				var multiple = $("#multipleId").val();
				
				$(form).find("input[name=licenseId]").val(guess.licenseId);
				$(form).find("input[name=playType]").val(guess.playId);
				$(form).find("input[name=passType]").val(passString);
				$(form).find("input[name=singleFlag]").val("0");
				$(form).find("input[name=betCode]").val(betCode);
				$(form).find("input[name=orderOdds]").val(odds);
				$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple)/2);
				$(form).find("input[name=multiple]").val(multiple);
				$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
				$(form).find("input[name=betState]").val("1");
				$(form).find("input[name=issue]").val("1");
				$(form).find("input[name=betType]").val("1");
				$(form).find("input[name=reserved8]").val(stopTimes);
				
				if($("#highestBonusId").html() == '--')
					$("#highestBonusId").html('0.00');
						
				$(form).find("input[name=theoryBonus]").val($("#highestBonusId").html());
				
				$(form).submit();
			}
		}
	}); 
	
}

function clearBetInfo() {
	$("#schudleSelId").html("0");
	$("#betMoneyId").html("0");
	$("#highestBonusId").html("0.00");
	$("#betSelAreaId").empty();
}

function getAheadTime(tm) {
	var ahead = $("#aheadTimeId").val();
	var ham = tm.split(":");
	var result = tm;
	if ( parseInt(ham[1]) >= parseInt(ahead) ) {
		var dd = (parseInt(ham[1]) - parseInt(ahead));
		if ( dd < 10 ) {
			result = ham[0] + ":0" + dd;
		} else {
			result = ham[0] + ":" + dd;
		}
	} else {
		if ( parseInt(ham[0]) > 0 ) {
			ham[0] = parseInt(ham[0]) - 1;
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			var dd = (parseInt(ham[1]));
			if ( dd < 10 ) {
				result = ham[0] + ":0" + dd;
			} else {
				result = ham[0] + ":" + dd;
			}
		} else {
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			result = "23" +":"+ ham[1];
		}
	}
	ham = result.split(":");
	if ( parseInt(ham[0]) < 10 ) {
		result = "0" + parseInt(ham[0]) + ":" + ham[1];
	}
	
	return result;
}

function getAheadTime2(tm) {
	var ahead = $("#aheadTimeId").val();
	var tt = tm.split(" ");
	var ham = tt[1].split(":");
	var result = tm;
	if ( parseInt(ham[1]) >= parseInt(ahead) ) {
		result = tt[0] + " " + ham[0] + ":" + (parseInt(ham[1]) - parseInt(ahead));
	} else {
		if ( parseInt(ham[0]) > 0 ) {
			ham[0] = parseInt(ham[0]) - 1;
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			result = tt[0] +" " + ham[0] +":"+ ham[1];
		} else {
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			var tts = tt[0].split("-");
			if ( parseInt(tts[2]) - 1 > 0 ) {
				var ddy = (parseInt(tts[2]) - 1) + "";
				if ( ddy.length == 1 ) {
					ddy = "0" + ddy;
				}
				result = tts[0] + "-" + tts[1] + "-" + ddy + " 23" +":"+ ham[1];
			} else {
				return tm;
			}
		}
	}
	
	return result;
}

