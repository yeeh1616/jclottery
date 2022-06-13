/**
 * <p>Desc:竞彩足球胜平负新版页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/6/8 Version 1.0
 */

var dateUtils = new DateUtils();

var guess = new Guess(9, 6);

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
			var averOdds = [];
			if ( obj.overodds == 'null' ) {
				averOdds = ["--","--","--"];
			} else {
				averOdds = obj.overodds.split(",");
			}
			var spfOdds = [];
			if ( obj.spfggodds == 'null' ) {
				spfOdds = ["不受注","不受注","不受注"];
			} else {
				spfOdds = obj.spfggodds.split(",");
			}
			var spfDg = false;
			if ( obj.spfdgodds != 'null' ) {
				spfDg = true;
			}
			var rqSpfOdds = [];
			if ( obj.rqspfggodds == 'null' ) {
				rqSpfOdds = ["不受注","不受注","不受注"];
			} else {
				rqSpfOdds = obj.rqspfggodds.split(",");
			}
			var rqDg = false;
			if ( obj.rqspfdgodds != 'null' ) {
				rqDg = true;
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
			        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
			        '<div class="sais_ct_r fr">'+
			              '<input type="checkbox"/>'+
			              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>'+
			        '<div class="clear"></div>'+
			      '</div>'+
			      '<div class="sais_ct_l fl link2"><a href="javascript:void 0" class="xt"></a></div>'+
			      '<div class="day_list" style="display:block"><div class="sais_cc">';
			}
			var visibleHtml = "";
			if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) <= ndate ) {
				visibleHtml = 'style="display:none"';
			}
			var spfnodocss = "";
			var rqspfnodocss = "";
			if ( obj.spfggodds == 'null') {
				spfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.rqspfggodds == 'null') {
				rqspfnodocss = 'style="background:#f5f5f5"';
			}
			if ( date == obj.id.substring(0,8) ) {
				
				html += ''+
		              '<div class="sai_c_sc '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
		              '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>'+
	            '<div class="duiz_n_sc fl" ><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
	            '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
	            '<div class="w_duiz fl tal"> <span class="fl tal">'+obj.hostname+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+obj.guestname+'</span> </div>'+
	            '<div class="qr_wsj fl">';
				if ( spfDg ) {
					html += '<div class="qr_wsj_t danshi_d">'+
					'<div class="dan_ico">'+
			          '<i class="triAngle"></i>'+
			          '<i class="text">单</i>'+
			          '</div>';
				} else {
	              html += '<div class="qr_wsj_t">';
				}
	            html += '<div class="qr_wsj_tln fl">0</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="1-3" betName="主胜" '+spfnodocss+'>'+spfOdds[0]+'</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="1-1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="1-0" betName="主负" '+spfnodocss+'>'+spfOdds[2]+'</div>'+
	              '</div>';
	            if ( rqDg ) {
					html += '<div class="qr_wsj_t danshi_d">'+
					'<div class="dan_ico">'+
			          '<i class="triAngle"></i>'+
			          '<i class="text">单</i>'+
			          '</div>';
				} else {
	              html += '<div class="qr_wsj_t">';
				}
	            html += '<div class="qr_wsj_tln fl '+hbc+'">'+obj.ggrq+'</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="2-3" betName="主胜" '+rqspfnodocss+'>'+rqSpfOdds[0]+'</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="2-1" betName="平" '+rqspfnodocss+'>'+rqSpfOdds[1]+'</div>'+
	                '<div class="qr_wsj_tcn fl bgc" bet="2-0" betName="主负" '+rqspfnodocss+'>'+rqSpfOdds[2]+'</div>'+
	              '</div>'+
	            '</div>'+
	            '<div class="diz_oyx fl tal"> <a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a> <a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a> <a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a> </div>'+
	            '<div class="duizw_s fl tal">'+averOdds[0]+'</div>'+
	            '<div class="duizw_s fl tal">'+averOdds[1]+'</div>'+
	            '<div class="duizw_s fl tal">'+averOdds[2]+'</div>'+
	            '<div class="clear"></div>'+
	          '</div>';
	            
	            if ( i == schedules.length - 1 ) {
					html += '</div></div></div>';
				}
				
			} else {
				html += '</div></div></div>';
				date = obj.id.substring(0,8);
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
			      '<div class="day_list" style="display:block">';
				
				html += '<div class="sais_cc">'+
			              '<div class="sai_c_sc '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
			              '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>'+
		          '<div class="duiz_n_sc fl" ><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
		          '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
		          '<div class="w_duiz fl tal"> <span class="fl tal">'+obj.hostname+'</span> <span class="fl tal vs">vs</span> <span class="fr tal">'+obj.guestname+'</span> </div>'+
		          '<div class="qr_wsj fl">';
					if ( spfDg ) {
						html += '<div class="qr_wsj_t danshi_d">'+
						'<div class="dan_ico">'+
				          '<i class="triAngle"></i>'+
				          '<i class="text">单</i>'+
				          '</div>';
					} else {
		            html += '<div class="qr_wsj_t">';
					}
		          html += '<div class="qr_wsj_tln fl">0</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="1-3" betName="主胜" '+spfnodocss+'>'+spfOdds[0]+'</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="1-1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="1-0" betName="主负" '+spfnodocss+'>'+spfOdds[2]+'</div>'+
		            '</div>';
		          if ( rqDg ) {
						html += '<div class="qr_wsj_t danshi_d">'+
						'<div class="dan_ico">'+
				          '<i class="triAngle"></i>'+
				          '<i class="text">单</i>'+
				          '</div>';
					} else {
		            html += '<div class="qr_wsj_t">';
					}
		          html += '<div class="qr_wsj_tln fl '+hbc+'">'+obj.ggrq+'</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="2-3" betName="主胜" '+rqspfnodocss+'>'+rqSpfOdds[0]+'</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="2-1" betName="平" '+rqspfnodocss+'>'+rqSpfOdds[1]+'</div>'+
		              '<div class="qr_wsj_tcn fl bgc" bet="2-0" betName="主负" '+rqspfnodocss+'>'+rqSpfOdds[2]+'</div>'+
		            '</div>'+
		          '</div>'+
		          '<div class="diz_oyx fl tal"> <a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a> <a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a> <a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a> </div>'+
		          '<div class="duizw_s fl tal">'+averOdds[0]+'</div>'+
		          '<div class="duizw_s fl tal">'+averOdds[1]+'</div>'+
		          '<div class="duizw_s fl tal">'+averOdds[2]+'</div>'+
		          '<div class="clear"></div>'+
		        '</div>';
				
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
		$("#accordion .sai_c_sc ").each(function(index){
			if ( $(this).find("div.active").length > 0  ) {
				selected++;
				var date = $(this).attr("id");
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
				
				selHtml += '<tr id="'+date+'">'+
		            '<td width="60px" class="Shallow">'+dateUtils.getWeekDay2(dd)+date.substring(8)+'</td>'+
		            '<td width="74px">'+$(this).attr("host")+' VS '+$(this).attr("guest")+'</td>'+
		            '<td width="286px">';
				$(this).find("div.active").each(function(index){
					var show = $(this).attr("betName");
					if ( $(this).attr("bet").split("-")[0] == "2" ) {
						show += "["+guess.getGgRqOrRf(date)+"]";
					}
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
	
	// 隐藏奖金明细
	//$("#lookBonusBtnId").hide();
	
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
		$("#accordion").find(".sai_c_sc").each(function(index){
			var startTime = guess.getStartTime($(this).attr("id"));
			$(this).children().eq(2).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	$("#showStopTimeId").live('click', function(){
		$("#accordion").find(".sai_c_sc").each(function(index){
			var startTime = guess.getStopTime($(this).attr("id"));
			$(this).children().eq(2).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
});

