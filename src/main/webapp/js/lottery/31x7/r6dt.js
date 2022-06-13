var dlt = new Qlc();
$(document).ready(function () {
	$("#radomSelDsId,#radomSelDsBtnId").hide();
	
	init();
	//加载遗漏数据
	loadOmitDate('013001');
});

function init() {
	// 生成号码
	var beforeHtml = '<h1><span>胆码</span>至少选择1个号码，至多选择5个号码</h1>'+
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
		'<div class="clear"></div>'+
	$("#beforeDanAreaId").empty();
	$(beforeHtml).appendTo($("#beforeDanAreaId"));
	
	beforeHtml = '<h1><span>拖码</span>胆码+拖码总个数不少于7个</h1>'+
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
		'<div class="clear"></div>'+
	$("#beforeTuoAreaId").empty();
	$(beforeHtml).appendTo($("#beforeTuoAreaId"));
	
	// 添加选中事件
	 $("#beforeDanAreaId").find("a[name=betN]").click(function(){
         if ( $(this).hasClass("active") ) {
                 $(this).removeClass("active");
         } else {
                 $(this).addClass("active");
                 if ( $("#beforeDanAreaId").find("a[name=betN].active").length == 6 ) {
                         $(this).removeClass("active");
                         layer.alert("最多选择5个胆！",0);
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
			
			var betNum = $("#betNumId").html();
			var dansFs = "胆拖";
			
			$('<li betNum='+betNum+' betCode='+beforeCode+'>'+
                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+beforeCode+' </span> <span class="tw_blue w_hkd">'+'</span></div>'+
                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
            '</li>').appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();
			
			calculteAll();
		}
	});
}

function calculte() {
	var beforeDanArray = $("#beforeDanAreaId").find(".active");
	var beforeTuoArray = $("#beforeTuoAreaId").find(".active");
	
	if ( (beforeDanArray.length > 0 ) && (beforeDanArray.length + beforeTuoArray.length > 6 && beforeTuoArray.length >= 1) ) {
		//var betNum = dlt.calcDanTuoBetNum(beforeDanArray, beforeTuoArray);
		var combAlg = new CombAlgorithm();
		var betNum = combAlg.calcCombNum(beforeTuoArray.length,6-beforeDanArray.length);
		$("#betNumId").html(betNum);
		$("#betMoneyId").html(betNum*2);
	} else {
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
	}
}