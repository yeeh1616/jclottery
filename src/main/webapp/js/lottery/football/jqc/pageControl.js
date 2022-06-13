$(document).ready(function () {
	loadSch();
	addEvent();
});

var schNum = 8;
var romArray = ["0", "1", "2", "3"];

function loadSch() {
	html = '<tr>'
		+'<th width="8%" rowspan="2">场次</th>'
		+'<th width="8%" rowspan="2">赛事</th>'
		+'<th width="14%" rowspan="2">比赛时间</th>'
		+'<th rowspan="2" width="20%">对阵</th>'
		+'<th height="20" colspan="4">投注区</th>'
		+'<th width="6%" rowspan="2">包</th>'
		+'<th width="12%" rowspan="2">数据</th>'
		+'</tr>'
		+'<tr>'
		+'<th height="20" width="8%">0</th>'
		+'<th height="20" width="8%">1</th>'
		+'<th height="20" width="8%">2</th>'
		+'<th height="20" width="8%">3+</th>'
		+'</tr>';

	for ( var i = 0; i < schedules.length; i++ ) {
		
		html +='<tr id="body_tr_'+(i+1)+'_1">';
		html +='<td rowspan="2">'+schedules[i].gameId+'</td>';
		html +='<td rowspan="2" style="color:#ffffff;background-color:#'+schedules[i].bgcolor+'">'+schedules[i].leagueName+'</td>';
		html +='<td rowspan="2">'+schedules[i].raceStartTime+'</td>';
		html +='<td class="dui_t table2"><span class="d_name fl">主队</span><a href="#" class="name fl">'+schedules[i].hostTeam+'</a></td>';		
		html +='<td width="6%" class="jjbg jjbg_w" name="betTdN"><a>0</a></td><td width="6%" class="jjbg jjbg_w" name="betTdN"><a>1</a></td><td width="6%" class="jjbg jjbg_w" name="betTdN"><a>2</a></td><td width="6%" class="jjbg jjbg_w" name="betTdN"><a>3</a></td>';
		html +='<td rowspan="2"><a class="w_underline" name="allBetAN">包</a></td>';
		html +='<td rowspan="2" class="w_sjfx table2"><a href="/datacenter/analyse.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">析</a><a href="/datacenter/europ.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">欧</a><a href="/datacenter/asia.jhtml?schudlesNo='+schedules[i].scheduleNo+'" target="_blank">亚</a></td>';
		html +='</tr>';
		html +='<tr id="body_tr_'+(i+1)+'_2">';
		html +='<td class="dui_t table2"><span class="d_name fl">客队</span><a href="#" class="name fl">'+schedules[i].guestTeam+'</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>0</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>1</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>2</a></td>';
		html +='<td class="jjbg jjbg_w" name="betTdN"><a>3</a></td>';
		html +='</tr>';
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
		var $TR = $(this).closest('tr');
		if ( $TR.find(".active").length != 4 && $TR.next('tr').find(".active").length != 4) {
			$TR.find("td[name=betTdN]").addClass("active");
			$TR.next('tr').find("td[name=betTdN]").addClass("active");
		} else {
			$TR.find("td[name=betTdN]").removeClass("active");
			$TR.next('tr').find("td[name=betTdN]").removeClass("active");
		}
		calc();
	});
}

