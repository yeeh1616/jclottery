
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
			var dansFs = betNum == "1" ? "组二单式" : "组二复式";
			
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
			var rd = engine.random(3,12);
			var betCode = rd[0] + "," + rd[1] + "," + rd[2];
			var betNum = 1;
			var dansFs = "组三单式";
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
	$(".qyconQsy2b").each(function(index){
		betCode += $(this).html() + ",";
	});
	if ( betCode != "" ) {
		betNum = engine.calcBetNum(40, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

