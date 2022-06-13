var combAlg = new CombAlgorithm();
$(document).ready(function () {
	
	// 生成投注区
	var betAreaV = ["号码"];
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
		            '<p class="qyconQsy3" id="omit_0'+j+'">-</p>'+
		        '</li>';
			}
			for ( var j = 10; j < 21; j++ ) {
				html += '<li>'+
		            '<p class="qyconQsya"><span class="qyconQsy2a">'+j+'</span></p>'+
		            '<p class="qyconQsy3" id="omit_'+j+'">-</p>'+
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
	$(".qyconQsy2a").click(function(){
		if ( $(this).hasClass("qyconQsy2aaa") ) {
			$(this).removeClass("qyconQsy2aaa");
		} else {
			$(this).addClass("qyconQsy2aaa");
		}
		calc();
	});
	
	// 全、大、小、奇、偶、清除
	$(".sscAb2").click(function(){
		$(this).parent().prev().find(".qyconQsy2aaa").removeClass("qyconQsy2aaa");
		var opt = $(this).html();
		switch(opt) {
		case "全":
			$(this).parent().prev().find(".qyconQsy2a").addClass("qyconQsy2aaa");
			break;
		case "大":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( index > 9 ) {
					$(this).addClass("qyconQsy2aaa");
				}
			});
			break;
		case "小":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( index < 10 ) {
					$(this).addClass("qyconQsy2aaa");
				}
			});
			break;
		case "奇":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( (index+1) % 2 == 1 ) {
					$(this).addClass("qyconQsy2aaa");
				}
			});
			break;
		case "偶":
			$(this).parent().prev().find(".qyconQsy2a").each(function(index){
				if ( (index+1) % 2 == 0 ) {
					$(this).addClass("qyconQsy2aaa");
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
			var dansFs = betNum == "1" ? "任选三" : "任选三";
			
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
		var v = parseInt($("#radomSelDsId").val(),10);
		for ( var i = 0; i < v; i++ ) {			
			var betCode = random(3,21);
			var betNum = 1;
			var dansFs = "任选三";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	//加载遗漏数据
	loadOmitDate('101014');
});

function calc() {
	var betNum = 0;
	
	var betCode = "";
	$("ul[name=betPanel]").each(function(index){
		if ( $(this).find(".qyconQsy2aaa").length > 0 ) {
			$(this).find(".qyconQsy2aaa").each(function(j){
				betCode += $(this).html() + ",";
			});
		}
	});
	if ( betCode != "" ) {
		betCode = betCode.substring(0, betCode.length-1);
	}
	if ( betCode.split(",").length > 2 ) {
		betNum = combAlg.calcCombNum(betCode.split(",").length,3);
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

