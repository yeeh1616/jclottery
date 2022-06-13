$(document).ready(function () {
	loadSch();
	addEvent();
	$("#betListAreaId .w_lil.fl").live('click', function(){
		$("#clearAllSelBtnId").click();
		var reds = $(this).find(".tw_red").html().split(",");
		for ( var i = 0; i < reds.length; i++ ) {
			var tds = $("#zcSchAreaId").find("tr").eq(i+2).find(".jjbg.jjbg_w");
			for ( var j = 0; j < tds.length; j++ ) {
				if ( reds[i].indexOf($(tds[j]).find("a").html()) > -1 ) {
					$(tds[j]).addClass("active");
				}
			}
		}
		calc();
	});
});

var schNum = 9;
var romArray = ["3", "1", "0"];

function loadSch() {
	html = '<tr>'
        +'<th width="5%" rowspan="2">场次</th>'
        +'<th width="7%" rowspan="2">赛事</th>'
        +'<th width="14%" rowspan="2">比赛时间</th>'
        +'<th rowspan="2" width="18%">主队客队</th>'
        +'<th width="9%" rowspan="2">数据</th>'
        +'<th width="6%" height="20" colspan="3">平均欧赔</th>'
        +'<th width="6%" height="20" colspan="3">选号区</th>'
        +'<th width="6%" rowspan="2">设胆</th>'
        +'<th width="5%" rowspan="2">包</th>'
        +'</tr>'
        +'<tr>'
        +'<th height="20"width="6%">胜</th>'
        +'<th width="6%">平</th>'
        +'<th width="6%">负</th>'
        +'<th width="6%" height="20">胜</th>'
        +'<th width="6%">平</th>'
        +'<th width="6%">负</th>'
        +'</tr>';
	for ( var i = 0; i < schedules.length; i++ ) {
		
		html +='<tr id="body_tr_'+(i+1)+'">';
		html +='<td>'+schedules[i].gameId+'</td>';
		html +='<td style="color:#ffffff;background-color:#'+schedules[i].bgcolor+'">'+schedules[i].leagueName+'</td>';
		html +='<td>'+schedules[i].raceStartTime+'</td>';
		html +='<td class="table2"><a href="#" class="name">'+schedules[i].hostTeam+'</a><span class="vs">vs</span><a href="#" class="name">'+schedules[i].guestTeam+'</a></td>';
		html +='<td class="table2"><a href="/datacenter/analyse.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">析</a><a href="/datacenter/europ.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">欧</a><a href="/datacenter/asia.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">亚</a></td>';
		var odd = schedules[i].averageOdds;
		if ( odd == 'null' ) {
			odd = '--,--,--';
		}
		var odds = odd.split(",");
		html +='<td>'+odds[0]+'</td>';
		html +='<td>'+odds[1]+'</td>';
		html +='<td>'+odds[2]+'</td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>3</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>1</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>0</a></td>';
		html +='<td class="jjbg_n "><input type="checkbox" disabled="disabled"/></td>';
		html +='<td class="w_underline"><a name="allBetAN">包</a></td>';
		html +='</tr>';
	}
	$("#zcSchAreaId").empty();
	$(html).appendTo($("#zcSchAreaId"));
}


function addEvent() {
	$("td[name=betTdN]").click(function(){
		$(this).toggleClass("active");
		
		if($(this).parent().find('td[name=betTdN].active').length == 0){
			$(this).parent().find('input:checkbox').attr('checked',false).attr("disabled", "disabled");
		}else{
			$(this).parent().find('input:checkbox').removeAttr("disabled");
		}
		
		calcR9();
	});
	// 全包
	$("a[name=allBetAN]").click(function(){
		if ( $(this).closest('tr').find(".active").length != 3 ) {
			$(this).closest('tr').find("td[name=betTdN]").addClass("active");
		} else {
			$(this).closest('tr').find("td[name=betTdN]").removeClass("active");
		}
		if($(this).closest('tr').find('td[name=betTdN].active').length == 0){
			$(this).closest('tr').find('input:checkbox').attr('checked',false).attr("disabled", "disabled");
		}else{
			$(this).closest('tr').find('input:checkbox').removeAttr("disabled");
		}
		calcR9();
	});
	// 设胆
	$("#zcSchAreaId").find("input[type=checkbox]").click(function(){
		if ( $("#zcSchAreaId").find("input[type=checkbox]:checked").length == 9 ) {
			layer.alert("最多设置8个胆！",0);
			return false;
		}
		calcR9();
	});
}

function calcR9() {
	var index = 0;
	var trs = $("#zcSchAreaId tr");
	for ( var i = 0; i < trs.length; i++ ) {
		if ($(trs[i]).find(".active").length > 0 ) {
			index++;
		}
	}
	var betNum = 0;
	if ( index > 8 ) {
		var danArray = new Array();
		var tuoArray = new Array();
		for ( var i = 0; i < trs.length; i++ ) {
			var subArray = new Array();
			if ($(trs[i]).find(".active").length > 0 ) {
				$(trs[i]).find(".active").each(function(i){
					subArray.push($(this).find('a').html());
				});
				
				if ( $(trs[i]).find("input[type=checkbox]:checked").length == 1 ) {
					danArray.push(subArray);
				} else {
					tuoArray.push(subArray);
				}
			}
		}
		betNum = football.calcR9DtBetNum(danArray, tuoArray);
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum*2);
}

