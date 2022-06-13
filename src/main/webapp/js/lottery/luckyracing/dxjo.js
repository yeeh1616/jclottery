
$(document).ready(function () {
	// 选中事件
	$("span[name=betName]").click(function(){
		if ( $(this).hasClass("qecondlJonrp2a") ) {
			$(this).removeClass("qecondlJonrp2a").addClass("qecondlJonrp2b");
		} else {
			$(this).removeClass("qecondlJonrp2b").addClass("qecondlJonrp2a");
		}
		calc();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qycondlConrp2b").removeClass("qycondlConrp2b");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			var betCodeS = "";
			$("span[name=betName]").each(function(index){
				if ( $(this).hasClass("qecondlJonrp2b") ) {
					betCode += $(this).attr("bet") + ",";
					betCodeS += $(this).attr("bn") + ",";
				}
			});
			betCode = betCode.substring(0, betCode.length - 1);
			betCodeS = betCodeS.substring(0, betCodeS.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "大小奇偶单式" : "大小奇偶复式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCodeS+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
	// 机选5注
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val());
		for ( var i = 0; i < v; i++ ) {
			var S = engine.random(1,12);
			var R = parseInt(S) % 4;
			var betCode = DXJO[R];
			var betCodeS = DXJOS[R];
			var betNum = 1;
			var dansFs = "前一单式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCodeS+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	getBonusControlData('',6);//加载奖金数据
});

var DXJO = ["A", "B", "C", "D"];
var DXJOS = ["小奇", "小偶", "大奇", "大偶"];

function calc() {
	var betNum = 0;
	
	var betCode = "";
	$("span[name=betName]").each(function(index){
		if ( $(this).hasClass("qecondlJonrp2b") ) {
			betCode += $(this).attr("bet") + ",";
		}
	});
	if ( betCode != "" ) {
		betNum = engine.calcBetNum(35, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

