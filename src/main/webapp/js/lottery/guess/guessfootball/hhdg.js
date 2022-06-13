/**
 * <p>Desc:竞彩足球单关投注页面控制</p>
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
			if ( obj.spfdgodds == 'null' ) {
				spfOdds = ["不受注","不受注","不受注"];
			} else {
				spfOdds = obj.spfdgodds.split(",");
			}
			var rqSpfOdds = [];
			if ( obj.rqspfdgodds == 'null' ) {
				rqSpfOdds = ["不受注","不受注","不受注"];
			} else {
				rqSpfOdds = obj.rqspfdgodds.split(",");
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
			if ( obj.zjqdgodds == 'null' ) {
				for ( var j = 0; j < 8; j++ ) {
					zjqOdds[j] = "--";
				}
			} else {
				zjqOdds = obj.zjqdgodds.split(",");
			}
			var bqcOdds = [];
			if ( obj.bqcdgodds == 'null' ) {
				for ( var j = 0; j < 9; j++ ) {
					bqcOdds[j] = "--";
				}
			} else {
				bqcOdds = obj.bqcdgodds.split(",");
			}
			var zhcss = i % 2 == 0 ? "" : "shbg";
			if ( i == 0 ) {
				date = obj.id.substring(0,8);
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
				html += '<div class="sais_cc sx_list">'+
					'<div class="sais_ct ">'+
					'<div class="dan_ico"><i class="triAngle"></i><i class="text">单</i></div>'+
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
			if ( obj.spfdgodds == 'null') {
				spfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.rqspfdgodds == 'null') {
				rqspfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.bfodds == 'null') {
				bfnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.zjqdgodds == 'null') {
				zjqnodocss = 'style="background:#f5f5f5"';
			}
			if ( obj.bqcdgodds == 'null') {
				bqcnodocss = 'style="background:#f5f5f5"';
			}
			if ( date == obj.id.substring(0,8) ) {
				html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
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
				
			} else {
				html += '</div>';
				date = obj.id.substring(0,8);
				var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
				html += '<div class="sais_cc sx_list">'+
					'<div class="sais_ct ">'+
					'<div class="dan_ico"><i class="triAngle"></i><i class="text">单</i></div>'+
			        '<div class="sais_ct_c fl" style="margin-left:50px"><span class="tme"></span><a href="javascript:void 0">'+dd+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</a></div>'+
			        '<div class="sais_ct_r fr">'+
			              '<input type="checkbox"/>'+
			              '<a href="javascript:void 0"> 显示已停售比赛<span>【'+(stopCounterMap.get(date)=='undefined'?'0':stopCounterMap.get(date))+'场】</span> </a></div>'+
			        '<div class="clear"></div>'+
			      '</div>'+
			      '<div class="sais_ct_l fl link2"><a href="javascript:void 0" class="xt"></a></div>'+
			      '<div class="day_list" style="display:block">';
				
				html += '<div class="sai_c '+zhcss+'" '+visibleHtml+' id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
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
	            '<td width="34px"><input type="checkbox" onclick="setDan(this)" disabled></td>'+
	            '<td class="Capital"><a href="javascript:void 0" onclick="removeT(this)">x</a></td>'+
	          '</tr>';
			}
		});
		$(selHtml).appendTo($("#betSelAreaId"));
		
		$("#schudleSelId").html(selected);
		
		calculate();
	}
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
			$(this).children().eq(1).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
	$("#showStopTimeId").live('click', function(){
		$("#accordion").find(".sai_c").each(function(index){
			var startTime = guess.getStopTime($(this).attr("id"));
			$(this).children().eq(1).html(getAheadTime(startTime.substring(11,16))+'<span class="xial tal"></span>');
		});
	});
});
