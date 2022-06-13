// 非高频追号公用 added by luochang at 2015/03/23
$(document).ready(function () {
	
	// 5期/10期/50期 期数切换
	$("#chasingIssueOptId").change(function(){
		var issueNumber = parseInt($(this).val(),10);
		$("#chasingIssListId").find("tr").hide();
		$("#chasingIssListId").find("input[type=checkbox]:checked").removeAttr("checked");
		$("#chasingIssListId").find("input[type=text]").attr("disabled","disabled");
		var lis = $("#chasingIssListId").find("tr");
		var base = parseInt($("#totalBetNumId").html());
		var tos = 2;
		if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
			tos = 3;
		}
		for ( var i = 0; i < issueNumber; i++ ) {
			$(lis[i]).show();
			//$(lis[i]).find("input[type=checkbox]").click();
			$(lis[i]).find("input[type=checkbox]").attr("checked","checked");
			$(lis[i]).find("input[type=text]").removeAttr("disabled").val(1);
			$(lis[i]).find("span[name=issSpan]").html(base * tos);
		}
		calcTotalBetMoney();
	});
	// 期号选中
	$("#chasingIssListId").find("input[type=checkbox]").click(function(){
		var tos = 2;
		if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
			tos = 3;
		}
		if ( $(this).attr("checked") ) {
			$(this).parent().parent().find("input[type=text]").removeAttr("disabled");
			$(this).parent().parent().find("input[type=text]").removeAttr("disabled").val(1);
			var base = parseInt($("#totalBetNumId").html());
			$(this).parent().parent().find("span[name=issSpan]").html(base * tos);
		} else {
			$(this).parent().parent().find("input[type=text]").attr("disabled","disabled");
			$(this).parent().parent().find("span[name=issSpan]").html(0);
		}
		calcTotalBetMoney();
	});
	// 倍数控制事件 begin  
	$("#totalSetMultId").keyup(function(){
		var val = $(this).val();
		if ( val != "" ) {
			$("#chasingIssListId").find("tr").each(function(index){
				if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
					$(this).find("input[name=issMultiple]").val(val);
				}
			});
			updateMultAndTotalMoney();
		}
	});
	
	$("input[name=issMultiple],#totalSetMultId").live("keydown", function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("input[name=issMultiple]").live("keyup", function(event){
		if ( $(this).val() != "" ) {
			var base = parseInt($("#totalBetNumId").html());
			var tos = 2;
			if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
				tos = 3;
			}
			$(this).parent().parent().find("span[name=issSpan]").html(base * tos * parseInt($(this).val()));
			calcTotalBetMoney();
		}
	});
	// 单期奖金停止追号设置
	$("#stopSetId").click(function(){
		if ( $(this).attr("checked") ) {
			$("#stopBonusId").removeAttr("disabled");
		} else {
			$("#stopBonusId").attr("disabled", "disabled");
		}
	});
	// 停止奖金事件
	$("#stopBonusId,#partBaoInputId").live("keydown", function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	
});

/**
 * 倍数变化之后修改累计投入额
 * @return
 */
function updateMultAndTotalMoney(){
	var uls = $("#chasingIssListId").find("tr");
	var base = parseInt($("#totalBetNumId").html());
	var tos = 2;
	if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
		tos = 3;
	}
	for ( var i = 0; i < uls.length; i++ ) {
		if ( $(uls[i]).find("input[type=checkbox]:checked").length > 0 ) {
			$(uls[i]).find("span[name=issSpan]").html(base * tos * parseInt($(uls[i]).find("input[name=issMultiple]").val()));
		}
	}
	calcTotalBetMoney();
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
	$("#chasingIssListId").find("tr").each(function(index){
		if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
			issueMult += $(this).attr("issue")+"|"+$(this).find("input[name=issMultiple]").val()+",";
			multiple += parseInt($(this).find("input[name=issMultiple]").val());
		}
	});
	totalMoney = parseInt($("#totalCBetMoneyId").html());
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val(totalMoney);
	issueMult = issueMult.substring(0, issueMult.length - 1);
	$(form).find("input[name=issueMult]").val(issueMult);
	if ( $("#stopSetId").attr("checked") ) {
		$(form).find("input[name=stopBonus]").val($("#stopBonusId").val());
		$(form).find("input[name=winStop]").val("1");
	} else {
		$(form).find("input[name=stopBonus]").val("0");
		$(form).find("input[name=winStop]").val("0");
	}
	var base = "0";
	if ( $("#zjBoxId").length > 0 && $("#zjBoxId").attr("checked") ) {
		base = "1";
	}
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}

//计算总投注金额
function calcTotalBetMoney() {
	var base = parseInt($("#totalBetNumId").html());
	var totalM = 0;
	var tos = 2;
	if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
		tos = 3;
	}
	var issnumber = 0;
	$("#chasingIssListId").find("tr").each(function(index){
		if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
			issnumber++;
			totalM += base * parseInt($(this).find("input[type=text]").val()) * tos;
		}
	});
	$("#totalCIssueId").html(issnumber);
	$("#totalCBetMoneyId").html(totalM);
}