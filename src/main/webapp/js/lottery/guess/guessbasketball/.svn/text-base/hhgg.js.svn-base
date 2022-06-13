/**
 * <p>Desc:竞彩篮球混合过关页面处理</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/4/15 Version 1.0
 */

var dateUtils = new DateUtils();

var guess = new Guess(10, 6);

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
			if ( obj.sfggodds != 'null' ) {
				sfodds = obj.sfggodds.split(",");
			} else {
				sfodds = ["--","--"];
			}
			var rfsfodds = [];
			var ggrf = '--';
			var guestRf = '--';
			var gbc = "", hbc = "";
			if ( obj.rfsfggodds != 'null' ) {
				ggrf = obj.ggqf;
				if ( ggrf.substring(0, 1) == '-' ) {
					guestRf = "+" + ggrf.substring(1);
					hbc = "n_green";
					gbc = "n_red";
				} else {
					guestRf = "-" + ggrf.substring(1);
					gbc = "n_green";
					hbc = "n_red";
				}
				rfsfodds = obj.rfsfggodds.split(",");
			} else {
				rfsfodds = ["--","--"];
			}
			var dxfodds = [];
			var yszf = '--';
			if ( obj.dxfggodds != 'null' ) {
				yszf = obj.ggyszf;
				dxfodds = obj.dxfggodds.split(",");
			} else {
				dxfodds = ["--","--"];
			}
			var sfcodds = [];
			if ( obj.sfcodds != 'null' ) {
				sfcodds = obj.sfcodds.split(",");
			} else {
				sfcodds = ["--","--","--","--","--","--","--","--","--","--","--","--"];
			}
			var sfnodocss = "";
			var rfsfnodocss = "";
			var sfcnodocss = "";
			var zjqnodocss = "";
			var dxfnodocss = "";
			if ( obj.sfggodds == 'null') {
				sfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.rfsfggodds == 'null') {
				rfsfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.sfcodds == 'null') {
				sfcnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.dxfggodds == 'null') {
				dxfnodocss = 'style="background:#f5f5f5"';
			}
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
				html += '<div class="sai_c new_h" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">' +
			        '<div class="l_dz_n fl tal">'+obj.id.substring(8)+'</div>' +
			        '<div class="l_duiz_n fl"><a href="javascript:void 0" style="background-color:'+obj.bgcolor+'">'+obj.leaguename+'</a></div>' +
			        '<div class="l_duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>' +
			        '<div class="l_duiz fl tal"> <span class="fl tal">'+obj.guestname+'</span> <span class="fl tal vs">vs</span> <span class="fl tal">'+obj.hostname+'</span> </div>' +
			        '<div class="l_duiz_tz fl bcl"> ' +
			          '<span class="l_duiz_tz_l fl ">' +
			          '<div class="l_qiuduil tal bgc" bet="1-0" betName="客胜" '+sfnodocss+'> <a href="javascript:void 0" class="zhus fl">客胜</a><a href="javascript:void 0"class="zhuf fl">'+sfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir tal bgc" bet="1-3" betName="主胜" '+sfnodocss+'> <a href="javascript:void 0" class="zhus fl">主胜</a><a href="javascript:void 0"class="zhuf fl">'+sfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span> ' +
			          
			          '<span class="l_qiudui_wr fl '+hbc+'">'+ggrf+'</span>' +
			           '<span class="l_qiudui_p fl">' +
		           		'<a class="l_qiudui_p bgc tal" bet="2-0" betName="客胜" '+rfsfnodocss+'>'+rfsfodds[1]+'</a>' +
		                '<a class="l_qiudui_p bgc tal" bet="2-3" betName="主胜" '+rfsfnodocss+'>'+rfsfodds[0]+'</a>' +
		           '</span>' +
		           '<span class="l_qiudui_wr fl">'+yszf+'</span>' +
		           '<span class="l_qiudui_p fl">' +
		           		'<a class="l_qiudui_p bgc tal" bet="4-0" betName="大分" '+dxfnodocss+'>大 '+dxfodds[0]+'</a>' +
		                '<a class="l_qiudui_p bgc tal" bet="4-1" betName="小分" '+dxfnodocss+'>小 '+dxfodds[1]+'</a>' +
		           '</span>'+
			          
			          /*'<span class="l_duiz_tz_l fl ">' +
			          '<div class="l_qiuduil tal bgc" bet="2-0" betName="客胜"> <a href="javascript:void 0" class="zhus fl '+gbc+'">'+guestRf+'</a><a href="javascript:void 0"class="zhuf fl">'+rfsfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir  tal bgc" bet="2-3" betName="主胜"><a href="javascript:void 0" class="zhus fl '+hbc+'">'+ggrf+'</a><a href="javascript:void 0"class="zhuf fl">'+rfsfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span> ' +
			          '<span class="l_duiz_tz_l fl">' +
			          '<div class="l_qiuduil tal bgc" bet="4-0" betName="大分"> <a href="javascript:void 0" class="zhus fl">大'+yszf+'</a><a href="javascript:void 0"class="zhuf fl">'+dxfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir tal bgc" bet="4-1" betName="小分"><a href="javascript:void 0" class="zhus fl">小'+yszf+'</a><a href="javascript:void 0"class="zhuf fl">'+dxfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span>' +*/
			          '<span class="zhengt_z bgc link fl"> ' +
			              '<div class="zk_s" style="display:none">15</div><a class=" xxj saisl tal"> </a> ' +
			              '</span>' +
			                  '<div class="submenu sf_qit"> ' +
			                '<div class="f_bif danh">' +
			                      '<div class="bif_name">客胜：</div>' +
			                      '<div class="bi_tz">' +
			                    '<div class="heng">' +
			                          '<div class="c_plant" bet="3-0">' +
			                        '<div class="plant_top">1-5分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[0]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-1">' +
			                        '<div class="plant_top">6-10分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[1]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-2">' +
			                        '<div class="plant_top">11-15分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[2]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-3">' +
			                        '<div class="plant_top">16-20分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[3]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-4">' +
			                        '<div class="plant_top">21-25分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[4]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-5">' +
			                        '<div class="plant_top">26+分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[5]+'</div>' +
			                      '</div>' +
			                        '</div>' +
			                  '</div>' +
			                      '<div class="clear"></div>' +
			                    '</div>' +
			                    '<div class="f_bif danh">' +
			                      '<div class="bif_name">主胜：</div>' +
			                      '<div class="bi_tz">' +
			                    '<div class="heng">' +
			                          '<div class="c_plant" bet="3-6">' +
			                        '<div class="plant_top">1-5分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[6]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-7">' +
			                        '<div class="plant_top">6-10分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[7]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-8">' +
			                        '<div class="plant_top">11-15分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[8]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-9">' +
			                        '<div class="plant_top">16-20分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[9]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-10">' +
			                        '<div class="plant_top">21-25分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[10]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-11">' +
			                        '<div class="plant_top">26+分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[11]+'</div>' +
			                      '</div>' +
			                        '</div>' +
			                  '</div>' +
			                      '<div class="clear"></div>' +
			                    '</div>' +
			              '</div>' +
			        '</div>' +
			        '<div class="l_duiz_oyx fl tal"> <a href="javascript:void 0" class="oyx tal">亚</a> <a href="javascript:void 0" class="oyx tal">析</a> </div>' +
			        '<div class="l_duiz_s fl tal">'+averOdds[0]+' '+averOdds[1]+'</div>' +
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
				html += '<div class="sai_c new_h" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">' +
			        '<div class="l_dz_n fl tal">'+obj.id.substring(8)+'</div>' +
			        '<div class="l_duiz_n fl"><a href="javascript:void 0" style="background-color:'+obj.bgcolor+'">'+obj.leaguename+'</a></div>' +
			        '<div class="l_duiz_t fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>' +
			        '<div class="l_duiz fl tal"> <span class="fl tal">'+obj.guestname+'</span> <span class="fl tal vs">vs</span> <span class="fl tal">'+obj.hostname+'</span> </div>' +
			        '<div class="l_duiz_tz fl bcl"> ' +
			          '<span class="l_duiz_tz_l fl ">' +
			          '<div class="l_qiuduil tal bgc" bet="1-0" betName="客胜" '+sfnodocss+'> <a href="javascript:void 0" class="zhus fl">客胜</a><a href="javascript:void 0"class="zhuf fl">'+sfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir tal bgc" bet="1-3" betName="主胜" '+sfnodocss+'> <a href="javascript:void 0" class="zhus fl">主胜</a><a href="javascript:void 0"class="zhuf fl">'+sfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span> ' +
			          
			          '<span class="l_qiudui_wr fl '+hbc+'">'+ggrf+'</span>' +
			           '<span class="l_qiudui_p fl">' +
		           		'<a class="l_qiudui_p bgc tal" bet="2-0" betName="客胜" '+rfsfnodocss+'>'+rfsfodds[1]+'</a>' +
		                '<a class="l_qiudui_p bgc tal" bet="2-3" betName="主胜" '+rfsfnodocss+'>'+rfsfodds[0]+'</a>' +
		           '</span>' +
		           '<span class="l_qiudui_wr fl">'+yszf+'</span>' +
		           '<span class="l_qiudui_p fl">' +
		           		'<a class="l_qiudui_p bgc tal" bet="4-0" betName="大分" '+dxfnodocss+'>大 '+dxfodds[0]+'</a>' +
		                '<a class="l_qiudui_p bgc tal" bet="4-1" betName="小分" '+dxfnodocss+'>小 '+dxfodds[1]+'</a>' +
		           '</span>'+
		           
			          /*'<span class="l_duiz_tz_l fl ">' +
			          '<div class="l_qiuduil tal bgc" bet="2-0" betName="客胜"> <a href="javascript:void 0" class="zhus fl '+gbc+'">'+guestRf+'</a><a href="javascript:void 0"class="zhuf fl">'+rfsfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir  tal bgc" bet="2-3" betName="主胜"><a href="javascript:void 0" class="zhus fl '+hbc+'">'+ggrf+'</a><a href="javascript:void 0"class="zhuf fl">'+rfsfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span> ' +
			          '<span class="l_duiz_tz_l fl">' +
			          '<div class="l_qiuduil tal bgc" bet="4-0" betName="大分"> <a href="javascript:void 0" class="zhus fl">大'+yszf+'</a><a href="javascript:void 0"class="zhuf fl">'+dxfodds[0]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '<div class="l_qiuduir tal bgc" bet="4-1" betName="小分"><a href="javascript:void 0" class="zhus fl">小'+yszf+'</a><a href="javascript:void 0"class="zhuf fl">'+dxfodds[1]+'</a>' +
			            '<div class="clear"></div>' +
			          '</div>' +
			          '</span>' +*/
			          '<span class="zhengt_z bgc link fl"> ' +
			              '<div class="zk_s" style="display:none">15</div><a class=" xxj saisl tal"> </a> ' +
			              '</span>' +
			                  '<div class="submenu sf_qit"> ' +
			                '<div class="f_bif danh">' +
			                      '<div class="bif_name">客胜：</div>' +
			                      '<div class="bi_tz">' +
			                    '<div class="heng">' +
			                          '<div class="c_plant" bet="3-0">' +
			                        '<div class="plant_top">1-5分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[0]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-1">' +
			                        '<div class="plant_top">6-10分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[1]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-2">' +
			                        '<div class="plant_top">11-15分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[2]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-3">' +
			                        '<div class="plant_top">16-20分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[3]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-4">' +
			                        '<div class="plant_top">21-25分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[4]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-5">' +
			                        '<div class="plant_top">26+分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[5]+'</div>' +
			                      '</div>' +
			                        '</div>' +
			                  '</div>' +
			                      '<div class="clear"></div>' +
			                    '</div>' +
			                    '<div class="f_bif danh">' +
			                      '<div class="bif_name">主胜：</div>' +
			                      '<div class="bi_tz">' +
			                    '<div class="heng">' +
			                          '<div class="c_plant" bet="3-6">' +
			                        '<div class="plant_top">1-5分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[6]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-7">' +
			                        '<div class="plant_top">6-10分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[7]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-8">' +
			                        '<div class="plant_top">11-15分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[8]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-9">' +
			                        '<div class="plant_top">16-20分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[9]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-10">' +
			                        '<div class="plant_top">21-25分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[10]+'</div>' +
			                      '</div>' +
			                          '<div class="c_plant" bet="3-11">' +
			                        '<div class="plant_top">26+分</div>' +
			                        '<div class="plant_bottom">'+sfcodds[11]+'</div>' +
			                      '</div>' +
			                        '</div>' +
			                  '</div>' +
			                      '<div class="clear"></div>' +
			                    '</div>' +
			              '</div>' +
			        '</div>' +
			        '<div class="l_duiz_oyx fl tal"> <a href="javascript:void 0" class="oyx tal">亚</a> <a href="javascript:void 0" class="oyx tal">析</a> </div>' +
			        '<div class="l_duiz_s fl tal">'+averOdds[0]+' '+averOdds[1]+'</div>' +
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
		var pLimited = 8;	
		var selHtml = "";
		$("#betSelAreaId").empty();
		$("#accordion .sai_c").each(function(index){
			if ( $(this).find("div.active,a.active").length > 0 ) {
				selected++;
				var date = $(this).attr("id");
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
				
				selHtml += '<tr id="'+date+'">'+
		            '<td width="60px" class="Shallow">'+dateUtils.getWeekDay2(dd)+date.substring(8)+'</td>'+
		            '<td width="74px">'+$(this).attr("guest")+' VS '+$(this).attr("host")+'</td>'+
		            '<td width="286px">';
				$(this).find("div.active,a.active").each(function(index){
					var show = $(this).attr("betName");
					if ( $(this).attr("bet").split("-")[0] == "2" ) {
						show += "[让]";
					} else if ( $(this).attr("bet").split("-")[0] == "3" ) {
						pLimited = 4;	
						show = betResult[parseInt($(this).attr("bet").split("-")[1])];
					}
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
	$("div.bgc,a.bgc").click(function() {
		if ( $(this).hasClass("link") ) {
			return false;
		}
		if ( $(this).html().indexOf('--') > -1 || $(this).html().indexOf('不受注') > -1 ) {
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
	// 更多投注项单击
	$(".c_plant").click(function(){
		if ( $(this).html().indexOf('--') > -1 ) {
			return false;
		}
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		var clen = $(this).parent().parent().parent().parent().find(".c_plant.active").length;
		if ( clen > 0 ) {
			$(this).parent().parent().parent().parent().prev().children().eq(0).show();
			$(this).parent().parent().parent().parent().prev().children().eq(0).html(clen);
		} else {
			$(this).parent().parent().parent().parent().prev().children().eq(0).hide();
		}
		guessHhgg.calc();
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

