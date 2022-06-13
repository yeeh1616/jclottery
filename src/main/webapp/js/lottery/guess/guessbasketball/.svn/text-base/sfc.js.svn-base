/**
 * <p>Desc:竞彩篮球胜分差页面处理</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/6/9 Version 1.0
 */

var dateUtils = new DateUtils();

var guess = new Guess(10, 3);

var betResult = ["客1-5","客6-10","客11-15","客16-20","客21-25","客26+","主1-5","主6-10","主11-15","主16-20","主21-25","主26+"];
var sfResult = ["客胜", "", "", "主胜"];
var rfsfResult = ["(让)客胜", "", "", "(让)主胜"];
var dxfResult = ["大分", "小分"];

function PageControl() {
	
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
			var obj = schedules[i];
			if ( obj.sfcodds == 'null' ) {
				continue;
			}
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
		date = "";
		for ( var i = 0; i < schedules.length; i++ ) {
			var obj = schedules[i];
			if ( obj.sfcodds == 'null' ) {
				continue;
			}
			var averOdds = [];
			if ( obj.overodds == 'null' ) {
				averOdds = ["--","--"];
			} else {
				averOdds = obj.overodds.split(",");
			}
			if ( averOdds.length != 2 ) {
				averOdds[1] = "";
			}
			
			var sfodds = [];
			if ( obj.sfcodds != 'null' ) {
				sfodds = obj.sfcodds.split(",");
			} else {
				sfodds = ["--","--"];
			}
			var spfDg = true;
			var zhcss = i % 2 == 0 ? "" : "shbg";
			if ( date == "" ) {
				date = obj.id.substring(0,8);
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
				html += '<div class="sais_cc sx_list"><div class="sais_ct ">' +
			        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>' +
			        '<div class="sais_ct_r fr">' +
			              '<input type="checkbox"/>' +
			              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>' +
			        '<div class="clear"></div>' +
			      '</div>' +
			      '<div class="sais_ct_l fl link2"><a class="xt"></a></div>' +
			      '<div class="day_list" style="display:block">';
			}
			var visibleHtml = "";
			if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) <= ndate ) {
				visibleHtml = 'style="display:none"';
			}
			if ( date == obj.id.substring(0,8) ) {
				html += '<div class="sf_sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">' +
			        '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>' +
		          '<div class="sf_sai fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>' +
		          '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>' +
		          '<div class="duiz fl tal">' +
						'<span class="fl tal">'+obj.guestname+'</span>' +
		                '<span class="fl tal vs">vs</span>' +
		                '<span class="fr tal">'+obj.hostname+'</span>' +
		           '</div>' ;
				if ( spfDg ) {
					html += '<div class="sf_tzq fl danshi_d">' +
		             '<div class="dan_ico">' +
			          '<i class="triAngle"></i>' +
			          '<i class="text">单</i>' +
			          '</div>' ;
				} else {
					html += '<div class="sf_tzq fl danshi_d">';
				}
				 html +=   		'<div class="sf_tzq_k">' +
	            	'<span>客胜</span>' +
	                '<a href="javascript:void 0" class="bgc" bet="0" betName="客胜1-5">'+sfodds[0]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="1" betName="客胜6-10">'+sfodds[1]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="2" betName="客胜11-15">'+sfodds[2]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="3" betName="客胜16-20">'+sfodds[3]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="4" betName="客胜21-25">'+sfodds[4]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="5" betName="客胜26+">'+sfodds[5]+'</a>' +
	            '</div>' +
	            '<div class="sf_tzq_z">' +
	            	'<span>主胜</span>' +
	                '<a href="javascript:void 0" class="bgc" bet="6" betName="主胜1-5">'+sfodds[6]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="7" betName="主胜6-10">'+sfodds[7]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="8" betName="主胜11-15">'+sfodds[8]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="9" betName="主胜16-20">'+sfodds[9]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="10" betName="主胜21-25">'+sfodds[10]+'</a>' +
	                '<a href="javascript:void 0" class="bgc" bet="11" betName="主胜26+">'+sfodds[11]+'</a>' +
	            '</div>' +
			         '</div>' +
		          '<div class="duiz_oyx fl tal">' +
		          	'<a href="#" class="oyx tal">欧</a>' +
		          	'<a href="#" class="oyx tal">亚</a>' +
		          	'<a href="#" class="oyx tal">析</a>' +
		          '</div>' +
		          //'<div class="sf_tzq_s fl tal"></div>' +
		          '<div class="sf_tzq_s fl tal">'+averOdds[0]+'</div>' +
		          '<div class="sf_tzq_s fl tal">'+averOdds[1]+'</div>' +
		          '<div class="clear"></div>' +
		      '</div>' +
		      '<div class="clear"></div>';
				
				
			} else {
				html += '</div></div>';
				
				date = obj.id.substring(0,8);
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
				
				html += '<div class="sais_cc sx_list"><div class="sais_ct ">' +
			        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>' +
			        '<div class="sais_ct_r fr">' +
			              '<input type="checkbox"/>' +
			              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>' +
			        '<div class="clear"></div>' +
			      '</div>' +
			      '<div class="sais_ct_l fl link2"><a class="xt"></a></div>' +
			      '<div class="day_list" style="display:block">';
				html += '<div class="sf_sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">' +
		        '<div class="dz_n fl tal">'+obj.id.substring(8)+'</div>' +
	          '<div class="sf_sai fl"><a href="javascript:void 0" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>' +
	          '<div class="duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>' +
	          '<div class="duiz fl tal">' +
					'<span class="fl tal">'+obj.guestname+'</span>' +
	                '<span class="fl tal vs">vs</span>' +
	                '<span class="fr tal">'+obj.hostname+'</span>' +
	           '</div>' ;
			if ( spfDg ) {
				html += '<div class="sf_tzq fl danshi_d">' +
	             '<div class="dan_ico">' +
		          '<i class="triAngle"></i>' +
		          '<i class="text">单</i>' +
		          '</div>' ;
			} else {
				html += '<div class="sf_tzq fl danshi_d">';
			}
			 html +=   		'<div class="sf_tzq_k">' +
            	'<span>客胜</span>' +
                '<a href="javascript:void 0" class="bgc" bet="0" betName="客胜1-5">'+sfodds[0]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="1" betName="客胜6-10">'+sfodds[1]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="2" betName="客胜11-15">'+sfodds[2]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="3" betName="客胜16-20">'+sfodds[3]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="4" betName="客胜21-25">'+sfodds[4]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="5" betName="客胜26+">'+sfodds[5]+'</a>' +
            '</div>' +
            '<div class="sf_tzq_z">' +
            	'<span>主胜</span>' +
                '<a href="javascript:void 0" class="bgc" bet="6" betName="主胜1-5">'+sfodds[6]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="7" betName="主胜6-10">'+sfodds[7]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="8" betName="主胜11-15">'+sfodds[8]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="9" betName="主胜16-20">'+sfodds[9]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="10" betName="主胜21-25">'+sfodds[10]+'</a>' +
                '<a href="javascript:void 0" class="bgc" bet="11" betName="主胜26+">'+sfodds[11]+'</a>' +
            '</div>' +
		         '</div>' +
	          '<div class="duiz_oyx fl tal">' +
	          	'<a href="#" class="oyx tal">欧</a>' +
	          	'<a href="#" class="oyx tal">亚</a>' +
	          	'<a href="#" class="oyx tal">析</a>' +
	          '</div>' +
	          //'<div class="sf_tzq_s fl tal"></div>' +
	          '<div class="sf_tzq_s fl tal">'+averOdds[0]+'</div>' +
	          '<div class="sf_tzq_s fl tal">'+averOdds[1]+'</div>' +
	          '<div class="clear"></div>' +
	      '</div>' +
	      '<div class="clear"></div>';
				if ( i == schedules.length - 1 ) {
					html += '</div></div>';
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
		var pLimited = 4;	
		var selHtml = "";
		$("#betSelAreaId").empty();
		$("#accordion .sf_sai_c ").each(function(index){
			if ( $(this).find("a.active").length > 0 ) {
				selected++;
				var date = $(this).attr("id");
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
				
				selHtml += '<tr id="'+date+'">'+
		            '<td width="60px" class="Shallow">'+dateUtils.getWeekDay2(dd)+date.substring(8)+'</td>'+
		            '<td width="74px">'+$(this).attr("guest")+' VS '+$(this).attr("host")+'</td>'+
		            '<td width="286px">';
				$(this).find("a.active").each(function(index){
					var show = $(this).attr("betName");
					show += "("+guess.getBetOdds(date,$(this).attr("bet"))+")";
					selHtml += '<a href="javascript:void 0" bet="'+$(this).attr("bet")+'" onclick="removeOneT(this)">'+show+'</a>';
				});
				selHtml +=   '</td>'+
	            '<td width="34px"><input type="checkbox" onclick="setDan(this)" ></td>'+
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

var guessHhgg = new PageControl();

$(document).ready(function () {
	
	guessHhgg.loadSchedules();
	
	// 选中彩果事件
	$("a.bgc").click(function() {
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
	
});

