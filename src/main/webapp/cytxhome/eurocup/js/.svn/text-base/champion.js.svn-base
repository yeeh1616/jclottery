
$(document).ready(function (){
	$("table.against_one tr").click(function(){
		if ( $(this).find(".sale").html() != "开售" ) {
			return false;
		}
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		calcBetNum();
	});
	
	addNumberEvent($("#multipleId"), function(){
		calcBetNum();
	});
	$("#addMulId").click(function(){
		var m = $("#multipleId").val();
		if ( m == "" ) {
			m = 1;
		}
		m = parseInt(m) + 1;
		$("#multipleId").val(m);
		calcBetNum();
	});
	$("#subMulId").click(function(){
		var m = $("#multipleId").val();
		if ( m == "" ) {
			m = 1;
		}
		if ( parseInt(m) > 1 ) {
			m = parseInt(m) - 1;
		}
		$("#multipleId").val(m);
		calcBetNum();
	});
	$(".all_choose").click(function(){
		$("table.against_one tr.active").removeClass("active");
		calcBetNum();
	});
	$("#sbmBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						// 尚未登录
						$(".openlogin").click();
					} else {
						// 判断余额是否足够
						var pay = parseFloat($("#betMoneyId").html());
						var balance = parseFloat(data);
						if ( (pay > balance) && oo == "1") {
							layer.alert("余额不足，请您先充值！",0);
						} else {
							formSubmit();
						}
					}
			    }
			});
		}
	});
	
	try {
		$.ajax({
			type: "GET",
			url: "http://i.sporttery.cn/rank_calculator/get_list?tid[]=77535&&pcode[]=chp&pcode[]=fnl&i_callback=getDataCallBack",
			dataType: "jsonp",
			jsonp: "jsoncallback",
			crossDomain: true,
			success: function (result) {
			},
			error: function (xMLHttpRequest, textStatus, errorThrown) {
			}
		});
	} catch ( e ) {}
})

function getDataCallBack(para) {
	 var data = para.data;
	 for (var m = 0; m < data.length; m++) {
		 if ( $("#playTypeId").val() == "10" && data[m].odds_type == "CHP" ) {
			 var ss = data[m].data.split("|");
			 for ( var i = 0; i < ss.length; i++ ) {
				 var pp = ss[i].split("-");
				 var obj = $("tr[sid="+pp[0]+"]");
				 $(obj).find("td").eq(3).html(pp[3]);
				 $(obj).find("td").eq(2).html(pp[2]);
				 $(obj).find("td").eq(2).html(pp[2]);
				 $(obj).find(".progress").attr("style", "width:"+pp[4]+";");
				 $(obj).find("td").eq(5).html(pp[5]);
			 }
		 }
		 if ( $("#playTypeId").val() == "11" && data[m].odds_type == "FNL" ) {
			 var ss = data[m].data.split("|");
			 for ( var i = 0; i < ss.length; i++ ) {
				 var pp = ss[i].split("-");
				 var obj = $("tr[sid="+pp[0]+"]");
				 $(obj).find("td").eq(3).html(pp[3]);
				 $(obj).find("td").eq(2).html(pp[2]);
				 $(obj).find("td").eq(2).html(pp[2]);
				 $(obj).find(".progress").attr("style", "width:"+pp[4]+";");
				 $(obj).find("td").eq(5).html(pp[5]);
			 }
		 }
	 }
}

function formSubmit() {
	var form = $("#lotteryBuyFormId");
	
	var betCode = "";
	if ( $("#playTypeId").val() == "10" ) {
		$("table.against_one tr.active").each(function(){
			betCode += $(this).find("td").eq(0).html()+"_"+$(this).find(".country").html()+"("+$(this).find(".tw_red").html()+")" + ",";
		});
	} else {
		$("table.against_one tr.active").each(function(){
			betCode += $(this).find("td").eq(0).html()+"_"+$(this).find(".width_country.fl").text()+"|"+$(this).find(".width_country.fr").text()+"("+$(this).find(".tw_red").html()+")" + ",";
		});
	}
	betCode = betCode.substring(0, betCode.length - 1);
	
	var passString = "1c1";
	
	var multiple = $("#multipleId").val();
	
	$(form).find("input[name=licenseId]").val(9);
	$(form).find("input[name=playType]").val($("#playTypeId").val());
	$(form).find("input[name=passType]").val(passString);
	$(form).find("input[name=singleFlag]").val("0");
	$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=orderOdds]").val("");
	$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple)/2);
	$(form).find("input[name=multiple]").val(multiple);
	$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=issue]").val("1");
	$(form).find("input[name=betType]").val("1");
	$(form).find("input[name=reserved8]").val("");
	
	if($("#highBonId").html() == '--')
		$("#highBonId").html('0.00');
			
	$(form).find("input[name=theoryBonus]").val($("#highBonId").html());
	
	$(form).submit();
}

function calcBetNum() {
	var schNum = $("table.against_one tr.active").length;
	$("#schId").html(schNum);
	var m = $("#multipleId").val();
	if ( m == "" ) {
		m = 1;
		$("#multipleId").val(1);
	}
	$("#betMoneyId").html(schNum*parseInt(m)*2)
	var bo = 0;
	$("table.against_one tr.active").each(function(){
		if ( parseFloat($(this).find("td.tw_red").html()) > bo ) {
			bo = parseFloat($(this).find("td.tw_red").html());
		}
	});
	$("#highBonId").html((new Number(bo*parseInt(m)*2)).toFixed(2));
}

function addNumberEvent(obj, callFun) {
	$(obj).keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$(obj).keyup(function(event){
		if ( $(this).val() != "" ) {
			callFun();
		}
	});
}