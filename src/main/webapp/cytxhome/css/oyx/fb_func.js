$(function(){
	var obj_goal_set=$('#goal_set');
	obj_goal_set.attr('checked',true);
	var obj_rank_set=$('#rank_set');
	obj_rank_set.attr('checked',true);
	var obj_red_set=$('#red_set');
	obj_red_set.attr('checked',true);
	$('#song_set').val('1');
	$('#m_pool_set').val('had');
	get_all_data();
	get_all_details();
	$('#div_sel_competition').click(function(e){
		var div_top=$(this).offset().top;
		var div_left=$(this).offset().left;
		$('#div_sel_competitions').css({'top':div_top, 'left':div_left});
		$('#div_sel_competitions').css('display','block');
		e.stopPropagation();
	});
	$('#div_song').click(function(){
		var song_set=$('#song_set').val();
		if(song_set=='1'){
			$(this).removeClass("song");
			$(this).addClass("nosong");
			$('#song_set').val('0');
		}else{
			$(this).removeClass("nosong");
			$(this).addClass("song");
			$('#song_set').val('1');
		}
	});
	$('#div_set').click(function(e){
		if($('#div_introd_set').css('display')=='none'){
			var div_top=$(this).offset().top;
			var div_left=$(this).offset().left;
			var set_top=div_top+30;
			var set_left=div_left;
			$('#div_introd_set').css({'top':set_top, 'left':set_left});
			$('#div_introd_set').css('display','block');
		}else{
			$('#div_introd_set').css('display','none');
		}
		e.stopPropagation();
	});
	$('#div_introd_set').find('.rq_a').click(function(e){
		e.stopPropagation();
	});
	$('#show_all').click(function(){
		get_all_data();
		get_all_details();
	});
	$('#div_sel_competitions').click(function(e){
		e.stopPropagation();
	});
	$('#choose_all').click(function(e){
		show_status_cond();
		show_league_cond();
		$("tr[id^='trm_']").each(function(){
			$(this).css('display','');
		});
		$('#hide_matches').val('');
		$('#hidden_total').text('0');
		set_zebra();
	});
	$('#opposite_all').click(function(e){
		show_status_cond();
		var r_leagues='';
		$('#tbl_leagues').find('input').each(function(){
			if($(this).attr('checked')==undefined){
				$(this).attr('checked',true);
			}else{
				$(this).attr('checked',false);
				if(r_leagues!=''){
					r_leagues+=',';
				}
				r_leagues+=$(this).val();
			}
		});
		$('#h_league_set').val(r_leagues);
		var h_leagues=','+r_leagues+',';
		var hidden_matches='';
		var hidden_count=0;
		$("tr[id^='trm_']").each(function(){
			var trm_id=$(this).attr('id');
			var arr_id=trm_id.split('_');
			var tr_lid=arr_id[2];
			var h_tr_lid=','+tr_lid+',';
			if(h_leagues.indexOf(h_tr_lid)!=-1){
				$(this).css('display','none');
				if(hidden_matches!=''){
					hidden_matches+=',';
				}
				hidden_matches+=arr_id[1];
				hidden_count++;
			}else{
				$(this).css('display','');
			}
		});
		$('#hide_matches').val(hidden_matches);
		$('#hidden_total').text(hidden_count);
		set_zebra();
	});
	$('#fixture').click(function(){
		set_status_match();
	});
	$('#playing').click(function(){
		set_status_match();
	});
	$('#played').click(function(){
		set_status_match();
	});
	$('#other').click(function(){
		set_status_match();
	});
	obj_rank_set.click(function(){
		var rank_checked=$(this).attr('checked');
		$("div[id^='div_table']").find('span').each(function(){
			if(!rank_checked){
				$(this).css('display','none');
			}else{
				$(this).css('display','');
			}
		});
	});
	obj_red_set.click(function(){
		var red_checked=$(this).attr('checked');
		$("div[id^='div_rc']").each(function(){
			if(!red_checked){
				if($(this).hasClass("tb_redbg")){
					$(this).removeClass("tb_redbg");
					$(this).addClass("tb_nored");
					$(this).find('span').css('display','none');
				}
			}else{
				var red_count=$(this).find('span').text();
				if(red_count!=''){
					$(this).removeClass("tb_nored");
					$(this).addClass("tb_redbg");
					$(this).find('span').css('display','');
				}
			}
		});
	});
	$('#pool_set').click(function(e){
		if($('#div_pool_set').css('display')=='none'){
			var div_top=$(this).offset().top;
			var div_left=$(this).offset().left;
			var set_top=div_top+18;
			var set_left=div_left;
			$('#div_pool_set').css({'top':set_top, 'left':set_left});
			$('#div_pool_set').css('display','block');
		}else{
			$('#div_pool_set').css('display','none');
		}
		e.stopPropagation();
	});
	$('#div_pool_set').find('.rq_a').click(function(){
		if(load_match_status==1){
			var obj_span=$(this).find('span');
			pool_set_odds(obj_span);
		}
	});
	$('#show_hide_set').click(function(e){
		e.stopPropagation();
	});
	$('#div_show_match').click(function(){
		var matches_checked_num=$("input[id^='matches_']:checked").length;
		if(matches_checked_num<=0){
			alert('请至少选择一场比赛');
			return false;
		}
		var hide_match_ids=$('#hide_matches').val();
		var hide_num=parseInt($('#hidden_total').text(),10);
		$("input[id^='matches_']").each(function(){
			var hs_id=$(this).attr('id');
			var arr_hs_id=hs_id.split('_');
			if($(this).attr('checked')==undefined){
				var obj_this_tr=$('#trm_'+arr_hs_id[1]+'_'+arr_hs_id[2]);
				var this_tr_display=obj_this_tr.css('display');
				if(this_tr_display!='none'){
					obj_this_tr.css('display','none');
					if(hide_match_ids!=''){
						hide_match_ids+=',';
					}
					hide_match_ids+=arr_hs_id[1];
					hide_num++;
				}
			}else{
				$(this).attr('checked',false);
			}
		});
		$('#hide_matches').val(hide_match_ids);
		$('#hidden_total').text(hide_num);
		set_zebra();
		$('#show_hide_set').css('display','none');
	});
	$('#div_hide_match').click(function(){
		var matches_checked_num=$("input[id^='matches_']:checked").length;
		if(matches_checked_num<=0){
			alert('请至少选择一场比赛');
			return false;
		}
		var hide_match_ids=$('#hide_matches').val();
		var hide_num=parseInt($('#hidden_total').text(),10);
		$("input[id^='matches_']").each(function(){
			var hs_id=$(this).attr('id');
			var arr_hs_id=hs_id.split('_');
			if($(this).attr('checked')!=undefined){
				var obj_this_tr=$('#trm_'+arr_hs_id[1]+'_'+arr_hs_id[2]);
				var this_tr_display=obj_this_tr.css('display');
				if(this_tr_display!='none'){
					obj_this_tr.css('display','none');
					if(hide_match_ids!=''){
						hide_match_ids+=',';
					}
					hide_match_ids+=arr_hs_id[1];
					hide_num++;
				}
				$(this).attr('checked',false);
			}
		});
		$('#hide_matches').val(hide_match_ids);
		$('#hidden_total').text(hide_num);
		set_zebra();
		$('#show_hide_set').css('display','none');
	});
	$("body").click(function(){
		close_competition();
		$('#div_introd_set').css('display','none');
		$('#div_pool_set').css('display','none');
	});
	var ie_v=get_ie_version();
	if(ie_v>0 && ie_v<=6){
		$(window).scroll(scroll_func);
		if($('.goal_close')!=undefined){
			$('.goal_close').remove();
		}
	}else{
		if($('.close_goal')!=undefined){
			$('.close_goal').remove();
		}
	}
	window.setTimeout('get_this_time()', 3000);
	window.setTimeout('show_change_data()', 5000);
	window.setTimeout('check()', 300000);
});

//隐藏赛事选择
function close_competition(){
	$('#div_sel_competitions').css('display','none');
}

//显示状态
function show_status_cond(){
	$('#fixture').attr('checked',true);
	$('#playing').attr('checked',true);
	$('#played').attr('checked',true);
	$('#other').attr('checked',true);
}

//显示联赛
function show_league_cond(){
	$('#h_league_set').val('');
	$('#tbl_leagues').find('input').each(function(){
		$(this).attr('checked',true);
	});
}

var ie6_scroll_set=1;
var load_match_status=1;
var last_update_time='';
var old_update_time='';
var this_sever_time='';
var obj_match_data={};
var obj_detail_data={};
var obj_playing_time={};
var obj_fixture_time={};
var obj_status={'Fixture':'未','Playing':'进行','Postponed':'推迟','Suspended':'暂停','Played':'完','Cancelled':'取消'};
var obj_period={'1H':'上','2H':'下','HT':'中','E1':'完','E2':'完','EH':'完','PS':'完','FT':'完'};
var obj_event={'YC':'tb_yellowbg','RC':'tb_redbg','Y2C':'tb_redbg','G':'bg_football','PG':'pg_football','OG':'og_football'};
var obj_statistics={'posession':'控球率'};
var obj_weather={'微雪':'tb_weather_xsnow','阵雪':'tb_weather_xsnow','雪':'tb_weather_msnow','大雪':'tb_weather_lsnow','暴雪':'tb_weather_lsnow','大雨':'tb_weather_lrain','微雨':'tb_weather_xrain','毛毛雨':'tb_weather_xrain','小雨':'tb_weather_xrain','小阵雨':'tb_weather_xrain','雨':'tb_weather_mrain','阵雨':'tb_weather_mrain','附近有阵雨':'tb_weather_mrain','暴雨':'tb_weather_lrain','雨夹雪':'tb_weather_lrain','打雷':'tb_weather_zrain','雷暴':'tb_weather_zrain','附近有雷暴':'tb_weather_zrain','小雨+打雷':'tb_weather_zrain','薄雾':'tb_weather_fog','雾':'tb_weather_fog','雾霭':'tb_weather_fog','大面積塵埃':'tb_weather_smog','塵埃':'tb_weather_smog','天晴':'tb_weather_sunny','晴朗':'tb_weather_sunny','晴':'tb_weather_sunny','多云':'tb_weather_cloudy','大致多云':'tb_weather_cloudy','大致多云/有风':'tb_weather_cloudy','阴':'tb_weather_cloudy'};
var list_timeout=0;
var detail_timeout=0;
var updated_timeout=0;
var goal_close_flag=0;

//加载比赛数据
function get_all_data(){
	$('#h_league_set').val('');
	$('#hide_matches').val('');
	$('#top_matches').val('');
	$('#checked_matches').val('');
	show_status_cond();
	obj_playing_time={};
	show_data();
}

//显示比赛列表
function show_data(){
	$('input').attr('disabled',true);
	load_match_status=0;
	try{
		$.getScript("http://i.sporttery.cn/api/match_live/get_match_list?callback=?", function(){
			if(match_list!=undefined){
				obj_match_data=match_list;
				sort_data();
			}
		});
	}catch(e){}
	window.clearTimeout(list_timeout);
	list_timeout=window.setTimeout("show_data()", 300000);
}

//比赛数据排序
function sort_data(){
	var obj_going_match=[];
	var obj_end_match=[];
	for(var id in obj_match_data){
		var match_status=obj_match_data[id]['status'];
		var match_period=obj_match_data[id]['match_period'];
		if(match_status=='Fixture' || (match_status=='Playing' && (match_period=='1H' || match_period=='2H' || match_period=='HT' || match_period==''))){
			obj_going_match.push(obj_match_data[id]);
		}else{
			obj_end_match.push(obj_match_data[id]);
		}
	}
	obj_going_match.sort(by_str('date_cn',by_str('time_cn', by_str('sort_num'))));
	obj_end_match.sort(by_str('date_cn',by_str('time_cn', by_str('sort_num'))));
	obj_match_data={};
	var going_len=obj_going_match.length;
	if(going_len>0){
		for(var i=0;i<going_len;i++){
			obj_match_data['_'+obj_going_match[i]['m_id']]=obj_going_match[i];
		}
	}
	var end_len=obj_end_match.length;
	if(end_len){
		for(var i=0;i<end_len;i++){
			obj_match_data['_'+obj_end_match[i]['m_id']]=obj_end_match[i];
		}
	}
	make_table();
}

function by_str(name,minor){
	return function(o,p){
		var a,b;
		if (typeof o==="object" && typeof p==="object" && o && p){
			a=o[name];
			b=p[name];
			if(a===b){
				return typeof minor==='function'?minor(o,p):0;
			}
			if (typeof a===typeof b){
				return a<b?-1:1;
			}
			return typeof a<typeof b?-1:1;
		}
	}
}

//创建比赛列表
function make_table(){
	$('#tbl_leagues').html('');
	$('#tbl_match_list').find('tr').each(function(){
		var tr_id=$(this).attr('id');
		if(tr_id!='tr_title'){
			$(this).remove();
		}
	});
	var fixture_check=$('#fixture').attr('checked');
	var playing_check=$('#playing').attr('checked');
	var played_check=$('#played').attr('checked');
	var other_check=$('#other').attr('checked');
	var status_hide_mids='';
	var arr_match_html=new Array();
	var obj_league={};
	var s_rank=$('#rank_set').attr('checked');
	var s_red=$('#red_set').attr('checked');
	var pool_set=$('#m_pool_set').val();
	var checked_matches=$('#checked_matches').val();
	var c_checked_matches=','+checked_matches+',';
	var m_total=0;
	for(var id in obj_match_data){
		var m_id=obj_match_data[id]['m_id'];
		var l_id=obj_match_data[id]['l_id'];
		var c_mid=','+m_id+',';
		arr_match_html.push('<tr id="trm_'+m_id+'_'+l_id+'" height="39" class="boder_B" bgcolor="">');
		var m_checked_input='';
		if(c_checked_matches.indexOf(c_mid)!=-1){
			m_checked_input=' checked="checked"';
		}
		arr_match_html.push('<td class="tb_33"><input id="matches_'+m_id+'_'+l_id+'" name="matches_'+m_id+'_'+l_id+'" type="checkbox" value="1"'+m_checked_input+' onclick="set_show_hide(\'matches_'+m_id+'_'+l_id+'\');" />'+obj_match_data[id]['match_num']+'</td>');
		var l_bg_color=obj_match_data[id]['l_bg_color'];
		var l_cn_abbr=obj_match_data[id]['l_cn_abbr'];
		arr_match_html.push('<td class="tb_ff" bgcolor="'+l_bg_color+'" title="'+obj_match_data[id]['l_cn']+'">'+l_cn_abbr+'</td>');
		var date_cn=obj_match_data[id]['date_cn'];
		var time_cn=obj_match_data[id]['time_cn'];
		var s_date=date_cn.substr(5);
		var s_time=time_cn.substr(0,5);
		var s_match_time=s_date+' '+s_time;
		arr_match_html.push('<td class="tb_99 boder_R">'+s_match_time+'</td>');
		var match_status=obj_match_data[id]['status'];
		var match_period=obj_match_data[id]['match_period'];
		var status_name='';
		if(match_status=='Playing'){
			if(match_period!=''){
				if(match_period=='1H' || match_period=='2H'){
					var this_minute=obj_match_data[id]['minute'];
					if(obj_match_data[id]['minute_extra']!=''){
						this_minute+='+';
					}else{
						var cookie_info=0;
						if(this_minute=='45'){
							cookie_info=$.cookie("m_1H_"+m_id);
						}else if(this_minute=='90'){
							cookie_info=$.cookie("m_2H_"+m_id);
						}
						if(cookie_info!=null && cookie_info!=''){
							if(obj_playing_time[m_id]==undefined){
								obj_playing_time[m_id]=$.parseJSON(cookie_info);
							}
							this_minute+='+';
						}
					}
					status_name='<span id="tb_status_'+m_id+'" class="tb_blue tb_bold">'+this_minute+'<img src="http://info.sporttery.cn/livescore/images/in.gif"></span>';
				}else{
					if(match_period=='HT'){
						status_name='<span id="tb_status_'+m_id+'" class="tb_blue tb_bold">'+obj_period[match_period]+'</span>';
					}else{
						status_name='<span id="tb_status_'+m_id+'" class="tb_f00 tb_bold">'+obj_period[match_period]+'</span>';
					}
				}
			}else{
				status_name='<span id="tb_status_'+m_id+'" class="tb_33">未</span>';
			}
			if(match_period=='1H' || match_period=='2H' || match_period=='HT'){
				if(!playing_check){
					if(status_hide_mids!=''){
						status_hide_mids+=',';
					}
					status_hide_mids+=m_id;
				}
			}else if(match_period==''){
				if(!fixture_check){
					if(status_hide_mids!=''){
						status_hide_mids+=',';
					}
					status_hide_mids+=m_id;
				}
			}else{
				if(!played_check){
					if(status_hide_mids!=''){
						status_hide_mids+=',';
					}
					status_hide_mids+=m_id;
				}
			}
		}else if(match_status=='Played'){
			status_name='<span id="tb_status_'+m_id+'" class="tb_f00 tb_bold">'+obj_status[obj_match_data[id]['status']]+'</span>';
			if(!played_check){
				if(status_hide_mids!=''){
					status_hide_mids+=',';
				}
				status_hide_mids+=m_id;
			}
		}else{
			status_name='<span id="tb_status_'+m_id+'" class="tb_33">'+obj_status[obj_match_data[id]['status']]+'</span>';
			if(match_status=='Fixture'){
				if(!fixture_check){
					if(status_hide_mids!=''){
						status_hide_mids+=',';
					}
					status_hide_mids+=m_id;
				}
			}else{
				if(!other_check){
					if(status_hide_mids!=''){
						status_hide_mids+=',';
					}
					status_hide_mids+=m_id;
				}
			}
		}
		arr_match_html.push('<td class="boder_R">'+status_name+'</td>');
		arr_match_html.push('<td class="boder_R"><div class="tb_99 tb_zhuduipai FloatL">');
		var h_rc=obj_match_data[id]['h_rc'];
		var h_rc_html='';
		if(h_rc>0){
			if(s_red!=undefined){
				h_rc_html='<div id="div_rch_'+m_id+'" class="tb_ff tb_redbg FloatL"><span>'+h_rc+'</span></div>';
			}else{
				h_rc_html='<div id="div_rch_'+m_id+'" class="tb_ff tb_nored FloatL"><span style="display:none">'+h_rc+'</span></div>';
			}
		}else{
			h_rc_html='<div id="div_rch_'+m_id+'" class="tb_ff tb_nored FloatL"><span style="display:none"></span></div>';
		}
		arr_match_html.push(h_rc_html);
		var table_h=obj_match_data[id]['table_h'];
		arr_match_html.push('<div id="div_tableh_'+m_id+'" class="tb_zdpm FloatL">');
		var group_name=obj_match_data[id]['group_name'];
		if(table_h!=''){
			if(s_rank!=undefined){
				arr_match_html.push('<span>'+(group_name!=''?group_name:l_cn_abbr)+'['+table_h+']</span>');
			}else{
				arr_match_html.push('<span style="display:none;">'+(group_name!=''?group_name:l_cn_abbr)+'['+table_h+']</span>');
			}
		}
		arr_match_html.push('</div></div>');
		var pool_goalling_show='';
		if(pool_set=='hhad'){
			pool_goalling_show='('+obj_match_data[id]['goalline']+')';
		}
		arr_match_html.push('<div class="tb_33 tb_zname FloatL"><span id="h_team_'+m_id+'" style="padding:2px"><a href="/datacenter/analyse.jhtml?schudlesNo='+m_id+'" title="'+obj_match_data[id]['h_cn']+'" target="_blank">'+obj_match_data[id]['h_cn_abbr']+'</a></span><span id="goalline_'+m_id+'">'+pool_goalling_show+'</span></div>');
		var match_score='';
		var fs_h=(obj_match_data[id]['fs_h']!=''?obj_match_data[id]['fs_h']:'0');
		var fs_a=(obj_match_data[id]['fs_a']!=''?obj_match_data[id]['fs_a']:'0');
		if(match_status=='Playing'){
			if(match_period=='1H' || match_period=='2H' || match_period=='HT'){
				match_score='<div id="mscore_'+m_id+'" class="tb_blue tb_bold FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">'+fs_h+'-'+fs_a+'</div>';
			}else if(match_period==''){
				match_score='<div id="mscore_'+m_id+'" class="FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">VS</div>';
			}else{
				match_score='<div id="mscore_'+m_id+'" class="tb_f00 tb_bold FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">'+fs_h+'-'+fs_a+'</div>';
			}
		}else if(match_status=='Suspended'){
			match_score='<div id="mscore_'+m_id+'" class="tb_blue tb_bold FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">'+fs_h+'-'+fs_a+'</div>';
		}else if(match_status=='Played'){
			match_score='<div id="mscore_'+m_id+'" class="tb_f00 tb_bold FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">'+fs_h+'-'+fs_a+'</div>';
		}else{
			match_score='<div id="mscore_'+m_id+'" class="FloatL" style="line-height:39px;cursor:pointer;width:22px;text-align:center" onmouseover="show_detail(\'' +m_id+ '\',event);" onmouseout="close_detail();">VS</div>';
		}
		arr_match_html.push(match_score);
		arr_match_html.push('<div class="tb_33 tb_kname FloatL"><span id="a_team_'+m_id+'" style="padding:2px"><a href="/datacenter/analyse.jhtml?schudlesNo='+m_id+'" title="'+obj_match_data[id]['a_cn']+'" target="_blank">'+obj_match_data[id]['a_cn_abbr']+'</a></span></div>');
		arr_match_html.push('<div class="tb_99 tb_keduipai FloatL">');
		var a_rc=obj_match_data[id]['a_rc'];
		var a_rc_html='';
		if(a_rc>0){
			if(s_red!=undefined){
				a_rc_html='<div id="div_rca_'+m_id+'" class="tb_ff tb_redbg FloatR"><span>'+a_rc+'</span></div>';
			}else{
				a_rc_html='<div id="div_rca_'+m_id+'" class="tb_ff tb_nored FloatR"><span style="display:none">'+a_rc+'</span></div>';
			}
		}else{
			a_rc_html='<div id="div_rca_'+m_id+'" class="tb_ff tb_nored FloatR"><span style="display:none"></span></div>';
		}
		arr_match_html.push(a_rc_html);
		var table_a=obj_match_data[id]['table_a'];
		arr_match_html.push('<div id="div_tablea_'+m_id+'" class="tb_kdpm FloatR">');
		if(table_a!=''){
			if(s_rank!=undefined){
				arr_match_html.push('<span>['+table_a+']'+(group_name!=''?group_name:l_cn_abbr)+'</span>');
			}else{
				arr_match_html.push('<span style="display:none;">['+table_a+']'+(group_name!=''?group_name:l_cn_abbr)+'</span>');
			}
		}
		arr_match_html.push('</div></div></td>');
		var half_score='<td id="half_'+m_id+'" class="boder_R"></td>';
		if(match_status=='Playing' || match_status=='Suspended'){
			if(match_period=='1H'){
				if(obj_match_data[id]['hts_h']!='' && obj_match_data[id]['hts_a']!=''){
					half_score='<td id="half_'+m_id+'" class="tb_blue boder_R">'+obj_match_data[id]['hts_h']+'-'+obj_match_data[id]['hts_a']+'</td>';
				}else{
					half_score='<td id="half_'+m_id+'" class="tb_blue boder_R">'+fs_h+'-'+fs_a+'</td>';
				}
			}else{
				if(obj_match_data[id]['hts_h']!='' && obj_match_data[id]['hts_a']!=''){
					half_score='<td id="half_'+m_id+'" class="tb_f00 boder_R">'+obj_match_data[id]['hts_h']+'-'+obj_match_data[id]['hts_a']+'</td>';
				}else{
					half_score='<td id="half_'+m_id+'" class="tb_f00 boder_R">'+fs_h+'-'+fs_a+'</td>';
				}
			}
		}else if(match_status=='Played'){
			half_score='<td id="half_'+m_id+'" class="tb_f00 boder_R">'+obj_match_data[id]['hts_h']+'-'+obj_match_data[id]['hts_a']+'</td>';
		}
		arr_match_html.push(half_score);
		var h_weather=obj_match_data[id]['weather'];
		var h_temperature=obj_match_data[id]['temperature'];
		var weather_class='';
		if(h_weather!='' && obj_weather[h_weather]!=undefined){
			weather_class=' class="'+obj_weather[h_weather]+'" title="'+h_weather+' '+h_temperature+'"';
		}
		arr_match_html.push('<td class="boder_R"><div'+weather_class+'></div></td>');
		odds_html=cal_odds(pool_set,m_id);
		arr_match_html.push('<td id="odds_'+m_id+'" class="tb_33 boder_R">'+odds_html+'</td>');
		arr_match_html.push('<td class="tb_oyx boder_R"><a href="/datacenter/europ.jhtml?schudlesNo='+m_id+'" target="_blank">欧</a> <a href="/datacenter/asia.jhtml?schudlesNo='+m_id+'" target="_blank">亚</a> <a href="/datacenter/analyse.jhtml?schudlesNo='+m_id+'" target="_blank">析</a></td>');
		arr_match_html.push('<td><div id="set_ud_'+m_id+'" class="tb_zd" onclick="up_down(\'trm_'+m_id+'_'+l_id+'\');"></div></td></tr>');
		if(!(obj_league[l_id])){
			obj_league[l_id]={'l_cn_abbr':l_cn_abbr, 'l_bg_color':l_bg_color};
		}
		m_total++;
	}
	var arr_league_html=new Array();
	var l_count=0;
	var h_league_val=$('#h_league_set').val();
	var cr_hleague_set=','+h_league_val+',';
	for(var l_id in obj_league){
		if(l_count%3==0){
			 arr_league_html.push('<tr height="30">');
		}
		var cr_lid=','+l_id+',';
		var league_input_html='<td width="84" bgcolor="'+obj_league[l_id]['l_bg_color']+'"><input type="checkbox" id="leagues_'+l_id+'" name="leagues_'+l_id+'" value="'+l_id+'"';
		if(cr_hleague_set.indexOf(cr_lid)==-1){
			league_input_html+=' checked="checked"';
		}
		league_input_html+=' />'+obj_league[l_id]['l_cn_abbr']+'</td>';
		arr_league_html.push(league_input_html);
		if(l_count%3==2){
			arr_league_html.push('</tr>');
		}else{
			arr_league_html.push('<td width="15">&nbsp;</td>');
		}
		l_count++;
	}
	var m_l_num=l_count%3;
	if(m_l_num!=0){
		var lack_num=3-m_l_num;
		for(var i=0;i<lack_num;i++){
			arr_league_html.push('<td width="84">&nbsp;</td>');
			if(i!=lack_num-1){
				arr_league_html.push('<td width="15">&nbsp;</td>');
			}
		}
		arr_league_html.push('</tr>');
	}
	var league_html=arr_league_html.join("\r\n");
	$('#tbl_leagues').html(league_html);
	$('#tbl_leagues').find('input').click(function(){
		show_status_cond();
		var l_id=$(this).val();
		var is_checked=$(this).attr('checked');
		var h_league_set=$('#h_league_set').val();
		var h_lid=','+l_id+',';
		var h_leagues=','+h_league_set+',';		
		if(!is_checked){
			if(h_leagues.indexOf(h_lid)==-1){
				if(h_league_set!=''){
					h_league_set+=',';
				}
				h_league_set+=l_id;
				if(h_leagues==',,'){
					h_leagues=','+l_id+',';
				}else{
					h_leagues+=l_id+',';
				}
			}
		}else{
			if(h_leagues.indexOf(h_lid)!=-1){
				var arr_leagues=h_league_set.split(',');
				var leagus_num=arr_leagues.length;
				var r_league='';
				for(var i=0; i<leagus_num; i++){
					if(arr_leagues[i]!=l_id){
						if(r_league!=''){
							r_league+=',';
						}
						r_league+=arr_leagues[i];
					}
				}
				h_league_set=r_league;
				h_leagues=','+r_league+',';
			}
		}
		$('#h_league_set').val(h_league_set);
		var hidden_match_ids='';
		var hidden_count=0;
		$("tr[id^='trm_']").each(function(){
			var trm_id=$(this).attr('id');
			var arr_id=trm_id.split('_');
			var tr_lid=arr_id[2];
			var h_tr_lid=','+tr_lid+',';
			if(h_leagues.indexOf(h_tr_lid)!=-1){
				$(this).css('display','none');
				if(hidden_match_ids!=''){
					hidden_match_ids+=',';
				}
				hidden_match_ids+=arr_id[1];
				hidden_count++;
			}else{
				$(this).css('display','');
			}
		});
		$('#hide_matches').val(hidden_match_ids);
		$('#hidden_total').text(hidden_count);
		set_zebra();
	});
	var match_html=arr_match_html.join("\r\n");
	$('#tr_title').after(match_html);
	$('#match_total').text(m_total);
	load_match_status=1;
	if(status_hide_mids!=''){
		$('#hide_matches').val(status_hide_mids);
	}
	var r_hide_matches=','+$('#hide_matches').val()+',';
	var top_matches=$('#top_matches').val();
	var r_top_matches=','+top_matches+',';
	var obj_tops={};
	var obj_hide={};
	$("tr[id^='trm_']").each(function(){
		var tr_id=$(this).attr('id');
		var arr_tr_id=tr_id.split('_');
		var c_mid=','+arr_tr_id[1]+',';
		if(r_hide_matches.indexOf(c_mid)!=-1){
			obj_hide[arr_tr_id[1]]=tr_id;
		}
		if(r_top_matches.indexOf(c_mid)!=-1){
			obj_tops[arr_tr_id[1]]=tr_id;
		}
	});
	var arr_top_matches=top_matches.split(',');
	var top_len=arr_top_matches.length;
	if(top_len>0){
		$('#top_matches').val('');
		for(var i=0;i<top_len;i++){
			if(obj_tops[arr_top_matches[i]]!=undefined){
				var mtr_id=obj_tops[arr_top_matches[i]];
				up_down(mtr_id);
			}
		}
	}
	var hidden_count=0;
	for(var mid in obj_hide){
		$('#'+obj_hide[mid]).css('display','none');
		hidden_count++;
	}
	$('#hidden_total').text(hidden_count);
	set_zebra();
	$('input').attr('disabled',false);
}

//按状态显示隐藏比赛
function set_status_match(){
	show_league_cond();
	var fixture_check=$('#fixture').attr('checked');
	var playing_check=$('#playing').attr('checked');
	var played_check=$('#played').attr('checked');
	var other_check=$('#other').attr('checked');
	var status_hide_matches='';
	var status_hide_num=0;
	for(var id in obj_match_data){
		var m_id=obj_match_data[id]['m_id'];
		var l_id=obj_match_data[id]['l_id'];
		var m_status=obj_match_data[id]['status'];
		var m_period=obj_match_data[id]['match_period'];
		if((!fixture_check && (m_status=='Fixture' || (m_status=='Playing' && m_period==''))) || (!playing_check && (m_status=='Playing' && (m_period=='1H' || m_period=='2H' || m_period=='HT'))) || (!played_check && (m_status=='Played' || (m_status=='Playing' && (m_period=='E1' || m_period=='E2' || m_period=='EH' || m_period=='PS' || m_period=='FT')))) || (!other_check && (m_status=='Postponed' || m_status=='Suspended' || m_status=='Cancelled'))){
			$('#trm_'+m_id+'_'+l_id).css('display','none');
			if(status_hide_matches!=''){
				status_hide_matches+=',';
			}
			status_hide_matches+=m_id;
			status_hide_num++;
		}else{
			$('#trm_'+m_id+'_'+l_id).css('display','');
		}
	}
	$('#hide_matches').val(status_hide_matches);
	$('#hidden_total').text(status_hide_num);
	set_zebra();
}

//重置斑马线
function set_zebra(){
	var bg_set='#f6f6f6';
	var up_bg_set='#ffefc7';
	var is_has_top=0;
	$("tr[id^='trm_']").each(function(){
		var tr_bg=$(this).attr('bgcolor');
		if($(this).css('display')!='none'){
			if(tr_bg!='#fff5dc' && tr_bg!='#ffefc7'){
				if(bg_set!=''){
					bg_set='';
				}else{
					bg_set='#f6f6f6';
				}
				$(this).attr('bgcolor',bg_set);
			}else{
				if(up_bg_set=='#ffefc7'){
					up_bg_set='#fff5dc';
				}else{
					up_bg_set='#ffefc7';
				}
				$(this).attr('bgcolor',up_bg_set);
				if(is_has_top==0){
					is_has_top=1;
				}
			}
		}
	});
	if($('#cancel_updown')!=undefined){
		if(is_has_top==0){
			$('#cancel_updown').css('display','none');
		}else{
			$('#cancel_updown').css('display','');
		}
	}
}

//奖池切换
function pool_set_odds(obj_span){
	var pool_set=obj_span.attr('id');
	$('#m_pool_set').val(pool_set);
	var pool_text=obj_span.text();
	$('#pool_show').text(pool_text);
	for(var id in obj_match_data){
		var m_id=obj_match_data[id]['m_id'];
		var goalline=obj_match_data[id]['goalline'];
		var obj_odds_td=$('#odds_'+m_id);
		obj_odds_td.html('');
		odds_html=cal_odds(pool_set,m_id);
		obj_odds_td.html(odds_html);
		if($('#goalline_'+m_id)!=undefined){
			if(pool_set=='hhad'){
				if(goalline!=''){
					$('#goalline_'+m_id).text('('+goalline+')');
				}else{
					$('#goalline_'+m_id).text('');
				}
			}else{
				$('#goalline_'+m_id).text('');
			}
		}
	}
}

//计算奖金
function cal_odds(pool_set,m_id){
	var id='_'+m_id;
	var odds_html='';
	var fs_h=obj_match_data[id]['fs_h'];
	var fs_a=obj_match_data[id]['fs_a'];
	if(fs_h=='' || fs_a==''){
		if($('#mscore_'+m_id)!=undefined){
			var show_score=$('#mscore_'+m_id).text();
			if(show_score!='VS'){
				var arr_show_score=show_score.split('-');
				fs_h=arr_show_score[0];
				fs_a=arr_show_score[1];
			}
		}
	}
	if(fs_h==''){
		fs_h=0;
	}
	if(fs_a==''){
		fs_a=0;
	}
	var match_status=obj_match_data[id]['status'];
	var match_period=obj_match_data[id]['match_period'];
	if(pool_set=='had'){
		if(match_status=='Fixture' || match_status=='Postponed' || match_status=='Cancelled' || (match_status=='Playing' && match_period=='')){
			if(obj_match_data[id]['h']!=''){
				odds_html+=obj_match_data[id]['h'];
			}
			if(obj_match_data[id]['d']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				odds_html+=obj_match_data[id]['d'];
			}
			if(obj_match_data[id]['a']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				odds_html+=obj_match_data[id]['a'];
			}
		}else{
			fs_h=parseFloat(fs_h);
			fs_a=parseFloat(fs_a);
			if(obj_match_data[id]['h']!=''){
				if(fs_h>fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['h']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['h'];
				}
			}
			if(obj_match_data[id]['d']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				if(fs_h==fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['d']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['d'];
				}
			}
			if(obj_match_data[id]['a']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				if(fs_h<fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['a']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['a'];
				}
			}
		}
	}else if(pool_set=='hhad'){
		if(match_status=='Fixture' || match_status=='Postponed' || match_status=='Cancelled' || (match_status=='Playing' && match_period=='')){
			if(obj_match_data[id]['hh']!=''){
				odds_html+=obj_match_data[id]['hh'];
			}
			if(obj_match_data[id]['hd']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				odds_html+=obj_match_data[id]['hd'];
			}
			if(obj_match_data[id]['ha']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				odds_html+=obj_match_data[id]['ha'];
			}
		}else{
			fs_h=parseFloat(fs_h);
			fs_a=parseFloat(fs_a);
			var r_fs_h=fs_h+parseFloat(obj_match_data[id]['goalline']);
			if(obj_match_data[id]['hh']!=''){
				if(r_fs_h>fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['hh']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['hh'];
				}
			}
			if(obj_match_data[id]['hd']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				if(r_fs_h==fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['hd']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['hd'];
				}
			}
			if(obj_match_data[id]['ha']!=''){
				if(odds_html!=''){
					odds_html+='&nbsp;';
				}
				if(r_fs_h<fs_a){
					odds_html+='<span class="tb_float_bg">'+obj_match_data[id]['ha']+'</span>';
				}else{
					odds_html+=obj_match_data[id]['ha'];
				}
			}
		}
	}else if(pool_set=='crs'){
		if(obj_match_data[id]['crs_odds']!=''){
			if(match_status!='Fixture' && match_status!='Postponed' && match_status!='Cancelled' && match_period!='' && obj_match_data[id]['crs_odds']!=''){
				odds_html=fs_h+'-'+fs_a+'('+obj_match_data[id]['crs_odds']+')';
			}
		}
	}else if(pool_set=='ttg'){
		if(obj_match_data[id]['ttg_odds']!=''){
			if(match_status!='Fixture' && match_status!='Postponed' && match_status!='Cancelled' && match_period!='' && obj_match_data[id]['ttg_odds']!=''){
				fs_h=parseFloat(fs_h);
				fs_a=parseFloat(fs_a);
				var total_goal=fs_h+fs_a;
				odds_html=total_goal+'('+obj_match_data[id]['ttg_odds']+')';
			}
		}
	}else if(pool_set=='hafu'){
		if(obj_match_data[id]['hafu_odds']!=''){
			if(match_status!='Fixture' && match_status!='Postponed' && match_status!='Cancelled' && match_period!='' && obj_match_data[id]['hafu_odds']!=''){
				var hafu_name='';
				fs_h=parseFloat(fs_h);
				fs_a=parseFloat(fs_a);
				if(match_period=='1H'){
					if(fs_h>fs_a){
						hafu_name='胜胜';
					}else if(fs_h<fs_a){
						hafu_name='负负';
					}else{
						hafu_name='平平';
					}
				}else{
					var half_name='';
					var hts_h=parseFloat(obj_match_data[id]['hts_h']);
					var hts_a=parseFloat(obj_match_data[id]['hts_a']);
					if(hts_h>hts_a){
						half_name='胜';
					}else if(hts_h<hts_a){
						half_name='负';
					}else{
						half_name='平';
					}
					if(fs_h>fs_a){
						hafu_name=half_name+'胜';
					}else if(fs_h<fs_a){
						hafu_name=half_name+'负';
					}else{
						hafu_name=half_name+'平';
					}
				}
				odds_html=hafu_name+'('+obj_match_data[id]['hafu_odds']+')';
			}
		}
	}
	return odds_html;
}

//加载比赛详情
function get_all_details(){
	try{
		$.getScript("http://i.sporttery.cn/api/match_live/get_match_detail?callback=?", function(){
			if(match_detail!=undefined){
				obj_detail_data=match_detail;
			}
		});
	}catch(e){}
	window.clearTimeout(detail_timeout);
	detail_timeout=window.setTimeout("get_all_details()", 60000);
}

//显示比赛详情
function show_detail(m_id,ev){
	if(load_match_status==1){
		var m_status=obj_match_data['_'+m_id]['status'];
		if(m_status=='Playing' || m_status=='Played' || m_status=='Suspended'){
			make_detail_tb(m_id,ev);
		}
	}
}

//创建比赛详情列表
function make_detail_tb(m_id,ev){
	$('#tbl_match_detail').html('');
	var arr_detail_html=new Array();
	arr_detail_html.push('<tr bgcolor="#bcc1c4" height="27" class="tb_ff"><td width="152">'+obj_match_data['_'+m_id]['h_cn_abbr']+'</td><td width="19">&nbsp;</td><td width="70">时间</td><td width="19">&nbsp;</td><td width="152">'+obj_match_data['_'+m_id]['a_cn_abbr']+'</td></tr>');
	var is_has_detail=0;
	if(obj_detail_data[m_id]!=undefined){
		var obj_detail_event=obj_detail_data[m_id]['event'];
		var event_len=obj_detail_event.length;
		if(event_len>0){
			for(var i=0;i<event_len;i++){
				var sev_len=obj_detail_event[i].length;
				if(sev_len>0){
					for(var j=0;j<sev_len;j++){
						var d_code=obj_detail_event[i][j]['code'];
						if(obj_event[d_code]!=undefined){
							var e_minute=obj_detail_event[i][j]['minute'];
							if(e_minute>=0 && e_minute<=90){
								if(obj_detail_event[i][j]['minute_extra']!=''){
									e_minute=e_minute+'+';
								}
								if(obj_detail_event[i][j]['is_ha']=='a'){
									arr_detail_html.push('<tr height="30"><td class="boder_B boder_R">&nbsp;</td><td class="boder_B boder_R">&nbsp;</td><td class="boder_B boder_R" bgcolor="#f6f6f6">'+e_minute+'\'</td><td class="boder_B boder_R"><div '+((d_code=='YC' || d_code=='Y2C' || d_code=='RC')?'class="tb_ff '+obj_event[d_code]+' FloatL" style="margin:0 0 0 4px"':'class="'+obj_event[d_code]+'"')+'></div></td><td class="boder_B">'+obj_detail_event[i][j]['person']+'</td></tr>');
								}else{
									arr_detail_html.push('<tr height="30"><td class="boder_B boder_R">'+obj_detail_event[i][j]['person']+'</td><td class="boder_B boder_R"><div '+((d_code=='YC' || d_code=='Y2C' || d_code=='RC')?'class="tb_ff '+obj_event[d_code]+' FloatL" style="margin:0 0 0 4px"':'class="'+obj_event[d_code]+'"')+'></div></td><td class="boder_B boder_R" bgcolor="#f6f6f6">'+e_minute+'\'</td><td class="boder_B boder_R">&nbsp;</td><td class="boder_B">&nbsp;</td></tr>');
								}
							}
						}
					}
				}
			}
			if(is_has_detail==0){
				is_has_detail=1;
			}
		}
		var obj_detail_statistics=obj_detail_data[m_id]['statistics'];
		for(var st in obj_statistics){
			if(obj_detail_statistics[st]!=undefined){
				arr_detail_html.push('<tr height="30"><td class="boder_B boder_R">'+obj_detail_statistics[st]['team_h_data']+'</td><td class="boder_B boder_R" colspan="3" bgcolor="#f6f6f6">'+obj_statistics[st]+'</td><td class="boder_B">'+obj_detail_statistics[st]['team_a_data']+'</td></tr>');
				if(is_has_detail==0){
					is_has_detail=1;
				}
			}
		}
	}
	if(is_has_detail==1){
		var detail_html=arr_detail_html.join("\r\n");
		$('#tbl_match_detail').html(detail_html);
		var body_top=$(window).scrollTop();
		var body_width=$(document.body).width();
		var div_top=body_top+ev.clientY+15;
		var div_left=body_width/2-208;
		var div_top_height=div_top+$('#div_detail_show').height();
		var body_heigth=$(document).height();
		if(div_top_height>body_heigth){
			div_top=div_top-(div_top_height-body_heigth)-5;
			div_left=ev.clientX+15;
		}
		$('#div_detail_show').css('top',div_top+'px');
		$('#div_detail_show').css('left',div_left+'px');
	    $('#div_detail_show').show();
	}
}

//隐藏比赛详情
function close_detail(){
	if(load_match_status==1){
		if($('#div_detail_show').css('display')!='none'){
			$('#div_detail_show').hide();
		}
	}
}

//获取时间
function get_this_time(){
	this_sever_time=new Date().getTime();
	window.setTimeout("get_this_time()",20000);
}

//显示变化数据
function show_change_data(){
	if(load_match_status==1){
		try{
			$.getScript("http://i.sporttery.cn/api/match_live/get_match_updated?callback=?", function(){
				if(match_updated!=undefined){
					change_match_info(match_updated);
				}
			});
			last_update_time=new Date();
		}catch(e){}
	}
	window.clearTimeout(updated_timeout);
	updated_timeout=window.setTimeout("show_change_data()", 15000);
}

//处理变化数据
function change_match_info(match_updated){
	var goal_set=$('#goal_set').attr('checked');
	var arr_pop_info=new Array();
	var updated_len=match_updated.length;
	var is_order=0;
	var m_pool_set=$('#m_pool_set').val();
	if(updated_len>0){
		for(var i=0;i<updated_len;i++){
			var m_id=match_updated[i]['m_id'];
			var status=match_updated[i]['status'];
			var match_period=match_updated[i]['match_period'];
			var obj_tb_status=$('#tb_status_'+m_id);
			if(status=='Playing'){
				if(match_period!=''){
					if(match_period=='1H' || match_period=='2H'){
						if(match_period=='1H'){
							if(obj_tb_status.hasClass("tb_33")){
								obj_tb_status.removeClass("tb_33");
								obj_tb_status.addClass("tb_blue");
								obj_tb_status.addClass("tb_bold");
							}
							if(obj_match_data['_'+m_id]['status']=='Fixture'){
								obj_match_data['_'+m_id]['status']=status;
							}
							if(!($('#mscore_'+m_id).hasClass("tb_blue"))){
								$('#mscore_'+m_id).addClass("tb_blue");
								$('#mscore_'+m_id).addClass("tb_bold");
								$('#mscore_'+m_id).text('0-0');
								pool_set_odds($('#'+m_pool_set));
							}
							if(!($('#half_'+m_id).hasClass("tb_blue"))){
								$('#half_'+m_id).addClass("tb_blue");
								$('#half_'+m_id).text('0-0');
							}
						}
						var this_minute=match_updated[i]['minute'];
						if(match_updated[i]['minute_extra']!=''){
							this_minute+='+';
						}
						if(obj_playing_time[m_id]==undefined){
							obj_tb_status.html(this_minute+'<img src="http://info.sporttery.cn/livescore/images/in.gif">');
							obj_playing_time[m_id]={'minute':this_minute,'time':new Date().getTime()};
							pool_set_odds($('#'+m_pool_set));
						}else{
							if(obj_playing_time[m_id]['minute']!=this_minute){
								obj_tb_status.html(this_minute+'<img src="http://info.sporttery.cn/livescore/images/in.gif">');
								obj_playing_time[m_id]['minute']=this_minute;
								obj_playing_time[m_id]['time']=new Date().getTime();
								if(obj_playing_time[m_id]['minute']>this_minute){
									pool_set_odds($('#'+m_pool_set));
								}
							}else{
								var this_time=new Date().getTime();
								if(Math.floor((this_time-obj_playing_time[m_id]['time'])/1000)>=60){
									var tb_minute=obj_tb_status.text();
									var tb_minute_num=parseInt(tb_minute,10);
									if((match_period=='1H' && tb_minute_num<45) || (match_period=='2H' && tb_minute_num<90)){
										tb_minute_num=parseInt(tb_minute_num,10)+1;
										obj_tb_status.html(tb_minute_num+'<img src="http://info.sporttery.cn/livescore/images/in.gif">');
										obj_playing_time[m_id]['time']=this_time;
									}else{
										if(match_period=='1H' && tb_minute=='45'){
											obj_tb_status.html('45+<img src="http://info.sporttery.cn/livescore/images/in.gif">');
											obj_playing_time[m_id]['time']=this_time;
											var cookie_info=$.cookie("m_1H_"+m_id);
    										if(cookie_info==null){
												$.cookie("m_1H_"+m_id,'{"minute":"'+obj_playing_time[m_id]['minute']+'","time":"'+obj_playing_time[m_id]['time']+'"}',{expires:null});
											}
										}else if(match_period=='2H' && tb_minute=='90'){
											obj_tb_status.html('90+<img src="http://info.sporttery.cn/livescore/images/in.gif">');
											obj_playing_time[m_id]['time']=this_time;
											var cookie_info= $.cookie("m_2H_"+m_id);
											if(cookie_info==null){
												$.cookie("m_2H_"+m_id,'{"minute":"'+obj_playing_time[m_id]['minute']+'","time":"'+obj_playing_time[m_id]['time']+'"}',{expires:null});
											}
										}
									}
								}
							}
						}
						var l_fs_h=parseInt(obj_match_data['_'+m_id]['fs_h'], 10);
						var l_fs_a=parseInt(obj_match_data['_'+m_id]['fs_a'], 10);
						var u_fs_h=parseInt(match_updated[i]['fs_h'], 10);
						var u_fs_a=parseInt(match_updated[i]['fs_a'], 10);
						if(u_fs_h>l_fs_h || u_fs_a>l_fs_a){
							var is_ha='';
							if(u_fs_h>l_fs_h){
								is_ha='h';
							}else{
								is_ha='a';
							}
							if(is_ha!=''){
								if($('#'+is_ha+'_team_'+m_id)!=undefined){
									$('#'+is_ha+'_team_'+m_id).css('background-color','#bbbb22');
								}
								obj_match_data['_'+m_id]['fs_'+is_ha]=match_updated[i]['fs_'+is_ha];
								var new_score=match_updated[i]['fs_h']+'-'+match_updated[i]['fs_a'];
								$('#mscore_'+m_id).text(new_score);
								if(match_period=='1H'){
									$('#half_'+m_id).text(new_score);
									obj_match_data['_'+m_id]['hts_'+is_ha]=match_updated[i]['hts_'+is_ha];
								}
								obj_match_data['_'+m_id]['crs_odds']=match_updated[i]['crs_odds'];
								obj_match_data['_'+m_id]['ttg_odds']=match_updated[i]['ttg_odds'];
								obj_match_data['_'+m_id]['hafu_odds']=match_updated[i]['hafu_odds'];
								pool_set_odds($('#'+m_pool_set));
								if(goal_set=='checked'){
									var obj_ltr=$('#mscore_'+m_id).parent().parent();
									if(obj_ltr.css('display')!='none'){
										var h_td_class=(is_ha=='h'?' tb_f00 tb_bold':'');
										var a_td_class=(is_ha=='a'?' tb_f00 tb_bold':'');
										var td_score=(is_ha=='h'?'<span class="tb_f00 tb_bold">'+match_updated[i]['fs_h']+'</span>':match_updated[i]['fs_h'])+'-'+(is_ha=='a'?'<span class="tb_f00 tb_bold">'+match_updated[i]['fs_a']+'</span>':match_updated[i]['fs_a']);
										arr_pop_info.push('<tr height="30"><td class="boder_B'+h_td_class+'">'+obj_match_data['_'+m_id]['h_cn_abbr']+'</td><td class="boder_B">'+td_score+'</td><td class="boder_B'+a_td_class+'">'+obj_match_data['_'+m_id]['a_cn_abbr']+'</td></tr>');
									}
								}
								window.setTimeout('del_goal_color("'+m_id+'","'+is_ha+'")', 10000);
							}
						}
						var l_h_rc=parseInt(obj_match_data['_'+m_id]['h_rc'], 10);
						var l_a_rc=parseInt(obj_match_data['_'+m_id]['a_rc'], 10);
						var u_h_rc=parseInt(match_updated[i]['h_rc'], 10);
						var u_a_rc=parseInt(match_updated[i]['a_rc'], 10);
						if(u_h_rc>l_h_rc || u_a_rc>l_a_rc){
							var is_ha='';
							var rc_num=0;
							if(u_h_rc>l_h_rc){
								is_ha='h';
								rc_num=u_h_rc;
							}else{
								is_ha='a';
								rc_num=u_a_rc;
							}
							if(is_ha!='' && rc_num>0){
								var obj_rc=$('#div_rc'+is_ha+'_'+m_id);
								if(obj_rc!=undefined){
									if(obj_rc.hasClass("tb_nored")){
										obj_rc.removeClass("tb_nored");
										obj_rc.addClass("tb_redbg");
										obj_rc.find('span').css('display','');
									}
									obj_rc.find('span').text(rc_num);
									obj_match_data['_'+m_id][is_ha+'_rc']=rc_num;
								}
							}
						}
					}else{
						if(match_period=='HT'){
							if($('#half_'+m_id).hasClass("tb_blue")){
								$('#half_'+m_id).removeClass("tb_blue");
								$('#half_'+m_id).addClass("tb_f00");
							}
						}else if(match_period!=''){
							if(obj_tb_status.hasClass("tb_blue")){
								obj_tb_status.removeClass("tb_blue");
								obj_tb_status.addClass("tb_f00");
								$('#mscore_'+m_id).removeClass("tb_blue");
								$('#mscore_'+m_id).addClass("tb_f00");
								is_order=1;
							}
						}
						obj_tb_status.html(obj_period[match_period]);
					}
				}
				obj_match_data['_'+m_id]['match_period']=match_period;
				obj_match_data['_'+m_id]['minute']=match_updated[i]['minute'];
				obj_match_data['_'+m_id]['minute_extra']=match_updated[i]['minute_extra'];
			}else if(status=='Played'){
				if(obj_tb_status.hasClass("tb_blue")){
					obj_match_data['_'+m_id]['status']=status;
					obj_match_data['_'+m_id]['match_period']=match_period;
					obj_tb_status.removeClass("tb_blue");
					obj_tb_status.addClass("tb_f00");
					obj_tb_status.html(obj_status[status]);
					$('#mscore_'+m_id).removeClass("tb_blue");
					$('#mscore_'+m_id).addClass("tb_f00");
					is_order=1;
				}
			}else if(status=='Suspended'){
				if(obj_tb_status.hasClass("tb_blue")){
					obj_match_data['_'+m_id]['status']=status;
					obj_match_data['_'+m_id]['match_period']=match_period;
					obj_tb_status.removeClass("tb_blue");
					obj_tb_status.removeClass("tb_bold");
					obj_tb_status.addClass("tb_33");
					obj_tb_status.html(obj_status[status]);
					is_order=1;
				}
			}else{
				var is_live=0;
				if(status=='Fixture'){
					var date_cn=obj_match_data['_'+m_id]['date_cn'];
					var time_cn=obj_match_data['_'+m_id]['time_cn'];
					var date_split='-';
					var arr_date=[];
					if(date_cn.indexOf(date_split)!=-1){
						arr_date=date_cn.split('-');
					}
					var time_split=':';
					var arr_time=[];
					if(time_cn.indexOf(time_split)!=-1){
						arr_time=time_cn.split(':');
					}
					var match_time=new Date(arr_date[0],(parseInt(arr_date[1],10)-1),arr_date[2],arr_time[0],arr_time[1],arr_time[2]).getTime();
					if(this_sever_time>match_time){
						var m_minute=Math.floor((this_sever_time-match_time)/60000);
						if(m_minute>0 && m_minute<=90){
							if(obj_tb_status.hasClass("tb_33")){
								obj_tb_status.removeClass("tb_33");
								obj_tb_status.addClass("tb_blue");
								obj_tb_status.addClass("tb_bold");
								$('#mscore_'+m_id).addClass("tb_blue");
								$('#mscore_'+m_id).addClass("tb_bold");
								$('#mscore_'+m_id).text('0-0');
								$('#half_'+m_id).addClass("tb_blue");
								$('#half_'+m_id).text('0-0');
							}
							obj_tb_status.html(m_minute+'<img src="http://info.sporttery.cn/livescore/images/in.gif">');
							is_live=1;
						}
					}
				}
				if(is_live==0){
					obj_match_data['_'+m_id]['status']=status;
					obj_tb_status.html(obj_status[status]);
				}
			}
		}
	}
	var pop_len=arr_pop_info.length;
	if(goal_set=='checked' && pop_len>0){
		show_goal_div(arr_pop_info);
		goal_song();
	}
	if(is_order==1){
		window.setTimeout('sort_data()', 5000);
	}
}

//去掉进球背景
function del_goal_color(m_id, is_ha){
	$('#'+is_ha+'_team_'+m_id).css('background-color','');
}

//显示比分变化弹出层
function show_goal_div(arr_pop_info){
	var pop_html=arr_pop_info.join('');
	$('#tbl_goal_info').html('');
	var pop_title_html='<tr id="tr_goal_title" bgcolor="#bcc1c4" height="27" class="tb_ff"><td width="131">主队</td><td width="60">比分</td><td width="131">客队</td></tr>';
	pop_html=pop_title_html+pop_html;
	$('#tbl_goal_info').html(pop_html);
	var ie_v=get_ie_version();
	if(ie_v>0 && ie_v<=6){
		scroll_func();
	}else{
		$("#div_goal_show").css("position","fixed");
		$("#div_goal_show").css("top","0px");
	}
	var body_width=$(document.body).width();
	var div_left=body_width/2-161;
	$("#div_goal_show").css("left",div_left+"px");
	if(ie_v>0 && ie_v<=6){
		if($('.close_goal')!=undefined){
			var div_close_left=parseFloat(div_left)+297;
			$('.close_goal').css('left',div_close_left+'px');
			$('.close_goal').css('display','');
		}
	}
	$('#div_goal_show').show();
	if(ie_v>0 && ie_v<=6){
		ie6_scroll_set=0;
	}
	window.clearTimeout(goal_close_flag);
	goal_close_flag=window.setTimeout('close_goal_div()', 10000);
}

function scroll_func(){
	var s_top=parseFloat($(document).scrollTop());
	if(ie6_scroll_set==1){
		if(s_top>0){
			var page_height=$(document).height();
			var div_height=$('.wrap').height()+1;
			var height_minus=parseFloat(page_height)-parseFloat(div_height);
			if(height_minus>0){
				var window_height=$(window).height();
				var minus=page_height-parseFloat(window_height);
				if(minus>=s_top){
					var bottom_height=minus-s_top;
					if(bottom_height<height_minus){
						var bottom_minus=height_minus-bottom_height;
						s_top=s_top-bottom_minus;
					}
				}
			}
		}
	}
	$("#div_goal_show").css("top",s_top+'px');
	if($('.close_goal')!=undefined){
		$('.close_goal').css('top',s_top+'px');
	}
}

//隐藏比分变化弹出层
function close_goal_div(){
	$('#div_goal_show').hide();
	if($('.close_goal')!=undefined){
		$('.close_goal').css('display','none');
	}
}

//发声
function goal_song(){
	var song_set=$('#song_set').val();
	if(song_set=='1'){
		var ie_v=get_ie_version();
		var flash_sound="images/notice.swf";
		if (ie_v>0 && ie_v<=6){
			//$('#flashsound').html("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='1' height='1'><param name='movie' value='"+flash_sound+"'><param name='quality' value='high'><param name='wmode' value='transparent'><embed src='"+flash_sound+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1' height='1'></embed></object>");
		}else{
			$('#flashsound').html("<embed src='"+flash_sound+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1' height='1'></embed>");
		}
	}
}

function get_ie_version(){
	var ieVersion = "-1";
	var ua=navigator.userAgent.toLowerCase();
	if (window.ActiveXObject){
		ieVersion=ua.match(/msie ([\d.]+)/)[1];
	}
	ieVersion=parseFloat(ieVersion);
	return ieVersion;
}

//保留隐藏选中
function set_show_hide(obj_hs){
	var s_checked_matches='';
	$("input[id^='matches_']").each(function(){
		var hs_id=$(this).attr('id');
		var arr_hs_id=hs_id.split('_');
		if($(this).attr('checked')!=undefined){
			if(s_checked_matches!=''){
				s_checked_matches+=',';
			}
			s_checked_matches+=arr_hs_id[1];
		}
	});
	$('#checked_matches').val(s_checked_matches);
	var obj_show_hide=$('#show_hide_set');
	if(obj_show_hide.css('display')=='none'){
		var div_left=$('#'+obj_hs).offset().left;
		obj_show_hide.css('left',(div_left-50)+'px');
		obj_show_hide.css('display','block');
	}
}

//置顶功能
function up_down(m_tr_id){
	if(load_match_status==1){
		var top_matches=$('#top_matches').val();
		var mtr_html=$('#'+m_tr_id).html();
		var arr_trid=m_tr_id.split('_');
		var ud_id=','+arr_trid[1]+',';
		var up_top=','+top_matches+',';
		var r_top_matches='';
		if(up_top.indexOf(ud_id)!=-1){
			var arr_tops=top_matches.split(',');
			var top_len=arr_tops.length;
			for(var i=0;i<top_len;i++){
				if(arr_tops[i]!=arr_trid[1]){
					if(r_top_matches!=''){
						r_top_matches+=',';
					}
					r_top_matches+=arr_tops[i];
				}
			}
			mtr_html='<tr id="'+m_tr_id+'" height="39" class="boder_B" bgcolor="">'+mtr_html+'</tr>';
			$('#'+m_tr_id).remove();
			var is_this_id=0;
			var r_next_id=0;
			for(var  id in obj_match_data){
				m_id=obj_match_data[id]['m_id'];
				if(m_id==arr_trid[1]){
					is_this_id=1;
				}else{
					if(is_this_id==1){
						var next_id=','+m_id+',';
						if(up_top.indexOf(next_id)==-1){
							r_next_id=m_id;
							break ;
						}
					}
				}
			}
			if(r_next_id==0){
				$('#tbl_match_list').append(mtr_html);
			}else{
				$('#set_ud_'+r_next_id).parent().parent().before(mtr_html);
			}

			$('#set_ud_'+arr_trid[1]).removeClass('tb_hf');
			$('#set_ud_'+arr_trid[1]).addClass('tb_zd');
			if(r_top_matches==''){
				if($('#cancel_updown')!=undefined){
					$('#cancel_updown').remove();
				}
			}
		}else{
			mtr_html='<tr id="'+m_tr_id+'" height="39" class="boder_B" bgcolor="#fff5dc">'+mtr_html+'</tr>';
			$('#'+m_tr_id).remove();
			$('#tr_title').after(mtr_html);
			$('#set_ud_'+arr_trid[1]).removeClass('tb_zd');
			$('#set_ud_'+arr_trid[1]).addClass('tb_hf');
			if(top_matches==''){
				r_top_matches=arr_trid[1];
				$('#'+m_tr_id).after('<tr id="cancel_updown" height="39" class="boder_B" bgcolor=""><td colspan="10" align="center" class="tb_blue"><u style="cursor:pointer" onclick="cancel_updown();">撤销置顶</u></td></tr>');
			}else{
				r_top_matches=top_matches+','+arr_trid[1];
			}
		}
		set_zebra();
		$('#top_matches').val(r_top_matches);
	}
}

function cancel_updown(){
	if(load_match_status==1){
		var arr_tops=[];
		var arr_top_hides=[];
		$("tr[id^='trm_']").each(function(){
			var tr_id=$(this).attr('id');
			var tr_bg=$(this).attr('bgcolor');
			var tr_dispay=$(this).css('display');
			if(tr_bg=='#fff5dc' || tr_bg=='#ffefc7'){
				arr_tops.push(tr_id);
				if(tr_dispay=='none'){
					arr_top_hides.push(tr_id);
				}
			}
		});
		var top_len=arr_tops.length;
		if(top_len>0){
			for(var i=0;i<top_len;i++){
				up_down(arr_tops[i]);
			}
		}
		var hide_len=arr_top_hides.length;
		if(hide_len>0){
			for(var i=0;i<hide_len;i++){
				$('#'+arr_top_hides[i]).css('display','none');
			}
		}
	}
}

function check(){
	if (old_update_time==last_update_time && old_update_time!=''){
		if (confirm("由于程序忙，或其他网络问题，你已经和服务器断开连接超过 5 分钟，是否要重新连接观看比分？")){
			window.location.reload();
		}
	}
	old_update_time=last_update_time;
	window.setTimeout("check()", 300000);
}