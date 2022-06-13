/**
 * <p>Desc:追号页面公共调用模块</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩通汇众科技有限公司</p>
 * Added by Luochang at 2014/9/4 Version 1.0
 */

$(document).ready(function () {
	$("input[name=buyChasName]").eq(0).click();
	// 代购/追号切换
	$("input[name=buyChasName]").click(function(){
		var option = $(this).val();
		switch( option ) {
		case "1":
			$("#chsPanelId").hide();
			$("#merPanelId").hide();
			break;
		case "2":
			$("#chsPanelId").show();
			$("#ptChsSetPanelId").show();
			$("#seChsSetPanelId").hide();
			$("#merPanelId").hide();
			
			$("#setChasingId").removeAttr("disabled");
			$("#setMultId").removeAttr("disabled");
			// 生成今天期次追号信息
			$("a[name=dayOptionName]").eq(0).click();
			break;
		case "3":
			$("#chsPanelId").show();
			$("#ptChsSetPanelId").hide();
			$("#merPanelId").hide();
			$("#seChsSetPanelId").show();
			
			$("#setChasingId").attr("disabled", "disabled");
			$("#setMultId").attr("disabled", "disabled");
			$("a[name=dayOptionName]").eq(0).click();
			
			// 设置起始期次
			var uls = $("#chasingIssListId").find("ul");
			$("<option value="+$(uls[0]).attr("issue")+">"+$(uls[0]).attr("issue")+"[当前期]</option>").appendTo($("#seChsStartIssueId"));
			for ( var i = 1; i < uls.length; i++ ) {
				$("<option value="+$(uls[i]).attr("issue")+">"+$(uls[i]).attr("issue")+"</option>").appendTo($("#seChsStartIssueId"));
			}
			break;
		case "4":
			if ( $("#totalBetNumId").html() != "0" ) {
				// 隐藏追号内容
				$("div[name=chasingPanel]").hide();
				$("#chasingLiSId").hide();
				
				// 展示合买设置内容
				$("div[name=mergerPanel]").show();
				// 合买数据填充
				$("#totalHemaiNumId").html($("#totalBetMoneyId").html());

				// 合买默认购买份数 1%
				var lbuy = parseInt(parseInt($("#totalBetMoneyId").html())/100);
				if ( parseInt($("#totalBetMoneyId").html())%100 != 0 ) {
					lbuy++;
				}
				$("#offerBuyId").val(lbuy);
				// 显示百分比
				//$("#offerBMId").html(parseFloat(new Number(lbuy/parseInt($("#totalBetMoneyId").html())).toFixed(2))*100);
				$("#offerBMId").html(parseInt(lbuy/parseInt($("#totalBetMoneyId").html())*100));
				//$("#offerBMId").html(lbuy/parseInt($("#totalBetMoneyId").html())*100);

				$("input[name=baodiType][type=radio]").eq(0).click();
				
				$("#chsPanelId").hide();
				$("div[name=mergerPanel]").show();
				$("#merPanelId").show();
			} else {
				layer.alert("请先投注！",0);
				return false;
			}
			
			break;
		}
		calculteAll();
	});
	
	// 今天/明天期号切换
	$("a[name=dayOptionName]").click(function(){
		$("a[name=dayOptionName]").removeClass("qycodldh").addClass("qycodldh1");
		$(this).removeClass("qycodldh1").addClass("qycodldh");
		
		createChsHtml($(this).attr("value"));
		calculteAll();
	});
	// 5期/10期/15期/20期 切换
	$("a[name=issueNumOptionName]").click(function(){
		$("a[name=issueNumOptionName]").removeClass("qycodldja").addClass("qycodldj1");
		$(this).removeClass("qycodldj1").addClass("qycodldja");
		selectIssue(parseInt($(this).attr("value"),10));
	});
	// 手输期数
	$("#setChasingId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#setChasingId").keyup(function(event){
		if ( $(this).val() != "" ) {
			selectIssue(parseInt($(this).val(),10));
		}
	});
	// 手输倍数
	$("#setMultId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#setMultId").keyup(function(event){
		var val = $(this).val();
		if ( val != "" ) {
			$("#chasingIssListId").find("ul").each(function(index){
				if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
					$(this).find("input[name=multiple]").val(val);
				}
			});
			updateMultAndTotalMoney();
			calculteAll();
		}
	});
	// 生成高级倍投计划
	$("#seniorCsPlanId").click(function(){
		if ( $("#totalBetMoneyId").html() == "0" ) {
			layer.alert("请先投注！",0);
			return;
		}
		var issueNum = $("#seChsIssueNumId").val();
		if ( isNaN(issueNum) ) {
			$("#seChsIssueNumId").val(1);
			issueNum = 1;
		}
		issueNum = parseInt(issueNum,10);
		var startMult = $("#seStartMultId").val();
		if ( isNaN(startMult) ) {
			$("#seStartMultId").val(1);
			issueNum = 1;
		}
		startMult = parseInt(startMult,10);
		var mode = parseInt($("input[name=rateTypeName]:checked").val(),10);
		var totalRate = $("#totalRateId").val();
		if ( isNaN(totalRate) ) {
			$("#totalRateId").val(50);
			totalRate = 0.5;
		}
		totalRate = parseFloat(parseInt(totalRate,10)/100);
		var startProfitIssueNum = $("#startProfitIssueNumId").val();
		if ( isNaN(startProfitIssueNum) ) {
			$("#startProfitIssueNumId").val(1);
			startProfitIssueNum = 1;
		}
		startProfitIssueNum = parseInt(startProfitIssueNum,10);
		var startProfitRate = $("#startProfitRateId").val();
		if ( isNaN(startProfitRate) ) {
			$("#startProfitRateId").val(50);
			startProfitRate = 0.5;
		}
		startProfitRate = parseFloat(parseInt(startProfitRate,10)/100);
		var afterProfitRate = $("#afterProfitRateId").val();
		if ( isNaN(afterProfitRate) ) {
			$("#afterProfitRateId").val(20);
			afterProfitRate = 0.2;
		}
		afterProfitRate = parseFloat(parseInt(afterProfitRate,10)/100);
		var planProfit = $("#planProfitId").val();
		if ( isNaN(planProfit) ) {
			$("#planProfitId").val(100);
			planProfit = 100;
		}
		if ( $("#isPlanProfitId").attr("checked") ) {
			planProfit = parseInt(planProfit,10);
		} else {
			planProfit = 0;	
		}
		
		var betMoney = parseInt($("#totalBetNumId").html(),10) * 2;
		if ( betMoney >= bonus ) {
			layer.alert("您的投注不能盈利！",0);
			return false;
		}
		var list = chasing.createSeniorCsPlan(issueNum,startMult,mode,totalRate,startProfitIssueNum,startProfitRate,afterProfitRate,planProfit,betMoney,bonus+"");
		var startIss = parseInt($("#seChsStartIssueId").val(),10);
		$("#chasingIssListId").find("input[type=checkbox]").removeAttr("checked", "checked");
		$("#chasingIssListId").find("input[name=multiple]").removeAttr("disabled").val(1);
		$("#chasingIssListId").find("span[name=currPay]").html(0);
		$("#chasingIssListId").find("span[name=totalPay]").html(0);
		for ( var i = 0; i < list.length; i++ ) {
			$("ul[issue="+startIss+"]").find("input[type=checkbox]").attr("checked", "checked");
			$("ul[issue="+startIss+"]").find("input[name=multiple]").removeAttr("disabled");
			$("ul[issue="+startIss+"]").find("input[name=multiple]").val(list[i].multiple);
			$("ul[issue="+startIss+"]").find("span[name=currPay]").html(list[i].currBetMoney);
			$("ul[issue="+startIss+"]").find("span[name=totalPay]").html(list[i].currTotolMoney);
			$("ul[issue="+startIss+"]").find("li[name=bonus]").html(list[i].theoryBonus+"("+list[i].profitRate+")");
			
			startIss++;
		}
		calculteAll();
	});
	// 高级追号中的设置
	$("input[name=rateTypeName]").click(function(){
		if ( $(this).val() == "1" ) {
			$("#startProfitIssueNumId").attr("disabled", "disabled");
			$("#startProfitRateId").attr("disabled", "disabled");
			$("#afterProfitRateId").attr("disabled", "disabled");
		} else {
			$("#startProfitIssueNumId").removeAttr("disabled");
			$("#startProfitRateId").removeAttr("disabled");
			$("#afterProfitRateId").removeAttr("disabled");
		}
	});
	$("#isPlanProfitId").click(function(){
		if ( $(this).attr("checked") ) {
			$("#planProfitId").removeAttr("disabled");
		} else {
			$("#planProfitId").attr("disabled", "disabled");
		}
	});
	// 取消或加上一期
	$("input[type=checkbox].qycodldcheck").live("click", function(){
		calculteAll();
	});
});

var chasing = new ChasingNo();



function selectIssue(num) {
	
	if ( $("#totalBetMoneyId").html() == "0" ) {
		layer.alert("请先投注！",0);
		return;
	}
	$("#chasingIssListId").find("input[type=checkbox]").removeAttr("checked");
	$("#chasingIssListId").find("input[name=multiple]").attr("disabled", "disabled");
	$("#chasingIssListId").find("span[name=currPay]").html("0");
	$("#chasingIssListId").find("span[name=totalPay]").html("0");
	
	var uls = $("#chasingIssListId").find("ul");
	if ( uls.length < num ) {
		num = uls.length;
	}
	//var totalPay = parseInt($("#totalBetMoneyId").html());
	var mult = $("#setMultId").val().trim() == "" ? "1" : $("#setMultId").val().trim();
	for ( var i = 0; i < num; i++ ) {
		$(uls[i]).find("input[type=checkbox]").attr("checked", "checked");
		$(uls[i]).find("input[name=multiple]").removeAttr("disabled").val(mult);
		$(uls[i]).find("span[name=currPay]").html(0);
		$(uls[i]).find("span[name=totalPay]").html(0);
		//totalPay += parseInt($("#totalBetMoneyId").html());
	}
	updateMultAndTotalMoney();
	calculteAll();
}

/**
 * 倍数变化之后修改累计投入额
 * @return
 */
function updateMultAndTotalMoney(){
	var totalPay = 0;
	var uls = $("#chasingIssListId").find("ul");
	for ( var i = 0; i < uls.length; i++ ) {
		if ( $(uls[i]).find("input[type=checkbox]:checked").length > 0 ) {
			var currPay = parseInt($("#totalBetMoneyId").html())*parseInt($(uls[i]).find("input[name=multiple]").val());
			totalPay += currPay;
			$(uls[i]).find("span[name=currPay]").html(currPay);
			$(uls[i]).find("span[name=totalPay]").html(totalPay);
			if ( $("#licenseId").val() == "102" ) {
				$(uls[i]).find("li[name=bonus]").html("-");
			} else {
				$(uls[i]).find("li[name=bonus]").html(bonus*parseInt($(uls[i]).find("input[name=multiple]").val()));
			}
		}
	}
}

function createChsHtml(option) {
	var date = "";
	var list = new Array();
	var max = parseInt($("#maxIssueId").val(),10);
	if( option == "1" ) {
		date = $("#todayFmtId").val();
		var currentIssue = $("#currentIssueId").html();
		list = chasing.createChasingIssue(date.substring(2), parseInt(currentIssue.substring(6,8)), max, 2);
	} else {
		date = $("#tomorrowFmtId").val();
		list = chasing.createChasingIssue(date.substring(2), 1, max, 2);
	}
	
	var html = "";
	$("#chasingIssListId").empty();
	for ( var i = 0; i < list.length; i++ ) {
		html += '<ul issue='+list[i]+'><li class="qycodldlia">'+(i+1)+'</li>'+
            '<li class="qycodldlib"><input name="" type="checkbox" value="" class="qycodldcheck" />'+list[i]+'期</li>'+
            '<li class="qycodldlic"><input name="multiple" type="text" class="qycodldklit" value="0" disabled /> 倍</li>'+
            '<li class="qycodldlid"><span class="redb" name="currPay">0</span>元</li>'+
            '<li class="qycodldlie"><span class="redb" name="totalPay">0</span>元</li>'+
            '<li class="qycodldlif" name="bonus">-</li></ul>';
	}
	$(html).appendTo($("#chasingIssListId"));
	
	// 倍数加事情
	$("#chasingIssListId").find("input[name=multiple]").live("keydown", function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#chasingIssListId").find("input[name=multiple]").live("keyup", function(event){
		var val = $(this).val();
		if ( val != "" ) {
			updateMultAndTotalMoney();
		}
	});
	$("#chasingIssListId").find("input[name=multiple]").live("blur", function(event){
		var val = $(this).val();
		if ( val == "" ) {
			$(this).val(1);
			updateMultAndTotalMoney();
		}
	});
}

function chasingFormSubmit() {
	var form = $("#chasingBuyFormId");
	
	var betCode = "";
	$("#betListAreaId").children().each(function(index){
		betCode += $(this).attr("betCode") + ";";
	});
	betCode = betCode.substring(0, betCode.length - 1);
	
	var multiple = $("#multipleId").val();
	
	$(form).find("input[name=singleFlag]").val("0");
	$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html()));
	var multiple = 0, totalMoney = 0;
	var issueMult = "";
	$("#chasingIssListId").find("ul").each(function(index){
		if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
			issueMult += $(this).attr("issue")+"|"+$(this).find("input[name=multiple]").val()+",";
			multiple += parseInt($(this).find("input[name=multiple]").val(),10);
			totalMoney += parseInt($(this).find("span[name=totalPay]").html());
		}
	});
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val(totalMoney);
	issueMult = issueMult.substring(0, issueMult.length - 1);
	$(form).find("input[name=issueMult]").val(issueMult);
	$(form).find("input[name=stopBonus]").val("0");
	if ( $("#stopBonusId").attr("checked") ) {
		$(form).find("input[name=winStop]").val("1");
	} else {
		$(form).find("input[name=winStop]").val("0");
	}
	var base = "0";
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}
