var dateUtils = new DateUtils();
$(document).ready(function (){
	loadSchedules();
	
	// 倒计时
	setInterval("clock()", 1000);
});

function loadSchedules() {
	var html = '';
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		date = obj.id.substring(0,8);
		var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
		html += '<tr id="'+obj.id+'">'+
	          '<td width="7%" class="zhuan"><span class="menn zhuanjai"></span>'+
	          '<div class="lisd zhuanzhuan"><i></i>媒体观点</div></td>'+
	          '<td width="9%">'+dateUtils.getWeekDay2(dd)+obj.id.substring(8)+'</td>'+
	          '<td width="9%"><span style="background: '+obj.bgcolor+';color: #fff; display:block;width:41px;height:20px;text-align:center;line-height:20px;margin:auto;">'+obj.leaguename+' </span></td>'+
	          '<td width="12%">'+obj.starttime.substring(5,16)+'</td>'+
	          '<td width="12%">'+obj.hostname+'</td>'+
	          '<td width="4%" class="figure_form_vs">vs</td>'+
	          '<td width="12%">'+obj.guestname+'</td>'+
	          '<td width="6%" class="figure_first">指数:</td>'+
	          '<td width="9%" class="figure_first figure_none"></td>'+
	          '<td width="9%" class="figure_first figure_none"></td>'+
	          '<td width="9%" class="figure_first figure_none"></td>'+
	        '</tr>';
	}
	$(html).appendTo($("#accordion"));
	
	var odds = eval("("+$("#oddInfoId").val()+")");
	for ( var i = 0; i < odds.length; i++ ) {
		$("tr[id="+odds[i].id+"]").find(".figure_first").eq(1).removeClass("figure_none").html(odds[i].srate);
		$("tr[id="+odds[i].id+"]").find(".figure_first").eq(2).removeClass("figure_none").html(odds[i].prate);
		$("tr[id="+odds[i].id+"]").find(".figure_first").eq(3).removeClass("figure_none").html(odds[i].frate);
	}
}

function clock() {
	var sec = parseInt($("#stopSId").html(),10);
	if ( sec > 0 ) {
		if ( sec <= 10 ) {
			$("#stopSId").html("0"+(sec-1));
		} else {
			$("#stopSId").html((sec-1));
		}
	} else {
		var min = parseInt($("#stopMId").html(),10);
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#stopMId").html("0"+(min-1));
			} else {
				$("#stopMId").html((min-1));
			}
			$("#stopSId").html(59);
		} else {
			var hou = parseInt($("#stopHId").html(),10);
			if ( hou > 0 ) {
				if ( hou <= 10 ) {
					$("#stopHId").html("0"+(hou-1));
				} else {
					$("#stopHId").html((hou-1));
				}
				$("#stopMId").html(59);
				$("#stopSId").html(59);
			} else {
			}
		}
	}
}