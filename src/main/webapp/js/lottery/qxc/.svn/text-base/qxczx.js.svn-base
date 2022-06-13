var pl3 = new Pl3();
$(document).ready(function () {
	// 追加隐藏
	$("#dltZjAreaId").hide();
	var html = '';
	var betArray = ["第一位", "第二位", "第三位", "第四位", "第五位","第六位","第七位"];
	if ( $("#licenseId").val() == "20" ) {
		betArray = ["第一位", "第二位", "第三位", "第四位", "第五位","第六位","特别号"];
	}
	var bcss = ["dan-wenz","dan-next","dan-next","dan-next","dan-next","dan-next","dan-next"];
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
					betCode += $(this).html();
				});
				betCode += ","
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
	
	// 机选5注
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val());
		for ( var i = 0; i < v; i++ ) {
			var code = "";
			for ( var j = 0; j < 7; j++ ) {
				code += pl3.random(10) + ",";
			}
			code = code.substring(0, code.length-1);
			$('<li betNum=1 betCode='+code+'>'+
	                  '<div class="w_lil fl">［单式  '+1+'注］ <span class="tw_red">'+code+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	try {
		// 开奖信息填充
		$("#preIssueCId").html(preIssue);
		//$("#preBonusJcId").html(bonusJc);
		for ( var i = 0; i < 6; i++ ) {
			$('<span class="red_ballbg">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
		}
		if ( $("#licenseId").val() == "3" || $("#licenseId").val() == "24" ) {
			$('<span class="red_ballbg">'+preCode[6]+'</span>').appendTo($("#redCodeAId"));
		} else {
			$('<span class="blue_ballbg blue1">'+preCode[6]+'</span>').appendTo($("#redCodeAId"));
		}
		
		for ( var i = 0; i < issueCode.length; i++ ) {
			var cin = issueCode[i].code.split("-");
			var css = $("#licenseId").val() == "3" || $("#licenseId").val() == "24" ? "kjm-red" : "kjm-bule";
			$('<div class="kjm-l fl">'+issueCode[i].issue+'期</div>'+
		        '<div class="kjm-r fl">'+
		        '<b class="kjm-red">'+cin[0]+'</b>'+
		        '<b class="kjm-red">'+cin[1]+'</b>'+
		        '<b class="kjm-red">'+cin[2]+'</b>'+
		        '<b class="kjm-red">'+cin[3]+'</b>'+
		        '<b class="kjm-red">'+cin[4]+'</b>'+
		        '<b class="kjm-red">'+cin[5]+'</b>'+
		        '<b class="'+css+'">'+cin[6]+'</b>'+
		      '</div>').appendTo("#issueCodeAId");
		}
	}catch ( ex ) {}
	
	//加载遗漏数据
	loadOmitDate('003001');
});

function calculte() {
	var counter = 0;
	$("ul[name=betPanel]").each(function(index){
		if ( $(this).find("a[name=betN].active").length > 0 ) {
			counter++;
		}
	});
	var betNum = 0;
	if ( counter == 7 ) {
		betNum = 1;
		$("ul[name=betPanel]").each(function(index){
			betNum *= $(this).find("a[name=betN].active").length;
		});
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}
