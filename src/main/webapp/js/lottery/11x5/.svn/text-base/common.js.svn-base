var bonus = 0;
$(document).ready(function () {

	// 手工录入显示的玩法
	var playType = $("#lotteryBuyFormId").find("input[name=playType]").val();
	if ( playType.indexOf("pt") > -1 ) {
		$("#handInputBtnId").show();
	} else {
		$("#handInputBtnId").hide();
	}
	updateKjInfo();
	setInterval("updateKjInfo()", 1000*30);
	// 倒计时
	setInterval("clock()", 1000);
	
	$(".dlt-12cb-l").hide();
	
	// 倍数控制事件 begin  96,105
	$("#multipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
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
	
	// 删除所选
	$("#clearSelListBtnId").click(function(){
		$("#betListAreaId").find("input[type=checkbox]:checked").each(function(index){
			$(this).parent().parent().remove();
		});
		calculteAll();
	});
	
	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){
		var sec = parseInt($("#stopSId").html(),10);
		var min = parseInt($("#stopMId").html(),10);
		//var hou = parseInt($("#stopHId").html());
		if ( sec == 0 && min == 0  ) {
			layer.alert("当前期不可投注！",0);
			return false;
		}
		if ( $("#totalBetNumId").html() != "0" ) {
			if ( !$("#agreeChkId").attr("checked") ) {
				layer.alert("请同意用户合买代购协议！",0);
				return false;
			}
			// 查询余额
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
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
						if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "4") ){
							pay = parseFloat($("#totalHmMoneyId").html());
						}
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							$("#sureZjTdId").hide();
							var playName = engine.getPlayName($("#chsPlayerId").val());
							if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "2" || $("input[name=buyChasName]:checked").val() == "3") ) {
								$("#buyChsMergeNameId").html("个人追号");
								if ( $("#chasingIssListId").find("input[type=checkbox]:checked").length == 0 ) {
									layer.alert("余额不足，请先设置追号期次！",0);
									return false;
								}
							} else if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "4") ){
								$("#buyChsMergeNameId").html("发起合买");
							}else {
								$("#buyChsMergeNameId").html("个人代购");
							}
							$("#sureDivIssueId").html($("#currentIssueId").html());
							var html = '<td width="165" height="33">'+playName+'</td>';
							html += '<td height="33">'+$("#totalBetNumId").html()+'</td>';
							html += '<td height="33">'+$("#multipleId").val()+'</td>';
							var zj = "否";
							html += '<td height="33" style="display:none">'+zj+'</td>';
							html += '<td width="210" height="33">¥<span>'+$("#totalBetMoneyId").html()+'元</span></td>';
							$("#sureBuyOrInfoTrId").empty();
							$(html).appendTo($("#sureBuyOrInfoTrId"));
							
							var chtml = '';
							$("#betListAreaId").children().each(function(index){
								var code = $(this).attr("betcode");
								chtml += '<li><span class="red">'+code+'</span>  <span class="blue"></span></li>'; 
							});
							$("#sureBuyBetDetailId").empty();
							$(chtml).appendTo($("#sureBuyBetDetailId"));
							if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "4") ){
								$("#sureBuyTotalBetMoneyId").html($("#totalHmMoneyId").html());
							} else {
								$("#sureBuyTotalBetMoneyId").html($("#totalChsMoneyId").html());
							}
							$("#sureBuyBalanceId").html(formatCurrency(data));
							showSureDiv();
							//formSubmit();
						}
					}
			    }
			});
		} else {
			layer.alert("请先投注！",0);
		}
	});	
	
	// 开奖描述信息
	try {
		var csi = parseInt($("#currentIssueId").html().substring(6,8),10);
		var max = parseInt($("#maxIssueId").val(),10);
		$("#kjDescId").html("今天已开"+(csi-1)+"期，还剩"+(max+1-csi)+"期");
	} catch (ex){}
	
	//热冷号分析切换-zlp
	$("li[id^=hotcoldAnalysis]").click(function(){
		if($(this).hasClass("qycodrcaollia")){
			$("li[id^=hotcoldAnalysis]").toggleClass("qycodrcaollia");
			var id= $(this).attr("id");
			if(id == 'hotcoldAnalysis_hot'){
				$("#hcAnalysisdiv_cold").hide();
				$("#hcAnalysisdiv_hot").show();
			}else{
				$("#hcAnalysisdiv_cold").show();
				$("#hcAnalysisdiv_hot").hide();
			}
		}		
	});
	
	bonus = engine.getPlayBonus($("#chsPlayerId").val());
});

var engine = new C11x5();

/**
 * 开奖号码更新
 * @return
 */
function updateKjInfo() {
	// 异步请求开奖号码
	var licenseId = $("#licenseId").val();
	$.ajax({
	    type: "post",
	    url: "http://101.200.213.247:9380/global/open/freq/"+licenseId+".js",
	    dataType: "jsonp",
		jsonp: "jsoncallback",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			
	    }
	});
}

function callback(objs) {
	$("#historyIssueId").html(objs[0].issue);
	$(".qiu").eq(0).html(objs[0].code.split("-")[0]);
	$(".qiu").eq(1).html(objs[0].code.split("-")[1]);
	$(".qiu").eq(2).html(objs[0].code.split("-")[2]);
	$(".qiu").eq(3).html(objs[0].code.split("-")[3]);
	$(".qiu").eq(4).html(objs[0].code.split("-")[4]);
	
	$("#kjListAreaId").empty();
	for ( var i = 0; i < objs.length; i++ ) {
		$('<ul>'+
            	'<li class="qycodrba2 zicol">'+objs[i].issue+'</li>'+
            	'<li class=" zicola" style="width:10%">'+objs[i].code.split("-")[0]+'</li>'+
            	'<li class=" zicola" style="width:10%">'+objs[i].code.split("-")[1]+'</li>'+
            	'<li class=" zicola" style="width:10%">'+objs[i].code.split("-")[2]+'</li>'+
            	'<li class=" zicola" style="width:10%">'+objs[i].code.split("-")[3]+'</li>'+
            	'<li class=" zicola" style="width:10%">'+objs[i].code.split("-")[4]+'</li>'+
            '</ul>').appendTo($("#kjListAreaId"));
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
			$("#stopSId2").html("0"+(sec-1));
		} else {
			$("#stopSId").html((sec-1));
			$("#stopSId2").html((sec-1));
		}
	} else {
		var min = parseInt($("#stopMId").html(),10);
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#stopMId").html("0"+(min-1));
				$("#stopMId2").html("0"+(min-1));
			} else {
				$("#stopMId").html((min-1));
				$("#stopMId2").html((min-1));
			}
			$("#stopSId").html(59);
			$("#stopSId2").html(59);
		} else {
			// 下一期
			var max = parseInt($("#maxIssueId").val(),10);
			var currentIssue = $("#currentIssueId").html();
			if ( parseInt(currentIssue.substring(6,8),10) == max ) {
				$("#stopMId").html("--");
				$("#stopSId").html("--");
				$("#stopMId2").html("--");
				$("#stopSId2").html("--");
			} else {
				var nextIssue = parseInt(currentIssue,10) + 1;
				$("#currentIssueId").html(nextIssue);
				$("#currentIssueId2").html(nextIssue);
				$("#stopMId").html("09");
				$("#stopSId").html(59);
				$("#stopMId2").html("09");
				$("#stopSId2").html(59);
				//下一期提示
				popupConfirm("温馨提示","当前已进入下一期");
				setTimeout("$.unblockUI();", 5000);
				
				var csi = parseInt($("#currentIssueId").html().substring(6,8),10);
				$("#kjDescId").html("今天已开"+(csi-1)+"期，还剩"+(max+1-csi)+"期");
				
				// 更新追号列表期次
				$("input[name=buyChasName]").eq(0).click();
			}
		}
	}
}

function calculteAll() {
	var betNum = 0;
	var multiple = parseInt($("#multipleId").val(),10);
	$("#betListAreaId").children().each(function(index){
		betNum += parseInt($(this).attr("betNum"),10);
	});
	$("#totalBetNumId").html(betNum);
	var base = 2;
	$("#totalBetMoneyId").html(betNum*base*multiple);
	var option = $("input[name=buyChasName]:checked").val();
	if ( option == "1" ) {
		$("#totalChsIssueId").html(1);
		$("#totalChsMoneyId").html(betNum*base*multiple);
	} else {
		// 计算追号总额
		//updateMultAndTotalMoney();
		var multiple = 0, totalMoney = 0, issueNum = 0;
		$("#chasingIssListId").find("ul").each(function(index){
			if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
				issueNum++;
				$(this).find("span[name=currPay]").html(betNum*parseInt($(this).find("input[name=multiple]").val(),10)*2);
				totalMoney += parseInt($(this).find("span[name=currPay]").html(),10);
			}
			$("#totalChsIssueId").html(issueNum);
			$("#totalChsMoneyId").html(totalMoney);
		});
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
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetNumId").html(),10));
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
	$(form).find("input[name=issue]").val($("#currentIssueId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=betType]").val("1");
	var base = "0";
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}

/**
 * 加载奖金数据_可以传0—3个参数；1、时间(20140910)2、玩法，3、期号
 * 
 * */
function getBonusControlData(){
	var arg_size = arguments.length;
	var data_ = '';
	
	switch(arg_size){
		case 1:
			data_ = "dataStr="+arguments[0];
			break;
		case 2:
			data_ = "dataStr="+arguments[0]+"&playId="+arguments[1];
			break;
		case 3:
			data_ = "dataStr="+arguments[0]+"&playId="+arguments[1]+"&issue="+arguments[2];
			break;
		default:
			data_ = "dataStr=&playId=1";
		break;
	}
	
	$.ajax( {
		type : "post",
		url : "/lottery/getBonusControlData.json",
		async : false,
		data : data_,
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			result = 1;
		},
		success : function(data) {	
			var p = $("p[id^='@c']");
			var issue = $("#currentIssueId").html();
			var json = eval("("+data+")");
			
			if(arg_size != 4){//不带期号查询，得到所有当天的数据
				$.each(json,function(index,val){				
					if(val['@expect']==issue){
						$.each(p,function(){
							$(this).html(val[$(this).attr('id')]);
						});						
					}
				});
			}else{//带期号
				$.each(p,function(){
					$(this).html(json[0][$(this).attr('id')]);
				});	
			}			
		}
	});
}
