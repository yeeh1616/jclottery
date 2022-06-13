// 非高频追号公用 added by luochang at 2015/03/23
$(document).ready(function () {
	// 追号js begin added at 2015/02/27
	// 代购/追号/合买切换
	$("input[name=buyType]").click(function(){
		var opt = $(this).val();
		if ( opt == "1" ) {
			// 隐藏追号内容
			$("div[name=chasingPanel]").hide();
			$("#chasingLiSId").hide();
			// 隐藏合买内容
			$("div[name=mergerPanel]").hide();
		}
		else if ( opt == "2" ) {
			if ( $("#totalBetNumId").html() != "0" ) {
				// 展示追号内容
				$("div[name=chasingPanel]").show();
				$("#chasingLiSId").show();
				// 初始显示5期
				$("#chasingIssueOptId").change();
	
				// 隐藏合买内容
				$("div[name=mergerPanel]").hide();
			} else {
				layer.alert("请先投注！",0);
				return false;
			} 
		}
		else if ( opt == "3" ) {
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
			} else {
				layer.alert("请先投注！",0);
				return false;
			}
		}
	});
	$("input[name=buyType]").eq(0).click();
	// 5期/10期/50期 期数切换
	$("#chasingIssueOptId").change(function(){
		var issueNumber = parseInt($(this).val(),10);
		$("#chasingIssListId").children().hide();
		$("#chasingIssListId").find("input[type=checkbox]:checked").removeAttr("checked");
		$("#chasingIssListId").find("input[type=text]").attr("disabled","disabled");
		var lis = $("#chasingIssListId").children();
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
		if ( $(this).attr("checked") ) {
			$(this).parent().find("input[type=text]").removeAttr("disabled");
			$(this).parent().find("input[type=text]").removeAttr("disabled").val(1);
			var base = parseInt($("#totalBetNumId").html());
			$(this).parent().find("span[name=issSpan]").html(base * 2);
		} else {
			$(this).parent().find("input[type=text]").attr("disabled","disabled");
			$(this).parent().find("span[name=issSpan]").html(0);
		}
		calcTotalBetMoney();
	});
	// 倍数控制事件 begin  96,105
	$("input[name=issMultiple]").live("keydown", function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("input[name=issMultiple]").live("keyup", function(event){
		if ( $(this).val() != "" ) {
			var base = parseInt($("#totalBetNumId").html());
			$(this).parent().find("span[name=issSpan]").html(base * 2 * parseInt($(this).val()));
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
	// 提交表单
	$("#lotteryFormBtnId").click(function(){
		var opt = $("input[name=buyType]:checked").val();
		if ( opt == "2" ) {
			// 追号表单提交
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
						var pay = parseFloat($("#totalCBetMoneyId").html());
						var balance = parseFloat(data);
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							// 弹出确认
							if ( $("#totalCBetMoneyId").html() == "0" ) {
								layer.alert("请先投注！",0);
								return false;
							}
							// 填充追号确认信息
							var playName = $("#licenseNameId").val();
							if ( $("#playNameId").length > 0 ) {
								playName = $("#playNameId").val();
							}
							var chasingNum = 0;
							var startIssue = '';
							$("#chasingIssListId").find("li").each(function(index){
								if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
									chasingNum++;
									if ( startIssue == '' ) {
										startIssue = $(this).attr("issue");
									}
								}
							});
							var zjFlag = "否";
							if ( $("#zjBoxId").attr("checked") ) {
								zjFlag = "是";
							}
							var autoStop = "否";
							if ( $("#stopSetId").attr("checked") ) {
								autoStop = "累计奖金≥<span>"+$("#stopBonusId").val()+"</span>元";
							}
							$("#chasingTitleSureId").html('<td height="31" align="center" class="sktit4">'+playName+' </td>'+
								'<td height="31" align="center" class="sktit4">'+chasingNum+' </td>'+
								'<td height="31" align="center" class="sktit4">'+startIssue+' </td>'+
								'<td height="31" align="center" class="sktit4">每期'+$("#totalBetNumId").html()+'注</td>'+
								'<td height="31" align="center" class="sktit4">'+zjFlag+'</td>'+
								'<td height="31" align="center" class="sktit4">¥  <span>'+$("#totalCBetMoneyId").html()+'</span> 元</td>'+
								'<td height="31" align="center" class="sktit4">'+autoStop+'</td>');
							$("#chasingSureBetListId").empty();
							$("#betListAreaId").children().each(function(index){
								$("<p>"+$(this).attr("betCode") + "</p>").appendTo($("#chasingSureBetListId"));
							});
							$("#chasingTotalSureMoneyId").html($("#totalCBetMoneyId").html());
							$.blockUI({
							message: $("#chasingSureDivId"),
							css: {
									width: '612px',
									height: '520px',
									left: ($(window).width() - 618) / 2 + 'px',
									top: 50 + 'px',
									border: 'none',
									cursor:'default'
								}
							});
							// 提交表单
							//chasingFormSubmit();
						}
					}
			    }
			});
		}
	});
	// 返回修改
	$("#chasingReturnId,#closeChasingSureDivId").click(function(){
		$.unblockUI();
	});
	// 追号表单提交
	$("#chasingFrmBtnId").click(function(){
		chasingFormSubmit();
	});
	// 追号js end added at 2015/02/27
});

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
	$("#chasingIssListId").find("li").each(function(index){
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