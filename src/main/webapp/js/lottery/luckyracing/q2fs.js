
$(document).ready(function () {
	// 选中事件
	$(".qyconQsya").click(function(){
		if ( $(this).children().eq(0).hasClass("qyconQsy2b") ) {
			$(this).children().eq(0).removeClass("qyconQsy2b").addClass("qyconQsy2a");
		} else {
			$(this).children().eq(0).removeClass("qyconQsy2a").addClass("qyconQsy2b");
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
			var betCode = "";
			$(".qyconQsy2b").each(function(index){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "前二单式" : "前二复式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
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
			var betCode = "";
			var codes = engine.random(2,12);
			for ( var j = 0; j < codes.length; j++ ) {
				betCode += codes[j] + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1);
			var betNum = 2;
			var dansFs = "前二复式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
});

function calc() {
	var betNum = 0;
	
	var betCode = "";
	if ( $(".qyconQsy2b").length > 0 ) {
		$(".qyconQsy2b").each(function(index){
			betCode += $(this).html() + ",";
		});
		betNum = engine.calcBetNum(5, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

