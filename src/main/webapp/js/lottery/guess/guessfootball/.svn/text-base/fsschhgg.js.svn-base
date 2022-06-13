/**
 * <p>Desc:竞彩足球混合过关新版页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/5/25 Version 1.0
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
		
		// 統計一天的對陣數
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
			var rqSpfOdds = [];
			if ( obj.rqspfggodds == 'null' ) {
				rqSpfOdds = ["不受注","不受注","不受注"];
			} else {
				rqSpfOdds = obj.rqspfggodds.split(",");
			}
			var bfOdds = [];
			if ( obj.bfodds == 'null' ) {
				for ( var j = 0; j < 31; j++ ) {
					bfOdds[j] = "--";
				}
			} else {
				bfOdds = obj.bfodds.split(",");
			}
			var zjqOdds = [];
			if ( obj.zjqggodds == 'null' ) {
				for ( var j = 0; j < 8; j++ ) {
					zjqOdds[j] = "--";
				}
			} else {
				zjqOdds = obj.zjqggodds.split(",");
			}
			var bqcOdds = [];
			if ( obj.bqcggodds == 'null' ) {
				for ( var j = 0; j < 9; j++ ) {
					bqcOdds[j] = "--";
				}
			} else {
				bqcOdds = obj.bqcggodds.split(",");
			}
			var zhcss = i % 2 == 0 ? "" : "shbg";
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
			      '<div class="day_list" style="display:block">';
			}
			var visibleHtml = "";
			if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) <= ndate ) {
				visibleHtml = 'style="display:none"';
			}
			var spfnodocss = "";
			var rqspfnodocss = "";
			var bfnodocss = "";
			var zjqnodocss = "";
			var bqcnodocss = "";
			if ( obj.spfggodds == 'null') {
				spfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.rqspfggodds == 'null') {
				rqspfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.bfodds == 'null') {
				bfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.zjqggodds == 'null') {
				zjqnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.bqcggodds == 'null') {
				bqcnodocss = 'style="background:#f5f5f5"';
			}
			var spfdgcss = "";
			var rqdgcss = "";
			if ( obj.spfdgodds != 'null') {
				spfdgcss = '<div class="dan_ico">'+
					'<i class="triAngle"></i>'+
					'<i class="text">单</i>'+
					'</div>';
			}
			if ( obj.rqspfdgodds != 'null') {
				rqdgcss = '<div class="dan_ico">'+
				'<i class="triAngle"></i>'+
				'<i class="text">单</i>'+
				'</div>';
			}
			if ( date == obj.id.substring(0,8) ) {
				
				html += '<div class="sai_c '+zhcss+'" " '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
		              '<div class="xuh fl tal">'+obj.id.substring(8)+'<a href="javascript:void 0" class="yaguan fl" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
		              '<div class="x_l fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
		              '<div class="odds fl"> '+spfdgcss+'<span class="zhengti bgc " bet="1-3" betName="主胜" '+spfnodocss+'>'+
		                '<div class="lian fl bcl tal"></div>'+
		               ' <div class="shui fl tal">'+obj.hostname+'</div>'+
		                '<div class="shu fl tal">'+spfOdds[0]+'</div>'+
		                '</span> <span class="zhengti_s bgc tal" bet="1-1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</span> <span class="zhengti_l bgc tal" bet="1-0" betName="主负" '+spfnodocss+'>'+
		                '<div class="shu fl tal" >'+spfOdds[2]+'</div>'+
		                '<div class="shui fl tal">'+obj.guestname+'</div>'+
		                '<div class="lian fl tal"></div>'+
		                '</span> </div>'+
		                '<div class="x_oyx fl tal"><a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a><a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a><a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a></div>'+
		             ' <div class="bcl odds_n fl"> '+rqdgcss+'<span class="zhengt bgc fl" bet="2-3" betName="主胜" '+rqspfnodocss+'>'+
		               ' <div class="shuy tal">'+obj.hostname.substring(0,2)+'<span class="color">'+obj.ggrq+'</span></div>'+
		               ' <div class="shuiy_r tal" >'+rqSpfOdds[0]+'</div>'+
		                '</span> <span class="zhengt_s bgc tal" bet="2-1" betName="平" '+rqspfnodocss+'>'+rqSpfOdds[1]+'</span> <span class="zhengt_l bgc" bet="2-0" betName="主负" '+rqspfnodocss+'>'+
		                '<div class="shuiy_r tal" >'+rqSpfOdds[2]+'</div>'+
		               ' <div class="shuy tal">'+obj.guestname.substring(0,2)+'</div>'+
		                '</span> <span class="zhengt_z bgc link"> '+
		             ' <div class="zk_s" style="display:none">15</div>'+
		              '<a href="#" class=" xxj saisl tal"> </a> </span>'+ 
		                  '<div class="submenu"> '+
		                '<div class="f_bif">'+
		                      '<div class="bif_name">比分投注</div>'+
		                      '<div class="bi_tz">'+
		                    '<div class="heng">'+
		                          '<div class="c_plant" bet="5-1" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[1]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-2" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[2]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-3" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[3]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-4" '+bfnodocss+'>'+
		                        '<div class="plant_top">3:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[4]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-5" '+bfnodocss+'>'+
		                        '<div class="plant_top">3:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[5]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-6" '+bfnodocss+'>'+
		                        '<div class="plant_top">3:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[6]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-7" '+bfnodocss+'>'+
		                        '<div class="plant_top">4:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[7]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-8" '+bfnodocss+'>'+
		                        '<div class="plant_top">4:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[8]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-9" '+bfnodocss+'>'+
		                        '<div class="plant_top">4:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[9]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-10" '+bfnodocss+'>'+
		                        '<div class="plant_top">5:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[10]+'</div>'+
		                     ' </div>'+
		                          '<div class="c_plant" bet="5-11" '+bfnodocss+'>'+
		                        '<div class="plant_top">5:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[11]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-12" '+bfnodocss+'>'+
		                       ' <div class="plant_top">5:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[12]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-0" '+bfnodocss+'>'+
		                        '<div class="plant_top">胜其它</div>'+
		                        '<div class="plant_bottom">'+bfOdds[0]+'</div>'+
		                      '</div>'+
		                        '</div>'+
		                    '<div class="heng">'+
		                         ' <div class="c_plant" bet="5-14" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:0</div>'+
		                        '<div class="plant_bottom">'+bfOdds[14]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-15" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[15]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-16" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[16]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-17" '+bfnodocss+'>'+
		                        '<div class="plant_top">3:3</div>'+
		                        '<div class="plant_bottom">'+bfOdds[17]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-13" '+bfnodocss+'>'+
		                        '<div class="plant_top">平其它</div>'+
		                        '<div class="plant_bottom">'+bfOdds[13]+'</div>'+
		                      '</div>'+
		                        '</div>'+
		                    '<div class="heng">'+
		                          '<div class="c_plant" bet="5-19" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:1</div>'+
		                        '<div class="plant_bottom">'+bfOdds[19]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-20" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[20]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-21" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:2</div>'+
		                        '<div class="plant_bottom">'+bfOdds[21]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-22" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:3</div>'+
		                        '<div class="plant_bottom">'+bfOdds[22]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-23" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:3</div>'+
		                        '<div class="plant_bottom">'+bfOdds[23]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-24" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:3</div>'+
		                        '<div class="plant_bottom">'+bfOdds[24]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-25" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:4</div>'+
		                        '<div class="plant_bottom">'+bfOdds[25]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-26" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:4</div>'+
		                        '<div class="plant_bottom">'+bfOdds[26]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-27" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:4</div>'+
		                        '<div class="plant_bottom">'+bfOdds[27]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-28" '+bfnodocss+'>'+
		                        '<div class="plant_top">0:5</div>'+
		                        '<div class="plant_bottom">'+bfOdds[28]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-29" '+bfnodocss+'>'+
		                        '<div class="plant_top">1:5</div>'+
		                        '<div class="plant_bottom">'+bfOdds[29]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-30" '+bfnodocss+'>'+
		                        '<div class="plant_top">2:5</div>'+
		                        '<div class="plant_bottom">'+bfOdds[30]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="5-18" '+bfnodocss+'>'+
		                        '<div class="plant_top">负其它</div>'+
		                        '<div class="plant_bottom">'+bfOdds[18]+'</div>'+
		                      '</div>'+
		                        '</div>'+
		                  '</div>'+
		                      '<div class="clear"></div>'+
		                    '</div>'+
		                '<div class="f_bif danh">'+
		                      '<div class="bif_name">总进球投注</div>'+
		                      '<div class="bi_tz">'+
		                    '<div class="heng">'+
		                          '<div class="c_plant" bet="3-0" '+zjqnodocss+'>'+
		                        '<div class="plant_top">0球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[0]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-1" '+zjqnodocss+'>'+
		                        '<div class="plant_top">1球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[1]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-2" '+zjqnodocss+'>'+
		                        '<div class="plant_top">2球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[2]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-3" '+zjqnodocss+'>'+
		                        '<div class="plant_top">3球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[3]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-4" '+zjqnodocss+'>'+
		                        '<div class="plant_top">4球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[4]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-5" '+zjqnodocss+'>'+
		                        '<div class="plant_top">5球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[5]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-6" '+zjqnodocss+'>'+
		                        '<div class="plant_top">6球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[6]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="3-7" '+zjqnodocss+'>'+
		                        '<div class="plant_top">7+球</div>'+
		                        '<div class="plant_bottom">'+zjqOdds[7]+'</div>'+
		                      '</div>'+
		                        '</div>'+
		                  '</div>'+
		                      '<div class="clear"></div>'+
		                    '</div>'+
		                '<div class="f_bif danh">'+
		                      '<div class="bif_name">半全场投注</div>'+
		                      '<div class="bi_tz">'+
		                    '<div class="heng">'+
		                          '<div class="c_plant" bet="4-33" '+bqcnodocss+'>'+
		                        '<div class="plant_top">胜/胜</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[0]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-31" '+bqcnodocss+'>'+
		                        '<div class="plant_top">胜/平</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[1]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-30" '+bqcnodocss+'>'+
		                        '<div class="plant_top">胜/负</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[2]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-13" '+bqcnodocss+'>'+
		                        '<div class="plant_top">平/胜</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[3]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-11" '+bqcnodocss+'>'+
		                        '<div class="plant_top">平/平</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[4]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-10" '+bqcnodocss+'>'+
		                        '<div class="plant_top">平/负</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[5]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-03" '+bqcnodocss+'>'+
		                        '<div class="plant_top">负/胜</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[6]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-01" '+bqcnodocss+'>'+
		                        '<div class="plant_top">负/平</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[7]+'</div>'+
		                      '</div>'+
		                          '<div class="c_plant" bet="4-00" '+bqcnodocss+'>'+
		                        '<div class="plant_top">负/负</div>'+
		                        '<div class="plant_bottom">'+bqcOdds[8]+'</div>'+
		                      '</div>'+
		                        '</div>'+
		                  '</div>'+
		                      '<div class="clear"></div>'+
		                    '</div>'+
		              '</div>'+
		          '</div>'+
		              '<div class="biv fl tal">'+averOdds[0]+'</div>'+
		              '<div class="biv fl tal">'+averOdds[1]+'</div>'+
		              '<div class="biv fl tal">'+averOdds[2]+'</div>'+
		              '<div class="clear"></div>'+
		            '</div>'+
		        '<div class="clear"></div>';
				
			} else {
				html += '</div>';
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
				
				html += '<div class="sai_c '+zhcss+'" " '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
	              '<div class="xuh fl tal">'+obj.id.substring(8)+'<a href="javascript:void 0" class="yaguan fl" style="background: '+obj.bgcolor+'">'+obj.leaguename+'</a></div>'+
	              '<div class="x_l fl tal">'+getAheadTime(obj.stoptime.substring(11,16))+'<span class="xial tal"></span></div>'+
	              '<div class="odds fl"> <span class="zhengti bgc " bet="1-3" betName="主胜" '+spfnodocss+'>'+
	                '<div class="lian fl bcl tal"></div>'+
	               ' <div class="shui fl tal">'+obj.hostname+'</div>'+
	                '<div class="shu fl tal">'+spfOdds[0]+'</div>'+
	                '</span> <span class="zhengti_s bgc tal" bet="1-1" betName="平" '+spfnodocss+'>'+spfOdds[1]+'</span> <span class="zhengti_l bgc tal" bet="1-0" betName="主负" '+spfnodocss+'>'+
	                '<div class="shu fl tal" >'+spfOdds[2]+'</div>'+
	                '<div class="shui fl tal">'+obj.guestname+'</div>'+
	                '<div class="lian fl tal"></div>'+
	                '</span> </div>'+
	                '<div class="x_oyx fl tal"><a href="/datacenter/europ.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">欧</a><a href="/datacenter/asia.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">亚</a><a href="/datacenter/analyse.jhtml?schudlesNo='+obj.schudlesno+'" class="oyx tal" target="_blank">析</a></div>'+
	             ' <div class="bcl odds_n fl"> <span class="zhengt bgc fl" bet="2-3" betName="主胜" '+rqspfnodocss+'>'+
	               ' <div class="shuy tal">'+obj.hostname.substring(0,2)+'<span class="color">'+obj.ggrq+'</span></div>'+
	               ' <div class="shuiy_r tal" >'+rqSpfOdds[0]+'</div>'+
	                '</span> <span class="zhengt_s bgc tal" bet="2-1" betName="平" '+rqspfnodocss+'>'+rqSpfOdds[1]+'</span> <span class="zhengt_l bgc" bet="2-0" betName="主负" '+rqspfnodocss+'>'+
	                '<div class="shuiy_r tal" >'+rqSpfOdds[2]+'</div>'+
	               ' <div class="shuy tal">'+obj.guestname.substring(0,2)+'</div>'+
	                '</span> <span class="zhengt_z bgc link"> '+
	             ' <div class="zk_s" style="display:none">15</div>'+
	              '<a href="#" class=" xxj saisl tal"> </a> </span>'+ 
	                  '<div class="submenu"> '+
	                '<div class="f_bif">'+
	                      '<div class="bif_name">比分投注</div>'+
	                      '<div class="bi_tz">'+
	                    '<div class="heng">'+
	                          '<div class="c_plant" bet="5-1" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[1]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-2" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[2]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-3" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[3]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-4" '+bfnodocss+'>'+
	                        '<div class="plant_top">3:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[4]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-5" '+bfnodocss+'>'+
	                        '<div class="plant_top">3:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[5]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-6" '+bfnodocss+'>'+
	                        '<div class="plant_top">3:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[6]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-7" '+bfnodocss+'>'+
	                        '<div class="plant_top">4:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[7]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-8" '+bfnodocss+'>'+
	                        '<div class="plant_top">4:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[8]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-9" '+bfnodocss+'>'+
	                        '<div class="plant_top">4:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[9]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-10" '+bfnodocss+'>'+
	                        '<div class="plant_top">5:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[10]+'</div>'+
	                     ' </div>'+
	                          '<div class="c_plant" bet="5-11" '+bfnodocss+'>'+
	                        '<div class="plant_top">5:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[11]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-12" '+bfnodocss+'>'+
	                       ' <div class="plant_top">5:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[12]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-0" '+bfnodocss+'>'+
	                        '<div class="plant_top">胜其它</div>'+
	                        '<div class="plant_bottom">'+bfOdds[0]+'</div>'+
	                      '</div>'+
	                        '</div>'+
	                    '<div class="heng">'+
	                         ' <div class="c_plant" bet="5-14" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:0</div>'+
	                        '<div class="plant_bottom">'+bfOdds[14]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-15" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[15]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-16" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[16]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-17" '+bfnodocss+'>'+
	                        '<div class="plant_top">3:3</div>'+
	                        '<div class="plant_bottom">'+bfOdds[17]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-13" '+bfnodocss+'>'+
	                        '<div class="plant_top">平其它</div>'+
	                        '<div class="plant_bottom">'+bfOdds[13]+'</div>'+
	                      '</div>'+
	                        '</div>'+
	                    '<div class="heng">'+
	                          '<div class="c_plant" bet="5-19" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:1</div>'+
	                        '<div class="plant_bottom">'+bfOdds[19]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-20" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[20]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-21" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:2</div>'+
	                        '<div class="plant_bottom">'+bfOdds[21]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-22" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:3</div>'+
	                        '<div class="plant_bottom">'+bfOdds[22]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-23" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:3</div>'+
	                        '<div class="plant_bottom">'+bfOdds[23]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-24" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:3</div>'+
	                        '<div class="plant_bottom">'+bfOdds[24]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-25" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:4</div>'+
	                        '<div class="plant_bottom">'+bfOdds[25]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-26" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:4</div>'+
	                        '<div class="plant_bottom">'+bfOdds[26]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-27" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:4</div>'+
	                        '<div class="plant_bottom">'+bfOdds[27]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-28" '+bfnodocss+'>'+
	                        '<div class="plant_top">0:5</div>'+
	                        '<div class="plant_bottom">'+bfOdds[28]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-29" '+bfnodocss+'>'+
	                        '<div class="plant_top">1:5</div>'+
	                        '<div class="plant_bottom">'+bfOdds[29]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-30" '+bfnodocss+'>'+
	                        '<div class="plant_top">2:5</div>'+
	                        '<div class="plant_bottom">'+bfOdds[30]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="5-18" '+bfnodocss+'>'+
	                        '<div class="plant_top">负其它</div>'+
	                        '<div class="plant_bottom">'+bfOdds[18]+'</div>'+
	                      '</div>'+
	                        '</div>'+
	                  '</div>'+
	                      '<div class="clear"></div>'+
	                    '</div>'+
	                '<div class="f_bif danh">'+
	                      '<div class="bif_name">总进球投注</div>'+
	                      '<div class="bi_tz">'+
	                    '<div class="heng">'+
	                          '<div class="c_plant" bet="3-0" '+zjqnodocss+'>'+
	                        '<div class="plant_top">0球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[0]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-1" '+zjqnodocss+'>'+
	                        '<div class="plant_top">1球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[1]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-2" '+zjqnodocss+'>'+
	                        '<div class="plant_top">2球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[2]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-3" '+zjqnodocss+'>'+
	                        '<div class="plant_top">3球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[3]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-4" '+zjqnodocss+'>'+
	                        '<div class="plant_top">4球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[4]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-5" '+zjqnodocss+'>'+
	                        '<div class="plant_top">5球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[5]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-6" '+zjqnodocss+'>'+
	                        '<div class="plant_top">6球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[6]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="3-7" '+zjqnodocss+'>'+
	                        '<div class="plant_top">7+球</div>'+
	                        '<div class="plant_bottom">'+zjqOdds[7]+'</div>'+
	                      '</div>'+
	                        '</div>'+
	                  '</div>'+
	                      '<div class="clear"></div>'+
	                    '</div>'+
	                '<div class="f_bif danh">'+
	                      '<div class="bif_name">半全场投注</div>'+
	                      '<div class="bi_tz">'+
	                    '<div class="heng">'+
	                          '<div class="c_plant" bet="4-33" '+bqcnodocss+'>'+
	                        '<div class="plant_top">胜/胜</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[0]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-31" '+bqcnodocss+'>'+
	                        '<div class="plant_top">胜/平</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[1]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-30" '+bqcnodocss+'>'+
	                        '<div class="plant_top">胜/负</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[2]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-13" '+bqcnodocss+'>'+
	                        '<div class="plant_top">平/胜</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[3]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-11" '+bqcnodocss+'>'+
	                        '<div class="plant_top">平/平</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[4]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-10" '+bqcnodocss+'>'+
	                        '<div class="plant_top">平/负</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[5]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-03" '+bqcnodocss+'>'+
	                        '<div class="plant_top">负/胜</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[6]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-01" '+bqcnodocss+'>'+
	                        '<div class="plant_top">负/平</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[7]+'</div>'+
	                      '</div>'+
	                          '<div class="c_plant" bet="4-00" '+bqcnodocss+'>'+
	                        '<div class="plant_top">负/负</div>'+
	                        '<div class="plant_bottom">'+bqcOdds[8]+'</div>'+
	                      '</div>'+
	                        '</div>'+
	                  '</div>'+
	                      '<div class="clear"></div>'+
	                    '</div>'+
	              '</div>'+
	          '</div>'+
	              '<div class="biv fl tal">'+averOdds[0]+'</div>'+
	              '<div class="biv fl tal">'+averOdds[1]+'</div>'+
	              '<div class="biv fl tal">'+averOdds[2]+'</div>'+
	              '<div class="clear"></div>'+
	            '</div>'+
	        '<div class="clear"></div>';
				
				if ( i == schedules.length - 1 ) {
					html += '</div>';
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
			if ( $(this).find("span.active").length > 0 || $(this).find(".c_plant.active").length ) {
				selected++;
				var date = $(this).attr("id");
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
				
				selHtml += '<tr id="'+date+'">'+
		            '<td width="60px" class="Shallow">'+dateUtils.getWeekDay2(dd)+date.substring(8)+'</td>'+
		            '<td width="74px">'+$(this).attr("host")+' VS '+$(this).attr("guest")+'</td>'+
		            '<td width="286px">';
				$(this).find("span.active").each(function(index){
					var show = $(this).attr("betName");
					if ( $(this).attr("bet").split("-")[0] == "2" ) {
						show += "["+guess.getGgRqOrRf(date)+"]";
					}
					show += "("+guess.getBetOdds(date,$(this).attr("bet"))+")";
					selHtml += '<a href="javascript:void 0" bet="'+$(this).attr("bet")+'" onclick="removeOneT(this)">'+show+'</a>';
				});
				$(this).find(".c_plant.active").each(function(index){
					var playId = $(this).attr("bet").split("-")[0];
					if ( playId == "3" && pLimited > 6 ) {
						pLimited = 6;
					} else if ( ( playId == "4" || playId == "5") && pLimited > 4 ) {
						pLimited = 4;
					}
					var show = $(this).children().eq(0).html();
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
		if ( checkDgFlag() ) {
			$("#dgFalgId").show();
		} else {
			$("#dgFalgId").find("input").removeAttr("checked");
			$("#dgFalgId").hide();
		}
		
		calculate();
	}
}

function checkDgFlag() {
	var r = true;
	var betCode = "";
	var trs = $("#betSelAreaId").find("tr");
	for ( var i = 0; i < trs.length; i++ ) {
		var g = guess.scheduleMap.get($(trs[i]).attr("id"));
		var hasDg = true;
		var as = $(trs[i]).find("td").eq(2).children();
		for ( var j = 0; j < as.length; j++ ) {
			if ( $(as[j]).attr("bet").substring(0,1) == "1" ) {
				if ( g.spfDgOdds == 'null' ) {
					hasDg = false;
					break;
				}
			} else if ( $(as[j]).attr("bet").substring(0,1) == "2" ) {
				if ( g.rqspfDgOdds == 'null' ) {
					hasDg = false;
					break;
				}
			} else if ( $(as[j]).attr("bet").substring(0,1) == "3" ) {
				if ( g.zjqDgOdds == 'null' ) {
					hasDg = false;
					break;
				}
			} else if ( $(as[j]).attr("bet").substring(0,1) == "4" ) {
				if ( g.bqcDgOdds == 'null' ) {
					hasDg = false;
					break;
				}
			} 
		}
		if ( !hasDg ) {
			r = false;
			break;
		}
	}
	if (  trs.length == 0) {
		r = false;
	}
	
	return r;
}

var guessHhgg = new GuessFootballHhgg();

$(document).ready(function () {
	
	guessHhgg.loadSchedules();
	
	// 隐藏奖金明细
	//$("#lookBonusBtnId").hide();
	
	// 选中彩果事件
	$("span.bgc").click(function() {
		if ( $(this).hasClass("link") ) {
			/*if ( $(this).parent().hasClass("open_d") ) {
				$(this).parent().removeClass("open_d");
				$(this).next().hide();
			} else {
				$(this).parent().addClass("open_d");
				// 展示更多投注项
				$(this).next().show();
			}*/
			return false;
		}
		if ( $(this).html().indexOf('--') > -1 ||  $(this).html().indexOf('不受注') > -1 ) {
			return false;
		} else {
			if ( $(this).hasClass("active") ) {
				$(this).removeClass("active");
			} else {
				// 单一玩法确认
				/*var play = $(this).attr("bet").split("-")[0];
				var morePass = false;
				$(this).parent().parent().find(".active").each(function(index){
					var p = $(this).attr("bet").split("-")[0];
					if ( play != p && !morePass ) {
						morePass = true;
					}
				});
				if ( morePass ) {
					layer.alert("一场比赛中，只允许选择一个玩法进行过关！",0);
					return false;
				} else {
					$(this).addClass("active");
				}*/
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
			// 单一玩法确认
			/*var play = $(this).attr("bet").split("-")[0];
			var morePass = false;
			$(this).parent().parent().parent().parent().parent().parent().find(".active").each(function(index){
				var p = $(this).attr("bet").split("-")[0];
				if ( play != p && !morePass ) {
					morePass = true;
				}
			});
			if ( morePass ) {
				layer.alert("一场比赛中，只允许选择一个玩法进行过关！",0);
				return false;
			} else {
				$(this).addClass("active");
			}*/
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
			$(this).children().eq(1).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	$("#showStopTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStopTime($(this).attr("id"));
			$(this).children().eq(1).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	
	$("#fsscBonusBtnId").click(function(){
		if ( $("#betMoneyId").html() != '0' ) {
			$("#bonusPanalId").show();
			$("#betPanalId").hide();
			
			var multiple = $("#multipleId").val();
			var betNum = parseInt($("#betMoneyId").html())/parseInt(multiple)/2;
			$("#buyMoneyId").val(parseInt(betNum)*20);
			
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
			if (  $("#pageNameId").val().indexOf("dg") > -1 ) {
				passString = "1c1,";
			}
			else {
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
					layer.alert("不支持组合过关优化！",0);
					return false;
				}
				if ( passString == "" ) {
					return false;
				}
			} 
			passString = passString.substring(0, passString.length - 1);
			
			var betCodes = betCode.split("|");
			var html = "";
			for ( var i = 0; i < betCodes.length; i++ ) {
				var cInfo = betCodes[i].split(":");
				var sch = guess.scheduleMap.get(cInfo[0]);
				var date = sch.id.substring(0,8);
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
				html += '<tr><td align="center" bgcolor="#FFFFFF">'+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'</td>';
				html += '<td height="30" align="center" bgcolor="'+sch.bgcolor+'"> <font class="colwt">'+sch.leageName+'</font> </td>';
				html += '<td align="center" bgcolor="#FFFFFF">'+sch.stopTime.substring(5,16)+'</td>';
				html += '<td align="center" bgcolor="#FFFFFF">'+sch.hostName+'</td>';
				html += '<td align="center" bgcolor="#FFFFFF"> '+sch.guestName+'</td>';
				html += '<td align="center" bgcolor="#FFFFFF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">';
				html += '<tr>';
				var bets = cInfo[1].split(",");
				for ( var j = 0; j < bets.length; j++ ) {
					html += '<td align="">';
					html += '<div class="tzrq"><strong>'+getBetName(guess.licenseId, guess.playId, bets[j])+'</strong><s>'+guess.getBetOdds(cInfo[0], bets[j])+'</s></div></td>';
				}
				html += '</tr></table></td></tr>';
			}
			$("#schAreaId").empty();
			$(html).appendTo($("#schAreaId"));
			
			var singlist = guess.createOptList(betCode, passString);
			
			createSingleArea(singlist, false);
			// 优化按钮
			$("#bonusDoBtnId").click(function(){
				if ( (parseInt($("#buyMoneyId").val()) % 2) != 0 ) {
					layer.alert("投注必须为偶数！",0);
					return false;
				}
				var betMoney = $("#buyMoneyId").val();
				//var list = guess.createOptList(betCode, passString);
				var list = new Array();
				if ( $("#singCodeId").val() != '' ) {
					// 过滤来的单子
					var filterCodes = $("#singCodeId").val().split(";");
					for ( var i = 0; i < filterCodes.length; i++ ) {
						var om = new Optimization();
						var cInfo = filterCodes[i].split("|");
						var bonus = 1;
						for ( var j = 0; j < cInfo.length; j++ ) {
							var ccInfo = cInfo[j].split(":");
							bonus *= parseFloat(guess.getBetOdds(ccInfo[0], ccInfo[1]));
						}
						bonus = parseFloat(new Number(bonus*2).toFixed(2));
						om.baseBonus = bonus;
						om.betCode = filterCodes[i];
						om.multiple = 1;
						
						list.push(om);
					}
				} else {
					list = guess.createOptList(betCode, passString);
				}
				var s = $("input[name=bonusIn]:checked").val();
				var hasBox = false;
				switch ( s ) {
				case "1":
					list = guess.averOptimize(list, betMoney);
					break;
				case "2":
					list = guess.hotOptimize(list, betMoney);
					break;
				case "3":
					list = guess.coldOptimize(list, betMoney);
					break;
				case "4":
					if ( $("#singleAreaId").find("input[type=checkbox]").length == 0 ) {
						layer.alert("请选选择保本的注！",0);
						hasBox = true;
					} else {
						if ( $("#singleAreaId").find("input[type=checkbox]:checked").length == 0 ) {
							layer.alert("请选选择保本的注！",0);
							return false;
						}
						var trs = $("#singleAreaId").children();
						for ( var i = 0; i < trs.length; i++ ) {
							if ( $(trs[i]).find("input[type=checkbox]:checked").length > 0 ) {
								list[i].even = 1;
							}
						}
						list = guess.evenOptimize(list, betMoney);
						var amt = 0;
						for ( var i = 0; i < trs.length; i++ ) {
							amt += list[i].multiple;
							$(trs[i]).find("input[name=betNum]").val(list[i].multiple);
							$(trs[i]).find(".jj").html(new Number(list[i].baseBonus*list[i].multiple).toFixed(2));
						}
						$("#fsscBetMoneyId").html(amt*2);
						return false;
					}
					break;
				}
				createSingleArea(list, hasBox);
			});
			$("#bonusDoBtnId").click();
			
			$("#buyMoneyId").keydown(function(event){
				if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
					return true;
				} else {
					return false;
				}
			});
		} else {
			layer.alert("请先选择比赛投注！",0);
		}
	});
	
	$("#fsscLotteryFormBtnId").click(function(){
		if ( $("#fsscBetMoneyId").html() != '0' ) {
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
			if ( passString != "" ) {
				passString = passString.substring(0, passString.length - 1);
				passString =  guess.optimizePassType(betCode.split("|").length, passString, betCode);
			} else if ( passString != ""){
				passString = passString.substring(0, passString.length - 1);
			}
			
			var licenseId = $("#licenseId").val();
			var orderId = getMethodParameter("orderId");
			var betNum = 0;
			var betInfo = "";
			$("#singleAreaId").children().each(function(index){
				betNum += parseInt($(this).find("input[name=betNum]").val());
				betInfo += $(this).attr("code") + "`" + $(this).find("input[name=betNum]").val() + ";";
			});
			betInfo = betInfo.substring(0, betInfo.length - 1);
			$.ajax({
			    type: "post",
			    url: "/lottery/frsFsUpload.do",
			    async: false,
			    dataType: "json",
			    data: "schs="+betInfo+"&fsscFlag=2&"+"licenseId="+licenseId+"&betCode="+betCode+"&orderId="+orderId+"&playId="+guess.playId+"&passType="+passString+"&betNum="+betNum,
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

function createSingleArea(singlist, hasBox) {
	for ( var i = 0; i < singlist.length; i++ ) {
		if ( singlist[i].multiple < 1 ) {
			layer.alert("所选方案不能进行该项优化！",0);
			return false;
		}
	}
	$("#singleAreaId").empty();
	var passString = $("#passTypeId").val();
	var betCode = $("#betCodeId").val();
	var shtml = "";
	var amt = 0;
	for ( var i = 0; i < singlist.length; i++ ) {
		var codes = singlist[i].betCode.split("|");
		amt += singlist[i].multiple;
		if ( hasBox ) {
			shtml += ' <tr code='+singlist[i].betCode+'><td height="30" align="center" bgcolor="#FFFFFF"><input type="checkbox"></td>';
		} else {
			shtml += ' <tr code='+singlist[i].betCode+'><td height="30" align="center" bgcolor="#FFFFFF">'+(i+1)+'</td>';
		}
		shtml += '<td align="center" bgcolor="#FFFFFF"><div class="dz">';
		for ( var j = 0; j < codes.length; j++ ) {
			var cInfo = codes[j].split(":");
			var sch = guess.scheduleMap.get(cInfo[0]);
			var date = sch.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			shtml += ' '+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'［<strong>'+getBetName(guess.licenseId, guess.playId, cInfo[1])+' '+guess.getBetOdds(cInfo[0], cInfo[1])+'</strong>］ ×';
		}
		shtml = shtml.substring(0, shtml.length-1);
		shtml += '</div></td>';
		shtml += '<td align="center" bgcolor="#FFFFFF" class="zhushu">';
		shtml += '<div class="tzrq"><span><img src="/images/jj.png" width="20" height="19" name="subMBtn"/>';
		shtml += '<input type="text" value="'+singlist[i].multiple+'" name="betNum" base="'+singlist[i].baseBonus+'"/>';
		shtml += '<img src="/images/add_bt.gif" width="20" height="19" name="addMBtn"/></span></div></td>';
		shtml += '<td align="center" bgcolor="#FFFFFF"><strong class="jj">'+(new Number(singlist[i].baseBonus*singlist[i].multiple).toFixed(2))+'</strong></td></tr>';
	}
	
	$(shtml).appendTo($("#singleAreaId"));
	$("#fsscBetMoneyId").html(amt*2);
	
	addDinamicalEvent();
}

function addDinamicalEvent() {
	$("#singleAreaId").find("input[name=betNum]").each(function(index){
		$(this).keydown(function(event){
			if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
				return true;
			} else {
				return false;
			}
		});
		$(this).keyup(function(event){
			var v = $(this).val();
			if ( v == "" ) {
				return false;
			}
			var o = $(this).parent().parent().parent().next();
			$(o).find(".jj").html(new Number(parseInt(v)*parseFloat($(this).attr("base"))).toFixed(2));
			calcBetN();
		});
	});
	
	$("#singleAreaId").find("img[name=subMBtn]").click(function(){
		var v = $(this).next().val();
		if ( parseInt(v) > 1 ) {
			$(this).next().val(parseInt(v)-1);
			var o = $(this).parent().parent().parent().next();
			$(o).find(".jj").html(new Number((parseInt(v)-1)*parseFloat($(this).next().attr("base"))).toFixed(2));
			calcBetN();
		}
	});
	
	$("#singleAreaId").find("img[name=addMBtn]").click(function(){
		var v = $(this).prev().val();
		$(this).prev().val(parseInt(v)+1);
		var o = $(this).parent().parent().parent().next();
		$(o).find(".jj").html(new Number((parseInt(v)+1)*parseFloat($(this).prev().attr("base"))).toFixed(2));
		calcBetN();
	});
}

function calcBetN() {
	var trs = $("#singleAreaId").children();
	var amt = 0;
	for ( var i = 0; i < trs.length; i++ ) {
		amt += parseInt($(trs[i]).find("input[name=betNum]").val());
	}
	$("#fsscBetMoneyId").html(amt*2);
}

var JCZQ_INDEX_BF = new Hashtable();

JCZQ_INDEX_BF.put(0, "胜其他");
JCZQ_INDEX_BF.put(1, "1:0");
JCZQ_INDEX_BF.put(2, "2:0");
JCZQ_INDEX_BF.put(3, "2:1");
JCZQ_INDEX_BF.put(4, "3:0");
JCZQ_INDEX_BF.put(5, "3:1");
JCZQ_INDEX_BF.put(6, "3:2");
JCZQ_INDEX_BF.put(7, "4:0");
JCZQ_INDEX_BF.put(8, "4:1");
JCZQ_INDEX_BF.put(9, "4:2");
JCZQ_INDEX_BF.put(10, "5:0");
JCZQ_INDEX_BF.put(11, "5:1");
JCZQ_INDEX_BF.put(12, "5:2");

JCZQ_INDEX_BF.put(13, "平其他");
JCZQ_INDEX_BF.put(14, "0:0");
JCZQ_INDEX_BF.put(15, "1:1");
JCZQ_INDEX_BF.put(16, "2:2");
JCZQ_INDEX_BF.put(17, "3:3");

JCZQ_INDEX_BF.put(18, "负其他");
JCZQ_INDEX_BF.put(19, "0:1");
JCZQ_INDEX_BF.put(20, "0:2");
JCZQ_INDEX_BF.put(21, "1:2");
JCZQ_INDEX_BF.put(22, "0:3");
JCZQ_INDEX_BF.put(23, "1:3");
JCZQ_INDEX_BF.put(24, "2:3");
JCZQ_INDEX_BF.put(25, "0:4");
JCZQ_INDEX_BF.put(26, "1:4");
JCZQ_INDEX_BF.put(27, "2:4");
JCZQ_INDEX_BF.put(28, "0:5");
JCZQ_INDEX_BF.put(29, "1:5");
JCZQ_INDEX_BF.put(30, "2:5");

var JCLQ_INDEX_SFC = new Hashtable();
JCLQ_INDEX_SFC.put("0", "客胜1-5");
JCLQ_INDEX_SFC.put("1", "客胜6-10");
JCLQ_INDEX_SFC.put("2", "客胜11-15");
JCLQ_INDEX_SFC.put("3", "客胜16-20");
JCLQ_INDEX_SFC.put("4", "客胜21-25");
JCLQ_INDEX_SFC.put("5", "客胜26+");
JCLQ_INDEX_SFC.put("6", "主胜1-5");
JCLQ_INDEX_SFC.put("7", "主胜6-10");
JCLQ_INDEX_SFC.put("8", "主胜11-15");
JCLQ_INDEX_SFC.put("9", "主胜16-20");
JCLQ_INDEX_SFC.put("10", "主胜21-25");
JCLQ_INDEX_SFC.put("11", "主胜26+");

function getBetName(licenseId, playId, bet) {
	var retObj = "";
	switch( licenseId ) {
	case 9:
	{
		switch( playId ) {
		case 1:
			retObj = bet == "3" ? "胜" : bet == "1" ? "平" : "负";
			break;
		case 2:
			retObj = bet == "3" ? "胜(让)" : bet == "1" ? "平(让)" : "负(让)";
			break;
		case 3:
			retObj = bet;
			break;
		case 4:
			retObj = bet.replaceAll("3", "胜").replaceAll("1", "平").replaceAll("0", "负");
			break;
		case 5:
			retObj = JCZQ_INDEX_BF.get(parseInt(bet));
			break;
		case 6:
			var sInfo = bet.split("-");
			retObj = getBetName(licenseId, parseInt(sInfo[0]), sInfo[1]);
			break;
		}
		break;
	}
	case 10:
	{
		switch( playId ) {
		case 1:
			retObj = bet == "3" ? "主胜" : "客胜";
			break;
		case 2:
			retObj = bet == "3" ? "主胜(让)" : "客胜(让)";
			break;
		case 3:
			retObj = JCLQ_INDEX_SFC.get(parseInt(bet));
			break;
		case 4:
			retObj = bet == "0" ? "大分" : "小分";
			break;
		case 6:
			var sInfo = bet.split("-");
			retObj = getBetName(licenseId, parseInt(sInfo[0]), sInfo[1]);
			break;
		}
		break;
	}
	}
	return retObj;
}