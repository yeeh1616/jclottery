var dlt = new Dlt();
$(document).ready(function () {
	$("#radomSelDsId,#radomSelDsBtnId").hide();
	
	init();
	//加载遗漏数据
	loadOmitDate('004001');
});

function init() {
	// 生成号码
	var beforeHtml = '<h1><span>前区胆码</span>至少选择1个,最多选4个</h1>'+
						'<ul class="">'+
					'<div class="dan-next">'+
					'<div class="dan-wyl">遗漏</div></div>';
	for ( var i = 1; i < 11; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 11; i < 21; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 21; i < 31; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 31; i < 36; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '</ul>'+
		'<div class="clear"></div>'+
	$("#beforeDanAreaId").empty();
	$(beforeHtml).appendTo($("#beforeDanAreaId"));
	
	// 生成后区号码
	var afterHtml = '<h1><span>后区胆码</span>最多选择1个</h1>'+
					'<ul class="lq_wsl">';
	for ( var i = 1; i < 13; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		afterHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
						'<p id="omit_1_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	afterHtml += '</ul>'+
		'<div class="clear"></div>'+
	$("#afterDanAreaId").empty();
	$(afterHtml).appendTo($("#afterDanAreaId"));
	
	beforeHtml = '<h1><span>前区拖码</span>前区胆码+拖码总个数不少于6个</h1>'+
					'<ul class="">'+
				'<div class="dan-next">'+
				'<div class="dan-wyl">遗漏</div></div>';
	for ( var i = 1; i < 11; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
			'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 11; i < 21; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
			'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
	for ( var i = 21; i < 31; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
			'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '<div class="clear"></div>'+
		'<div class="dan-next"><div class="dan-wyl">遗漏</div></div>';
		for ( var i = 31; i < 36; i++ ) {
		var view = i > 9 ? "" + i : "0" + i;
		beforeHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
			'<p id="omit_0_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	beforeHtml += '</ul>'+
		'<div class="clear"></div>'+
	$("#beforeTuoAreaId").empty();
	$(beforeHtml).appendTo($("#beforeTuoAreaId"));
	
	// 生成后区号码
	var afterHtml = '<h1><span>后区拖码</span>至少选择2个</h1>'+
		'<ul class="lq_wsl">';
	for ( var i = 1; i < 13; i++ ) {
	var view = i > 9 ? "" + i : "0" + i;
		afterHtml += '<li><a class="" name="betN" href="javascript:void 0" bet="'+view+'">'+view+'</a>'+
			'<p id="omit_1_'+(i > 9 ? "" + i : "0" + i)+'">0</p></li>';
	}
	afterHtml += '</ul>'+
		'<div class="clear"></div>'+
	$("#afterTuoAreaId").empty();
	$(afterHtml).appendTo($("#afterTuoAreaId"));

	// 添加选中事件
	 $("#beforeDanAreaId").find("a[name=betN]").click(function(){
         if ( $(this).hasClass("active") ) {
                 $(this).removeClass("active");
         } else {
                 $(this).addClass("active");
                 if ( $("#beforeDanAreaId").find("a[name=betN].active").length == 5 ) {
                         $(this).removeClass("active");
                         layer.alert("最多选择4个胆！",0);
                         return false;
                 }
                 // 拖码中对应相同的项去掉
                 $("#beforeTuoAreaId").find("a[bet="+$(this).attr("bet")+"]").removeClass("active");
         }
         calculte();
	 });
	 $("#beforeTuoAreaId").find("a[name=betN]").click(function(){
	         if ( $(this).hasClass("active") ) {
	                 $(this).removeClass("active");
	         } else {
	                 $(this).addClass("active");
	                 // 胆码中对应相同的项去掉
	                 $("#beforeDanAreaId").find("a[bet="+$(this).attr("bet")+"]").removeClass("active");
	         }
	         calculte();
	 });
	 
	 $("#afterDanAreaId").find("a[name=betN]").click(function(){
         if ( $(this).hasClass("active") ) {
                 $(this).removeClass("active");
         } else {
                 $(this).addClass("active");
                 if ( $("#afterDanAreaId").find("a[name=betN].active").length == 2 ) {
                         $(this).removeClass("active");
                         layer.alert("最多选择1个胆！",0);
                         return false;
                 }
                 // 拖码中对应相同的项去掉
                 $("#afterTuoAreaId").find("a[name=betN][bet="+$(this).attr("bet")+"]").removeClass("active");
         }
         calculte();
	 });
	 $("#afterTuoAreaId").find("a[name=betN]").click(function(){
	         if ( $(this).hasClass("active") ) {
	                 $(this).removeClass("active");
	         } else {
	                 $(this).addClass("active");
	                 // 拖码中对应相同的项去掉
	                 $("#afterDanAreaId").find("a[name=betN][bet="+$(this).attr("bet")+"]").removeClass("active");
	         }
	         calculte();
	 });
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$("a[name=betN].active").removeClass("active");
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html(),10) > 0 ) {
			if ( parseInt($("#betNumId").html(),10) > 10000 ) {
				layer.alert("暂不支持大于10000注的订单！",0);
				return false;
			}
			var beforeCode = "";
			if ( $("#beforeDanAreaId").find("a[name=betN].active").length > 0 ) {
				beforeCode = "(";
				$("#beforeDanAreaId").find("a[name=betN].active").each(function(index){
					beforeCode += $(this).attr("bet") + ","
				});
				beforeCode = beforeCode.substring(0, beforeCode.length - 1) + ")";
			}
			$("#beforeTuoAreaId").find("a[name=betN].active").each(function(index){
				beforeCode += $(this).attr("bet") + ","
			});
			beforeCode = beforeCode.substring(0, beforeCode.length - 1);
			
			var afterCode = "";
			if ( $("#afterDanAreaId").find("a[name=betN].active").length > 0 ) {
				afterCode = "(";
				$("#afterDanAreaId").find("a[name=betN].active").each(function(index){
					afterCode += $(this).attr("bet") + ","
				});
				afterCode = afterCode.substring(0, afterCode.length - 1) + ")";
			}
			$("#afterTuoAreaId").find("a[name=betN].active").each(function(index){
				afterCode += $(this).attr("bet") + ","
			});
			afterCode = afterCode.substring(0, afterCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "胆拖";
			
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
			var beforeBuf = dlt.random(5, 35);
			var afterBuf = dlt.random(2, 12);
			$('<li betNum=1 betCode='+beforeBuf.join(",")+"+"+afterBuf.join(",")+'>'+
	                  '<div class="w_lil fl">［单式  '+1+'注］ <span class="tw_red">'+beforeBuf.join(",")+' </span>| <span class="tw_blue w_hkd">'+afterBuf.join(",")+'</span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	if ( $("#radomBetCodeId").val() != "" ) {
		var sv = $("#radomBetCodeId").val().split(" ");
		$('<li betNum=1 betCode="'+sv[0]+"+"+sv[1]+'"><a style="cursor:pointer" onclick="$(this).parent().remove();calculteAll();">删除</a>［单式  1注］ <span class="red">'+sv[0]+'</span> | <span class="blue">'+sv[1]+'</span></li>').appendTo($("#betListAreaId"));
		calculteAll();
	}
	
}


function calculte() {
	var beforeDanArray = $("#beforeDanAreaId").find(".active");
	var beforeTuoArray = $("#beforeTuoAreaId").find(".active");
	var afterDanArray = $("#afterDanAreaId").find(".active");
	var afterTuoArray = $("#afterTuoAreaId").find(".active");
	
	if ( ((beforeDanArray.length + beforeTuoArray.length == 5) && beforeDanArray.length > 0) || (afterDanArray.length == 1 && afterTuoArray.length == 1) ) {
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
		return;
	}
	if ( (beforeDanArray.length > 0 || afterDanArray.length > 0) && (beforeDanArray.length + beforeTuoArray.length) >= 5 && (afterDanArray.length+afterTuoArray.length >= 2) ) {
		var betNum = dlt.calcDanTuoBetNum(beforeDanArray, beforeTuoArray, afterDanArray, afterTuoArray);
		if ( betNum > 1 ) {
			$("#betNumId").html(betNum);
			$("#betMoneyId").html(betNum*2);
		} else {
			$("#betNumId").html("0");
			$("#betMoneyId").html("0");
		}
	} else {
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
	}
}