var hem = new Hemai();
$(document).ready(function () {	
	//已选择区域投注项全删
	$("#removeAllSelId").click(function(){
		$("#accordion").find(".active").removeClass("active");
		$("#accordion").find(".zk_s").hide();
		$("#betSelAreaId").empty();
		calculate();
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
});		
	
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
				// 格式：对阵:彩果@赔率:让球
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
				if ( passString != "" ) {
					passString = passString.substring(0, passString.length - 1);
				}
				
				var multiple = $("#multipleId").val();
				
				$(form).find("input[name=playType]").val(guess.playId);
				$(form).find("input[name=passType]").val(passString);
				$(form).find("input[name=singleFlag]").val("0");
				$(form).find("input[name=betCode]").val(betCode);
				$(form).find("input[name=orderOdds]").val(odds);
				$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple)/2);
				$(form).find("input[name=multiple]").val(multiple);
				$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
				$(form).find("input[name=betState]").val("1");
				$(form).find("input[name=betType]").val("1");
				$(form).find("input[name=reserved8]").val(stopTimes);
				
				if($("#highestBonusId").html() == '--' || $("#highestBonusId").html() == 'NaN' )
					$("#highestBonusId").html('0.00');
						
				$(form).find("input[name=theoryBonus]").val($("#highestBonusId").html());
				
				$(form).submit();
			}
		}
	}); 
	
}

function calcNum() {
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
	if ( betCode != "" && passString != "" ) {
		var multiple = parseInt($("#multipleId").val());
		var betNum = guess.calcBetNum(betCode, passString);
		var highestBonus = guess.calcBonus(betCode, passString, multiple);
		var minBonus = guess.calcMinBonus(betCode, passString, multiple);
		$("#betMoneyId").html(betNum * 2 * multiple);
		$("#highestBonusId").html(highestBonus);
		$("#lowestBonusId").html(minBonus);
	} else {
		$("#betMoneyId").html(0);
		$("#highestBonusId").html(0);
		$("#lowestBonusId").html(0);
	}
}

//生成联赛信息
function createLsHtml(schedules) {
	// 生成赛事 联赛
	var lsMap = new Hashtable();
	var lsList = new Array();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		if ( lsMap.get(obj.leagueName) != 'undefined' ) {
			lsMap.put(obj.leagueName, parseInt(lsMap.get(obj.leagueName))+1);
		} else {
			lsMap.put(obj.leagueName, 1);
			lsList.push(obj.leagueName);
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
	calcNum();
}

function removeT(obj) {
	var id = $(obj).parent().parent().attr("id");
	$("#accordion").find("div[id="+id+"]").find(".active").removeClass("active");
	$("#accordion").find("div[id="+id+"]").find(".zk_s").hide();
	$("#accordion").find("div[id="+id+"]").find(".lq_sz").hide();
	$(obj).parent().parent().remove();
	calculate();
}

//删除一个投注项
function removeOneT(obj) {
	var id = $(obj).parent().parent().attr("id");
	$("#accordion").find("div[id="+id+"]").find("span[bet="+$(obj).attr("bet")+"]").click();
	$("#accordion").find("div[id="+id+"]").find("div[bet="+$(obj).attr("bet")+"]").click();
	calculate();
}