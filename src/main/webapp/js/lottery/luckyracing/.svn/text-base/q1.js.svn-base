
$(document).ready(function () {	
	
	// 选中事件
	$(".qycondlConrp2a").click(function(){
		if ( $(this).hasClass("qycondlConrp2b") ) {
			$(this).removeClass("qycondlConrp2b");
		} else {
			$(this).addClass("qycondlConrp2b");
		}
		calc();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$(".qycondlConrp2b").removeClass("qycondlConrp2b");
		calc();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			$(".qycondlConrp2b").each(function(index){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = betNum == "1" ? "前一单式" : "前一复式";
			
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
			var betCode = engine.random(1,12);
			var betNum = 1;
			var dansFs = "前一单式";
			$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
					'<input name="" type="checkbox" value="" class="qycodlclia" />'+
					'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
					'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
					'</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	try {
		loadOmit();//加载遗漏数据
		getBonusControlData();//加载奖金数据	
	} catch (e) {
		// TODO: handle exception
	}
	
});

function calc() {
	var betNum = 0;
	
	var betCode = "";
	$(".qycondlConrp2b").each(function(index){
		betCode += $(this).html() + ",";
	});
	if ( betCode != "" ) {
		betNum = engine.calcBetNum(2, betCode.substring(0, betCode.length - 1));
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
		data : "playCode=102001",
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			result = 1;
		},
		success : function(data) {			
			var json = eval("("+data+")");			
			$.each(json[0].dmos,function(index,val){
				
				$("#g"+val['data']+"omit").html(val['omit']);
				$("#g"+val['data']+"maxomit").html(val['maxomit']);
				$("#g"+val['data']+"avgomit").html(val['avgomit']);
			});
		}
	});
}

