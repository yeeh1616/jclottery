
var dateUtils = new DateUtils();
var guess = new SingleSchedule(2);
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
		
		date = schedules[i].uuid.substring(0,8);
		var obj = schedules[i];
		if ( obj.spfOdds == 'null' ) {
			continue;
		}
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
		if ( obj.spfOdds == 'null' ) {
			continue;
		}
		var averOdds = [];
		if ( obj.averageOdds == 'null' ) {
			averOdds = ["--","--","--"];
		} else {
			averOdds = obj.averageOdds.split(",");
		}
		var spfOdds = obj.spfOdds.split(",");
		for ( var j = 0; j < spfOdds.length; j++ ) {
			if ( spfOdds[j] == '' ) {
				spfOdds[j] = '--';
			}
		}
		var spfDg = false;
		
		var zhcss = i % 2 == 0 ? "" : "shbg";
		var hbc = "wc_red";
		if ( obj.rq.substring(0, 1) == '-' ) {
			hbc = "green";
		}
		if ( obj.rq == '0' ) {
			hbc = "";
		}
		
		if ( i == 0 || date == "") {
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			html += '<div class="sais_cc sx_list">'+
						'<div class="sais_ct ">'+
			        '<div class="sais_ct_c fl" style="margin-left:50px"><a href="javascript:void 0"><span class="tme"></span>'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
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
		var spfnodocss = "";
		var hostTeam = obj.hostTeam, guestTeam = obj.guestTeam;
		if ( hostTeam.indexOf(']') > -1 ) {
			var h = hostTeam.substring(hostTeam.indexOf(']')+1);
			if ( h.length > 2 ) {
				hostTeam = hostTeam.substring(0,hostTeam.indexOf(']')+1)+h.substring(0, 2);
			}
		}
		if ( guestTeam.indexOf('[') > -1 ) {
			var h = guestTeam.substring(0,guestTeam.indexOf('['));
			if ( h.length > 2 ) {
				guestTeam = h.substring(0, 2) + guestTeam.substring(guestTeam.indexOf('['));
			}
		}
		if ( date == obj.uuid.substring(0,8) ) {
			html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.uuid+'" host="'+obj.hostTeam+'" guest="'+obj.guestTeam+'">'+
					              '<div class="dz_n fl tal">'+obj.uuid.substring(8)+'</div>'+
					              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leagueName+'</a></div>'+
					              '<div class="duiz_t fl tal">'+getAheadTime(obj.betEndTime.substring(11,16))+'<span class="xial tal"></span></div>'+
					              '<div class="w_duiz fl tal"> <span class="fl tal">'+hostTeam+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+guestTeam+'</span> </div>';
			if ( spfDg ) {
				html += '<div class="qr_wsj_t danshi_d fl">'+
	              '<div class="dan_ico">'+
		          '<i class="triAngle"></i>'+
		          '<i class="text">单</i>'+
		          '</div>';
			} else {
				html += '<div class="qr_wsj_t fl">';
			}
			html +=		     '<div class="qr_wsj_tln fl '+hbc+'">'+obj.rq+'</div>'+
					                '<div class="qr_wsj_tcn fl bgc" bet="3" betName="主胜" '+spfnodocss+'>'+spfOdds[0]+'</div>'+
					                '<div class="qr_wsj_tcn fl bgc" bet="1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</div>'+
					                '<div class="qr_wsj_tcn fl bgc" bet="0" betName="主负" '+spfnodocss+'>'+spfOdds[2]+'</div>'+
					          '</div>'+
					              '<div class="duiz_oyx fl tal"> <a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a> <a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a> <a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a> </div>'+
					              '<div class="duiz_s fl tal">'+averOdds[0]+'</div>'+
					              '<div class="duiz_s fl tal">'+averOdds[1]+'</div>'+
					              '<div class="duiz_s fl tal">'+averOdds[2]+'</div>'+
					              '<div class="clear"></div>'+
					            '</div>'+
	            '<div class="clear"></div>';
			
		} else {
			html += '</div></div></div>';
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			html += '<div class="sais_cc sx_list">'+
					'<div class="sais_ct ">'+
		        '<div class="sais_ct_c fl" style="margin-left:50px"><a href="javascript:void 0"><span class="tme"></span>'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
		        '<div class="sais_ct_r fr">'+
		              '<input type="checkbox"/>'+
		              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>'+
		        '<div class="clear"></div>'+
		      '</div>'+
			'<div class="sais_ct_l fl link2"><a href="javascript:void 0" class="xt"></a></div>'+
		      '<div class="day_list" style="display:block">'+
		      '<div class="sais_cc">';
			html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.uuid+'" host="'+obj.hostTeam+'" guest="'+obj.guestTeam+'">'+
				              '<div class="dz_n fl tal">'+obj.uuid.substring(8)+'</div>'+
				              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leagueName+'</a></div>'+
				              '<div class="duiz_t fl tal">'+getAheadTime(obj.betEndTime.substring(11,16))+'<span class="xial tal"></span></div>'+
				              '<div class="w_duiz fl tal"> <span class="fl tal">'+hostTeam+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+ guestTeam+'</span> </div>';
			if ( spfDg ) {
			html += '<div class="qr_wsj_t danshi_d fl">'+
				'<div class="dan_ico">'+
				'<i class="triAngle"></i>'+
				'<i class="text">单</i>'+
				'</div>';
			} else {
				html += '<div class="qr_wsj_t fl">';
			}
			html +=		     '<div class="qr_wsj_tln fl '+hbc+'">'+obj.rq+'</div>'+
				                '<div class="qr_wsj_tcn fl bgc" bet="3" betName="主胜" '+spfnodocss+'>'+spfOdds[0]+'</div>'+
				                '<div class="qr_wsj_tcn fl bgc" bet="1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</div>'+
				                '<div class="qr_wsj_tcn fl bgc" bet="0" betName="主负" '+spfnodocss+'>'+spfOdds[2]+'</div>'+
				          '</div>'+
				              '<div class="duiz_oyx fl tal"> <a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a> <a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a> <a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a> </div>'+
				              '<div class="duiz_s fl tal">'+averOdds[0]+'</div>'+
				              '<div class="duiz_s fl tal">'+averOdds[1]+'</div>'+
				              '<div class="duiz_s fl tal">'+averOdds[2]+'</div>'+
				              '<div class="clear"></div>'+
				            '</div>'+
			'<div class="clear"></div>';
			
			if ( i == schedules.length - 1 ) {
				html += '</div></div></div>';
			}
		}
	}
	$(html).appendTo($("#accordion"));
	createLsHtml(schedules);
}
$(document).ready(function () {
	callback();
	/*$.ajax({
	    type: "post",
	    url: "http://101.200.213.247:9380/global/schudle/21/bjdc.js",
	    dataType: "jsonp",
		jsonp: "jsoncallback",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (schedules){
			
		}
	});*/
	
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
	$("div.bgc").live('click',function() {
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		calculate();
	});
	// 开赛时间/截止时间 
	$("#showStartTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStartTime($(this).attr("id"));
			$(this).children().eq(2).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	$("#showStopTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStopTime($(this).attr("id"));
			$(this).children().eq(2).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
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
	
	// 进入在线过滤
	$("#filterBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
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
			var hasCombP = "0";
			$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
				var selected = parseInt($("#schudleSelId").html());
				var cLen = parseInt($(this).val().split("c")[0]);
				if ( cLen <= selected ) {
					passString += $(this).val() + ",";
				}
				if ( parseInt($(this).val().split("c")[1]) > 1 ) {
					hasCombP = "1";
				}
			});
			if ( hasCombP == "1" ) {
				layer.alert("不支持组合过关！",0);
				return false;
			}
			if ( passString == "" ) {
				return false;
			}
			passString = passString.substring(0, passString.length - 1);
			var form = $("<form action='/lottery/indexFilter.jhtml' method='post' target='_blank'>" +
					"<input type='hidden' name='betCode' value='"+betCode+"'/>"+
					"<input type='hidden' name='passType' value='"+passString+"'/>"+
					"<input type='hidden' name='playId' value='"+guess.playId+"'/>"+
					"<input type='hidden' name='licenseId' value='21'/>"+
					"</form>");
			$(form).appendTo($("body"));
			$(form).submit();
			$(form).remove();
		} else {
			layer.alert("请先投注！",0);
		}
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
});

function calculate() {
	var selected = 0;
	var pLimited = 15;	// 过关限制
	var selHtml = "";
	$("#betSelAreaId").empty();
	$("#accordion .sai_c").each(function(index){
		if ( $(this).find("div.active").length > 0 ) {
			selected++;
			var date = $(this).attr("id");
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
			selHtml += '<tr id="'+date+'">'+
	            '<td width="60px" class="Shallow">'+date.substring(8)+'</td>'+
	            '<td width="74px">'+$(this).attr("host")+' VS '+$(this).attr("guest")+'</td>'+
	            '<td width="286px">';
			$(this).find("div.active").each(function(index){
				var show = $(this).attr("betname");
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
