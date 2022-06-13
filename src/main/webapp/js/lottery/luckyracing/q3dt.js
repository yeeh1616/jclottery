
$(document).ready(function () {
	$("#redInLiId").hide();
	$("#radomSelDsBtnId").hide();
	
	// 选中事件
	$("#gjPanelId").find(".qyconQsya").click(function(){
		
		if ( $(this).children().eq(0).hasClass("qyconQsy2b") ) {
			$(this).children().eq(0).removeClass("qyconQsy2b").addClass("qyconQsy2a");
		} else {
			if ( $("#gjPanelId").find(".qyconQsy2b").length > 1 ) {
				popupConfirm("温馨提示","最大设两个胆！");
				return false;
			}
			$(this).children().eq(0).removeClass("qyconQsy2a").addClass("qyconQsy2b");
			var val = $(this).children().eq(0).html();
			$("#yjPanelId").find(".qyconQsy2b").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2b").addClass("qyconQsy2a");
				}
			});
		}
		calc();
	});
	$("#yjPanelId").find(".qyconQsya").click(function(){
		if ( $(this).children().eq(0).hasClass("qyconQsy2b") ) {
			$(this).children().eq(0).removeClass("qyconQsy2b").addClass("qyconQsy2a");
		} else {
			$(this).children().eq(0).removeClass("qyconQsy2a").addClass("qyconQsy2b");
			var val = $(this).children().eq(0).html();
			$("#gjPanelId").find(".qyconQsy2b").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2b").addClass("qyconQsy2a");
				}
			});
		}
		calc();
	});
	
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qyconQsy2b").removeClass("qyconQsy2b").addClass("qyconQsy2a");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "(";
			var gjCodes = $("#gjPanelId").find(".qyconQsy2b");
			var yjCodes = $("#yjPanelId").find(".qyconQsy2b");
			for ( var i = 0 ; i < gjCodes.length; i++ ) {
				betCode += $(gjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1) + ")";
			for ( var i = 0 ; i < yjCodes.length; i++ ) {
				betCode += $(yjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "前三胆拖复式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
});

function calc() {
	var betNum = 0;
	
	var betCode = "(";
	var gjCodes = $("#gjPanelId").find(".qyconQsy2b");
	var yjCodes = $("#yjPanelId").find(".qyconQsy2b");
	if ( (gjCodes.length > 0) && (gjCodes.length+yjCodes.length>3) ) {
		for ( var i = 0 ; i < gjCodes.length; i++ ) {
			betCode += $(gjCodes[i]).html() + ",";
		}
		betCode = betCode.substring(0, betCode.length - 1) + ")";
		for ( var i = 0 ; i < yjCodes.length; i++ ) {
			betCode += $(yjCodes[i]).html() + ",";
		}
		betNum = engine.calcBetNum(10, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

