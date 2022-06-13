
$(document).ready(function () {
	$("#redInLiId").hide();
	$("#radomSelDsBtnId").hide();
	
	// 生成投注区
		var betAreaV = ["胆码","拖码"];
		html = "";
		for ( var i = 0; i < betAreaV.length; i++ ) {
			html += '<div class="qyconQsall" >'+
		            '<div class="qyconQs">'+
				        '<span class="qyconQsb">'+betAreaV[i]+'</span>'+
				        '<span class="qyconQsa">遗漏</span>'+
				    '</div>'+
				    '<ul class="qyconQsy2" name="betPanel">';
				for ( var j = 1; j < 10; j++ ) {
					html += '<li>'+
			            '<p class="qyconQsya"><span class="qyconQsy2a">0'+j+'</span></p>'+
			            '<p class="qyconQsy3" id="omit_'+i+'_0'+j+'">-</p>'+
			        '</li>';
				}
				for ( var j = 10; j < 12; j++ ) {
					html += '<li>'+
			            '<p class="qyconQsya"><span class="qyconQsy2a">'+j+'</span></p>'+
			            '<p class="qyconQsy3" id="omit_'+i+'_'+j+'">-</p>'+
			        '</li>';
				}
				html += '</ul>'+
				    '<div class="sscAa2">'+
				    	'<span class="sscAb2">全</span>'+
				        '<span class="sscAb2">大</span>'+
				        '<span class="sscAb2">小</span>'+
				        '<span class="sscAb2">奇</span>'+
				        '<span class="sscAb2">偶</span>'+
				        '<span class="sscAb2">清</span>'+
				    '</div>'+
				'</div>';
		}
	$("#betAreaId").empty();
	$(html).appendTo($("#betAreaId"));
	// 选中事件
	$(".qyconQsy2").eq(0).find(".qyconQsy2a").click(function(){
		if ( $(this).hasClass("qyconQsy2aaa") ) {
			$(this).removeClass("qyconQsy2aaa");
		} else {
			if ( $(".qyconQsy2").eq(0).find(".qyconQsy2aaa").length > 5 ) {
				popupConfirm("温馨提示","最大设6个胆！");
				return false;
			}
			$(this).addClass("qyconQsy2aaa");
			var val = $(this).html();
			$(".qyconQsy2").eq(1).find(".qyconQsy2a").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2aaa");
				}
			});
		}
		calc();
	});
	$(".qyconQsy2").eq(1).find(".qyconQsy2a").click(function(){
		if ( $(this).hasClass("qyconQsy2aaa") ) {
			$(this).removeClass("qyconQsy2aaa");
		} else {
			$(this).addClass("qyconQsy2aaa");
			var val = $(this).html();
			$(".qyconQsy2").eq(0).find(".qyconQsy2a").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2aaa");
				}
			});
		}
		calc();
	});
	// 全、大、小、奇、偶、清除
	$(".sscAb2").click(function(){
		$(this).parent().prev().find(".qyconQsy2aaa").removeClass("qyconQsy2aaa");
		var opt = $(this).html();
		switch(opt) {
		case "全":
			$(this).parent().prev().find(".qyconQsy2a").click();
			break;
		case "大":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( index > 4 ) {
					$(this).click();
				}
			});
			break;
		case "小":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( index < 5 ) {
					$(this).click();
				}
			});
			break;
		case "奇":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( (index+1) % 2 == 1 ) {
					$(this).click();
				}
			});
			break;
		case "偶":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( (index+1) % 2 == 0 ) {
					$(this).click();
				}
			});
			break;
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
		if ( parseInt($("#betNumId").html(),10) > 0 ) {
			var betCode = "(";
			var gjCodes = $("ul[name=betPanel]").eq(0).find(".qyconQsy2aaa");
			var yjCodes = $("ul[name=betPanel]").eq(1).find(".qyconQsy2aaa");
			for ( var i = 0 ; i < gjCodes.length; i++ ) {
				betCode += $(gjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1) + ")";
			for ( var i = 0 ; i < yjCodes.length; i++ ) {
				betCode += $(yjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "任七胆拖复式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
	//加载遗漏数据
	loadOmitDate('101019');
});

function calc() {
	var betNum = 0;
	
	var betCode = "(";
	var gjCodes = $("ul[name=betPanel]").eq(0).find(".qyconQsy2aaa");
	var yjCodes = $("ul[name=betPanel]").eq(1).find(".qyconQsy2aaa");
	if ( (gjCodes.length > 0) && (gjCodes.length+yjCodes.length>7) ) {
		for ( var i = 0 ; i < gjCodes.length; i++ ) {
			betCode += $(gjCodes[i]).html() + ",";
		}
		betCode = betCode.substring(0, betCode.length - 1) + ")";
		for ( var i = 0 ; i < yjCodes.length; i++ ) {
			betCode += $(yjCodes[i]).html() + ",";
		}
		betNum = engine.calcBetNum(27, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

