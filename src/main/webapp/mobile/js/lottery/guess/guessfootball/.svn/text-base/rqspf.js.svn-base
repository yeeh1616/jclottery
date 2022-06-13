
var dateUtils = new DateUtils();
$(document).ready(function () {
	// 异步请求
	loadSch();
	
	// 单击事件
	$(".none_linh,.part3").click(function(){
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		calc();
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
			$(".zulan").empty();
			var html = '';
			var date = "";
			var ndate = $("#ndateValId").val();
			
			var counterMap = new Hashtable();
			for ( var i = 0; i < schedules.length; i++ ) {
				var obj = schedules[i];
				if (  obj.rqspfggodds == 'null' ) {
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
				if (  obj.rqspfggodds == 'null' ) {
					continue;
				}
				var odds = obj.rqspfggodds.split(",");
				if ( date == "" ) {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛开奖比赛</h1>';
				}
				if ( date == obj.id.substring(0,8) ) {
					html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
						        '<div class="part1">'+
						          '<div class="zul_txt">'+obj.leaguename+'</div>'+
						          '<div class="zul_txt"><span>'+obj.id.substring(8)+'</span> <span>'+getAheadTime(obj.stoptime.substring(11,16))+'</span></div>'+
						        '</div>'+
						        '<div class="zu_r">'+
						        '<div class="part2 none_linh" bet="3" betName="主胜">'+
						        '<a href="javascript:void 0">'+
						          '<div class="zul_txt">'+obj.hostname+'<span class="red">'+obj.ggrq+'</span></div>'+
						          '<div class="zul_txt"><span>主胜</span> <span>'+odds[0]+'</span></div></a>'+
						        '</div>'+
						        '<div class="part3" bet="1" betName="平">'+
						        '<a href="javascript:void 0" >'+
						          '<div class="zul_txt">VS</div>'+
						          '<div class="zul_txt"><span>平'+odds[1]+'</span> <span></span></div></a>'+
						        '</div>'+
						        '<div class="part4 none_linh" bet="0" betName="主负">'+
						        '<a href="javascript:void 0" >'+
						          '<div class="zul_txt">'+obj.guestname+'</div>'+
						          '<div class="zul_txt"><span>主负</span> <span>'+odds[2]+'</span></div></a>'+
						        '</div>'+
						        '</div>'+
						        '<div class="clear"></div>'+
					      '</li>';
				} else {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛开奖比赛</h1>';
						html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'">'+
				        '<div class="part1">'+
				          '<div class="zul_txt">'+obj.leaguename+'</div>'+
				          '<div class="zul_txt"><span>'+obj.id.substring(8)+'</span> <span>'+getAheadTime(obj.stoptime.substring(11,16))+'</span></div>'+
				        '</div>'+
				        '<div class="zu_r">'+
				        '<div class="part2 none_linh" bet="3" betName="主胜">'+
				        '<a href="javascript:void 0">'+
				          '<div class="zul_txt">'+obj.hostname+'<span class="red">'+obj.ggrq+'</span></div>'+
				          '<div class="zul_txt"><span>主胜</span> <span>'+odds[0]+'</span></div></a>'+
				        '</div>'+
				        '<div class="part3" bet="1" betName="平">'+
				        '<a href="javascript:void 0" >'+
				          '<div class="zul_txt">VS</div>'+
				          '<div class="zul_txt"><span>平'+odds[1]+'</span> <span></span></div></a>'+
				        '</div>'+
				        '<div class="part4 none_linh" bet="0" betName="主负">'+
				        '<a href="javascript:void 0" >'+
				          '<div class="zul_txt">'+obj.guestname+'</div>'+
				          '<div class="zul_txt"><span>主负</span> <span>'+odds[2]+'</span></div></a>'+
				        '</div>'+
				        '</div>'+
				        '<div class="clear"></div>'+
			      '</li>';
				}
				
			}
			$(html).appendTo($(".zulan"));
		}
	});
}
