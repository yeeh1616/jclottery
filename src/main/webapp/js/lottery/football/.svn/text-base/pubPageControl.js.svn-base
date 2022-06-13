var football = new Football();
var hem = new Hemai();

$(document).ready(function () {
	// 合买事件begin
	// 合买表单提交
	$("#mergerBuyBtnId").click(function(){
		hem.submitForm();
	});
	
	//返回修改方案
	$('#backToChange').click(function(){
		$('#betPanalId').show();		
		$('#surePanalId').hide();
	});

	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){
		if ( parseInt($("#totalBetNumId").html()) != 0 ) {
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
						$(".openlogin").click();
					} else {
						var pay = 0;
						var balance = parseFloat(data);
												
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							
							var html = function(){
								switch (schNum) {
								case 14:
									return '<div class="tzxq_nb_l fl"><span>编号</span></div>'
								    +'<div class="tzxq_nb_r fl"><div class="tzxq_nb_rs tzxq_nb_name">'
								    +function(){
									var divs = '';
									for ( var i = 1; i <= schNum; i++) {
										divs += '<div '+(i==schNum?'class="tzxq_nb_last"':'')+'>'+i+'</div>';
									}
									return divs;
								}()+'</div></div><div class="lao_list">'
								+'<table  cellspacing="0" cellpadding="0" border="0" class="lao_list_nn">'
								+function(){
									var content = '';
									if ( $("#pageNameId").val() != "dssc" ) {
										if (  $("#pageNameId").val() != "filter" ) {
											$("#betListAreaId").children().each(function(index){
												var codes = $(this).attr('betCode').split(',');
												var tds = '';
												for ( var i = 0; i < codes.length; i++) {
													tds +='<td>'+codes[i]+'</td>';
												}
												content += '<tr>' + tds +'</tr>';
											});
										} else {
											for ( var o = 0; o < globallist.length; o++ ) {
												var codes = globallist[o].join(",").split(",");
												var tds = '';
												for ( var i = 0; i < codes.length; i++) {
													tds +='<td>'+codes[i]+'</td>';
												}
												content += '<tr>' + tds +'</tr>';
											}
										}
									}else{
										content +='<tr><td align="left">方案为文件上传</td></tr>';
									}
																
									return content;
								}()+'</table></div>';
									break;
								case 9:
									return '<div class="tzxq_nb_l fl"><span>编号</span></div>'
								    +'<div class="tzxq_nb_r fl"><div class="tzxq_nb_rs tzxq_nb_name">'
								    +function(){
									var divs = '';
									for ( var i = 1; i <= 14; i++) {
										divs += '<div '+(i==14?'class="tzxq_nb_last"':'')+'>'+i+'</div>';
									}
									return divs;
								}()+'</div></div><div class="lao_list">'
								+'<table  cellspacing="0" cellpadding="0" border="0" class="lao_list_nn">'
								+function(){
									var content = '';
									if ( $("#pageNameId").val() != "dssc" ) {
										$("#betListAreaId").children().each(function(index){
											var codes = $(this).find("span.tw_red").html().split(',');
											var tds = '';
											for ( var i = 0; i < codes.length; i++) {
												tds +='<td>'+codes[i]+'</td>';
											}
											content += '<tr>' + tds +'</tr>';
										});	
									}else{
										content +='<tr><td align="left">方案为文件上传</td></tr>';
									}
																
									return content;
								}()+'</table></div>';
									break;
								case 12:
									return '<div class="tzxq_nb_l fl"><span>编号</span></div>'
								    +'<div class="tzxq_nb_r fl"><div class="tzxq_nb_lc tzxq_nb_name">'
								    +function(){
									var divs = '';
									for ( var i = 1; i <= schNum; i++) {
										divs += '<div '+(i==schNum?'class="tzxq_nb_lastl"':'')+'>'+i+'</div>';
									}
									return divs;
								}()+'</div><div class="lao_list lao_listlc">'
								+'<table  cellspacing="0" cellpadding="0" border="0" class="lao_list_nlc">'
								+function(){
									var content = '';
									if ( $("#pageNameId").val() != "dssc" ) {
										$("#betListAreaId").children().each(function(index){
											var codes = $(this).attr('betCode').split(',');
											var tds = '';
											for ( var i = 0; i < codes.length; i++) {
												tds +='<td>'+codes[i]+'</td>';
											}
											content += '<tr>' + tds +'</tr>';
										});	
									}else{
										content +='<tr><td align="left">方案为文件上传</td></tr>';
									}
																
									return content;
								}()+'</table></div></div>';
									break;
								default:
									$('#surePageBetInfo').addClass('tzxq_nblc');
								
									return '<div class="tzxq_nb_l fl"><span>编号</span></div><div class="tzxq_nb_r fl">'
									+'<div class="tzxq_nb_sj tzxq_nb_name">'
									+function(){
									var divs = '';
									for ( var i = 1; i <= schNum; i++) {
										divs += '<div '+(i==schNum?'class="tzxq_nb_lastsj"':'')+'>'+i+'</div>';
									}
									return divs;
								}()+'</div><div class="lao_list lao_listlc">'
								+'<div  class="lao_listsj"><table width="100%" cellspacing="0" cellpadding="0" border="0"  class="lao_listsj">'
								+function(){
									var content = '';
									if ( $("#pageNameId").val() != "dssc" ) {
										if (  $("#pageNameId").val() != "filter" ) {
											$("#betListAreaId").children().each(function(index){
												var codes = $(this).attr('betCode').split(',');
												var tds = '';
												for ( var i = 0; i < codes.length; i++) {
													tds +='<td width="55">'+codes[i]+'</td>';
												}
												content += '<tr>' + tds +'</tr>';
											});	
										} else {
											for ( var o = 0; o < globallist.length; o++ ) {
												var codes = globallist[o].join(",").split(",");
												var tds = '';
												for ( var i = 0; i < codes.length; i++) {
													tds +='<td>'+codes[i]+'</td>';
												}
												content += '<tr>' + tds +'</tr>';
											}
										}
									}else{
										content +='<tr><td align="left">方案为文件上传</td></tr>';
									}
																
									return content;
								}()+'</table></div></div></div><div class="clear"></div>';
								break;
								}
							}();
							
							$("#surePageBetInfo").empty();
							$(html).appendTo($("#surePageBetInfo"));
							
							$("#showBalDivId").html(formatCurrency(data)+"元");
							
							$("#orderInfo_td").empty();
							if ( $("#pageNameId").val() != "dssc" ) { // 非单式上传
									
									$(' <td width="30%">'+$('#totalBetNumId').html()+'注</td>'
									    +'<td width="30%">'+$('#multipleId').val()+'倍</td>'
									    +'<td width="40%"><span class="red">'+$('#totalBetMoneyId').html()+'元</span></td>').appendTo('#orderInfo_td');
							}else{//单式上传
								var betNum = parseInt($("#totalBetNumId").html());
								var mult = parseInt($("#multipleId").val());
								$(' <td width="30%">'+betNum+'注</td>'
									    +'<td width="30%">'+mult+'倍</td>'
									    +'<td width="40%"><span class="red">'+betNum * 2 * mult+'元</span></td>').appendTo('#orderInfo_td');
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
	
	$("#offerBuyId").keyup(function(){
		if ( $(this).val() != '' ) {
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
			
			var totalNum = parseInt($("#totalHemaiNumId").html(),10);
			var buyNum = parseInt($("#offerBuyId").val(),10);
			var insNum = totalNum - buyNum;
			// 显示比例和支付金额
			$("#baoFullMoneyId").html(insNum);
			$("#baoFullPerId").html(parseInt(insNum/totalNum*100,10));
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
		var totalNum = parseInt($("#totalBetMoneyId").html(),10);
		// 显示比例和支付金额
		$("#baoPartMoneyId").html(v);
		$("#baoPartPerId").html(parseInt(v/totalNum*100,10));
		hem.calcOrderMoney();
	});
	$("#offerBaoDiId").keyup(function(){
		if ( $(this).val() != '' ) {
			hem.setBaoDi();
			hem.calcOrderMoney();
		}
	});
	// 保底设置end
	
	// 合买事件end
	// 代购/合买切换
	$("input[name=buyType]").click(function(){
		var opt = $(this).val();
		if ( opt == "1" ) {
			// 隐藏合买内容
			$("#mergerPanelId").hide();
		}
		else if ( opt == "3" ) {
			// 判断是普通投注还是单式上传
			var opt = $(".bismenu li.active a").html();
			if ( opt == "先发起后上传" ) {// 先发起后上传
							
				var betNum = $("#yjTotalBuyNumId").val();
				if ( betNum != "" && betNum != "0" ) {
					var betMult = $("#yjTotalBuyMulId").val();
					if ( isNaN(betMult) ) {
						betMult = 1;
						$("#yjTotalBuyMulId").val(1);
					}
					var betMoney = parseInt(betNum,10) * parseInt(betMult,10) * 2;
					// 展示合买设置内容
					$("div[name=mergerPanel]").show();
					// 合买数据填充
					$("#totalHemaiNumId").html(betMoney);

					// 合买默认购买份数 1%
					var lbuy = parseInt(betMoney/100);
					if ( parseInt($("#betDsMoneyId").html(),10)%100 != 0 ) {
						lbuy++;
					}
					
					$("#offerBuyId").val(lbuy);
					//$("#totalHemaiNumId").html("0");
					// 显示百分比
					$("#offerBMId").html(parseFloat(new Number(lbuy/betMoney).toFixed(2))*100);
					//$("#offerBMId").html(lbuy/parseInt($("#totalBetMoneyId").html())*100);
					
					$("#partDetailId").val("大奖就在眼前，不要错过哦");

					$("input[name=baodiType][type=radio]").eq(0).click();
				}
			} else if ( opt == "单式上传" ) {
				if ( $("#betDsNumId").html() != "0" ) {
					// 展示合买设置内容
					$("div[name=mergerPanel]").show();
					// 合买数据填充
					$("#totalHemaiNumId").html($("#betDsMoneyId").html());

					// 合买默认购买份数 1%
					var lbuy = parseInt(parseInt($("#betDsMoneyId").html(),10)/100);
					if ( parseInt($("#betDsMoneyId").html(),10)%100 != 0 ) {
						lbuy++;
					}
					$("#offerBuyId").val(lbuy);
					// 显示百分比
					$("#offerBMId").html(parseFloat(new Number(lbuy/parseInt($("#betDsMoneyId").html(),10)).toFixed(2))*100);
					//$("#offerBMId").html(lbuy/parseInt($("#totalBetMoneyId").html())*100);
					
					$("#partDetailId").val("大奖就在眼前，不要错过哦");

					$("input[name=baodiType][type=radio]").eq(0).click();
				} else {
					layer.alert("请先投注！",0);
					return false;
				}
			} else {//普通投注
				if ( $("#totalBetNumId").html() != "0" ) {
					// 展示合买设置内容
					$("#mergerPanelId").show();
					// 合买数据填充
					$("#totalHemaiNumId").html($("#totalBetMoneyId").html());

					// 合买默认购买份数 1%
					var lbuy = parseInt(parseInt($("#totalBetMoneyId").html(),10)/100);
					if ( parseInt($("#totalBetMoneyId").html(),10)%100 != 0 ) {
						lbuy++;
					}
					$("#offerBuyId").val(lbuy);
					// 显示百分比
					$("#offerBMId").html(parseFloat(new Number(lbuy/parseInt($("#totalBetMoneyId").html(),10)).toFixed(2))*100);
					//$("#offerBMId").html(lbuy/parseInt($("#totalBetMoneyId").html())*100);
					
					$("#partDetailId").val("大奖就在眼前，不要错过哦");

					$("input[name=baodiType][type=radio]").eq(0).click();
				} else {
					layer.alert("请先投注！",0);
					return false;
				} 
			}
		}
	});
	$("input[name=buyType]").removeAttr("disabled");
	$("input[name=buyType]").eq(0).click();
	//单式上传与投注界面切换
	$("h1[name=singOBet]").click(function(){
		$("h1[name=singOBet]").removeClass("hover");
		$(this).addClass("hover");
		
		$("input[name=buyType][value=1]").removeAttr("disabled").click();
		$("#xfqhscMergerPanelId").hide();
		if ( $(this).html() == "普通投注" ) {
			$("#betPanelDivId").show();
			$(".zctz").show();
			$(".touzhu").show();
			$("#singPanelDivId").hide();
		} else if ( $(this).html() == "单式上传" ) {
			$("#betPanelDivId").hide();
			$(".zctz").hide();
			$(".touzhu").hide();
			$("#singPanelDivId").show();
		} else { // 先发起后上传
			$("#betPanelDivId").hide();
			$(".zctz").hide();
			$(".touzhu").hide();
			$("#singPanelDivId").hide();
			
			// 只显示合买
			$("input[name=buyType][value=1]").attr("disabled", "disabled");
			$("input[name=buyType][value=3]").click();
			// 展示合买设置内容
			$("div[name=mergerPanel]").show();
			
			$("#yjTotalBuyNumId").val("");
			$("#yjTotalBuyMulId").val("1");
			$("#xfqhscMergerPanelId").show();
		}
	});
	
	// 先发起后上传事件 begin
	$("#yjTotalBuyNumId,#yjTotalBuyMulId").keyup(function(){
		var betNum = $("#yjTotalBuyNumId").val();
		var betMult = $("#yjTotalBuyMulId").val();
		if ( betMult == "" || betMult == "0" ) {
			return false;
		}
		if ( betNum != "" && betNum != "0" ) {
			if ( isNaN(betMult)  ) {
				betMult = 1;
				$("#yjTotalBuyMulId").val(1);
			}
			var betMoney = parseInt(betNum,10) * parseInt(betMult,10) * 2;
			// 展示合买设置内容
			$("div[name=mergerPanel]").show();
			// 合买数据填充
			$("#totalHemaiNumId").html(betMoney);

			// 合买默认购买份数 1%
			var lbuy = parseInt(betMoney/100);
			if ( parseInt(betMoney)%100 != 0 ) {
				lbuy++;
			}
			$("#offerBuyId").val(lbuy);
			// 显示百分比
			$("#offerBMId").html(parseFloat(new Number(lbuy/betMoney).toFixed(2))*100);
			//$("#offerBMId").html(lbuy/parseInt($("#totalBetMoneyId").html())*100);
			
			$("#partDetailId").val("大奖就在眼前，不要错过哦");

			$("input[name=baodiType][type=radio]").eq(0).click();
		} 
	});
	// 先发起后上传事件end
	
	
	// 倒计时
	setInterval("clock()", 1000);
	setInterval("coopclock()", 1000);
	//添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html(),10) != 0 ) {
			var betCode = "";
			var fCode = "";
			var idex = 1;
			$("#zcSchAreaId tr[id^=body_tr_]").each(function(index,item){				
				if ( schNum == 9 ) {
					fCode += idex + ":";
					if ( $(item).find(".active").length > 0 ) {
						$(item).find(".active").each(function(index,v){
							betCode += $(v).find('a').html();
							fCode += $(v).find('a').html();
						});
					} else {
						betCode += "#";
						fCode += "#";
					}
					if ( $(this).find("input[type=checkbox]:checked").length == 1 ) {
						fCode += "`0";
						betCode += "(胆)";
					} else {
						fCode += "`1";
					}
					idex++;
				} else {
					if ( $(this).find(".active").length > 0 ) {
						$(this).find(".active").each(function(index,v){
							betCode += $(v).find('a').html();
							fCode += $(v).find('a').html();
						});
					} 
				}
				betCode += ",";
				fCode += ",";
			});
			var dsF = $("#betNumId").html() == "1" ? "单式" : "复式";
			fCode = fCode.substring(0, fCode.length - 1);
			betCode = betCode.substring(0, betCode.length - 1);
			var html = '<li betNum="'+$("#betNumId").html()+'" betCode="'+fCode+'">'
             +'<div class="w_lil fl">［'+dsF+' '+$("#betNumId").html()+'注］ <span class="tw_red">'+betCode+'</span></div>'
             +'<a style="cursor:pointer" onclick="$(this).parent().remove();calcTotal();" class="fr">删除</a></li>';
			/*var html = '<li betNum="'+$("#betNumId").html()+'" betCode="'+fCode+'"><h1> ';
			html += '['+dsF+' '+$("#betNumId").html()+'注］   <b>'+betCode+'</b> </h1> <a style="cursor:pointer" onclick="$(this).parent().remove();calcTotal();">删除</a></li>';*/
			$(html).appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			calcTotal();
			
			// 任九去掉胆选项
			//$("#zcSchAreaId").find("input[type=checkbox]").attr("disabled", "disabled").removeAttr("checked");
		}
	});
	// 清理上方选号
	$("#clearAllSelBtnId").click(function(){
		$("td[name=betTdN].active").removeClass("active");
		$("#zcSchAreaId tr").find('input:checkbox').attr('checked',false).attr("disabled", "disabled");
		calc();
	});
	// 机选一注
	$("#radomSel1Id").click(function(){
		var betCode = "";
		if ( schNum == 9 ) {
			// 任9先随机出位置
			var buf = football.randomArray(9, 14);
			for ( var i = 0; i < 14; i++ ) {
				var ex = 0;
				for ( var j = 0; j < buf.length; j++ ) {
					if ( i == parseInt(buf[j],10) ) {
						var a = football.random(100);
						betCode += romArray[a%3] + ",";
						
						ex = 1;
						break;
					}
				}
				if ( ex == 0 ) {
					betCode += "#,";
				}
			}
		} else {
			for ( var i = 0; i < schNum; i++ ) {
				var a = football.random(100);
				if ( schNum == 8 ) {
					betCode += romArray[a%4] + ",";
				} else {
					betCode += romArray[a%3] + ",";
				}
			}
		}
		betCode = betCode.substring(0, betCode.length - 1);
		var html = '<li betNum="1" betCode="'+betCode+'"><h1> ';
		html += '[单式 '+'1注］   <b>'+betCode+'</b> </h1> <a style="cursor:pointer" onclick="$(this).parent().remove();calcTotal();">删除</a></li>';
		$(html).appendTo($("#betListAreaId"));
		
		calcTotal();
	});
	// 机选5注
	$("#radomSel5Id").click(function(){
		for ( var j = 0; j < 5; j++ ) {
			$("#radomSel1Id").click();
		}
	});
	
	// 机选多注
	$("#radomSelsId").click(function(){
		var randomBetNum = $('#radomSelBetNum').val();
		for ( var l = 0; l < randomBetNum; l++ ) {
			var betCode = "";
			if ( schNum == 9 ) {
				// 任9先随机出位置
				var buf = football.randomArray(9, 14);
				for ( var i = 0; i < 14; i++ ) {
					var ex = 0;
					for ( var j = 0; j < buf.length; j++ ) {
						if ( i == parseInt(buf[j],10) ) {
							var a = football.random(100);
							betCode += romArray[a%3] + ",";
							
							ex = 1;
							break;
						}
					}
					if ( ex == 0 ) {
						betCode += "#,";
					}
				}
			} else {
				for ( var i = 0; i < schNum; i++ ) {
					var a = football.random(100);
					if ( schNum == 8 ) {
						betCode += romArray[a%4] + ",";
					} else {
						betCode += romArray[a%3] + ",";
					}
				}
			}
			betCode = betCode.substring(0, betCode.length - 1);
			var html = '<li betNum="1" betCode="'+betCode+'">'
            +'<div class="w_lil fl">［单式  1注］ <span class="tw_red">'+betCode+'</span></div>'
            +'<a style="cursor:pointer" onclick="$(this).parent().remove();calcTotal();" class="fr">删除</a></li>';
			$(html).appendTo($("#betListAreaId"));
		}
		
		calcTotal();
	});
	
	// 删除全部
	$("#clearBetListBtnId").click(function(){
		$("#betListAreaId").empty();
		calcTotal();
	});
	// 倍数控制事件 begin
	$("#multipleId,#yjTotalBuyMulId,#yjTotalBuyNumId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			calcTotal();
		}
	});
	
	// 单式上传倍数控制事件 begin
	$("#dsMultipleId,#radomSelBetNum").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#dsMultipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			var betNum = parseInt($("#betDsNumId").html(),10);
			$("#betDsMoneyId").html(betNum * 2 * parseInt($(this).val(),10));
			var op = $("input[name=buyType]:checked").val();
			if ( op == "3" ) {
				$("input[name=buyType]:checked").click();
			}
		}
	});
	
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v,10) > 1 ) {
			$("#multipleId").val(parseInt(v,10)-1);
			calcTotal();
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v,10)+1);
		calcTotal();
	});
	// 倍数控制事件 end
	
	// 进入投注确认页
	$("#sureBetBtnId").click(function(){
		
		var oo = $("input[name=buyType]:checked").val();
		if ( oo == "1" ){
			if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
				singleFormSubmit();
			} else {
				ptFormSubmit();
			}
		} else if ( oo == "3" ) {
			//先发起后上传
			if ( $("#pageNameId").val() == "xfhc" ) { 
				hem.frsHupSubmitForm();	
			}else{
				hem.submitForm();
			}	
		}
		$("#backToChange").click();
	});
	
	$("#closeDivBtnId,#closeMergerSureDivId,#mergerCancelBtnId").click(function(){
		$.unblockUI();
	});
	$("#gobackBtnId").click(function(){
		$.unblockUI();
	});
	$("#numberBuyBtnId").click(function(){
		formSubmit();
		$.unblockUI();
	});
	$("#saveBtnId").click(function(){
		if ( $("#betNumId").html() == "0" ) {
			layer.alert("没有投注结果",0);
			return false;
		}
		var lic = $("#licenseId").val();
		
		var betCodes = "";
		if ( lic != "6" ) {
			$("#zcSchAreaId").find("tr").each(function(i){
				if ( $(this).find("td[name=betTdN].active").length > 0 ) {
					$(this).find("td[name=betTdN].active").each(function(j){
						betCodes += $(this).find("a").html();
					});
					betCodes += "-";
				}
			});
			betCodes = betCodes.substring(0, betCodes.length - 1);
		} else {
			var dan = new Array();
			var tuo = new Array();
			$("#zcSchAreaId").find("tr").each(function(i){
				if ( $(this).find("td[name=betTdN].active").length > 0 ) {
					var ii = i-1;
					if ( ii == 10 ) {
						ii = "A";
					} else if ( ii == 11 ) {
						ii = "B";
					} else if ( ii == 12 ) {
						ii = "C";
					} else if ( ii == 13 ) {
						ii = "D";
					} else if ( ii == 14 ) {
						ii = "E";
					}
					var b = ii+"_";
					$(this).find("td[name=betTdN].active").each(function(j){
						b += $(this).find("a").html();
					});
					if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
						dan.push(b);
					} else {
						tuo.push(b);
					}
				}
			});
			var comb = new CombAlgorithm();
			var list = comb.findComb(tuo, tuo.length, 9 - dan.length);
			for (var i = 0; i < list.length; i++ ) {
				var a = new Array();
				for ( var j = 0; j < dan.length; j++ ) {
					a.push(dan[j]);
				}
				for ( var j = 0; j < list[i].length; j++ ) {
					a.push(list[i][j]);
				}
				a.sort();
				var sc = "";
				for ( var j = 1; j <= 14; j++ ) {
					var E = false;
					var B = 0;
					for ( var k = 0; k < a.length; k++ ) {
						var S = "" + j;
						if ( j == 10 ) {
							S = "A";
						} else if ( j == 11 ) {
							S = "B";
						} else if ( j == 12 ) {
							S = "C";
						} else if ( j == 13 ) {
							S = "D";
						} else if ( j == 14 ) {
							S = "E";
						}
						if ( a[k].split("_")[0] == S ) {
							B = k;
							E = true;
							break;
						}
					}
					if ( E ) {
						sc += a[B].split("_")[1] + "-";
					} else {
						sc += "X-";
					}
				}
				betCodes += sc.substring(0, sc.length - 1) + "\n";
			}
			betCodes = betCodes.substring(0, betCodes.length - 1);
		}
		
		$("#exportFilterDataForm").remove();
		var $form = $("<form action='/common/downfile.jhtml' method='post'></form>").appendTo("body");
		var $filepath = $("<input type='hidden' id='fileName' name='fileName' value='投注结果.txt' />").appendTo($form);
		var $filterContent = $("<input type='hidden' id='filterContent' name='content' value='' />").appendTo($form);
		
		$filterContent.val(betCodes);
		$form.submit();
	});
	
	// 从首页来的投注数据
	/*if ( $("#licenseId").val() == "5" || $("#licenseId").val() == "6" ) {
		if ( $("#radomBetCodeId").val() != "" ) {
			var rcs = $("#radomBetCodeId").val().split(",");
			var trs = $("#zcSchAreaId").find("tr");
			for ( var i = 0; i < rcs.length; i++ ) {
				var oo = rcs[i].split("`")[1];
				if ( oo != "-" ) {
					var oos = oo.split("");
					for ( var j = 0; j < oos.length; j++ ) {
						$(trs[i]).find("td[name=betTdN]").find("span").each(function(index){
							if ( $(this).html() == oos[j] ) {
								$(this).addClass("checked");
							}
						});
					}
					if ( $("#licenseId").val() == "6" ) {
						$(trs[i]).find("input[type=checkbox]").removeAttr("disabled");
					}
				}
				if ( rcs[i].split("`")[2] == "2" ) {
					$(trs[i]).find("input[type=checkbox]").attr("checked", "checked");
				}
			}
			calc();
		}
	}*/
});

// 普通投注合买提交
function ptMergerSubmit() {
	var sec = parseInt($("#stopSId").html(),10);
	var min = parseInt($("#stopMId").html(),10);
	var hou = parseInt($("#stopHId").html(),10);
	if ( sec == 0 && min == 0 && hou == 0 ) {
		layer.alert("当前期不可投注！",0);
		return false;
	} else {
		// 展示合买确认信息
		var baodi = 0;
		var totalNum = parseInt($("#totalBetMoneyId").html(),10);
		var buyNum = parseInt($("#offerBuyId").val(),10);
		var o = $("input[name=baodiType][type=radio]:checked").val();
		if ( o == "2" ) {
			baodi = totalNum - buyNum;
		} else if ( o == "3" ) {
			baodi = parseInt($("#partBaoInputId").val(),10);
		} 
		var playName = $("#licenseNameId").val();
		if ( $("#playNameId").length > 0 ) {
			playName = $("#playNameId").val();
		}
		$("#mergerSureTitleTrId").html('<td height="31" align="center" class="hemai4">'+playName+'  </td>'+
	       		'<td height="31" align="center" class="hemai4">'+parseInt($("#totalBetMoneyId").html(),10)/2/parseInt($("#multipleId").val(),10)+'   </td>'+
	       		'<td height="31" align="center" class="hemai4">'+$("#multipleId").val()+'倍 </td>'+
	       		'<td height="31" align="center" class="hemai4"> ¥  '+$("#totalBetMoneyId").html()+'元 </td>'+
	       		'<td height="31" align="center" class="hemai4">¥  1.00 元 </td>'+
	       		'<td height="31" align="center" class="hemai4"> ¥  '+baodi+' 元('+parseInt(baodi/totalNum*100,10)+'%) </td>'+
	       		'<td height="31" align="center" class="hemai4">'+parseFloat($("#brokerageId").val())*100+'% </td>'+
				'<td height="31" align="center" class="hemai4">'+$("input[name=showLevel][type=radio]:checked").attr("show")+'</td>');
		$("#mergerSureTotalMoneyId").html('您本次购买'+buyNum+'份，保底'+baodi+'份，需消费¥ <span> '+$("#totalHmMoneyId").html()+' </span>元');
		
		html = "";
		if ( $("#licenseId").val() == "5" || $("#licenseId").val() == "6" ) {
			// 主队信息
			html += '<tr>'+
				'<td rowspan="2" class="bge2">对阵</td>';
			for ( var i = 0; i < schedules.length; i++ ) {
				if ( i == 0 ) {
					html += '<td height="50"><span>'+schedules[i].hostTeam+'</span></td>';
				} else {
					html += '<td><span>'+schedules[i].hostTeam+'</span></td>';
				}
			}
			// 客队信息
			html += '</tr><tr>';
			for ( var i = 0; i < schedules.length; i++ ) {
				if ( i == 0 ) {
					html += '<td height="65" class="bge3"><span>'+schedules[i].guestTeam+'</span></td>';
				} else {
					html += '<td class="bge3"><span>'+schedules[i].guestTeam+'</span></td>';
				}
			}
			html += '</tr>';
		} else if ( $("#licenseId").val() == "8" || $("#licenseId").val() == "7" ) {
			// 四场进球对阵信息
			html += '<tr>'+
				'<td class="bge2">对阵</td>';
			for ( var i = 0; i < schedules.length; i++ ) {
				if ( i == 0 ) {
					html += '<td height="50"><span>'+schedules[i].hostTeam+'</span></td>';
					html += '<td height="50"><span>'+schedules[i].guestTeam+'</span></td>';
				} else {
					html += '<td><span>'+schedules[i].hostTeam+'</span></td>';
					html += '<td><span>'+schedules[i].guestTeam+'</span></td>';
				}
			}
			html += '</tr>';
		}
		// 投注项
		$("#betListAreaId").children().each(function(index){
			html += '<tr><td height="30">投注项</td>';
			var codes = $(this).attr("betcode").split(",");
			for ( var i = 0; i < codes.length; i++ ) {
				var ccode = codes[i];
				if ( ccode.indexOf(':') > -1 ) {
					ccode = ccode.substring(ccode.indexOf(":")+1, ccode.indexOf("`"));
				}
				html += '<td class="bge1">'+ccode+'</td>';
			}
			html += '</tr>';
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
		//hem.submitForm();
	}

}

// 普通投注表单提交
function ptFormSubmit() {
	var sec = parseInt($("#stopSId").html(),10);
	var min = parseInt($("#stopMId").html(),10);
	var hou = parseInt($("#stopHId").html(),10);
	if ( sec == 0 && min == 0 && hou == 0 ) {
		layer.alert("当前期不可投注！",0);
		return false;
	}
	if ( $("#totalBetNumId").html() != "0" ) {
		if ( !$("#agreeChkId").attr("checked") ) {
			layer.alert("请彩店与彩民交易协议！",0);
			return false;
		}
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
					$(".openlogin").click();
				} else {// 判断余额是否足够
					var pay = parseFloat($("#betMoneyId").html());
					var balance = parseFloat(data);
					if ( pay > balance ) {
						//popupConfirm("温馨提示","余额不足，请您先充值！");
						layer.alert("余额不足，请您先充值！",0);
					} else {
						formSubmit();
					}}
		    }
		});
	} else {
		layer.alert("请先投注！",0);
	}
}


// 单式上传表单提交
function singleFormSubmit() {
	var sec = parseInt($("#stopSId").html(),10);
	var min = parseInt($("#stopMId").html(),10);
	var hou = parseInt($("#stopHId").html(),10);
	if ( sec == 0 && min == 0 && hou == 0 ) {
		layer.alert("当前期不可投注！",0);
		return false;
	}
	if ( $("#totalBetNumId").html() != "0" ) {
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
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#totalBetMoneyId").html(),10);
					var balance = parseFloat(data);
					if ( pay > balance ) {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						$("#singleFormId").find("input[name=licenseId]").val($("input:radio[name=singleRadio]:checked").val());
						$("#singleFormId").find("input[name=multiple]").val($("#multipleId").val());
						$("#singleFormId").submit();
					}
				}
		    }
		});
	} else {
		layer.alert("请先投注！",0);
	}
}

function calcTotal() {
	if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
		var betNum = parseInt($("#totalBetNumId").html());
		var mult = parseInt($("#multipleId").val());
		$("#totalBetMoneyId").html(betNum * 2 * mult);
	} else if ( $("#pageNameId").val() == "filter" ) { 
		if ( $(this).val() == "" )
			return false;
		var betNum = globallist.length;
		$("#totalBetMoneyId").html(betNum*2*parseInt($(this).val(),10));
	}else{
		var totalNum = 0;
		$("#betListAreaId").find("li").each(function(index){
			totalNum += parseInt($(this).attr("betNum"),10);
		});
		$("#totalBetNumId").html(totalNum);
		var multiple = $("#multipleId").val();
		if ( multiple == "" || isNaN(multiple) ) {
			multiple = 1;
			$("#multipleId").val(1);
		}
		$("#totalBetMoneyId").html(totalNum*2*multiple);
		
		var opt = $("input[name=buyType]:checked").val();
		$("input[name=buyType][value="+opt+"]").click();
	}
}

function calc() {
	var index = 0;
	var trs = $("#zcSchAreaId tr[id^=body_tr_]");
	for ( var i = 0; i < trs.length; i++ ) {
		if ($(trs[i]).find(".active").length > 0 ) {
			index++;
		}
	}
	var betNum = 0;
	if ( index == trs.length ) {
		var betArray = new Array();
		for ( var i = 0; i < trs.length; i++ ) {
			var subArray = new Array();
			if ($(trs[i]).find(".active").length > 0 ) {
				$(trs[i]).find(".active").each(function(i){
					subArray.push($(this).find('a').html());
				});
				
				betArray.push(subArray);
			}
		}
		betNum = football.calcBetNum(betArray);
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum*2);
}

/**
 * 时钟倒计
 * @return
 */
function clock() {
	var sec = parseInt($("#stopSId").html(),10);
	if ( sec > 0 ) {
		if ( sec <= 10 ) {
			$("#stopSId").html("0"+(sec-1));
		} else {
			$("#stopSId").html((sec-1));
		}
	} else {
		var min = parseInt($("#stopMId").html(),10);
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#stopMId").html("0"+(min-1));
			} else {
				$("#stopMId").html((min-1));
			}
			$("#stopSId").html(59);
		} else {
			var hou = parseInt($("#stopHId").html(),10);
			if ( hou > 0 ) {
				if ( hou <= 10 ) {
					$("#stopHId").html("0"+(hou-1));
				} else {
					$("#stopHId").html((hou-1));
				}
				$("#stopMId").html(59);
				$("#stopSId").html(59);
			} else {
				// 等待下一期
				//location.reload();
			}
		}
	}
}

/**
 * 合买时钟倒计
 * @return
 */
function coopclock() {
	var sec = parseInt($("#coopstopSId").html());
	if ( sec > 0 ) {
		if ( sec <= 10 ) {
			$("#coopstopSId").html("0"+(sec-1));
		} else {
			$("#coopstopSId").html((sec-1));
		}
	} else {
		var min = parseInt($("#coopstopMId").html());
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#coopstopMId").html("0"+(min-1));
			} else {
				$("#coopstopMId").html((min-1));
			}
			$("#coopstopSId").html(59);
		} else {
			var hou = parseInt($("#coopstopHId").html());
			if ( hou > 0 ) {
				if ( hou <= 10 ) {
					$("#coopstopHId").html("0"+(hou-1));
				} else {
					$("#coopstopHId").html((hou-1));
				}
				$("#coopstopMId").html(59);
				$("#coopstopSId").html(59);
			} else {
				// 等待下一期
			}
		}
	}
}

function formSubmit() {
	var form = $("#lotteryBuyFormId");
	
	var betCode = "";
	var betCodeDesc = "";
	
	if ( $("#pageNameId").val() != "filter"  ) {
		$("#betListAreaId").children().each(function(index){
			betCode += $(this).attr("betCode") + ";";
			betCodeDesc += $(this).find("b").eq(0).html() + ";";
		});
	} else {
		for ( var o = 0; o < globallist.length; o++ ) {
			betCode += globallist[o].join(",").split(",") + ";";
			betCodeDesc += globallist[o].join(",").split(",") + ";";
		}
	}
	betCode = betCode.substring(0, betCode.length - 1);
	betCodeDesc = betCodeDesc.substring(0, betCodeDesc.length - 1);
	
	var multiple = $("#multipleId").val();
	
	$(form).find("input[name=singleFlag]").val("0");
	$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html(),10));
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
	//$(form).find("input[name=issue]").val($("#currIssueId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=betType]").val("1");
	$(form).find("input[name=reserved5]").val(betCodeDesc);
	
	$(form).submit();
}