var hem = new Hemai();

$(document).ready(function () {
	// 合买事件begin
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
		var totalNum = parseInt($("#totalHemaiNumId").html(),10);
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
	
	// 倍数控制事件 begin
	$("#multipleId,#yjTotalBuyMulId,#yjTotalBuyNumId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 进入投注确认页
	$("#sureBetBtnId").click(function(){
		if ( !$("#agreeChkId").attr("checked") ) {
			layer.alert("请同意彩店与彩民交易协议！",0);
			return false;
		}
		hem.frsHupSubmitForm();	
	});
	
});

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
