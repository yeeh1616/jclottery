var dlt = new DltFilter();
$(document).ready(function () {
	$("input[name=h]").click(function(){
		if ( $(this).hasClass("redbutton") ) {
			$(this).removeClass("redbutton");
		} else {
			var opt = $("input[name=qqselect][type=radio]:checked").val();
			if ( opt == "1" ) {
				if ( $("input[name=h].redbutton").length == 4 ) {
					layer.alert("前区最多选择4个胆码！",0);
					return;
				}
			} 
			$(this).addClass("redbutton");
		}
		addBfCode();
	});
	$("input[name=qqselect][type=radio]").click(function(){
		$("input[name=h].redbutton").removeClass("redbutton");
		addBfCode();
	});
	$("input[name=d]").click(function(){
		if ( $(this).hasClass("bluebutton") ) {
			$(this).removeClass("bluebutton");
		} else {
			var opt = $("input[name=selecthqm][type=radio]:checked").val();
			if ( opt == "1" ) {
				if ( $("input[name=d].bluebutton").length == 1 ) {
					layer.alert("后区最多选择1个胆码！",0);
					return;
				}
			} 
			$(this).addClass("bluebutton");
		}
		addAfCode();
	});
	$("input[name=selecthqm][type=radio]").click(function(){
		$("input[name=d].bluebutton").removeClass("bluebutton");
		addAfCode();
	});
	
	addNumberEvent($("#bhz,#ehz,#hbhz,#hehz"), function(){});
	
	$("#fltBtnId").click(function(){ // 开始过滤
		var bL = $("#qhm").val().split(",").length + $("#qdm").val().split(",").length;
		var aL = $("#hhm").val().split(",").length + $("#hdm").val().split(",").length;
		if ( bL < 5 || aL < 2 ) {
			return;
		}
		var betCode = "";
		if ( $("#qdm").val().split(",").length > 0 && $("#qdm").val() != "" ) {
			betCode = "("+$("#qdm").val()+")";
		}
		betCode += $("#qhm").val() + "+";
		if ( $("#hdm").val().split(",").length > 0 && $("#hdm").val() != "" ) {
			betCode += "("+$("#hdm").val()+")";
		}
		betCode += $("#hhm").val();
		var expressions = new Array();
		// AC值
		if ( $("input[name=ac]:checked").length > 0 ) {
			var exp = "";
			$("input[name=ac]:checked").each(function(index){
				exp += $(this).val() + ",";
			});
			exp = exp.substring(0, exp.length-1);
			expressions.push(new Expression(1, exp));
		}
		// 前区首位奇偶
		if ( $("input[name=bjo]:checked").length > 0 ) {
			var exp = $("input[name=bjo]:checked").val();
			expressions.push(new Expression(2, exp));
		}
		// 前区末位奇偶
		if ( $("input[name=ejo]:checked").length > 0 ) {
			var exp = $("input[name=ejo]:checked").val();
			expressions.push(new Expression(3, exp));
		}
		// 前区和值
		{
			var exp = $("#bhz").val()+"<v<"+$("#ehz").val();
			expressions.push(new Expression(4, exp));
		}
		// 前区奇偶比
		if ( $("input[name=job]:checked").length > 0 ) {
			$("input[name=job]:checked").each(function(index){
				expressions.push(new Expression(5, $(this).val()));
			});
		}
		// 前区大小比
		if ( $("input[name=dxb]:checked").length > 0 ) {
			$("input[name=dxb]:checked").each(function(index){
				expressions.push(new Expression(6, $(this).val()));
			});
		}
		// 前区质合比
		if ( $("input[name=zhb]:checked").length > 0 ) {
			$("input[name=zhb]:checked").each(function(index){
				expressions.push(new Expression(7, $(this).val()));
			});
		}
		// 连号
		if ( $("input[name=lh]:checked").length > 0 ) {
			var exp = "";
			$("input[name=lh]:checked").each(function(index){
				exp += $(this).val() + ",";
			});
			exp = exp.substring(0, exp.length-1);
			expressions.push(new Expression(8, exp));
		}
		// 位数
		if ( $("input[name=ws]:checked").length > 0 ) {
			var exp = "";
			$("input[name=ws]:checked").each(function(index){
				exp += $(this).val() + ",";
			});
			exp = exp.substring(0, exp.length-1);
			expressions.push(new Expression(9, exp));
		}
		
		// 后区begin
		// 后区首位奇偶
		if ( $("input[name=hbjo]:checked").length > 0 ) {
			var exp = $("input[name=hbjo]:checked").val();
			expressions.push(new Expression(21, exp));
		}
		// 后区末位奇偶
		if ( $("input[name=hejo]:checked").length > 0 ) {
			var exp = $("input[name=hejo]:checked").val();
			expressions.push(new Expression(22, exp));
		}
		// 后区和值
		{
			var exp = $("#hbhz").val()+"<v<"+$("#hehz").val();
			expressions.push(new Expression(23, exp));
		}
		// 后区奇偶比
		if ( $("input[name=hjob]:checked").length > 0 ) {
			$("input[name=hjob]:checked").each(function(index){
				expressions.push(new Expression(24, $(this).val()));
			});
		}
		// 后区大小比
		if ( $("input[name=hdxb]:checked").length > 0 ) {
			$("input[name=hdxb]:checked").each(function(index){
				expressions.push(new Expression(25, $(this).val()));
			});
		}
		// 后区质合比
		if ( $("input[name=hzhb]:checked").length > 0 ) {
			$("input[name=hzhb]:checked").each(function(index){
				expressions.push(new Expression(26, $(this).val()));
			});
		}
		// 后区连号
		if ( $("input[name=hlh]:checked").length > 0 ) {
			var exp = "";
			$("input[name=hlh]:checked").each(function(index){
				exp += $(this).val() + ",";
			});
			exp = exp.substring(0, exp.length-1);
			expressions.push(new Expression(27, exp));
		}
		
		$("#betListAreaId").empty();
		var list = dlt.shrink(betCode, expressions);
		layer.alert("过滤前"+dlt.soureNum+"注，过滤后"+list.length+"注，压缩率"+(new Number(parseFloat(list.length/dlt.soureNum)*100).toFixed(2))+"%",0);
		for ( var i = 0; i < list.length; i++ ) {
			$('<li betNum=1 betCode='+list[i]+'>'+
	                  '<div class="w_lil fl">［单式  '+1+'注］ <span class="tw_red">'+list[i].split("+")[0]+' </span>| <span class="tw_blue w_hkd">'+list[i].split("+")[1]+'</span></div>'+
	                  '<a href="javascript:void 0" class="fr" onclick="$(this).parent().remove();calculteAll();">删除</a>'+
	            '</li>').appendTo($("#betListAreaId"));
		}
		calculteAll();
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
	
});

function addBfCode() {
	var betCode = "";
	$("input[name=h].redbutton").each(function(index){
		betCode += $(this).val() + ",";
	});
	if ( betCode != "" ) {
		betCode = betCode.substring(0, betCode.length-1);
	}
	var opt = $("input[name=qqselect][type=radio]:checked").val();
	if ( opt == "0" ) {
		$("#qhm").val(betCode);
		var sps = $("#qdm").val().split(",");
		var s = betCode.split(",");
		var DO = "";
		for ( var i = 0; i < sps.length; i++ ) {
			var E = false;
			for ( var j = 0; j < s.length; j++ ) {
				if ( sps[i] == s[j] ) {
					E = true;
					break;
				}
			}
			if ( !E ) {
				DO += sps[i] + ",";
			}
		}
		if ( DO != "" ) {
			DO = DO.substring(0,DO.length-1);
		}
		$("#qdm").val(DO);
	} else {
		$("#qdm").val(betCode);
		var sps = $("#qhm").val().split(",");
		var s = betCode.split(",");
		var DO = "";
		for ( var i = 0; i < sps.length; i++ ) {
			var E = false;
			for ( var j = 0; j < s.length; j++ ) {
				if ( sps[i] == s[j] ) {
					E = true;
					break;
				}
			}
			if ( !E ) {
				DO += sps[i] + ",";
			}
		}
		if ( DO != "" ) {
			DO = DO.substring(0,DO.length-1);
		}
		$("#qhm").val(DO);
	}
}

function addAfCode() {
	var betCode = "";
	$("input[name=d].bluebutton").each(function(index){
		betCode += $(this).val() + ",";
	});
	if ( betCode != "" ) {
		betCode = betCode.substring(0, betCode.length-1);
	}
	var opt = $("input[name=selecthqm][type=radio]:checked").val();
	if ( opt == "0" ) {
		$("#hhm").val(betCode);
		var sps = $("#hdm").val().split(",");
		var s = betCode.split(",");
		var DO = "";
		for ( var i = 0; i < sps.length; i++ ) {
			var E = false;
			for ( var j = 0; j < s.length; j++ ) {
				if ( sps[i] == s[j] ) {
					E = true;
					break;
				}
			}
			if ( !E ) {
				DO += sps[i] + ",";
			}
		}
		if ( DO != "" ) {
			DO = DO.substring(0,DO.length-1);
		}
		$("#hdm").val(DO);
	} else {
		$("#hdm").val(betCode);
		var sps = $("#hhm").val().split(",");
		var s = betCode.split(",");
		var DO = "";
		for ( var i = 0; i < sps.length; i++ ) {
			var E = false;
			for ( var j = 0; j < s.length; j++ ) {
				if ( sps[i] == s[j] ) {
					E = true;
					break;
				}
			}
			if ( !E ) {
				DO += sps[i] + ",";
			}
		}
		if ( DO != "" ) {
			DO = DO.substring(0,DO.length-1);
		}
		$("#hhm").val(DO);
	}
}

function addNumberEvent(obj, callFun) {
	$(obj).keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$(obj).keyup(function(event){
		if ( $(this).val() != "" ) {
			callFun();
		}
	});
}