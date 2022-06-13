
$(document).ready(function () {
	$("#redInLiId").hide();
	$("#radomSelDsBtnId").hide();
	
	// 选中事件
	$("#line1AreaId").find(".qecondlConrp1").each(function(index){
		$(this).click(function(){
			if ( $(this).children().eq(0).hasClass("qecondlConrp2b") ) {
				$(this).children().eq(0).removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
			} else {
				if ( $("#line1AreaId").find(".qecondlConrp2b").length > 1 ) {
					popupConfirm("温馨提示","最多选择两个个胆码！");
					return false;
				}
				$(this).children().eq(0).removeClass("qecondlConrp2a").addClass("qecondlConrp2b");
				
				$("#line2AreaId").find("span[bet="+$(this).children().eq(0).attr("bet")+"]").removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
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
				$("#line1AreaId").find("span[bet="+$(this).children().eq(0).attr("bet")+"]").removeClass("qecondlConrp2b").addClass("qecondlConrp2a");
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
			var betCode = "(";
			var betCodeS = "(";
			$("#line1AreaId").find(".qecondlConrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1) + ")";
			betCodeS = betCodeS.substring(0, betCodeS.length - 1) + ")";
			$("#line2AreaId").find(".qecondlConrp2b").each(function(index){
				betCode += $(this).attr("bet") + ",";
				betCodeS += $(this).attr("bet2") + ",";
			});
			
			betCode = betCode.substring(0, betCode.length - 1);
			betCodeS = betCodeS.substring(0, betCodeS.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "颜色前二胆拖";
			
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCodeS+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
});

var YS_LABLE = ["A", "B", "C", "D", "E", "F"];
var YS_NAME = ["红色", "蓝色", "绿色", "黄色", "银色", "紫色"];

function calc() {
	var betNum = 0;
	
	if ( $("#line1AreaId").find(".qecondlConrp2b").length > 0 && ($("#line1AreaId").find(".qecondlConrp2b").length + $("#line2AreaId").find(".qecondlConrp2b").length) > 3 ) {
		var betCode = "(";
		$("#line1AreaId").find(".qecondlConrp2b").each(function(index){
			betCode += $(this).attr("bet") + ",";
		});
		betCode = betCode.substring(0, betCode.length - 1) + ")";
		$("#line2AreaId").find(".qecondlConrp2b").each(function(index){
			betCode += $(this).attr("bet") + ",";
		});
		betNum = engine.calcBetNum(25, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

