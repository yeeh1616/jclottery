
$(document).ready(function () {
	$("#redInLiId").hide();
	$("#radomSelDsBtnId").hide();
	// 生成投注区
	var betAreaV = ["选择号码"];
	html = "";
	for ( var i = 0; i < betAreaV.length; i++ ) {
		html += '<div class="qyconQsall" >'+
            '<div class="qyconQs">'+
		        '<span class="qyconQsb">'+betAreaV[i]+'</span>'+
		    '</div>'+
		    '<ul class="qyconQsyHz" name="betPanel">';
		for ( var j = 0; j < 19; j++ ) {
			html += '<li>'+
	            '<p class="qyconQsya"><span class="qyconQsy2a">'+j+'</span></p>'+
	        '</li>';
		}
		html += '</ul>'+
		'</div>';
	}
	$(html).appendTo($("#betAreaId"));
	
	// 选中事件
	$(".qyconQsy2a").click(function(){
		if ( $(this).hasClass("qyconQsy2aaa") ) {
			$(this).removeClass("qyconQsy2aaa");
		} else {
			$(this).addClass("qyconQsy2aaa");
		}
		calc();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qyconQsy2aaa").removeClass("qyconQsy2aaa");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			$("ul[name=betPanel]").each(function(index){
				if ( $(this).find(".qyconQsy2aaa").length > 0 ) {
					$(this).find(".qyconQsy2aaa").each(function(j){
						betCode += $(this).html() + ",";
					});
					betCode = betCode.substring(0, betCode.length-1) + "|";
				}
			});
			if ( betCode != "" ) {
				betCode = betCode.substring(0, betCode.length-1);
			}
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "二星和值" : "二星和值";
			
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
			var betCode = engine.random(1,10)+"|"+engine.random(1,10)+"|"+engine.random(1,10)+"|"+engine.random(1,10)+"|"+engine.random(1,10);
			var betNum = 1;
			var dansFs = "五星直选单式";
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
	$("ul[name=betPanel]").each(function(index){
		if ( $(this).find(".qyconQsy2aaa").length > 0 ) {
			$(this).find(".qyconQsy2aaa").each(function(j){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length-1) + "|";
		}
	});
	if ( betCode != "" ) {
		betCode = betCode.substring(0, betCode.length-1);
		betNum = engine.calcBetNum(10, betCode);
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

