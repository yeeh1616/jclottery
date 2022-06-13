
$(document).ready(function () {
	
	// 清空
	$(".qk-button").click(function(){
		$(".active").removeClass("active");
		calc();
	});
	// 到确认页面
	$(".qd-button").click(function(){
		var betCode = "";
		var len = 0;
		$(".zulan").find("li").each(function(index){
			if ($(this).find(".active").length > 0) {
				betCode += $(this).attr("id") + ":";
				$(this).find(".active").each(function(index){
					betCode += $(this).attr("bet") + ",";
				});
				betCode = betCode.substring(0, betCode.length-1) + ":0|";
				len++;
			}
		});
		if ( len < 2 ) {
			alert("至少选择2场比赛");
			return false;
		}
		betCode = betCode.substring(0, betCode.length-1);
		$(this).find("a").attr("href", "/lottery/wsure.jhtml?betCode="+betCode).click();
		
		//location.href = '/lottery/wsure.jhtml?betCode='+betCode;
	});
});

function calc() {
	var counter = 0;
	$(".zulan").find("li").each(function(index){
		if ($(this).find(".active").length > 0) {
			counter++;
		}
	});
	$("#schNumId").html(counter);
}

function getAheadTime(tm) {
	var ahead = $("#aheadTimeId").val();
	var ham = tm.split(":");
	var result = tm;
	if ( parseInt(ham[1]) >= parseInt(ahead) ) {
		var dd = (parseInt(ham[1]) - parseInt(ahead));
		if ( dd < 10 ) {
			result = ham[0] + ":0" + dd;
		} else {
			result = ham[0] + ":" + dd;
		}
	} else {
		if ( parseInt(ham[0]) > 0 ) {
			ham[0] = parseInt(ham[0]) - 1;
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			var dd = (parseInt(ham[1]));
			if ( dd < 10 ) {
				result = ham[0] + ":0" + dd;
			} else {
				result = ham[0] + ":" + dd;
			}
		} else {
			ham[1] = parseInt(ham[1]) + 60 - parseInt(ahead);
			result = "23" +":"+ ham[1];
		}
	}
	
	return result;
}

