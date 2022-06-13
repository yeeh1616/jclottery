var pl3 = new Pl3();
$(document).ready(function () {
	
	var html = '';
	var betArray = ["百位", "十位", "个位"];
	var bcss = ["dan-wenz","dan-next","dan-next"];
	for ( var i = 0; i < betArray.length; i++ ) {
		html += '<div class="'+bcss[i]+'">'+
		          '<p class="dan-wyl">'+betArray[i]+'</p>'+
		          '<div >遗漏</div>'+
		        '</div>'+
	            '<ul name="betPanel" '+(i==0?"class=xqtop":"")+'>';
		for ( var j = 0; j < 10; j++ ) {
			html += '<li><a href="javascript:void 0" name="betN" v='+j+'>'+j+'</a><p id="omit_'+i+'_'+j+'">0</p></li>';
		}
		html += '</ul>'+
					'<span class="">';
		html +=   '<div> <i class=" fl"></i>'+
		          '<ul >'+
		          '</ul>'+
		        '</div>'+
		        '</span><div class="clear"></div>';
		
	}
	$(html).appendTo($("#betAreaDivId"));
	
	// 添加选中事件
	$("a[name=betN]").click(function(){
		if ( $(this).hasClass("active") ) {
			$(this).removeClass("active");
		} else {
			$(this).parent().parent().find(".active").removeClass("active");
			$(this).addClass("active");
			var bets = $("#betAreaDivId").find(".active");
			if ( bets.length == 3 ) {
				if ( (($(bets[0]).html() != $(bets[1]).html()) && ($(bets[0]).html() != $(bets[2]).html()) && ($(bets[1]).html() != $(bets[2]).html()))
						||($(bets[0]).html() == $(bets[1]).html() && $(bets[1]).html() == $(bets[2]).html())) {
					layer.alert("号码不是组3单式！",0);
					$(this).removeClass("active");
				}
			}
		}
		calculte();
	});
	
	// 清空上方
	$("#clearAllSelBtnId").click(function(){
		$("a[name=betN].active").removeClass("active");
		$("#betNumId").html("0");
		$("#betMoneyId").html("0");
	});
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			$("a[name=betN].active").each(function(index){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "组3单式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'>'+
	                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+betCode+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
			
			$("a[name=betN].active").removeClass("active");
			calculteAll();
		}
	});
	
	// 机选5注
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val());
		var counter = 0;
		while( counter < v ) {
			var code = "";
			var firstCode = pl3.random(10);
			var secCode = pl3.random(10);
			if ( firstCode == secCode ) {
				continue;
			}
			counter++;
			var rd = pl3.random(10);
			if ( rd % 2 == 0 ) {
				code = firstCode + "," + firstCode + "," + secCode;
			} else {
				code = firstCode + "," + secCode + "," + secCode;
			}
			$('<li betNum=1 betCode='+code+'>'+
	                  '<div class="w_lil fl">［组3单式  '+1+'注］ <span class="tw_red">'+code+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		
		calculteAll();
	});
	
	//加载遗漏数据
	loadOmitDate($("#licenseId").val()=='1'?'001004':'012004');
});

function calculte() {
	var counter = 0;
	$("ul[name=betPanel]").each(function(index){
		if ( $(this).find("a[name=betN].active").length > 0 ) {
			counter++;
		}
	});
	var betNum = 0;
	if ( counter == 3 ) {
		betNum = 1;
		$("ul[name=betPanel]").each(function(index){
			betNum *= $(this).find("a[name=betN].active").length;
		});
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}
