var combAlg = new CombAlgorithm();
$(document).ready(function () {
	init();
	//加载遗漏数据
	loadOmitDate('013001');
});

function init() {
	// 生成号码
	var beforeHtml = '<h1><span>号码</span>至少选择2个</h1>'+
						'<ul class="">'+
					'<div class="dan-next">'+
					'<div class="dan-wyl">遗漏</div></div>';
	for ( var i = 1; i < 15; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 15; i < 29; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 29; i <= 31; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '</ul>'+
		'<div class="clear"></div>';
		
	$("#beforeAreaId").empty();
	
	$(beforeHtml).appendTo($("#beforeAreaId"));
	
	
	// 添加选中事件
	$("a[name=betN]").click(function(){
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		calculte();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$("#beforeAreaId").find(".active").removeClass("active");
		calculte();
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html(),10) > 0 ) {
			if ( parseInt($("#betNumId").html(),10) > 10000 ) {
				layer.alert("暂不支持大于10000注的订单！",0);
				return false;
			}
			var beforeCode = "";
			$("#beforeAreaId").find("a[name=betN].active").each(function(index){
				beforeCode += $(this).attr("bet") + ","
			});
			beforeCode = beforeCode.substring(0, beforeCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "";
			if ( betNum == "1" ) {
				dansFs = "单式";
			} else {
				dansFs = "复式";
			}
			
			$('<li betNum='+betNum+' betCode='+beforeCode+'>'+
                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+beforeCode+' </span> <span class="tw_blue w_hkd">'+'</span></div>'+
                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
            '</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
	// 机选5注
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val(),10);
		var dlt = new Qlc();
		for ( var i = 0; i < v; i++ ) {
			var beforeBuf = dlt.random(2, 31);
			$('<li betNum=1 betCode='+beforeBuf.join(",")+'>'+
	                  '<div class="w_lil fl">［单式  '+1+'注］ <span class="tw_red">'+beforeBuf.join(",")+' </span> <span class="tw_blue w_hkd">'+'</span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	
}


function calculte() {
	var beforeArray = $("#beforeAreaId").find("a[name=betN].active");
	
	if ( beforeArray.length >= 2 ) {
		var betNum = combAlg.calcCombNum(beforeArray.length,2);
		$("#betNumId").html(betNum);
		$("#betMoneyId").html(betNum*2);
	} else {
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
	}
}