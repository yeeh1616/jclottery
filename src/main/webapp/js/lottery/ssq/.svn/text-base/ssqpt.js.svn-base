var dlt = new Ssq();
$(document).ready(function () {

	init();
	//加载遗漏数据
	loadOmitDate('011001');
});

function init() {
	// 生成号码
	var beforeHtml = '<h1><span>前区</span>至少选择6个</h1>'+
						'<ul class="">'+
					'<div class="dan-next">'+
					'<div class="dan-wyl">遗漏</div></div>';
	for ( var i = 1; i < 10; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 10; i < 19; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 19; i < 28; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 28; i < 34; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '</ul>'+
		'<div class="clear"></div>'+
		'<div class="hq_b">'+
			'<ul>'+
		    	'<li><select id="beforeRadomSelId"></select></li>'+
		        '<li><a href="javascript:void 0" class="jixuan" id="radomSelBeforeBtnId">机选</a></li>'+
		        '<li><a href="javascript:void 0" class="quanxing" id="clearBeforeAreaBtnId">全清</a></li>'+
		        '<div class="clear"></div>'+
		    '</ul>'+
		'</div>';
	$("#beforeAreaId").empty();
	
	$(beforeHtml).appendTo($("#beforeAreaId"));
	
	// 生成后区号码
	var afterHtml = '<h1><span>后区</span>至少选择1个</h1>'+
					'<ul class="lq_wsl">';
	for ( var i = 1; i < 17; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		afterHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_1_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	afterHtml += '</ul>'+
		'<div class="clear"></div>'+
		'<div class="lq_b">'+
			'<ul>'+
		    	'<li><select id="afterRadomSelId"></select></li>'+
		        '<li><a href="javascript:void 0" class="jixuan" id="radomSelAfterBtnId">机选</a></li>'+
		        '<li><a href="javascript:void 0" class="quanxing" id="clearAfterAreaBtnId">全清</a></li>'+
		        '<div class="clear"></div>'+
		    '</ul>'+
		'</div>';
	$("#afterAreaId").empty();
	$(afterHtml).appendTo($("#afterAreaId"));
	// 添加选中事件
	$("a[name=betN]").click(function(){
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
		calculte();
	});
	
	// 清空
	$("#clearBeforeAreaBtnId").click(function(){
		$("#beforeAreaId").find(".active").removeClass("active");
		calculte();
	});
	$("#clearAfterAreaBtnId").click(function(){
		$("#afterAreaId").find(".active").removeClass("active");
		calculte();
	});
	// 生成机选下拉框待选项
	for ( var i = 6; i < 34; i++ ) {
		$("<option value="+i+">"+i+"</option>").appendTo($("#beforeRadomSelId"));
	}
	// 红球随机选号
	$("#radomSelBeforeBtnId").click(function(){
		$("#beforeAreaId").find(".active").removeClass("active");
		var v = $("#beforeRadomSelId").val();
		if ( v == "33" ) {
			$("#beforeAreaId").find("a[name=betN]").addClass("active");
		} else {
			if ( parseInt(v,10) < 18 ) {
				var buf = dlt.random(parseInt(v,10), 33);
				$("#beforeAreaId").find("a[name=betN]").each(function(index){
					for ( var i = 0; i < buf.length; i++ ) {
						if ( buf[i] == $(this).attr("bet") ) {
							$(this).addClass("active");
							break;
						}
					}
				});
			} else {
				var buf = dlt.random(33 - parseInt(v), 33);
				$("#beforeAreaId").find("a[name=betN]").each(function(index){
					var exp = 0;
					for ( var i = 0; i < buf.length; i++ ) {
						if ( buf[i] == $(this).attr("bet") ) {
							exp = 1;
							break;
						}
					}
					if ( exp == 0 ) {
						$(this).addClass("active");
					}
				});
			}
		}
		
		calculte();
	});
	// 篮球生成机选下拉框待选项
	for ( var i = 1; i < 17; i++ ) {
		$("<option value="+i+">"+i+"</option>").appendTo($("#afterRadomSelId"));
	}
	// 蓝球随机选号
	$("#radomSelAfterBtnId").click(function(){
		$("#afterAreaId").find(".active").removeClass("active");
		var v = $("#afterRadomSelId").val();
		if ( v == "16" ) {
			$("#afterAreaId").find("a[name=betN]").addClass("active");
		} else {
			if ( parseInt(v,10) < 8 ) {
				var buf = dlt.random(parseInt(v,10), 16);
				$("#afterAreaId").find("a[name=betN]").each(function(index){
					for ( var i = 0; i < buf.length; i++ ) {
						if ( buf[i] == $(this).attr("bet") ) {
							$(this).addClass("active");
							break;
						}
					}
				});
			} else {
				var buf = dlt.random(16 - parseInt(v,10), 16);
				$("#afterAreaId").find("a[name=betN]").each(function(index){
					var exp = 0;
					for ( var i = 0; i < buf.length; i++ ) {
						if ( buf[i] == $(this).attr("bet") ) {
							exp = 1;
							break;
						}
					}
					if ( exp == 0 ) {
						$(this).addClass("active");
					}
				});
			}
		}
		
		calculte();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$("#clearBeforeAreaBtnId").click();
		$("#clearAfterAreaBtnId").click();
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
			
			var afterCode = "";
			$("#afterAreaId").find("a[name=betN].active").each(function(index){
				afterCode += $(this).attr("bet") + ","
			});
			afterCode = afterCode.substring(0, afterCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "";
			if ( betNum == "1" ) {
				dansFs = "单式";
			} else {
				dansFs = "复式";
			}
			
			$('<li betNum='+betNum+' betCode='+beforeCode+"+"+afterCode+'>'+
                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+beforeCode+' </span>| <span class="tw_blue w_hkd">'+afterCode+'</span></div>'+
                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
            '</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
	
	// 机选5注
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val(),10);
		for ( var i = 0; i < v; i++ ) {
			var beforeBuf = dlt.random(6, 33);
			var afterBuf = dlt.random(1, 16);
			$('<li betNum=1 betCode='+beforeBuf.join(",")+"+"+afterBuf.join(",")+'>'+
	                  '<div class="w_lil fl">［单式  '+1+'注］ <span class="tw_red">'+beforeBuf.join(",")+' </span>| <span class="tw_blue w_hkd">'+afterBuf.join(",")+'</span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	
}


function calculte() {
	var beforeArray = $("#beforeAreaId").find("a[name=betN].active");
	var afterArray = $("#afterAreaId").find("a[name=betN].active");
	
	$("#redBallNumId").html(beforeArray.length);
	$("#blueBallNumId").html(afterArray.length);
	
	if ( beforeArray.length >= 6 && afterArray.length >= 1 ) {
		var betNum = dlt.calcBetNum(beforeArray, afterArray);
		$("#betNumId").html(betNum);
		$("#betMoneyId").html(betNum*2);
	} else {
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
	}
}