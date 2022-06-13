
var dateUtils = new DateUtils();
$(document).ready(function () {
	// 异步请求
	loadSch();
	
	// 弹出时赋值
	$("a[name=betN]").click(function(){
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
				
				var odds = obj.bqcggodds.split(",");
				if ( date == "" ) {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</h1>';
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
				if ( date == obj.id.substring(0,8) ) {
					html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'" style="background: none;">'+
						        '<div class="part1">'+
						          '<div>'+obj.leaguename+'</div>'+
						          '<div>'+obj.id.substring(8)+'</div><div>'+getAheadTime(obj.stoptime.substring(11,16))+'</div>'+
						        '</div>'+
						        '<div class="part_r">'+
						        '<div class="top">'+
						        '<div style="width:30%">'+obj.hostname+'<span class="red">'+obj.ggrq+'</span></div>'+
						        '<div style=" width:10% !important">VS</div>'+
						        '<div style="width:60%">'+obj.guestname+'</div>'+
						        '</div>'+
						        
						        '<table class="table_0 new_t" width="99%" cellspacing="0" cellpadding="0" border="0">'+
						        '<tbody>'+
						        '<tr>'+
						        '<td width="16%" style="background-color: #5bbdfb; color:#FFF">非让球</td>'+
						        '<td class="sf s " width="28%" v="主胜" pl="4.10" t="0" bet="1-3" name="betN">'+
						        '<a href="#">'+
						        '胜'+
						        '<span>'+spfOdds[0]+'</span>'+
						        '</a>'+
						        '</td>'+
						        '<td class="sf p " width="28%" v="主平" pl="4.00" t="0" bet="1-1" name="betN">'+
						        '<a href="#">'+
						        '平'+
						        '<span>'+spfOdds[1]+'</span>'+
						        '</a>'+
						        '<td class="sf f " width="28%" v="主负" pl="1.59" t="0" bet="1-0" name="betN">'+
						        '<a href="#">'+
						        '负'+
						        '<span>'+spfOdds[2]+'</span>'+
						        '</a>'+
						        '</td>'+
						        '</tr>'+
						        '<tr>'+
						        '<td width="16%" style="background-color: #7fda33; color:#FFF">让球</td>'+
						        '<td class="rsf s " width="28%" v="让球胜" pl="2.05" t="1" bet="2-3" name="betN">'+
						        '<a href="#">'+
						        '胜'+
						        '<span>'+rqSpfOdds[0]+'</span>'+
						        '</a>'+
						        '</td>'+
						        '<td class="rsf p " width="28%" v="让球平" pl="3.75" t="1" bet="2-1" name="betN">'+
						        '<a href="#">'+
						        '平'+
						        '<span>'+rqSpfOdds[1]+'</span>'+
						        '</a>'+
						        '</td>'+
						        '<td iclass="rsf f " width="28%" v="让球负" pl="2.67" t="1" bet="2-0" name="betN">'+
						        '<a href="#">'+
						        '负'+
						        '<span>'+rqSpfOdds[2]+'</span>'+
						        '</a>'+
						        '</td>'+
						        '</tr>'+
						        '</tbody>'+
						        '</table>'+
						        
						        '<div class="bottom_all">'+
						        '<div>'+
						        '<a  href="#hun_zhan" class="check_a s" data-transition="slide" odd="'+obj.bqcggodds+'" name="betN">点击展开投注区</a>'+
						        '</div>'+
						        '</div>'+
						        '</div>'+
						        '<div class="clear"></div>'+
					      '</li>';
				} else {
					date = obj.id.substring(0,8);
					var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
					html += '<h1>'+date.substring(4, 6)+'月'+date.substring(6)+'日 '+dateUtils.getWeekDay(dd)+' '+(counterMap.get(date)=='undefined'?'0':counterMap.get(date))+'场比赛可投注</h1>';
						html += '<li id="'+obj.id+'" host="'+obj.hostname+'" guest="'+obj.guestname+'" style="background: none;">'+
						 '<div class="part1">'+
				          '<div>'+obj.leaguename+'</div>'+
				          '<div>'+obj.id.substring(8)+'</div><div>'+getAheadTime(obj.stoptime.substring(11,16))+'</div>'+
				        '</div>'+
				        '<div class="part_r">'+
				        '<div class="top">'+
				        '<div style="width:30%">'+obj.hostname+'<span class="red">'+obj.ggrq+'</span></div>'+
				        '<div style=" width:10% !important">VS</div>'+
				        '<div style="width:60%">'+obj.guestname+'</div>'+
				        '</div>'+
				        
				        '<table class="table_0 new_t" width="99%" cellspacing="0" cellpadding="0" border="0">'+
				        '<tbody>'+
				        '<tr>'+
				        '<td width="16%" style="background-color: #5bbdfb; color:#FFF">非让球</td>'+
				        '<td class="sf s " width="28%" v="主胜" pl="4.10" t="0" bet="1-3" name="betN">'+
				        '<a href="#">'+
				        '胜'+
				        '<span>'+spfOdds[0]+'</span>'+
				        '</a>'+
				        '</td>'+
				        '<td class="sf p " width="28%" v="主平" pl="4.00" t="0" bet="1-1" name="betN">'+
				        '<a href="#">'+
				        '平'+
				        '<span>'+spfOdds[1]+'</span>'+
				        '</a>'+
				        '<td class="sf f " width="28%" v="主负" pl="1.59" t="0" bet="1-0" name="betN">'+
				        '<a href="#">'+
				        '负'+
				        '<span>'+spfOdds[2]+'</span>'+
				        '</a>'+
				        '</td>'+
				        '</tr>'+
				        '<tr>'+
				        '<td width="16%" style="background-color: #7fda33; color:#FFF">让球</td>'+
				        '<td class="rsf s " width="28%" v="让球胜" pl="2.05" t="1" bet="2-3" name="betN">'+
				        '<a href="#">'+
				        '胜'+
				        '<span>'+rqSpfOdds[0]+'</span>'+
				        '</a>'+
				        '</td>'+
				        '<td class="rsf p " width="28%" v="让球平" pl="3.75" t="1" bet="2-1" name="betN">'+
				        '<a href="#">'+
				        '平'+
				        '<span>'+rqSpfOdds[1]+'</span>'+
				        '</a>'+
				        '</td>'+
				        '<td iclass="rsf f " width="28%" v="让球负" pl="2.67" t="1" bet="2-0" name="betN">'+
				        '<a href="#">'+
				        '负'+
				        '<span>'+rqSpfOdds[2]+'</span>'+
				        '</a>'+
				        '</td>'+
				        '</tr>'+
				        '</tbody>'+
				        '</table>'+
				        
				        '<div class="bottom_all">'+
				        '<div>'+
				        '<a  href="#hun_zhan"  class="check_a s" data-transition="slide" odd="'+obj.bqcggodds+'" name="betN">点击展开投注区</a>'+
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
