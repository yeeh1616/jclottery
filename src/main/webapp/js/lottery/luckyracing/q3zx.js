
$(document).ready(function () {
	// 选中事件
	$("#gjPanelId").find(".qyconQsya").click(function(){
		if ( $(this).children().eq(0).hasClass("qyconQsy2b") ) {
			$(this).children().eq(0).removeClass("qyconQsy2b").addClass("qyconQsy2a");
		} else {
			$(this).children().eq(0).removeClass("qyconQsy2a").addClass("qyconQsy2b");
			var val = $(this).children().eq(0).html();
			$("#yjPanelId").find(".qyconQsy2b").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2b").addClass("qyconQsy2a");
				}
			});
			$("#jjPanelId").find(".qyconQsy2b").each(function(){
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
			$("#jjPanelId").find(".qyconQsy2b").each(function(){
				if ( $(this).html() == val ) {
					$(this).removeClass("qyconQsy2b").addClass("qyconQsy2a");
				}
			});
		}
		calc();
	});
	$("#jjPanelId").find(".qyconQsya").click(function(){
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
			$("#yjPanelId").find(".qyconQsy2b").each(function(){
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
			var betCode = "";
			var gjCodes = $("#gjPanelId").find(".qyconQsy2b");
			var yjCodes = $("#yjPanelId").find(".qyconQsy2b");
			var jjCodes = $("#jjPanelId").find(".qyconQsy2b");
			for ( var i = 0 ; i < gjCodes.length; i++ ) {
				betCode += $(gjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1) + "|";
			for ( var i = 0 ; i < yjCodes.length; i++ ) {
				betCode += $(yjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1) + "|";
			for ( var i = 0 ; i < jjCodes.length; i++ ) {
				betCode += $(jjCodes[i]).html() + ",";
			}
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "前三直选单式" : "前三直选复式";
			
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
			var codes = engine.random(3,12);
			for ( var j = 0; j < codes.length; j++ ) {
				betCode += codes[j] + "|";
			}
			betCode = betCode.substring(0, betCode.length - 1);
			var betNum = 1;
			var dansFs = "前三直选单式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	try {
		//加载遗漏数据
		loadOmit();
	} catch (e) {
		// TODO: handle exception
	}	
	
});

function calc() {
	var betNum = 0;
	
	var betCode = "";
	var gjCodes = $("#gjPanelId").find(".qyconQsy2b");
	var yjCodes = $("#yjPanelId").find(".qyconQsy2b");
	var jjCodes = $("#jjPanelId").find(".qyconQsy2b");
	if ( gjCodes.length > 0 && yjCodes.length > 0 && jjCodes.length > 0 ) {
		for ( var i = 0 ; i < gjCodes.length; i++ ) {
			betCode += $(gjCodes[i]).html() + ",";
		}
		betCode = betCode.substring(0, betCode.length - 1) + "|";
		for ( var i = 0 ; i < yjCodes.length; i++ ) {
			betCode += $(yjCodes[i]).html() + ",";
		}
		betCode = betCode.substring(0, betCode.length - 1) + "|";
		for ( var i = 0 ; i < jjCodes.length; i++ ) {
			betCode += $(jjCodes[i]).html() + ",";
		}
		betNum = engine.calcBetNum(8, betCode.substring(0, betCode.length - 1));
	}
	
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

//加载遗漏数据
function loadOmit(){
	$.ajax( {
		type : "post",
		url : "/lottery/getOmitData.json",
		async : false,
		data : "playCode=102003",
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			result = 1;
		},
		success : function(data) {			
			var json = eval("("+data+")");			

			$.each(json[0].dmos,function(index,val){	
				$("#g"+val['data']+"omit").html(val['omit']);
			});
			$.each(json[1].dmos,function(index,val){	
				$("#y"+val['data']+"omit").html(val['omit']);
			});
			
			$.each(json[2].dmos,function(index,val){	
				$("#j"+val['data']+"omit").html(val['omit']);
			});
		}
	});
}
