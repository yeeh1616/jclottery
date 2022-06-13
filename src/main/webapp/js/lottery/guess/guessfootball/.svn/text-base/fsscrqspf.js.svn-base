/**
 * <p>Desc:竞彩足球胜平负新版页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/6/8 Version 1.0
 */

var dateUtils = new DateUtils();

var guess = new Guess(9, 2);

function GuessFootballHhgg() {
	
	/**
	 * 装载赛程
	 */
	this.loadSchedules = function() {
		guess.init();
		
		var html = '';
		var date = "";
		
		var ndate = $("#ndateValId").val();
		
		var counterMap = new Hashtable();
		var stopCounterMap = new Hashtable();
		for ( var i = 0; i < schedules.length; i++ ) {
			
			date = schedules[i].id.substring(0,8);
			var obj = schedules[i];
			if ( obj.rqspfggodds == 'null' ) {
				continue;
			}
			if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) > ndate ) {
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
			if ( obj.rqspfggodds == 'null' ) {
				continue;
			}
			var averOdds = [];
			if ( obj.overodds == 'null' ) {
				averOdds = ["--","--","--"];
			} else {
				averOdds = obj.overodds.split(",");
			}
			var spfOdds = [];
			if ( obj.rqspfggodds == 'null' ) {
				spfOdds = ["不受注","不受注","不受注"];
			} else {
				spfOdds = obj.rqspfggodds.split(",");
			}
			var spfDg = false;
			if ( obj.rqspfdgodds != 'null' ) {
				spfDg = true;
			}
			
			var zhcss = i % 2 == 0 ? "" : "shbg";
			var hbc = "wc_red";
			if ( obj.ggrq.substring(0, 1) == '-' ) {
				hbc = "green";
			}
			
			if ( i == 0 ) {
				date = obj.id.substring(0,8);
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
			if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) <= ndate ) {
				visibleHtml = 'style="display:none"';
			}
			var spfnodocss = "";
			/*if ( obj.spfggodds == 'null') {
				spfnodocss = 'style="background:#f5f5f5"';
			}*/
			if ( date == obj.id.substring(0,8) ) {
				html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
						              '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>'+
						              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
						              '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
						              '<div class="w_duiz fl tal"> <span class="fl tal">'+obj.hostname+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+obj.guestname+'</span> </div>';
				if ( spfDg ) {
					html += '<div class="qr_wsj_t danshi_d fl">'+
		              '<div class="dan_ico">'+
			          '<i class="triAngle"></i>'+
			          '<i class="text">单</i>'+
			          '</div>';
				} else {
					html += '<div class="qr_wsj_t fl">';
				}
				html +=		     '<div class="qr_wsj_tln fl '+hbc+'">'+obj.ggrq+'</div>'+
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
				date = obj.id.substring(0,8);
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
				html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
					              '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>'+
					              '<div class="duiz_n fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
					              '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
					              '<div class="w_duiz fl tal"> <span class="fl tal">'+obj.hostname+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+obj.guestname+'</span> </div>';
				if ( spfDg ) {
				html += '<div class="qr_wsj_t danshi_d fl">'+
					'<div class="dan_ico">'+
					'<i class="triAngle"></i>'+
					'<i class="text">单</i>'+
					'</div>';
				} else {
					html += '<div class="qr_wsj_t fl">';
				}
				html +=		     '<div class="qr_wsj_tln fl '+hbc+'">'+obj.ggrq+'</div>'+
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
		
		createLsHtml();
	}
	
	/**
	 * 注数及其最高奖金计算
	 */
	this.calc = function() {
		var selected = 0;
		var pLimited = 8;	// 过关限制：含总进球最大过6关，含比分和半全场过4关，其他过8关
		var selHtml = "";
		$("#betSelAreaId").empty();
		$("#accordion .sai_c").each(function(index){
			if ( $(this).find("div.active").length > 0  ) {
				selected++;
				var date = $(this).attr("id");
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
				
				selHtml += '<tr id="'+date+'">'+
		            '<td width="60px" class="Shallow">'+dateUtils.getWeekDay2(dd)+date.substring(8)+'</td>'+
		            '<td width="74px">'+$(this).attr("host")+' VS '+$(this).attr("guest")+'</td>'+
		            '<td width="286px">';
				$(this).find("div.active").each(function(index){
					var show = $(this).attr("betName") + "["+guess.getGgRqOrRf(date)+"]";
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
		
		calculate();
	}
}

var guessHhgg = new GuessFootballHhgg();

$(document).ready(function () {
	
	guessHhgg.loadSchedules();
	
	// 选中彩果事件
	$("div.bgc").click(function() {
		if ( $(this).html().indexOf('--') > -1 ||  $(this).html().indexOf('不受注') > -1 ) {
			return false;
		} else {
			if ( $(this).hasClass("active") ) {
				$(this).removeClass("active");
			} else {
				$(this).addClass("active");
			}
			guessHhgg.calc();
		}
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
	
	$("#fsscBtnId").click(function(){
		if ( $("#betMoneyId").html() != '0' ) {
			var betCode = "";
			var dan = false;
			$("#betSelAreaId").find("tr").each(function(index){
				betCode += $(this).attr("id") + ":";
				$(this).find("td").eq(2).children().each(function(index){
					betCode += $(this).attr("bet") + ",";
				});
				if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
					betCode = betCode.substring(0, betCode.length - 1) + ":2|";
					dan = true;
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
			if ( passString != "" && !dan ) {
				passString = passString.substring(0, passString.length - 1);
				passString =  guess.optimizePassType(betCode.split("|").length, passString, betCode);
			} else if ( passString != ""){
				passString = passString.substring(0, passString.length - 1);
			}
			
			var licenseId = $("#licenseId").val();
			var orderId = getMethodParameter("orderId");
			var multiple = $("#multipleId").val();
			var betNum = parseInt($("#betMoneyId").html())/parseInt(multiple)/2;
			$.ajax({
			    type: "post",
			    url: "/lottery/frsFsUpload.do",
			    async: false,
			    dataType: "json",
			    data: "fsscFlag=1&"+"licenseId="+licenseId+"&betCode="+betCode+"&orderId="+orderId+"&playId="+guess.playId+"&passType="+passString+"&betNum="+betNum,
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if( data.errCode == 0 ){
						layer.alert(data.message,0);
						return false;
					}
					layer.alert("号码上传成功！",0);
				}
			});
		}
	});
});

function getMethodParameter(name) {
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}