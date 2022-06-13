
var dateUtils = new DateUtils();
var guess = new SfPassSingleSchedule();
var hem = new Hemai();
function callback() {

	$("#issueSId").html("当前期"+schedules[0].issue);
	$("input[name=issue]").val(schedules[0].issue);
	guess.init(schedules);
	var html = '';
	var date = "";
	var ndate = $("#ndateValId").val();
	
	var counterMap = new Hashtable();
	var stopCounterMap = new Hashtable();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		date = schedules[i].uuid.substring(0,8);
		
		if ( dateUtils.formatGuessDate(schedules[i].betEndTime, $("#aheadTimeId").val()) > ndate ) {
			if ( counterMap.get(date) != 'undefined' ) {
				counterMap.put(date, parseInt(counterMap.get(date))+1);
			} else {
				counterMap.put(date, 1);
			}
		} else {
			if ( stopCounterMap.get(date) != 'undefined' ) {
				stopCounterMap.put(date, parseInt(stopCounterMap.get(date))+1);
			} else {
				stopCounterMap.put(date, 1);
			}
		}
	}
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		var averOdds = [];
		if ( obj.averageOdds == 'null' ) {
			averOdds = ["--","--","--"];
		} else {
			averOdds = obj.averageOdds.split(",");
		}
		
		var odds = obj.odds.split(",");
		if ( obj.odds == ',' ) {
			odds = ['--','--'];
		}
		
		var zhcss = i % 2 == 0 ? "" : "shbg";
		
		if ( i == 0 || date == "" ) {
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			html += '<div class="sais_cc sx_list">'+
				'<div class="sais_ct ">'+
		        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
		        '<div class="sais_ct_r fr">'+
		              '<input type="checkbox"/>'+
		              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>'+
		        '<div class="clear"></div>'+
		      '</div>'+
		      '<div class="sais_ct_l fl link2"><a href="javascript:void 0" class="xt"></a></div>'+
		      '<div class="day_list" style="display:block">'+
		      '<div class="sais_cc">';
		}
		var visibleHtml = "";
		if ( dateUtils.formatGuessDate(schedules[i].betEndTime, $("#aheadTimeId").val()) <= ndate ) {
			visibleHtml = 'style="display:none"';
		}
		var hostname = obj.hostTeam;
		var guestname = obj.guestTeam;
		if ( hostname.length > 5 ) {
			hostname = hostname.substring(0,5);
		}
		if ( guestname.length > 5 ) {
			guestname = guestname.substring(0,5);
		}
		var hbc = "wc_red";
		if ( obj.rq.substring(0, 1) == '-' ) {
			hbc = "green";
		}
		if ( date == obj.uuid.substring(0,8) ) {
			html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.uuid+'" host="'+obj.hostTeam+'" guest="'+obj.guestTeam+'">'+
	              '<div class="dz_n dz_nbj fl tal">'+obj.uuid.substring(8)+'</div>'+
	              '<div class="hj_dc fl tal">'+obj.leagueType+'</div>'+
	              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leagueName+'</a></div>'+
	              '<div class="duiz_t duiz_tbj fl tal">'+getAheadTime(obj.betEndTime.substring(11,16))+'<span class="xial tal"></span></div>'+
	              '<div class="duizbj duiz fl tal">'+
					'<span class="fl tal">'+hostname+'</span>'+
	                '<span class="fl tal vsbj '+hbc+'">'+obj.reserved1+'</span>'+
	                '<span class="fr tal">'+guestname+'</span>'+
	           '</div>';
              html += '<div class="duiz_tz fl bcl">'+
		           		'<span class="duiz_tz_l fl bgc" bet="3">'+
	               	'<div class="qiudui fl tal ">主胜</div>'+
	                   '<div class="qiudui fl tal">'+odds[0]+'</div>'+
	               '</span>'+
	          		'<span class="duiz_tz_l fl bgc" bet="0">'+
	               	'<div class="qiudui fl tal">主负</div>'+
	                   '<div class="qiudui fl tal">'+odds[1]+'</div>'+
	               '</span>'+
	          '</div>';
		     html +=    '<div class="duiz_oyx fl tal">'+
		         	'<a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a>'+
		         	'<a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a>'+
		         	'<a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a>'+
		         '</div>'+
		         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[0]+'</div>'+
		         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[1]+'</div>'+
		         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[2]+'</div>'+
		         '<div class="clear"></div></div><div class="clear"></div>';
			
		} else {
			html += '</div></div>';
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			html += '<div class="sais_cc sx_list">'+
			'<div class="sais_ct ">'+
	        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
	        '<div class="sais_ct_r fr">'+
	              '<input type="checkbox"/>'+
	              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>'+
	        '<div class="clear"></div>'+
	      '</div>'+
	      '<div class="sais_ct_l fl link2"><a href="javascript:void 0" class="xt"></a></div>'+
	      '<div class="day_list" style="display:block">'+
	      '<div class="sais_cc">';
			
			html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.uuid+'" host="'+obj.hostTeam+'" guest="'+obj.guestTeam+'">'+
              '<div class="dz_n dz_nbj fl tal">'+obj.uuid.substring(8)+'</div>'+
              '<div class="hj_dc fl tal">'+obj.leagueType+'</div>'+
              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leagueName+'</a></div>'+
              '<div class="duiz_t duiz_tbj fl tal">'+getAheadTime(obj.betEndTime.substring(11,16))+'<span class="xial tal"></span></div>'+
              '<div class="duizbj duiz fl tal">'+
				'<span class="fl tal">'+hostname+'</span>'+
                '<span class="fl tal vsbj '+hbc+'">'+obj.reserved1+'</span>'+
                '<span class="fr tal">'+guestname+'</span>'+
           '</div>';
              html += '<div class="duiz_tz fl bcl">'+
		           		'<span class="duiz_tz_l fl bgc" bet="3">'+
	               	'<div class="qiudui fl tal ">主胜</div>'+
	                   '<div class="qiudui fl tal">'+odds[0]+'</div>'+
	               '</span>'+
	          		'<span class="duiz_tz_l fl bgc" bet="0">'+
	               	'<div class="qiudui fl tal">主负</div>'+
	                   '<div class="qiudui fl tal">'+odds[1]+'</div>'+
	               '</span>'+
	          '</div>';
	     html += '<div class="duiz_oyx fl tal">'+
	     '<a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a>'+
         	'<a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a>'+
         	'<a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a>'+
	         '</div>'+
	         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[0]+'</div>'+
	         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[1]+'</div>'+
	         '<div class="duiz_s duiz_sbj fl tal">'+averOdds[2]+'</div>'+
	         '<div class="clear"></div></div><div class="clear"></div>';
			
			if ( i == schedules.length - 1 ) {
				html += '</div></div>';
			}
		}
	}
	$(html).appendTo($("#accordion"));
	
	createLsHtml(schedules);

}
$(document).ready(function () {
	callback();
	
	// 显示已截止
	$(".sais_ct_r").find("input[type=checkbox]").live('click', function(){
		var ndate = $("#ndateValId").val();
		if ( $(this).attr("checked") ) {
			$(this).parent().parent().parent().find(".sai_c").each(function(index){
				
				if ( dateUtils.formatGuessDate(guess.getStopTime($(this).attr("id")), $("#aheadTimeId").val()) <= ndate ) {
					$(this).show();
				}
			});
		} else {
			$(this).parent().parent().parent().find(".sai_c").each(function(index){
				if ( dateUtils.formatGuessDate(guess.getStopTime($(this).attr("id")), $("#aheadTimeId").val()) <= ndate ) {
					$(this).hide();
				}
			});
		}
	});
	
	// 选中事件
	// 选中彩果事件
	$("span.bgc").live('click',function() {
		if ( $(this).hasClass("link") ) {
			return false;
		}
		if ( $(this).html().indexOf('--') > -1 ) {
			return false;
		} else {
			if ( $(this).hasClass("active") ) {
				$(this).removeClass("active");
			} else {
				$(this).addClass("active");
			}
			calculate();
		}
	});
	// 开赛时间/截止时间 
	$("#showStartTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStartTime($(this).attr("id"));
			$(this).children().eq(3).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	$("#showStopTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStopTime($(this).attr("id"));
			$(this).children().eq(3).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	
	// 倍数控制事件 begin
	$("#multipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			calculate();
		}
	});
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v) > 1 ) {
			$("#multipleId").val(parseInt(v)-1);
			calculate();
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v)+1);
		calculate();
	});
	// 倍数控制事件 end
	
	$("#passAreaId").find("input[type=checkbox]").click(function(){
		calculate();
	});
	
	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
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
						// 登录
						$(".openlogin").click();
					} else {
						var pay = parseFloat($("#betMoneyId").html());
						/*var balance = parseFloat(data);
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {*/
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							$("#showBalDivId").html(formatCurrency(data)+"元");// 余额显示
							var passString = "";
							$("#sureSchPanalId").empty();
							if ( $("#pageNameId").val() != "dssc" ) { // 单式上传
								// 填充数据
								var html = '<tr>'+
								    '<th width="15%">赛事编号</th>'+
								    '<th width="25%">主队 VS 客队</th>'+
								    '<th width="52%">投注内容</th>'+
								    '<th width="8%">胆</th>'+
								  '</tr>';	// 头部
								$("#betSelAreaId").find("tr").each(function(index){
									html += '<tr>'+
									    '<td>'+$(this).children().eq(0).html()+'</td>'+
									    '<td>'+$(this).children().eq(1).html()+'</td><td>';
									$(this).children().eq(2).children().each(function(index){
										html += '<i>'+$(this).html()+'</i>';
									});
									html += '</td>';
									if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
										html += '<td>胆</td></tr>';
									} else {
										html += '<td></td></tr>';
									}
								});
								$(html).appendTo($("#sureSchPanalId"));
								$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
									var selected = parseInt($("#schudleSelId").html());
									var cLen = parseInt($(this).val().split("c")[0]);
									if ( cLen <= selected ) {
										passString += $(this).val() + ",";
									}
								});
								passString = passString.substring(0, passString.length - 1);
							} else {
								$('<tr><td align=left><font color=red>*方案为文件上传</font></td></tr>').appendTo($("#sureSchPanalId"));
								$("#passShowId").html($("input[type=radio][name=dsPtName]:checked").val()+"串1");
							}
							
							if ( "" != passString ) {
								$("#passShowId").html(passString.replaceAll("c", "串"));
							}
							
							var multiple = $("#multipleId").val();
							
							$("#sureBetNumId").html(parseInt($("#betMoneyId").html())/parseInt(multiple)/2+"注");
							$("#sureMultipleId").html(multiple + "倍");
							$("#sureBetMoneyId").html($("#betMoneyId").html()+"元");
							
							$("input[name=buyType]").eq(0).click();
						//}
						
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
					var pay = parseFloat($("#betMoneyId").html());
					var oo = $("input[name=buyType]:checked").val();
					var balance = parseFloat(data);
					if ( (pay > balance) && oo == "1") {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						if ( oo == "1" ) {
							if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
								dsscFormSubmit();
							} else {
								formSubmit();
							}
						} else if ( oo == "3" ) {
							if ( $("#pageNameId").val() == "dssc" ) { // 单式上传
								hem.dsSubmitForm();
							} else {
								hem.submitForm();
							}
						}
						$("#loginCloseBtnId").click();
						$("#returnModId").click();
					}
				}
		    }
		});
		
	});
	
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
	
	// 合买事件end
});

function calculate() {
	var selected = 0;
	var pLimited = 15;	// 过关限制
	var selHtml = "";
	$("#betSelAreaId").empty();
	$("#accordion .sai_c").each(function(index){
		if ( $(this).find("span.active").length > 0 ) {
			selected++;
			var date = $(this).attr("id");
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
			selHtml += '<tr id="'+date+'">'+
	            '<td width="60px" class="Shallow">'+date.substring(8)+'</td>'+
	            '<td width="74px">'+$(this).attr("host")+' VS '+$(this).attr("guest")+'</td>'+
	            '<td width="286px">';
			$(this).find("span.active").each(function(index){
				var show = $(this).children().eq(0).html();;
				show += "("+guess.getBetOdds(date,$(this).attr("bet"))+")";
				selHtml += '<a href="javascript:void 0" bet="'+$(this).attr("bet")+'" onclick="removeOneT(this)">'+show+'</a>';
			});
			selHtml +=   '</td>'+
            '<td width="34px"><input type="checkbox" onclick="setDan(this)"></td>'+
            '<td class="Capital"><a href="javascript:void 0" onclick="removeT(this)">x</a></td>'+
          '</tr>';
		}
	});
	$(selHtml).appendTo($("#betSelAreaId"));
	$("#schudleSelId").html(selected);
	selected = selected > pLimited ? pLimited : selected;
	$("#passAreaId").find("input[type=checkbox]").each(function(index){
		var cLen = parseInt($(this).val().split("c")[0]);
		if ( cLen <= selected ) {
			$(this).parent().show();
			$(this).removeAttr("disabled");
		} else {
			$(this).removeAttr("checked");
			$(this).parent().hide();
		}
	});
	
	// 计算注数及其奖金
	calcNum();
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
				
				$(form).find("input[name=playType]").val("1");
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
				
				if($("#highestBonusId").html() == '--')
					$("#highestBonusId").html('0.00');
						
				$(form).find("input[name=theoryBonus]").val($("#highestBonusId").html());
				
				$(form).submit();
			}
		}
	}); 
	
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
	calculate();
}

