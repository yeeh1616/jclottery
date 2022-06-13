/**
 * <p>Desc:竞彩页面公用处理</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/31 Version 1.0
 */

function calculate() {
	var betCode = "";
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
	if ( guess.playId != 6 ) {
		// 单关
		if ( $(".ss_top").find(".ck").html() == "单关投注" ) {
			passString = "";
		}
		/*if ( dgFlag == 1 ) {
			passString = "";
		}*/
	}
	if ( $("#multipleId").val() == "" ) {
		$("#multipleId").val(1);
	}
	if ( passString != "" && passString != "betCode" ) {
		var multiple = parseInt($("#multipleId").val());
		var betNum = guess.calcBetNum(betCode, passString);
		var highestBonus = guess.calcBonus(betCode, passString, multiple);
		$("#betMoneyId").html(betNum * 2 * multiple);
		$("#highestBonusId").html(highestBonus);
	} else if(guess.playId != 6) {
		// 单关奖金计算
		if ( dgFlag == 1 && betCode != "" ) {
			var codes = betCode.split("|");
			var lent = 0;
			var maxb = 0;
			for ( var i = 0; i < codes.length; i++ ) {
				lent += codes[i].split(":")[1].split(",").length;
				// 单场最大赔率
				var od = 0;
				var ods = codes[i].split(":")[1].split(",");
				for ( var j = 0; j < ods.length; j++ ) {
					if ( parseFloat(guess.getBetOdds(codes[i].split(":")[0],ods[j])) > 0 ) {
						od = parseFloat(guess.getBetOdds(codes[i].split(":")[0],ods[j]));
					}
				}
				maxb += od;
			}
			var multiple = parseInt($("#multipleId").val());
			$("#betMoneyId").html(lent * 2 * multiple);
			$("#highestBonusId").html(new Number(maxb*2*multiple).toFixed(2));
		} else {
			$("#betMoneyId").html("0");
			$("#highestBonusId").html("0.00");
		} 
		
	} else {
		$("#betMoneyId").html("0");
		$("#highestBonusId").html("0.00");
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
	$("#betSelAreaId").children().each(function(index){
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
	// 合买表单提交
	$("#mergerBuyBtnId").click(function(){
		hem.submitForm();
		$.unblockUI();
		$("#returnMergModId").click();
	});
	$("#mergerFormSbmBtnId").click(function(){
		if ( $("#mergerAgreeCheckBoxId").attr("checked") ) {
			// 显示确认页信息
			var baodi = 0;
			var totalNum = parseInt($("#betMoneyId").html());
			var buyNum = parseInt($("#offerBuyId").val());
			var o = $("input[name=baodiType][type=radio]:checked").val();
			if ( o == "2" ) {
				baodi = totalNum - buyNum;
			} else if ( o == "3" ) {
				baodi = parseInt($("#partBaoInputId").val());
			} 
			
			$("#mergerSureTitleTrId").html('<td height="31" align="center" class="hemai4">'+$("#playNameBId").html()+'  </td>'+
		       		'<td height="31" align="center" class="hemai4">'+parseInt($("#betMoneyId").html())/2/parseInt($("#multipleId").val())+'   </td>'+
		       		'<td height="31" align="center" class="hemai4">'+$("#multipleId").val()+'倍 </td>'+
		       		'<td height="31" align="center" class="hemai4"> ¥  '+$("#betMoneyId").html()+'元 </td>'+
		       		'<td height="31" align="center" class="hemai4">¥  1.00 元 </td>'+
		       		'<td height="31" align="center" class="hemai4"> ¥  '+baodi+' 元('+parseInt(baodi/totalNum*100)+'%) </td>'+
		       		'<td height="31" align="center" class="hemai4">'+parseFloat($("#brokerageId").val())*100+'% </td>'+
					'<td height="31" align="center" class="hemai4">'+$("input[name=showLevel][type=radio]:checked").attr("show")+'</td>');
			$("#mergerSureTotalMoneyId").html('您本次购买'+buyNum+'份，保底'+baodi+'份，需消费¥ <span> '+$("#totalHmMoneyId").html()+' </span>元');
			var passString = "";
			$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
				var selected = parseInt($("#schudleSelId").html());
				var cLen = parseInt($(this).val().split("c")[0]);
				if ( cLen <= selected ) {
					passString += $(this).val() + ",";
				}
			});
			if ( "" != passString ) {
				passString = passString.substring(0, passString.length - 1);
				passString = passString.replaceAll("c", "串");
			} else {
				passString = "单关";
			}
			if ( guess.playId != 6 ) {
				// 单关
				if ( $(".ss_top").find(".ck").html() == "单关投注" ) {
					passString = "";
				}
				/*if ( dgFlag == 1 ) {
					passString = "单关";
				}*/
			}
			$("#mergerSureSchPsId").html('选择场次：'+$("#schudleSelId").html()+'场  选择方式：'+passString);
			
			var html = "";
			$("#betSelAreaId").children().each(function(index){
				var id = $(this).attr("id");
				var dTr = $(this).find("tr").eq(0);
				var league = $(dTr).find("span").eq(0).html();
				league = league.replace("<br>", "");
				var hAg = $(dTr).children().eq(1).html();
				
				var host = hAg.split("VS")[0];
				var guest = hAg.split("VS")[1];
				if ( guess.licenseId == 9 ) {
					var t = host;
					host = guest;
					guest = t;
				}
				html += '<tr>'+
					'<td height="57" class="jcbg2">'+league+'</td>'+
					'<td class="jcbg2">'+host+'</td>'+
					'<td class="jcbg2">'+guest+'</td>'+
					'<td class="jcbg2">';
				$(dTr).find("font").each(function(index){
					html += '<span>'+$(this).html()+'</span>';
				});
				html += '</td>';
				if ($(dTr).find("input[type=checkbox]:checked").length == 1 ) {
					html += '<td><img src="/images/touzhu_11.png" /></td></tr>';
				} else {
					html += '<td class="jcbg2">&nbsp;</td></tr>';
				}
			});
			$("#mergerSureTbodyId").empty();
			$(html).appendTo($("#mergerSureTbodyId"));
			
			$.blockUI({
				message: $("#mergerSureDivId"),
				css: {
					width: '612px',
					height: '520px',
					left: ($(window).width() - 618) / 2 + 'px',
					top: 50 + 'px',
					border: 'none',
					cursor:'default'
				}
			});
		} else {
			//popupConfirm("温馨提示","请同意用户服务协议！");
			layer.alert("请同意用户服务协议！",0);
		}
	});
	
	// 总份数设置begin
	/*$("#totalHemaiNumId").blur(function(){
		hem.getUnitPrice();
	});
	$("#totalHemaiNumId").keyup(function(){
		hem.getUnitPrice();
	});*/
	// 总份数设置end
	// 发起人认购设置begin
	/*$("#offerBuyId").blur(function(){
		hem.offerBuy();
		hem.calcOrderMoney();
	});*/
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
	
	//查看奖金明细
	$("#lookBonusBtnId").click(function(){
		if ( $("#betMoneyId").html() == "0" ) {
			return false;
		}
		
		// 对阵显示
		$("#bonusAreaSchShowId").empty();
		var schHtml = "";
		$("#betSelAreaId").children().each(function(index){
			var id = $(this).attr("id");
			var dTr = $(this).find("tr").eq(0);
			var league = $(dTr).find("span").eq(0).html();
			league = league.replace("<br>", "");
			var hAg = $(dTr).children().eq(1).html();
			
			schHtml += '<tr><td width="67" height="30" align="center" bgcolor="#FFFFFF">'+league+'</td>' + 
				'<td width="175" align="center" bgcolor="#FFFFFF" class="jjvs">'+hAg+'</td>' + 
				'<td width="187" bgcolor="#FFFFFF"><div class="jfspf">';
			var subArray = new Array();
			$(dTr).find("font").each(function(index){
				subArray.push(guess.getBetOdds(id, $(this).attr("bet")));
				schHtml += '<span>'+$(this).html()+'</span>';
			});
			
			subArray.sort(guess.compare);
			schHtml += '</div></td>' + 
				'<td width="121" align="center" bgcolor="#FFFFFF">'+subArray[0]+'</td>' + 
				'<td width="122" align="center" bgcolor="#FFFFFF">'+subArray[subArray.length-1]+'</td>';
			if ($(dTr).find("input[type=checkbox]:checked").length == 1 ) {
				schHtml += '<td align="center" bgcolor="#f2f5f7"><img src="/images/touzhu_11.png" /></td></tr>';
			} else {
				schHtml += '<td align="center" bgcolor="#FFFFFF">&nbsp;</td></tr>';
			}
			
		});
		$(schHtml).appendTo($("#bonusAreaSchShowId"));
		
		var passString = "";
		$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
			var selected = parseInt($("#schudleSelId").html());
			var cLen = parseInt($(this).val().split("c")[0]);
			if ( cLen <= selected ) {
				passString += $(this).val() + ",";
			}
		});
		passString = passString.substring(0, passString.length - 1);
		var multiple = $("#multipleId").val();
		$("#bonusBAId").html('过关方式：  '+passString.replaceAll("c", "串")+'       倍数： '+multiple+'倍       方案总金额： '+$("#betMoneyId").html()+'元');
		
		var betCode = "";
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
		betCode = betCode.substring(0, betCode.length - 1);
		var list = guess.createBonusList(betCode, passString, multiple);
		var psa = "";
		for ( var i = 0; i < list[0].passArray.length; i++ ) {
			psa += "<b>"+list[0].passArray[i].replace("c","串")+"</b>";
		}
		$("#bonusTitleAId").empty();
		$('<tr><td width="67" height="32" align="center" bgcolor="#596e79">命中场数</td>'+
				'<td width="274" align="center" bgcolor="#596e79"><div>中奖注数</div>' + 
				'<div class="jjcc">'+psa+'</div></td>' + 
				'<td width="75" align="center" bgcolor="#596e79">倍数</td>'+
				'<td width="327" align="center" bgcolor="#596e79"><div>最小赔率</div>' + 
				'<div class="jjpl"><b>最小</b><b>最大</b></div></td></tr>').appendTo($("#bonusTitleAId"));
		var bonHtml = "";
		
		$("#bonusContAId").empty();
		for ( var i = 0; i < list.length; i++ ) {
			bonHtml += '<tr><td width="67" height="30" align="center" bgcolor="#FFFFFF">'+list[i].winNum+'</td>';
			var nums = list[i].winBet.split(",");
			var lent = 274 / nums.length;
			for ( var j = 0; j < nums.length; j++ ) {
				bonHtml += '<td width="'+lent+'" align="center" bgcolor="#FFFFFF" class="jjvs">'+nums[j]+'</td>';
			}
			var minDt = "";
			for ( var j = 0; j < list[i].bonusMinDetailArray.length; j++ ) {
				minDt += list[i].bonusMinDetailArray[j].passType + "`" + 
					list[i].bonusMinDetailArray[j].winNum + "`" + 
					list[i].bonusMinDetailArray[j].bonusDetail + "`" +
					list[i].bonusMinDetailArray[j].bonus + ";";
			}
			minDt = minDt.substring(0, minDt.length-1);
			var maxDt = "";
			for ( var j = 0; j < list[i].bonusMaxDetailArray.length; j++ ) {
				maxDt += list[i].bonusMaxDetailArray[j].passType + "`" + 
					list[i].bonusMaxDetailArray[j].winNum + "`" + 
					list[i].bonusMaxDetailArray[j].bonusDetail + "`" +
					list[i].bonusMaxDetailArray[j].bonus + ";";
			}
			maxDt = maxDt.substring(0, maxDt.length-1);
			bonHtml += '<td width="75" align="center" bgcolor="#FFFFFF">'+list[i].multiple+'</td>' + 
				'<td width="163" align="center" bgcolor="#FFFFFF" class="jjnum"><strong>'+list[i].minBonus+'</strong>元<a style="cursor:pointer" onclick="lookAtDetail(this)" detail="'+minDt+'">（明细）</a></td>' + 
				'<td width="163" align="center" bgcolor="#FFFFFF" class="jjnum"><strong>'+list[i].maxBonus+'</strong>元<a style="cursor:pointer" onclick="lookAtDetail(this)" detail="'+maxDt+'">（明细）</a></td>' + 
				'</tr>';
		}
		$(bonHtml).appendTo($("#bonusContAId"));
		$.blockUI({
			message: $("#BonusDetailAreaId"),
			css: {
				width: '612px',
				height: '520px',
				left: ($(window).width() - 618) / 2 + 'px',
				top: 50 + 'px',
				border: 'none',
				cursor:'default'
			}
		});		
	});
	$("#closeBonusAreaBtnId,#closeMergerSureDivId,#mergerCancelBtnId").click(function(){
		$.unblockUI();
	});
	
	// 进入合买配置界面 added at 2015/03/18
	$("#mergerFormBtnId").click(function(){
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
						/*$("#showBalDivId").html("未登录用户");
						$.blockUI({
							message: $("#loginAreaId"),
							css: {
								width: '612px',
								height: '520px',
								left: ($(window).width() - 618) / 2 + 'px',
								top: 50 + 'px',
								border: 'none',
								cursor:'default'
							}
						});*/
						$(".openlogin").click();
					} else {
						// 显示合买配置项
						$("#betPanalId").hide();
						$("div[name=mergerPanel]").show()
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
						$("#offerBMId").html(parseFloat(new Number(lbuy/parseInt($("#betMoneyId").html())).toFixed(2))*100);
					}
			    }
			});
			
		} else {
			//popupConfirm("温馨提示","请先投注！");
			layer.alert("请先投注！",0);
		}
	});
	// 退出合买配置页
	$("#returnMergModId").click(function(){
		$("#betPanalId").show();
		$("div[name=mergerPanel]").hide();
		$("#megerPanelDivId").hide();
	});
	
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
						/*$("#showBalDivId").html("未登录用户");
						$.blockUI({
							message: $("#loginAreaId"),
							css: {
								width: '612px',
								height: '520px',
								left: ($(window).width() - 618) / 2 + 'px',
								top: 50 + 'px',
								border: 'none',
								cursor:'default'
							}
						});*/
						// 登录
						$(".openlogin").click();
					} else {
						var pay = parseFloat($("#betMoneyId").html());
						var balance = parseFloat(data);
						if ( pay > balance ) {
							//popupConfirm("温馨提示","余额不足，请您先充值！");
							layer.alert("余额不足，请您先充值！",0);
						} else {
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							// 填充数据
							$(".touzhuh2").html(guess.scheduleMap.get($("#betSelAreaId").children().eq(0).attr("id")).stopTime);
							$("#sureSchPanalId").empty();
							var html = "";
							$("#betSelAreaId").children().each(function(index){
								var id = $(this).attr("id");
								var dTr = $(this).find("tr").eq(0);
								var league = $(dTr).find("span").eq(0).html();
								league = league.replace("<br>", "");
								var hAg = $(dTr).children().eq(1).html();
								if ( guess.licenseId == 9 ) {
									html += '<tr><td>'+league+'</td><td>'+hAg+'</td>' + 
									'<td bgcolor="#f2f5f7"  class="hover">';
								} else {
									var hgs = hAg.split("VS");
									html += '<tr><td>'+league+'</td><td>'+hgs[1]+" VS "+hgs[0]+'</td>' + 
									'<td bgcolor="#f2f5f7"  class="hover">';
								}
									//'<td bgcolor="#f2f5f7"  class="hover">胜平负让球（－1）</td>' + 
									
								$(dTr).find("font").each(function(index){
									html += '<span class="tzkuai">'+$(this).html()+'</span>';
								});
								if ($(dTr).find("input[type=checkbox]:checked").length == 1 ) {
									html += '</td><td><img src="/images/touzhu_11.png" /></td></tr>';
								} else {
									html += '</td><td bgcolor="#f2f5f7">&nbsp;</td></tr>';
								}
								
							});
							
							var passString = "";
							$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
								var selected = parseInt($("#schudleSelId").html());
								var cLen = parseInt($(this).val().split("c")[0]);
								if ( cLen <= selected ) {
									passString += $(this).val() + ",";
								}
							});
							passString = passString.substring(0, passString.length - 1);
							if ( "" != passString ) {
								$("#passShowId").html(passString.replaceAll("c", "串"));
							} else {
								$("#passShowId").html("单关");
							}
							if ( guess.playId != 6 ) {
								// 单关
								if ( $(".ss_top").find(".ck").html() == "单关投注" ) {
									$("#passShowId").html("单关");
								}
								/*if ( dgFlag == 1 ) {
									$("#passShowId").html("单关");
								}*/
							}
							
							var multiple = $("#multipleId").val();
							
							$("#sureBetNumId").html(parseInt($("#betMoneyId").html())/parseInt(multiple)/2+"注");
							$("#sureMultipleId").html(multiple + "倍");
							$("#sureBetMoneyId").html($("#betMoneyId").html()+"元");
							
							$(html).appendTo($("#sureSchPanalId"));
							$("#showBalDivId").html("账户余额&nbsp;&nbsp;&nbsp;&nbsp;"+formatCurrency(data)+"元");
						}
						
					}
			    }
			});
			
		} else {
			//popupConfirm("温馨提示","请先投注！");
			layer.alert("请先投注！",0);
		}
	});
	
	$("#returnModId").click(function(){
		$("#betPanalId").show();
		$("#surePanalId").hide();
	});
	
	$("#sureBetBtnId").click(function(){
		if ( !$("#agreeChkId").attr("checked") ) {
			//popupConfirm("温馨提示","请同意用户合买代购协议！");
			layer.alert("请同意用户合买代购协议！",0);
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
					/*$.blockUI({
						message: $("#loginAreaId"),
						css: {
							width: '612px',
							height: '520px',
							left: ($(window).width() - 618) / 2 + 'px',
							top: 50 + 'px',
							border: 'none',
							cursor:'default'
						}
					});*/
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#betMoneyId").html());
					var balance = parseFloat(data);
					if ( pay > balance ) {
						//popupConfirm("温馨提示","余额不足，请您先充值！");
						layer.alert("余额不足，请您先充值！",0);
					} else {
						formSubmit();
						
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
			betCode = betCode.substring(0, betCode.length - 1);
			var passString = "";
			var oo = $(".ss_top .ck").html();
			if ( oo == "过关投注" ) {
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
					//popupConfirm("温馨提示","不支持组合过关优化！");
					layer.alert("不支持组合过关优化！",0);
					return false;
				}
				if ( passString == "" ) {
					return false;
				}
			} else if ( oo == "单关投注" ) {// 单关奖金优化
				passString = "1c1,";
			}
			passString = passString.substring(0, passString.length - 1);
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
			//popupConfirm("温馨提示","请先投注！");
			layer.alert("请先投注！",0);
		}
	});
	
	// 进入在线过滤
	$("#filterBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			var betCode = "";
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
					hasCombP = "0";
				}
			});
			if ( hasCombP == "1" ) {
				//popupConfirm("温馨提示","不支持组合过关！");
				layer.alert("不支持组合过关！",0);
				return false;
			}
			if ( passString == "" ) {
				return false;
			}
			passString = passString.substring(0, passString.length - 1);
			var form = $("<form action='/lottery/indexFilter.jhtml' method='post' target='_blank'>" +
					"<input type='hidden' name='betCode' value='"+betCode+"'/>"+
					"<input type='hidden' name='passType' value='"+passString+"'/>"+
					"<input type='hidden' name='playId' value='"+guess.playId+"'/>"+
					"<input type='hidden' name='licenseId' value='"+guess.licenseId+"'/>"+
					"</form>");
			$(form).appendTo($("body"));
			$(form).submit();
			$(form).remove();
		} else {
			//popupConfirm("温馨提示","请先投注！");
			layer.alert("请先投注！",0);
		}
	});
	
	// 倍数控制事件 begin
	$("#multipleId,#dsMultipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId,#dsMultipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			//var reCat = /\bc([a-z]|[A-Z])*t\b/ig;  //•g（全文查找）；•i（忽略大小写）；•m（多行查找）  
			//$(this).val($(this).val().replace(reCat,''));
			if ( $(".ss_top .ck").html() == "单关投注" ) {
				var betNum = $("span.checked").length * ($(this).val());
				$("#betMoneyId").html(betNum*2);
				calculate();
			} else if ( $(".ss_top .ck").html() == "单式上传" ) {
				var betNum = parseInt($("#betDsNumId").html()) * ($(this).val());
				$("#betDsMoneyId").html(betNum*2);
				calculate();
			} else {
				calculate();
			}
		}
	});
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v) > 1 ) {
			$("#multipleId").val(parseInt(v)-1);
			if ( $(".ss_top .ck").html() == "单关投注" ) {
				var betNum = $("span.checked").length * (parseInt(v)-1);
				$("#betMoneyId").html(betNum*2);
				calculate();
			} else {
				calculate();
			}
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v)+1);
		if ( $(".ss_top .ck").html() == "单关投注" ) {
			var betNum = $("span.checked").length * (parseInt(v)+1);
			$("#betMoneyId").html(betNum*2);
			calculate();
		} else {
			calculate();
		}
	});
	// 倍数控制事件 end
});


function addFixedEvent() {
	// 选择过关方式
	$("#passAreaId").find("input[type=checkbox]").click(function(){
		if ( $(this).is(":visible") ) {
			calculate();
		}
	});
	//确认购买设胆弹出层
	$("#shedan").click(function(){
		var s=$(this).attr("class");
		if(s=='sel'){
			$(this).removeClass("sel");
			$(".showtongji").hide();
		}else{
			$(this).addClass("sel");
			$(".showtongji").show();
		}
	});
	$(".close").click(function(){
		$("#shedan").removeClass("sel");
		$(".showtongji").hide();
	});	
	//显示过关方式层
	$("#showMethod .ck").click(function(){
		if ( $(this).parent().hasClass("sel2") ) {
			$(this).parent().removeClass("sel2");
			$("#sdmethod").hide();
		} else {
			$(this).parent().addClass("sel2");
			$("#sdmethod").show();
		}
	});
	
	$(".close2").click(function(){
		$("#showMethod").removeClass("sel2");
		$("#sdmethod").hide();
	});
	
	//导航栏浮动
	t = $('#bet_th').offset().top;
	mh = $('body').height();
	fh = $('#bet_th').height();
	
	th = $('#bet_buy_btn').offset().top;
	
	$(window).scroll(function(e){
		if ( $(".ss_top").find(".ck").html() != '单式上传' ) {
			s = $(document).scrollTop();	
			if(s > t - 10){
				$('#bet_th').css('position','fixed');
				if(s + fh > mh){
					$('#bet_th').css('top','0px');	
				}				
			}else{
				$('#bet_th').css('position','');
			}
	
			if(th - s > 528){
				$('#bet_buy').css('position','fixed');
				if(s + th > mh){
					$('#bet_buy').css('bottom','0px');	
				}				
			}else{
				$('#bet_buy').css('position','');
			}
		}
	});
	
	ajaxFileUpload();
	
	// 单式上传表单提交事件
	$("#singleBuyBtnId").click(function(){
		if ( $("#betDsNumId").html() != "0" ) {
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
						/*$("#showBalDivId").html("未登录用户");
						$.blockUI({
							message: $("#loginAreaId"),
							css: {
								width: '612px',
								height: '520px',
								left: ($(window).width() - 618) / 2 + 'px',
								top: 50 + 'px',
								border: 'none',
								cursor:'default'
							}
						});*/
						$(".openlogin").click();
					} else {
						var pay = parseFloat($("#betDsMoneyId").html());
						var balance = parseFloat(data);
						if ( pay > balance ) {
							//popupConfirm("温馨提示","余额不足，请您先充值！");
							layer.alert("余额不足，请您先充值！",0);
						} else {
							// 同意购买协议
							if ( $("#mergerAgreeId").attr("checked") ) {
								// 组装表单并提交
								var form = $("#singleFormId");
								$(form).find("input[name=playId]").val(guess.playId);
								// 对阵编号
								var sch = "";
								// 截止时间
								var stopTime = "";
								// 让球数
								var rqs = "";
								$("#dsSchDivId").find("input[type=checkbox]:checked").each(function(index){
									sch += $(this).attr("id") + ",";
									stopTime += $(this).attr("id") + "`" + $(this).attr("stoptime") + "|";
									rqs += $(this).attr("id") + "`" + guess.getGgRqOrRf($(this).attr("id")) + "|";
								});
								sch = sch.substring(0, sch.length-1);
								$(form).find("input[name=schs]").val(sch);
								stopTime = stopTime.substring(0, stopTime.length-1);
								$(form).find("input[name=stopTime]").val(stopTime);
								rqs = rqs.substring(0, rqs.length-1);
								$(form).find("input[name=rqs]").val(rqs);
								
								var mult = $("#dsMultipleId").val();
								if ( isNaN(mult) ) {
									mult = 1;
								}
								$(form).find("input[name=multiple]").val(mult);
								
								// 过关方式
								$("#singleFormId").submit();
							} else {
								//popupConfirm("温馨提示","请先同意购买协议！");
								layer.alert("请先同意购买协议！",0);
								return false;
							}
						}
						
					}
			    }
			});
			
		} else {
			//popupConfirm("温馨提示","请先投注！");
			layer.alert("请先投注！",0);
		}
	});
}

// 奖金明细
function lookAtDetail(object) {
	var details = $(object).attr("detail").split(";");
	var html = "";
	$("#bonusDetailSId").empty();
	var betNum = 0;
	var bonus = 0;
	for ( var i = 0; i < details.length; i++ ) {
		var dd = details[i].split("`");
		betNum += parseInt(dd[1]);
		html += '<tr><td width="67" height="30" align="center" bgcolor="#FFFFFF">'+dd[0].replace("c", "串")+'</td>' + 
			'<td width="66" align="center" bgcolor="#FFFFFF" class="jjvs">'+dd[1]+'</td>' + 
			'<td width="448" bgcolor="#FFFFFF"><div  class="jjnum1">';
		var bs = dd[2].split(",");
		for ( var j = 0; j < bs.length; j++ ) {
			html += bs[j]+"<br>";
		}
		bonus += parseFloat(dd[3]);
		html += '</div></td>' + 
			'<td align="center" bgcolor="#FFFFFF"><span class="jjnum"><strong>'+new Number(parseFloat(dd[3])).toFixed(2)+'</strong>元</span></td>' + 
			'</tr>';
	}
	html += '<tr><td width="67" height="30" align="center" bgcolor="#FFFFFF">合计</td>' + 
		'<td width="66" align="center" bgcolor="#FFFFFF" class="jjvs">'+betNum+'</td>' + 
		'<td width="448" bgcolor="#FFFFFF">&nbsp;</td>' + 
		'<td align="center" bgcolor="#FFFFFF"><span class="jjnum"><strong>'+new Number(bonus).toFixed(2)+'</strong>元</span></td>' + 
		'</tr>';
	$(html).appendTo($("#bonusDetailSId"));
	$("#bonusDetailSId").show();
}

function formSubmit() {
	
	// 判断第一场比赛是否过期 modified at 2015/03/27
	$.ajax( {
		type : "POST",
		url : "/lottery/getServerDateTime.jhtml",
		async:false, //同步请求方式
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			//popupConfirm("温馨提示","与服务器通讯失败，请检查本地网络环境！");
			layer.alert("与服务器通讯失败，请检查本地网络环境！",0);
		},
		success : function(data) {
        	var firstTime = guess.getStopTime($("#betSelAreaId").children().eq(0).attr("id"));
        	if ( firstTime <= data ) {
        		//popupConfirm("温馨提示","第一场比赛已截止！");
        		layer.alert("第一场比赛已截止！",0);
			} else {
				var form = $("#lotteryBuyFormId");
				
				var betCode = "";
				var odds = "";//下单赔率 20140420001:3@2.10,1@1.11:1|20140420002:3@2.10:2
				var stopTimes = "";// 对阵的比赛截止时间
				// 格式：对阵:彩果@赔率:让球
				$("#betSelAreaId").children().each(function(index){
					betCode += $(this).attr("id") + ":";
					odds += $(this).attr("id") + ":";
					//alert(getAheadTime2(guess.getStopTime($(this).attr("id"))));
					//alert(guess.getStopTime($(this).attr("id")));
					stopTimes += $(this).attr("id") + "`" + getAheadTime2(guess.getStopTime($(this).attr("id"))) + "|";
					var bid = $(this).attr("id");
					$(this).find("font").each(function(index){
						betCode += $(this).attr("bet") + ",";
						odds += $(this).attr("bet") + "@" + guess.getBetOdds(bid, $(this).attr("bet"))+",";
					});
					odds = odds.substring(0, odds.length - 1) +":"+guess.getGgRqOrRf(bid)+ "|";
					
					if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
						betCode = betCode.substring(0, betCode.length - 1) + ":2|";
					} else {
						betCode = betCode.substring(0, betCode.length - 1) + ":0|";
					}
				});
				betCode = betCode.substring(0, betCode.length - 1);
				odds = odds.substring(0, odds.length - 1);
				stopTimes = stopTimes.substring(0, stopTimes.length - 1);
				
				var passString = "";
				$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
					var selected = parseInt($("#schudleSelId").html());
					var cLen = parseInt($(this).val().split("c")[0]);
					if ( cLen <= selected ) {
						passString += $(this).val() + ",";
					}
				});
				passString = passString.substring(0, passString.length - 1);
				
				// 如果全是自由过关，优化成组合过关 modified at 2015/03/26
				passString =  guess.optimizePassType(betCode.split("|").length, passString, betCode);
				
				if ( guess.playId != 6 ) {
					// 单关
					if ( $(".ss_top").find(".ck").html() == "单关投注" ) {
						passString = "1c1";
					}
					/*if ( dgFlag == 1 ) {
						passString = "1c1";
					}*/
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
				// 理论奖金 add at 2014/07/30
				
				//王和平08月13日
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

// 装载单式上传赛程 added at 2015/03/10
function loadDsSch() {
	$("#dsSchDivId").empty();
	var date = "";
	var dv = "";
	var zz = "";
	var html = "";
	var index = 0;
	var ndate = $("#ndateValId").val();
	var i = 0;
	for ( var ii = 0; ii < schedules.length; ii++ ) {
		if ( dateUtils.formatGuessDate(schedules[ii].stoptime, $("#aheadTimeId").val()) <= ndate ) {
			continue;
		}
		var obj = schedules[ii];
		// 如果过关赔率没有，不生成
		if ( guess.licenseId == 9 ) {
			if ( guess.playId == 1 ) {
				if (  obj.spfggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 2 ) {
				if (  obj.rqspfggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 3 ) {
				if (  obj.zjqggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 4 ) {
				if (  obj.zjqggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 5 ) {
				if (  obj.bfodds == 'null' ) {
					continue;
				}
			}
		} else if ( guess.licenseId == 10 ) {
			if ( guess.playId == 1 ) {
				if (  obj.sfggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 2 ) {
				if (  obj.rfsfggodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 3 ) {
				if (  obj.sfcodds == 'null' ) {
					continue;
				}
			} else if ( guess.playId == 4 ) {
				if (  obj.dxfggodds == 'null' ) {
					continue;
				}
			} 
		} 
		i++; 
		var hostn = obj.hostname;
		if ( hostn.length > 3 ) {
			hostn = hostn.substring(0,3);
		}
		var guestn = obj.guestname;
		if ( guestn.length > 3 ) {
			guestn = guestn.substring(0,3);
		}
		if ( guess.licenseId == 10 ) {
			var tmphost = hostn;
			hostn = guestn;
			guestn = tmphost;
		}
		if ( date == "" ) {
			date = obj.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			html += '<div class="ds_con23">'+
			'<div class="ds_con23_l">'+dv+'</div>'+
			'<div class="ds_con23_c">'+
				'';
		}
		var stopTime = dateUtils.formatGuessDate(obj.stoptime,$("#aheadTimeId").val());
		if ( date == obj.id.substring(0,8) ) {
			if ( index % 4 == 0 ) {
				if ( i != 0 ) {
					html += '</ul>';
				}
				html += '<ul><li><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/>'+obj.id.substring(8)+'    '+hostn+' '+getAheadTime(obj.stoptime.substring(11,16))+' '+guestn+' </li>';
			} else {
				html += '<li><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/>'+obj.id.substring(8)+'    '+hostn+' '+getAheadTime(obj.stoptime.substring(11,16))+' '+guestn+' </li>';
			}
			index++;
		} else {
			index = 1;
			html += ''+
			'</div>'+
			'</div>';
			date = obj.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			if ( i != schedules.length - 1 ) {
				html += '<div class="ds_con23">'+
				'<div class="ds_con23_l">'+dv+'</div>'+
				'<div class="ds_con23_c">'+
					'';
				html += '<ul><li><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/>'+obj.id.substring(8)+'    '+hostn+' '+getAheadTime(obj.stoptime.substring(11,16))+' '+guestn+' </li>';
			} else {
				html += '<div class="ds_con23">'+
				'<div class="ds_con23_l">'+dv+'</div>'+
				'<div class="ds_con23_c">'+
					'';
				html += '<ul><li><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/>'+obj.id.substring(8)+'    '+hostn+' '+getAheadTime(obj.stoptime.substring(11,16))+' '+guestn+' </li><ul>';
				html += ''+
				'</div>'+
				'</div>';
			}
		}
	}
	$(html).appendTo($("#dsSchDivId"));
	
	// 隐藏过关方式
	$("#dsPassTId").find("input[type=radio]").parent().hide();
	
	// 加载事件
	$("#dsSchDivId").find("input[type=checkbox]").click(function(){
		// 显示第一次比赛的截止时间
		if ( $("#dsSchDivId").find("input[type=checkbox]:checked").length > 0 ) {
			var stopTime = $("#dsSchDivId").find("input[type=checkbox]:checked").eq(0).attr("stoptime");
			$("#schemaStopTimeId").html(stopTime);
			
			// 显示过关方式
			var clen = $("#dsSchDivId").find("input[type=checkbox]:checked").length;
			var maxLen = guess.getMaxPassNum();
			if ( clen > maxLen ) {
				clen = maxLen;
				//popupConfirm("温馨提示","最多可选择"+maxLen+"场投注！");
				layer.alert("最多可选择"+maxLen+"场投注！",0);
				return false;
			}
			$("#dsPassTId").find("input[type=radio]").each(function(index){
				if ( parseInt($(this).val()) <= clen ) {
					$(this).parent().show();
					if ( parseInt($(this).val()) == clen ) {
						$(this).removeAttr("disabled");
						$(this).click();
						$(this).attr("checked", "checked");
					} else {
						$(this).attr("disabled", "disabled");
					}
				} else {
					$(this).parent().hide();
				}
			});
		} else {
			$("#schemaStopTimeId").html("--");
		}
	});
}

function ajaxFileUpload() {
	$("#btn_id").uploadify({
		'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
		'script':'/lottery/singleUpload.do',//后台处理的请求
		'cancelImg' :'/js/lottery/upload/images/cancel.png',//取消按钮图片
		'folder': '',
		'fileDataName' : 'file',
		'buttonImg' : '/js/lottery/upload/images/upload.gif',
		'width':101,
		'height':31,
		'multi': false,// 设置单文件上传或多文件上传
		'queueID' : "fileQueue",
		'displayData': 'speed',
		'method' : 'POST',
		'scriptData' : {"licenseId":$('#licenseId').val(),"playId":guess.playId,"passNum":$("#dsPassTId").find("input[type=radio]:checked").val()},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			$("#fileuplodid").uploadifySettings('scriptData',{"licenseId":$("#licenseId").val(),"playId":guess.playId,"passNum":$("#dsPassTId").find("input[type=radio]:checked").val()});
		},
		onError: function (event, queueID ,fileObj, errorObj) {
			//popupConfirm("温馨提示","服务端号码验证失败");
			layer.alert("服务端号码验证失败！",0);
			return false;
		},
		onComplete: function (event, queueID ,fileObj, response, data) {
			eval( "var bet = " + response + ";" );
			if( bet.errCode == 0 ){
				//popupConfirm("温馨提示",bet.message);
				layer.alert(bet.message,0);
				return false;
			}
			var mult = $("#dsMultipleId").val();
			if ( !isNaN(mult) ) {
				mult = parseInt(mult);
			} else {
				mult = 1;
			}
			$("#betDsMoneyId").html("￥" + bet.betNum * 2 * mult);
			$("#betDsNumId").html(bet.betNum);
			$("#fileNameId").val(bet.fileName);
		}
	});
}
