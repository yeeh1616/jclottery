
var dateUtils = new DateUtils();
$(document).ready(function () {
	// 异步请求
	loadSch();
	
	// 弹出时赋值
	$("a[name=betN]").click(function(){
		var odds = $(this).attr("odd").split(",");
		$("td[name=betN]").each(function(index){
			$(this).children().eq(0).children().eq(1).html(odds[index]);
		});
	});
	
	// 单击事件
	$("td[name=betN]").click(function(){
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		//calc();
	});
});

function loadSch() {
	$.ajax({
	    type: "post",
	    url: "/data/lottery/guess/guessFootballSchedules.js",
	    async: false,
	    dataType: "text",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			eval(data);
			$(".buy_jing").empty();
			var html = '';
			var date = "";
			var ndate = $("#ndateValId").val();
			
			var counterMap = new Hashtable();
			for ( var i = 0; i < schedules.length; i++ ) {
				var obj = schedules[i];
				if (  obj.bqcggodds == 'null' ) {
					continue;
				}
				date = schedules[i].id.substring(0,8);
				
				if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) > ndate ) {
					if ( counterMap.get(date) != 'undefined' ) {
						counterMap.put(date, parseInt(counterMap.get(date))+1);
					} else {
						counterMap.put(date, 1);
					}
				} 
			}
			date = "";
			for ( var i = 0; i < schedules.length; i++ ) {
				if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) <= ndate ) {
					continue;
				}
				var obj = schedules[i];
				if (  obj.bqcggodds == 'null' ) {
					continue;
				}
				var odds = obj.bqcggodds.split(",");
				if ( date == "" ) {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</h1>';
				}
				if ( date == obj.id.substring(0,8) ) {
					html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
						        '<div class="part1">'+
						          '<div>'+obj.leaguename+'</div>'+
						          '<div>'+obj.id.substring(8)+'</div><div>'+getAheadTime(obj.stoptime.substring(11,16))+'</div>'+
						        '</div>'+
						        '<div class="part_r">'+
						        '<div class="top">'+
						        '<div>'+obj.hostname+'</div>'+
						        '<div>VS</div>'+
						        '<div>'+obj.guestname+'</div>'+
						        '</div>'+
						        '<div class="bottom_all">'+
						        '<div>'+
						        '<a  href="#sfc" data-rel="popup" data-transition="slide" odd="'+obj.bqcggodds+'" name="betN">点击展开投注区</a>'+
						        '</div>'+
						        '</div>'+
						        '</div>'+
						        '<div class="clear"></div>'+
					      '</li>';
				} else {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</h1>';
						html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
						 '<div class="part1">'+
				          '<div>'+obj.leaguename+'</div>'+
				          '<div>'+obj.id.substring(8)+'</div><div>'+getAheadTime(obj.stoptime.substring(11,16))+'</div>'+
				        '</div>'+
				        '<div class="part_r">'+
				        '<div class="top">'+
				        '<div>'+obj.hostname+'</div>'+
				        '<div>VS</div>'+
				        '<div>'+obj.guestname+'</div>'+
				        '</div>'+
				        '<div class="bottom_all">'+
				        '<div>'+
				        '<a  href="#sfc" data-rel="popup" data-transition="slide" odd="'+obj.bqcggodds+'" name="betN">点击展开投注区</a>'+
				        '</div>'+
				        '</div>'+
				        '</div>'+
				        '<div class="clear"></div>'+
			      '</li>';
				}
				
			}
			$(html).appendTo($(".buy_jing"));
		}
	});
}
