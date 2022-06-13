var hem = new Hemai();
$(document).ready(function () {

	// 倒计时
	setInterval("clock()", 1000);
	setInterval("coopclock()", 1000);
	
	//---------------控制随机注数的输入begin
	$("#radomSelDsId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#radomSelDsId").keyup(function(event){
		var ml = $.trim($(this).val());
		if ( ml === "" ) {
			$(this).val(1);
		}
	});
	
	//---------------控制随机注数的输入end
	
	// 删除全部
	$("#clearBetListBtnId").click(function(){
		$("#betListAreaId").empty();
		calculteAll();
	});
	
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
		$("#loginCloseBtnId").click();
		$("#returnModId").click();
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
						var pay = parseFloat($("#betMoneyId").html());
						var balance = parseFloat(data);
												
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							
							var html = function(){
								var ul="<ul>";
								$("#betListAreaId li").each(function(i,v){
									ul += '<li>['+$(v).attr('dansFs')+' '+$(v).attr('betNum')+'注］<span>'+$(v).attr('betCode')+'</span></li>';
								});
								
								ul+='</ul>';
								
								return ul;
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
	//////////////////////////////////////////
	
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
	
	
	//返回修改方案
	$('#backToChange').click(function(){
		$('#betPanalId').show();		
		$('#surePanalId').hide();
	});
	
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
	
	//购买分数
	$("#offerBuyId").keyup(function(){
		if ( $(this).val() != '' ) {
			hem.offerBuy();
			hem.calcOrderMoney();
		}
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
	
	// 倍数控制事件 begin  96,105
	$("#multipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	
	$("#multipleId").keyup(function(event){
		var ml = $.trim($(this).val());
		if ( ml === "" ) {
			$(this).val(1);
		}
		calculteAll();
	});
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v,10) > 1 ) {
			$("#multipleId").val(parseInt(v,10)-1);
			calculteAll();
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v,10)+1);
		calculteAll();
	});
	// 倍数控制事件 end
	
		
	
	// 填充数据
	$("#preBonusIssueId").html(preIssue);
	for ( var i = 0; i < preCode.length; i++ ) {
		$('<a>'+preCode[i]+'</a>').appendTo($("#preBonusCodeId"));
	}
	var html = '';
	for ( var i = 0; i < issueCode.length; i++ ) {
		html += '<tr><td width="126">'+issueCode[i].issue+'</td><td width="136">';
		var codes = issueCode[i].code.split("-");
		for ( var j = 0; j < codes.length; j++ ) {
			html += '<em> '+codes[j]+' </em>';
		}
		html += '</td>';
	}
	$(html).appendTo($("#bonusCodeAreaId"));
});

var pl3 = new Pl3();

/**
 * 时钟倒计
 * @return
 */
function clock() {
	var sec = parseInt($("#stopSId").html());
	if ( sec > 0 ) {
		if ( sec <= 10 ) {
			$("#stopSId").html("0"+(sec-1));
		} else {
			$("#stopSId").html((sec-1));
		}
	} else {
		var min = parseInt($("#stopMId").html());
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#stopMId").html("0"+(min-1));
			} else {
				$("#stopMId").html((min-1));
			}
			$("#stopSId").html(59);
		} else {
			var hou = parseInt($("#stopHId").html());
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

function calculteAll() {
	var betNum = 0;
	var multiple = parseInt($("#multipleId").val(),10);
	$("#betListAreaId").children().each(function(index){
		betNum += parseInt($(this).attr("betNum"));
	});
	$("#totalBetNumId").html(betNum);
	var base = 2;
	$("#totalBetMoneyId").html(betNum*base*multiple);
	var opt = $("input[name=buyType]:checked").val();
	$("input[name=buyType][value="+opt+"]").click();
	/*if ( opt == "2" ) {
		// 初始显示5期
		$("#chasingIssueOptId").change();
	} else if ( opt == "3" ) {
		$("input[name=buyType][value=3]").click();
	} */
}

//普通投注表单提交
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
						
						$("#loginCloseBtnId").click();
						$("#returnModId").click();
					}}
		    }
		});
	} else {
		layer.alert("请先投注！",0);
	}
}

function formSubmit() {
	var form = $("#lotteryBuyFormId");
	
	var betCode = "";
	$("#betListAreaId").children().each(function(index){
		betCode += $(this).attr("betCode") + ";";
	});
	betCode = betCode.substring(0, betCode.length - 1);
	
	var multiple = $("#multipleId").val();
	
	$(form).find("input[name=singleFlag]").val("0");
	$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html()));
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
	$(form).find("input[name=issue]").val($("#currIssueId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=betType]").val("1");
	var base = "0";
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}
