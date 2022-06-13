
$(document).ready(function () {
	// 选中事件
	$("#line1AreaId").find(".qecondlConrp1").each(function(index){
		$(this).click(function(){
			if ( $(this).children().eq(0).hasClass("qecondlConrp2b") ) {
				$(this).children().eq(0).removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
			} else {
				$(this).children().eq(0).removeClass("qecondlConrp2a").addClass("qecondlConrp2b");
			}
			calc();
		});
	});
	$("#line2AreaId").find(".qecondlConrp1").each(function(index){
		$(this).click(function(){
			if ( $(this).children().eq(0).hasClass("qecondlConrp2b") ) {
				$(this).children().eq(0).removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
			} else {
				$(this).children().eq(0).removeClass("qecondlConrp2a").addClass("qecondlConrp2b");
			}
			calc();
		});
	});
	$("#line3AreaId").find(".qecondlConrp1").each(function(index){
		$(this).click(function(){
			if ( $(this).children().eq(0).hasClass("qecondlConrp2b") ) {
				$(this).children().eq(0).removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
			} else {
				$(this).children().eq(0).removeClass("qecondlConrp2a").addClass("qecondlConrp2b");
			}
			calc();
		});
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qecondlConrp2b").removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			var betCodeS = "";
			$("#line1AreaId").find(".qecondlConrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1) + "|";
			betCodeS = betCodeS.substring(0, betCodeS.length - 1) + "|";
			$("#line2AreaId").find(".qecondlConrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1) + "|";
			betCodeS = betCodeS.substring(0, betCodeS.length - 1) + "|";
			$("#line3AreaId").find(".qecondlConrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			
			betCode = betCode.substring(0, betCode.length - 1);
			betCodeS = betCodeS.substring(0, betCodeS.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "颜色前二单式" : "颜色前二复式";
			
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
			R = engine.random(1,12);
			betCode += "|" + YS_LABLE[parseInt(R)%6];
			betCodeS += "|" + YS_NAME[parseInt(R)%6];
			R = engine.random(1,12);
			betCode += "|" + YS_LABLE[parseInt(R)%6];
			betCodeS += "|" + YS_NAME[parseInt(R)%6];
			var betNum = 1;
			var dansFs = "颜色前二单式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCodeS+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
});

var YS_LABLE = ["A", "B", "C", "D", "E", "F"];
var YS_NAME = ["红色", "蓝色", "绿色", "黄色", "银色", "紫色"];

function calc() {
	var betNum = 0;
	
	if ( $("#line1AreaId").find(".qecondlConrp2b").length > 0 && $("#line2AreaId").find(".qecondlConrp2b").length > 0 && $("#line3AreaId").find(".qecondlConrp2b").length > 0 ) {
		var betCode = "";
		$("#line1AreaId").find(".qecondlConrp2b").each(function(index){
			betCode += $(this).attr("bet") + ",";
		});
		betCode = betCode.substring(0, betCode.length - 1) + "|";
		$("#line2AreaId").find(".qecondlConrp2b").each(function(index){
			betCode += $(this).attr("bet") + ",";
		});
		betCode = betCode.substring(0, betCode.length - 1) + "|";
		$("#line3AreaId").find(".qecondlConrp2b").each(function(index){
			betCode += $(this).attr("bet") + ",";
		});
		betNum = engine.calcBetNum(23, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

