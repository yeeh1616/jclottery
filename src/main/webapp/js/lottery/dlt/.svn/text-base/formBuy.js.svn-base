var hem = new Hemai();
$(document).ready(function () {
	
	// 数字彩显示追号设置
	$("#chaseSetBtnId").show();

	// 倒计时
	setInterval("clock()", 1000);
	setInterval("coopclock()", 1000);
	
	// 追加投注
	$("#zjBoxId").click(function(){
		if ( $(this).attr("checked") ) {
			$("input[name=zjFlag]").val("1");
		} else {
			$("input[name=zjFlag]").val("0");
		}
		calculteAll();
	});
	
	// 倍数控制事件 begin
	$("#multipleId,#radomSelDsId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			calculteAll();
		}
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
	
	// 删除全部
	$("#clearBetListBtnId").click(function(){
		$("#betListAreaId").empty();
		calculteAll();
	});
	
	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){

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
						var pay = 0;
						var balance = parseFloat(data);
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							$("#sureSchPanalId").empty();
							if ( $("#pageNameId").val() != "dssc" && $("#pageNameId").val() != "zxdssc" && $("#pageNameId").val() != "z3dssc" && $("#pageNameId").val() != "z6dssc" ) { // 单式上传
								var chtml = '';
								$("#betListAreaId").children().each(function(index){
									chtml += '<li>'+$(this).children().eq(0).html()+'</li>';
								});
								$(chtml).appendTo("#sureSchPanalId");
							} else {
								$('<li><font color=red>*方案为文件上传</font></li>').appendTo($("#sureSchPanalId"));
								// 隐藏追号按钮
								$("#chaseSetBtnId").hide();
							}
							
							$("#betPanalId").hide();
							$("#surePanalId").show();
							$("#showBalDivId").html(formatCurrency(data)+"元");// 余额显示
							var multiple = $("#multipleId").val();
							$("#sureBetNumId").html($("#totalBetNumId").html());
							$("#sureMultipleId").html(multiple + "倍");
							$("#sureBetMoneyId").html($("#totalBetMoneyId").html());
							$("input[name=buyType]").eq(0).click();
						}
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
					var pay = parseFloat($("#totalBetMoneyId").html());
					var oo = $("input[name=buyType]:checked").val();
					var balance = parseFloat(data);
					if ( (pay > balance) && oo == "1") {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						if ( oo == "1" ) {
							if ( $("#pageNameId").val() == "dssc" || $("#pageNameId").val() == "zxdssc" || $("#pageNameId").val() == "z3dssc" || $("#pageNameId").val() == "z6dssc" ) { // 单式上传
								dsscFormSubmit();
							} else {
								formSubmit();
							}
						} else if ( oo == "3" ) {
							if ( $("#pageNameId").val() == "dssc" || $("#pageNameId").val() == "zxdssc" || $("#pageNameId").val() == "z3dssc" || $("#pageNameId").val() == "z6dssc" ) { // 单式上传
								hem.dsSubmitForm();
							} else {
								hem.submitForm();
							}
						} else if ( oo == "2" ) {
							chasingFormSubmit();
						}
						$("#loginCloseBtnId").click();
						$("#returnModId").click();
					}
				}
		    }
		});
		
	});
	
	// 代购/合买切换
	$("input[name=buyType]").click(function(){
		var oo = $(this).val();
		if ( oo == "1" ) {
			$("#mergerPanelId").hide();
			$("#chaseSetPanelId").hide();
		} else if ( oo == "3" ) {
			$("#chaseSetPanelId").hide();
			$("#mergerPanelId").show();
			// 显示合买配置项
			$("#betPanalId").hide();
			$("div[name=mergerPanel]").show()
			$("#megerPanelDivId").show();
			// 合买数据填充
			$("#totalHemaiNumId").html($("#totalBetMoneyId").html());

			// 合买默认购买份数 1%
			var lbuy = parseInt(parseInt($("#totalBetMoneyId").html())/100);
			if ( parseInt($("#totalBetMoneyId").html())%100 != 0 ) {
				lbuy++;
			}
			$("#offerBuyId").val(lbuy);
			// 合买发起人总额
			$("#totalHmMoneyId").html(lbuy);
			$("#partDetailId").val("大奖就在眼前，不要错过哦");
			
			// 默认无保底
			$("input[name=baodiType][type=radio]").eq(0).click();
			$("#offerBMId").html(parseInt(new Number(lbuy/parseInt($("#totalBetMoneyId").html())).toFixed(2))*100);
		} else if ( oo == "2" ) {	// 追号
			$("#mergerPanelId").hide();
			$("#chaseSetPanelId").show();
			// 展示追号内容
			// 初始显示5期
			$("#chasingIssueOptId").change();
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
			
			var totalNum = parseInt($("#totalBetMoneyId").html());
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
		var totalNum = parseInt($("#totalBetMoneyId").html());
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
});

function dsscFormSubmit() {
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
				var pay = parseFloat($("#totalBetMoneyId").html());
				var balance = parseFloat(data);
				if ( pay > balance ) {
					layer.alert("余额不足，请您先充值！",0);
				} else {
					$("#singleFormId").find("input[name=multiple]").val($("#multipleId").val());
					$("#singleFormId").submit();
				}
			}
	    }
	});
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
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html(),10));
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
	$(form).find("input[name=issue]").val($("#currIssueId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=betType]").val("1");
	var base = "0";
	if ( $("#zjBoxId").attr("checked") ) {
		base = "1";
	}
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}

function calculteAll() {
	var betNum = 0;
	var base = 2;
	if ( $("#zjBoxId").attr("checked") ) {
		base = 3;
	}
	var multiple = parseInt($("#multipleId").val(),10);
	if ( $("#pageNameId").val().indexOf("dssc") == -1 ) { // 单式上传
		$("#betListAreaId").children().each(function(index){
			betNum += parseInt($(this).attr("betNum"),10);
		});
		$("#totalBetNumId").html(betNum);
		$("#totalBetMoneyId").html(betNum*base*multiple);
	} else {
		betNum = parseInt($("#totalBetNumId").html());
		$("#totalBetMoneyId").html(betNum*base*multiple);
	}
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