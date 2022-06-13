
$(document).ready(function () {
	// 选中事件
	$(".qecondlYonrp1").click(function(){
		if ( $(this).children().eq(0).hasClass("qecondlYonrp2b") ) {
			$(this).children().eq(0).removeClass("qecondlYonrp2b").addClass("qecondlYonrp2a");
		} else {
			$(this).children().eq(0).removeClass("qecondlYonrp2a").addClass("qecondlYonrp2b");
		}
		calc();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qecondlYonrp2b").removeClass("qecondlYonrp2b").addClass("qecondlYonrp2a");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			var betCodeS = "";
			$(".qecondlYonrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			betCodeS = betCodeS.substring(0, betCodeS.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "颜色前一单式" : "颜色前一复式";
			
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
			var R = engine.random(1,12);
			var betCode = YS_LABLE[parseInt(R)%6];
			var betCodeS = YS_NAME[parseInt(R)%6];
			var betNum = 1;
			var dansFs = "颜色前一单式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCodeS+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	try {
		getBonusControlData('',9);//加载奖金数据
	} catch (e) {
		// TODO: handle exception
	}
	
});

var YS_LABLE = ["A", "B", "C", "D", "E", "F"];
var YS_NAME = ["红色", "蓝色", "绿色", "黄色", "银色", "紫色"];

function calc() {
	var betNum = 0;
	
	var betCode = "";
	$(".qecondlYonrp2b").each(function(index){
		betCode += $(this).html() + ",";
	});
	if ( betCode != "" ) {
		betNum = engine.calcBetNum(17, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

