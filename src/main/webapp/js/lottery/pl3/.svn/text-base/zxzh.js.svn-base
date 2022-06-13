var combAlg = new CombAlgorithm();
$(document).ready(function () {
	
	$("#radomSelDsId,#radomSelDsBtnId").hide();
	
	var html = '';
	var betArray = ["号码"];
	var bcss = ["dan-wenz","dan-next","dan-next"];
	for ( var i = 0; i < betArray.length; i++ ) {
		html += '<div class="'+bcss[i]+'">'+
		          '<p class="dan-wyl">'+betArray[i]+'</p>'+
		          '<div >遗漏</div>'+
		        '</div>'+
	            '<ul name="betPanel" '+(i==0?"class=xqtop":"")+'>';
		for ( var j = 0; j < 10; j++ ) {
			html += '<li><a href="javascript:void 0" name="betN" v='+j+'>'+j+'</a><p id="omit'+'_'+j+'">0</p></li>';
		}
		html += '</ul>'+
					'<span class="qx_ls">';
		if ( i == 0 ) {
			html += '<p>快速选号</p>';
		}
		html +=   '<div> <i class="qx_ztg fl"></i>'+
		          '<ul >'+
		            '<li name="quickBtn">全</li>'+
		            '<li name="quickBtn">大</li>'+
		            '<li name="quickBtn">小</li>'+
		            '<li name="quickBtn">奇</li>'+
		            '<li name="quickBtn">偶</li>'+
		            '<a href="javascript:void 0" class="qxc_qx" name="quickBtn">全清</a>'+
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
			$(this).addClass("active");
		}
		calculte();
	});
	
	$("li[name=quickBtn],a[name=quickBtn]").click(function(){
		$(this).parent().parent().parent().prev().find("a[name=betN]").removeClass("active");
		$(this).parent().find("li").removeClass("active");
		$(this).addClass("active");
		var v = $(this).html();
		switch(v) {
		case "全":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").addClass("active");
			break;
		}
		case "全清":
		{
			$(this).removeClass("active");
			$(this).parent().parent().parent().prev().find("a[name=betN]").removeClass("active");
			break;
		}
		case "大":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) > 4 ) {
					$(this).addClass("active");
				}
			});
			break;
		}
		case "小":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) <= 4 ) {
					$(this).addClass("active");
				}
			});
			break;
		}
		case "奇":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) % 2 == 1 ) {
					$(this).addClass("active");
				}
			});
			break;
		}
		case "偶":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) % 2 == 0 ) {
					$(this).addClass("active");
				}
			});
			break;
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
			$("ul[name=betPanel]").each(function(index){
				$(this).find("a[name=betN].active").each(function(i){
					betCode += $(this).html()+",";
				});
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "";
			if ( betNum == "1" ) {
				dansFs = "单式";
			} else {
				dansFs = "复式";
			}
			
			$('<li betNum='+betNum+' betCode='+betCode+'>'+
	                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+betCode+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
			
			$("a[name=betN].active").removeClass("active");
			calculteAll();
		}
	});
	
	//加载遗漏数据
	loadOmitDate($("#licenseId").val()=='1'?'001002':'012002');
});

function calculte() {
	var counter = $("a[name=betN].active").length;
	var betNum = 0;
	if ( counter >= 3 ) {
		betNum = combAlg.calcCombNum(counter,3)*6;
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}
