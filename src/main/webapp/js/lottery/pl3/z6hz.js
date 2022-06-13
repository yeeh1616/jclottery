var pl3 = new Pl3();
$(document).ready(function () {
	
	var html = '';
	var betArray = ["和值"];
	var bcss = ["dan-wenz"];
	for ( var i = 0; i < betArray.length; i++ ) {
		html += '<div class="'+bcss[i]+'">'+
		          '<p class="dan-wyl">'+betArray[i]+'</p>'+
		          '<div >遗漏</div>'+
		        '</div>'+
	            '<ul name="betPanel" '+(i==0?"class=xqtop":"")+'>';
		for ( var j = 3; j < 25; j++ ) {
			var v = j ;
			html += '<li><a href="javascript:void 0" name="betN" v='+v+'>'+v+'</a><p id="omit_'+i+'_'+j+'">0</p></li>';
		}
		html += '</ul>'+
				'<span class="qx_ls danmar">';
		html +=   '<div> <i class="qx_ztg fl"></i>'+
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
			$(this).addClass("active");
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
		if ( $("#betNumId").html() == "1" ) {
			layer.alert("请选择复式号码！",0);
			return false;
		}
		if ( parseInt($("#betNumId").html()) > 0 ) {
			var betCode = "";
			$("ul[name=betPanel]").each(function(index){
				$(this).find("a[name=betN].active").each(function(i){
					betCode += $(this).html() + ",";
				});
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "和值";
			
			$('<li betNum='+betNum+' betCode='+betCode+'>'+
	                  '<div class="w_lil fl">［'+dansFs+'  '+betNum+'注］ <span class="tw_red">'+betCode+' </span><span class="tw_blue w_hkd"></span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
			
			$("a[name=betN].active").removeClass("active");
			calculteAll();
		}
	});
	
	//加载遗漏数据
	loadOmitDate($("#licenseId").val()=='1'?'001011':'012011');
	
});

function calculte() {
	var betArray = new Array();
	$("a[name=betN].active").each(function(index){
		betArray.push($(this).html());
	});
	
	var betNum = 0;
	if ( betArray.length > 0 ) {
		betNum = pl3.calcZ6Hz(betArray);
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}
