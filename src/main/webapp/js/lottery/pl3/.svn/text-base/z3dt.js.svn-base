var pl3 = new Pl3();
$(document).ready(function () {
	
	$("#radomSelDsId,#radomSelDsBtnId").hide();
	
	var html = '';
	var betArray = ["胆码"];
	var bcss = ["dan-wenz"];
	for ( var i = 0; i < betArray.length; i++ ) {
		html += '<div class="'+bcss[i]+'">'+
		          '<p class="dan-wyl">'+betArray[i]+'</p>'+
		          '<div >遗漏</div>'+
		        '</div>'+
	            '<ul name="betPanel" class="xqtop">';
		for ( var j = 0; j < 10; j++ ) {
			html += '<li><a href="javascript:void 0" name="betN" v='+j+'>'+j+'</a><p id="omit_'+i+'_'+j+'">0</p></li>';
		}
		html += '</ul>'+
					'<span class="qx_ls danmar">';
		html +=   '<div> <i class="qx_ztg fl"></i>'+
		          '<ul >'+
		            '<a href="javascript:void 0" class="qxc_qx" name="quickBtn">全清</a>'+
		          '</ul>'+
		        '</div>'+
		        '</span><div class="clear"></div>';
		
	}
	$(html).appendTo($("#danAreaDivId"));
	
	html = "";
	betArray = ["拖码"];
	bcss = ["dan-wenz"];
	for ( var i = 0; i < betArray.length; i++ ) {
		html += '<div class="'+bcss[i]+'">'+
		          '<p class="dan-wyl">'+betArray[i]+'</p>'+
		          '<div >遗漏</div>'+
		        '</div>'+
	            '<ul name="betPanel" class="xqtop">';
		for ( var j = 0; j < 10; j++ ) {
			html += '<li><a href="javascript:void 0" name="betN" v='+j+'>'+j+'</a><p id="omit_'+1+'_'+j+'">0</p></li>';
		}
		html += '</ul>'+
					'<span class="qx_ls danmar">';
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
	$(html).appendTo($("#tuoAreaDivId"));
	
	// 添加选中事件
	var calcA = $("ul[name=betPanel]");
	$(calcA[0]).find("a[name=betN]").each(function(index){
		$(this).click(function(){
			if ( $(this).hasClass("active") ) {
				$(this).removeClass("active");
			} else {
				if ( $(calcA[0]).find(".active").length == 1 ) {
					layer.alert("最多选择1个胆码！",0);
					return false;
				} else {
					$(this).addClass("active");
					// 去掉拖码
					$(calcA[1]).find("a[v="+$(this).attr("v")+"]").removeClass("active");
				}
			}
			calculte();
		});
	});
	$(calcA[1]).find("a[name=betN]").each(function(index){
		$(this).click(function(){
			if ( $(this).hasClass("active") ) {
				$(this).removeClass("active");
			} else {
				$(this).addClass("active");
				// 去掉胆码
				$(calcA[0]).find("a[v="+$(this).attr("v")+"]").removeClass("active");
			}
			calculte();
		});
	});
	
	$("li[name=quickBtn],a[name=quickBtn]").click(function(){
		$(this).parent().parent().parent().prev().find("a[name=betN]").removeClass("active");
		$(this).parent().find("li").removeClass("active");
		$(this).addClass("active");
		var v = $(this).html();
		switch(v) {
		case "全":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").click();
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
					$(this).click();
				}
			});
			break;
		}
		case "小":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) <= 4 ) {
					$(this).click();
				}
			});
			break;
		}
		case "奇":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) % 2 == 1 ) {
					$(this).click();
				}
			});
			break;
		}
		case "偶":
		{
			$(this).parent().parent().parent().prev().find("a[name=betN]").each(function(index){
				if ( parseInt($(this).html()) % 2 == 0 ) {
					$(this).click();
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
			var betCode = "(";
			var calcA = $("ul[name=betPanel]");
			$(calcA[0]).find("a[name=betN].active").each(function(index){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length-1) + ")";
			$(calcA[1]).find("a[name=betN].active").each(function(index){
				betCode += $(this).html() + ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "胆拖复式";
			
			$('<li betNum='+betNum+' betCode='+betCode+'>'+
	                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+betCode+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
			
			$("a[name=betN].active").removeClass("active");
			calculteAll();
		}
	});
	//加载遗漏数据
	loadOmitDate($("#licenseId").val()=='1'?'001006':'012006');
});

function calculte() {
	var calcA = $("ul[name=betPanel]");
	var betDanArray = new Array();
	$(calcA[0]).find("a[name=betN].active").each(function(index){
		betDanArray.push($(this).html());
	});
	var betTuoArray = new Array();
	$(calcA[1]).find("a[name=betN].active").each(function(index){
		betTuoArray.push($(this).html());
	});
	var betNum = 0;
	if ( betDanArray.length + betTuoArray.length > 2 && betDanArray.length > 0 ) {
		betNum = pl3.calcZ3Dt(betDanArray, betTuoArray);
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}
