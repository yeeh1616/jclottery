$(document).ready(function () {
	loadSch();
	addEvent();
});

var schNum = 12;
var romArray = ["3", "1", "0"];

function loadSch() {
	html ='<tr>'
	+'<th width="8%" rowspan="2">场次</th>'
	+'<th width="8%" rowspan="2">赛事</th>'
	+'<th width="14%" rowspan="2">比赛时间</th>'
	+'<th rowspan="2" width="20%">对阵</th>'
	+'<th height="20" colspan="4">投注区</th>'
	+'<th width="6%" rowspan="2">包</th>'
	+'<th width="12%" rowspan="2">数据</th>'
	+'</tr>'
	+'<tr>'
	+'<th width="5%" height="20" class="w_border"></th>'
	+'<th width="9%" height="20">3</th>'
	+'<th width="9%" height="20">1</th>'
	+'<th width="9%" height="20">0</th>'
	+'</tr>';
	
	for ( var i = 0; i < schedules.length; i++ ) {
		
		html += '<tr id="body_tr_'+(i+1)+'_1">';
		html += '<td rowspan="2">'+schedules[i].gameId+'</td>';
		html += '<td rowspan="2" style="color:#ffffff;background-color:#'+schedules[i].bgcolor+'">'+schedules[i].leagueName+'</td>';
		html += '<td rowspan="2">'+schedules[i].raceStartTime+'</td>';
		html += '<td class="dui_t table2"><a href="#" class="name">'+schedules[i].hostTeam+'</a><span class="vs">vs</span><a href="#" class="name">'+schedules[i].guestTeam+'</a></td>';
		html += '<td class="w_border_n">半</td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>3</a></td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>1</a></td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>0</a></td>';
		html += '<td rowspan="2"><a name="allBetAN" class="w_underline">包</a></td>';
		html += '<td rowspan="2" class="w_sjfx table2"><a href="/datacenter/analyse.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">析</a><a href="/datacenter/europ.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">欧</a><a href="/datacenter/asia.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">亚</a></td>';
		html += '</tr>';
		html += '<tr id="body_tr_'+(i+1)+'_2">';
		html += '<td class="dui_t table2"><a href="#" class="name">'+schedules[i].hostTeam+'</a><span class="vs">vs</span><a href="#" class="name">'+schedules[i].guestTeam+'</a></td>';
		html += '<td class="w_border_n">全</td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>3</a></td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>1</a></td>';
		html += '<td class="jjbg jjbg_w" name="betTdN"><a>0</a></td>';
		html += '</tr>';
	}
	$("#zcSchAreaId").empty();
	$(html).appendTo($("#zcSchAreaId"));
}

function addEvent() {
	$("td[name=betTdN]").click(function(){
		$(this).toggleClass("active");		
		calc();
	});
	// 全包
	$("a[name=allBetAN]").click(function(){
		if ( $(this).closest('tr').find(".active").length != 3 ) {
			$(this).closest('tr').find("td[name=betTdN]").addClass("active");
		} else {
			$(this).closest('tr').find("td[name=betTdN]").removeClass("active");
		}
		calc();
	});
}

