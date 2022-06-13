$(function(){
	//初始化号码区
	innitNumberArea();
	
	//添加对应的事件
	addEvent();
});
//$(function)---end

//添加对应的事件
function addEvent(){
//选号与取消选号
	$('a[name=ball]').click(function(){
		$(this).toggleClass('active');
		calc();
	});

//快速选号
	$('ul[name=shortcutOP] li').click(function(){
		$(this).addClass('active').siblings('li').removeClass('active');
		//先把对应的位上的号码置为未选中
		var $ul = $(this).closest('span').prev('ul');
		$ul.find('a').removeClass('active');
		//把对应的号码变为选中状态
		var text = $(this).html();
		if(text == '全'){
			$ul.find('a').addClass('active');
		}else if(text == '大'){
			$ul.find('a:gt(4)').addClass('active');
		}else if(text == '小'){
			$ul.find('a:lt(5)').addClass('active');
		}else if(text == '奇'){
			$ul.find('a:odd').addClass('active');
		}else{
			$ul.find('a:even').addClass('active');
		}
		
		calc();
	});
	
//快速选号——全清
	$('a[name=clearAllChose]').click(function(){
		$(this).closest('span').prev('ul').find('a').removeClass('active');
		calc();
	});
	
	
	//清空所有选中的号码
	$('#clearAllSelBtnId').click(function(){
		$(".xqtop").find('a.active').removeClass('active').end().find('ul[name=shortcutOP] li')
		.removeClass('active');
		calc();
	});
	
	
	// 添加到投注列表
	$("#addToBetListBtnId").click(function(){
		if ( parseInt($("#betNumId").html(),10) > 0 ) {
			var betCode = "";
			$(".xqtop").each(function(index){
				$(this).find("a.active").each(function(i){
					betCode += $(this).html();
				});
				betCode += ",";
			});
			betCode = betCode.substring(0, betCode.length - 1);
			
			var betNum = $("#betNumId").html();
			var dansFs = "";
			if ( betNum == "1" ) {
				dansFs = "单式";
			} else {
				dansFs = "复式";
			}
			
			var li = '<li betNum="'+betNum+'" betCode="'+betCode+'" dansFs="'+dansFs+'">'
				+'<div class="w_lil fl">['+dansFs+' '+betNum+'注]<span class="tw_red">'
				+betCode+'</span></div><a style="cursor:pointer" onclick="$(this).parent().remove();calculteAll();" class="fr">删除</a></li>';
            
			$(li).appendTo($("#betListAreaId"));
			
			$("#clearAllSelBtnId").click();			
			calculteAll();
		}
	});
	
	
	
	// 机选
	$("#radomSelDsBtnId").click(function(){
		var v = parseInt($("#radomSelDsId").val(),10);
		for ( var i = 0; i < v; i++ ) {
			var code = "";
			for ( var j = 0; j < 3; j++ ) {
				code += pl3.random(10) + ",";
			}
			code = code.substring(0, code.length-1);
			var li = '<li betNum="1" betCode="'+code+'" dansFs="单式">'
			+'<div class="w_lil fl">[单式 1注]<span class="tw_red">'
			+code+'</span></div><a style="cursor:pointer" onclick="$(this).parent().remove();calculteAll();" class="fr">删除</a></li>';
        
		$(li).appendTo($("#betListAreaId"));
		}
		calculteAll();
	});
	
	
}//addEvent---end


function calc() {
	var calcA = $(".xqtop");
	var betArray = new Array();
	for ( var i = 0; i < calcA.length; i++ ) {
		var subArray = new Array();
		$(calcA[i]).find("a.active").each(function(index){
			subArray.push($(this).html());
		});
		betArray.push(subArray);
	}
	var betNum = pl3.calcZxptBetNum(betArray);
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum * 2);
}

//初始化号码区
function innitNumberArea(){
	var html = '';
	var betArray = ["百位", "十位", "个位"];
	var html = '';
	for ( var i = 0; i < betArray.length; i++) {
		html += '<div class="dan-wenz"><p class="dan-wyl">'+betArray[i]+'</p><div>遗漏</div></div>'
		+'<ul class="xqtop">'+function(){
			var number = '';
			for ( var n = 0; n < 10; n++) {
				number += '<li><a style="surcor:point;" name="ball">'+n+'</a><p name="omit">0</p></li>';
			}			
			return number;
		}()+'</ul><span class="qx_ls">'+function(){
			return i==0?'<p>快速选号</p>':'';
		}()+'<div><i class="qx_ztg fl"></i>'
		+'<ul name="shortcutOP"><li style="surcor:point;">全</li><li style="surcor:point;" >大</li>'
		+'<li style="surcor:point;" >小</li><li style="surcor:point;">奇</li>'
		+'<li style="surcor:point;" >偶</li><a style="surcor:point;" name="clearAllChose" class="qxc_qx">全清</a>'
		+'</ul></div></span><div class="clear"></div>';		
	}
	
	$('#numberArea').html(html);
}