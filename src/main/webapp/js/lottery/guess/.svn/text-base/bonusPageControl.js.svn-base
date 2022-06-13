/**
 * <p>Desc:奖金优化</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/4/25 Version 1.0
 */
var guess = null;
var dateUtils = new DateUtils();
var hem = new Hemai();
$(document).ready(function () {
	guess = new Guess(parseInt($("#licenseId").val()), parseInt($("#playId").val()));
	guess.init();
	var passString = $("#passTypeId").val();
	// 展示对阵
	var betCode = $("#betCodeId").val();
	
	// 计算注数
	var betNum = guess.calcBetNum(betCode, passString);
	$("#buyMoneyId").val(betNum*2);
	var betCodes = betCode.split("|");
	
	var html = "";
	for ( var i = 0; i < betCodes.length; i++ ) {
		var cInfo = betCodes[i].split(":");
		var sch = guess.scheduleMap.get(cInfo[0]);
		var date = sch.id.substring(0,8);
		var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
		html += '<tr><td align="center" bgcolor="#FFFFFF">'+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'</td>';
		html += '<td height="30" align="center" bgcolor="'+sch.bgcolor+'"> <font class="colwt">'+sch.leageName+'</font> </td>';
		html += '<td align="center" bgcolor="#FFFFFF">'+sch.stopTime.substring(5,16)+'</td>';
		html += '<td align="center" bgcolor="#FFFFFF">'+sch.hostName+'</td>';
		html += '<td align="center" bgcolor="#FFFFFF"> '+sch.guestName+'</td>';
		html += '<td align="center" bgcolor="#FFFFFF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">';
		html += '<tr>';
		var bets = cInfo[1].split(",");
		for ( var j = 0; j < bets.length; j++ ) {
			html += '<td align="">';
			html += '<div class="tzrq"><strong>'+getBetName(guess.licenseId, guess.playId, bets[j])+'</strong><s>'+guess.getBetOdds(cInfo[0], bets[j])+'</s></div></td>';
		}
		html += '</tr></table></td></tr>';
	}
	
	$(html).appendTo($("#schAreaId"));
	
	var singlist = new Array();
	if ( $("#singCodeId").val() != '' ) {
		// 过滤来的单子
		var filterCodes = $("#singCodeId").val().split(";");
		for ( var i = 0; i < filterCodes.length; i++ ) {
			var om = new Optimization();
			var cInfo = filterCodes[i].split("|");
			var bonus = 1;
			for ( var j = 0; j < cInfo.length; j++ ) {
				var ccInfo = cInfo[j].split(":");
				bonus *= parseFloat(guess.getBetOdds(ccInfo[0], ccInfo[1]));
			}
			bonus = parseFloat(new Number(bonus*2).toFixed(2));
			om.baseBonus = bonus;
			om.betCode = filterCodes[i];
			om.multiple = 1;
			
			singlist.push(om);
		}
	} else {
		singlist = guess.createOptList(betCode, passString);
	}
	createSingleArea(singlist, false);
	
	// 优化按钮
	$("#bonusDoBtnId").click(function(){
		if ( (parseInt($("#buyMoneyId").val()) % 2) != 0 ) {
			layer.alert("投注必须为偶数！",0);
			return false;
		}
		var betMoney = $("#buyMoneyId").val();
		//var list = guess.createOptList(betCode, passString);
		var list = new Array();
		if ( $("#singCodeId").val() != '' ) {
			// 过滤来的单子
			var filterCodes = $("#singCodeId").val().split(";");
			for ( var i = 0; i < filterCodes.length; i++ ) {
				var om = new Optimization();
				var cInfo = filterCodes[i].split("|");
				var bonus = 1;
				for ( var j = 0; j < cInfo.length; j++ ) {
					var ccInfo = cInfo[j].split(":");
					bonus *= parseFloat(guess.getBetOdds(ccInfo[0], ccInfo[1]));
				}
				bonus = parseFloat(new Number(bonus*2).toFixed(2));
				om.baseBonus = bonus;
				om.betCode = filterCodes[i];
				om.multiple = 1;
				
				list.push(om);
			}
		} else {
			list = guess.createOptList(betCode, passString);
		}
		if ( $("#singleAreaId").children().length > 0 ) {
			list = new Array();
			$("#singleAreaId").children().each(function(index){
				var om = new Optimization();
				var cInfo = $(this).attr("code").split("|");
				var bonus = 1;
				for ( var j = 0; j < cInfo.length; j++ ) {
					var ccInfo = cInfo[j].split(":");
					bonus *= parseFloat(guess.getBetOdds(ccInfo[0], ccInfo[1]));
				}
				bonus = parseFloat(new Number(bonus*2).toFixed(2));
				om.baseBonus = bonus;
				om.betCode =  $(this).attr("code");
				om.multiple = 1;
				
				list.push(om);
			});
		}
		var s = $("input[name=bonusIn]:checked").val();
		var hasBox = false;
		switch ( s ) {
		case "1":
			list = guess.averOptimize(list, betMoney);
			break;
		case "2":
			list = guess.hotOptimize(list, betMoney);
			break;
		case "3":
			list = guess.coldOptimize(list, betMoney);
			break;
		case "4":
			if ( $("#singleAreaId").find("input[type=checkbox]").length == 0 ) {
				layer.alert("请选选择保本的注！",0);
				hasBox = true;
			} else {
				if ( $("#singleAreaId").find("input[type=checkbox]:checked").length == 0 ) {
					layer.alert("请选选择保本的注！",0);
					return false;
				}
				var trs = $("#singleAreaId").children();
				for ( var i = 0; i < trs.length; i++ ) {
					if ( $(trs[i]).find("input[type=checkbox]:checked").length > 0 ) {
						list[i].even = 1;
					}
				}
				list = guess.evenOptimize(list, betMoney);
				var amt = 0;
				for ( var i = 0; i < trs.length; i++ ) {
					amt += list[i].multiple;
					$(trs[i]).find("input[name=betNum]").val(list[i].multiple);
					$(trs[i]).find(".jj").html(new Number(list[i].baseBonus*list[i].multiple).toFixed(2));
				}
				$("#betMoneyId").html(amt*2);
				return false;
			}
			break;
		}
		createSingleArea(list, hasBox);
	});
	
	$("#buyMoneyId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	
});

function createSingleArea(singlist, hasBox) {
	for ( var i = 0; i < singlist.length; i++ ) {
		if ( singlist[i].multiple < 1 ) {
			layer.alert("所选方案不能进行该项优化！",0);
			return false;
		}
	}
	$("#singleAreaId").empty();
	var passString = $("#passTypeId").val();
	var betCode = $("#betCodeId").val();
	var shtml = "";
	var amt = 0;
	for ( var i = 0; i < singlist.length; i++ ) {
		var codes = singlist[i].betCode.split("|");
		amt += singlist[i].multiple;
		if ( hasBox ) {
			shtml += ' <tr code='+singlist[i].betCode+'><td height="30" align="center" bgcolor="#FFFFFF"><input type="checkbox"></td>';
		} else {
			shtml += ' <tr code='+singlist[i].betCode+'><td height="30" align="center" bgcolor="#FFFFFF">'+(i+1)+'</td>';
		}
		shtml += '<td align="center" bgcolor="#FFFFFF"><div class="dz">';
		for ( var j = 0; j < codes.length; j++ ) {
			var cInfo = codes[j].split(":");
			var sch = guess.scheduleMap.get(cInfo[0]);
			var date = sch.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			shtml += ' '+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'［<strong>'+getBetName(guess.licenseId, guess.playId, cInfo[1])+' '+guess.getBetOdds(cInfo[0], cInfo[1])+'</strong>］ ×';
		}
		shtml = shtml.substring(0, shtml.length-1);
		shtml += '</div></td>';
		shtml += '<td align="center" bgcolor="#FFFFFF" class="zhushu">';
		shtml += '<div class="tzrq"><span><img src="/images/jj.png" width="20" height="19" name="subMBtn"/>';
		shtml += '<input type="text" value="'+singlist[i].multiple+'" name="betNum" base="'+singlist[i].baseBonus+'"/>';
		shtml += '<img src="/images/add_bt.gif" width="20" height="19" name="addMBtn"/></span></div></td>';
		shtml += '<td align="center" bgcolor="#FFFFFF"><strong class="jj">'+(new Number(singlist[i].baseBonus*singlist[i].multiple).toFixed(2))+'</strong></td>'+
		'<td align="center" bgcolor="#FFFFFF"><a name="rem" onclick="remLine(this);">删除</a></td>'+
		'</tr>';
	}
	
	$(shtml).appendTo($("#singleAreaId"));
	$("#betMoneyId").html(amt*2);
	
	addDinamicalEvent();
}

function remLine(obj) {
	$(obj).parent().parent().remove();
	calcBetN();
	$("#singleAreaId").find("tr").each(function(index){
		$(this).find("td").eq(0).html(index+1);
	});
}

function addDinamicalEvent() {
	$("#singleAreaId").find("input[name=betNum]").each(function(index){
		$(this).keydown(function(event){
			if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
				return true;
			} else {
				return false;
			}
		});
		$(this).keyup(function(event){
			var v = $(this).val();
			if ( v == "" ) {
				return false;
			}
			var o = $(this).parent().parent().parent().next();
			$(o).find(".jj").html(new Number(parseInt(v)*parseFloat($(this).attr("base"))).toFixed(2));
			calcBetN();
		});
	});
	
	$("#singleAreaId").find("img[name=subMBtn]").click(function(){
		var v = $(this).next().val();
		if ( parseInt(v) > 1 ) {
			$(this).next().val(parseInt(v)-1);
			var o = $(this).parent().parent().parent().next();
			$(o).find(".jj").html(new Number((parseInt(v)-1)*parseFloat($(this).next().attr("base"))).toFixed(2));
			calcBetN();
		}
	});
	
	$("#singleAreaId").find("img[name=addMBtn]").click(function(){
		var v = $(this).prev().val();
		$(this).prev().val(parseInt(v)+1);
		var o = $(this).parent().parent().parent().next();
		$(o).find(".jj").html(new Number((parseInt(v)+1)*parseFloat($(this).prev().attr("base"))).toFixed(2));
		calcBetN();
	});
}

function calcBetN() {
	var trs = $("#singleAreaId").children();
	var amt = 0;
	for ( var i = 0; i < trs.length; i++ ) {
		amt += parseInt($(trs[i]).find("input[name=betNum]").val());
	}
	$("#betMoneyId").html(amt*2);
}

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

var JCZQ_INDEX_BF = new Hashtable();

JCZQ_INDEX_BF.put(0, "胜其他");
JCZQ_INDEX_BF.put(1, "1:0");
JCZQ_INDEX_BF.put(2, "2:0");
JCZQ_INDEX_BF.put(3, "2:1");
JCZQ_INDEX_BF.put(4, "3:0");
JCZQ_INDEX_BF.put(5, "3:1");
JCZQ_INDEX_BF.put(6, "3:2");
JCZQ_INDEX_BF.put(7, "4:0");
JCZQ_INDEX_BF.put(8, "4:1");
JCZQ_INDEX_BF.put(9, "4:2");
JCZQ_INDEX_BF.put(10, "5:0");
JCZQ_INDEX_BF.put(11, "5:1");
JCZQ_INDEX_BF.put(12, "5:2");

JCZQ_INDEX_BF.put(13, "平其他");
JCZQ_INDEX_BF.put(14, "0:0");
JCZQ_INDEX_BF.put(15, "1:1");
JCZQ_INDEX_BF.put(16, "2:2");
JCZQ_INDEX_BF.put(17, "3:3");

JCZQ_INDEX_BF.put(18, "负其他");
JCZQ_INDEX_BF.put(19, "0:1");
JCZQ_INDEX_BF.put(20, "0:2");
JCZQ_INDEX_BF.put(21, "1:2");
JCZQ_INDEX_BF.put(22, "0:3");
JCZQ_INDEX_BF.put(23, "1:3");
JCZQ_INDEX_BF.put(24, "2:3");
JCZQ_INDEX_BF.put(25, "0:4");
JCZQ_INDEX_BF.put(26, "1:4");
JCZQ_INDEX_BF.put(27, "2:4");
JCZQ_INDEX_BF.put(28, "0:5");
JCZQ_INDEX_BF.put(29, "1:5");
JCZQ_INDEX_BF.put(30, "2:5");

var JCLQ_INDEX_SFC = new Hashtable();
JCLQ_INDEX_SFC.put("0", "客胜1-5");
JCLQ_INDEX_SFC.put("1", "客胜6-10");
JCLQ_INDEX_SFC.put("2", "客胜11-15");
JCLQ_INDEX_SFC.put("3", "客胜16-20");
JCLQ_INDEX_SFC.put("4", "客胜21-25");
JCLQ_INDEX_SFC.put("5", "客胜26+");
JCLQ_INDEX_SFC.put("6", "主胜1-5");
JCLQ_INDEX_SFC.put("7", "主胜6-10");
JCLQ_INDEX_SFC.put("8", "主胜11-15");
JCLQ_INDEX_SFC.put("9", "主胜16-20");
JCLQ_INDEX_SFC.put("10", "主胜21-25");
JCLQ_INDEX_SFC.put("11", "主胜26+");

function getBetName(licenseId, playId, bet) {
	var retObj = "";
	switch( licenseId ) {
	case 9:
	{
		switch( playId ) {
		case 1:
			retObj = bet == "3" ? "胜" : bet == "1" ? "平" : "负";
			break;
		case 2:
			retObj = bet == "3" ? "胜(让)" : bet == "1" ? "平(让)" : "负(让)";
			break;
		case 3:
			retObj = bet;
			break;
		case 4:
			retObj = bet.replaceAll("3", "胜").replaceAll("1", "平").replaceAll("0", "负");
			break;
		case 5:
			retObj = JCZQ_INDEX_BF.get(parseInt(bet));
			break;
		case 6:
			var sInfo = bet.split("-");
			retObj = getBetName(licenseId, parseInt(sInfo[0]), sInfo[1]);
			break;
		}
		break;
	}
	case 10:
	{
		switch( playId ) {
		case 1:
			retObj = bet == "3" ? "主胜" : "客胜";
			break;
		case 2:
			retObj = bet == "3" ? "主胜(让)" : "客胜(让)";
			break;
		case 3:
			retObj = JCLQ_INDEX_SFC.get(parseInt(bet));
			break;
		case 4:
			retObj = bet == "0" ? "大分" : "小分";
			break;
		case 6:
			var sInfo = bet.split("-");
			retObj = getBetName(licenseId, parseInt(sInfo[0]), sInfo[1]);
			break;
		}
		break;
	}
	}
	return retObj;
}

function formFSubmit() {
	var form = $("#lotteryBuyFormId");
	var passString = $("#passTypeId").val();
	var betCode = $("#betCodeId").val();
	// 计算注数
	var betNum = guess.calcBetNum(betCode, passString);
	/*if ( betNum * 2 == parseInt($("#betMoneyId").html(),10) ) {
		alert("方案尚未优化！");
		return false;
	}*/
	var odds = "";////下单赔率 20140420001:3@2.10,1@1.11:1|20140420002:3@2.10:2
	var stopTimes = "";// 对阵的比赛截止时间
	var betCodes = betCode.split("|");
	for( var i = 0; i < betCodes.length; i++ ) {
		var cInfo = betCodes[i].split(":");
		var bets = cInfo[1].split(",");
		odds += cInfo[0] + ":";
		stopTimes += cInfo[0] + "`" + guess.getStopTime(cInfo[0]) + "|";
		for ( var j = 0; j < bets.length; j++ ) {
			odds += bets[j] + "@" + guess.getBetOdds(cInfo[0], bets[j]) + ",";
		}
		odds = odds.substring(0, odds.length - 1) + ":"+guess.getGgRqOrRf(cInfo[0])+ "|";
	}
	
	odds = odds.substring(0, odds.length - 1);
	stopTimes = stopTimes.substring(0, stopTimes.length - 1);
	
	var multiple = 0;
	var betInfo = "";
	$("#singleAreaId").children().each(function(index){
		multiple += parseInt($(this).find("input[name=betNum]").val());
		betInfo += $(this).attr("code") + "`" + $(this).find("input[name=betNum]").val() + ";";
	});
	betInfo = betInfo.substring(0, betInfo.length - 1);
	
	$(form).find("input[name=licenseId]").val(guess.licenseId);
	$(form).find("input[name=playType]").val(guess.playId);
	//$(form).find("input[name=passType]").val(passString);
	$(form).find("input[name=singleFlag]").val("3");
	//$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=orderOdds]").val(odds);
	$(form).find("input[name=betNum]").val(parseInt($("#betMoneyId").html())/parseInt(multiple));
	$(form).find("input[name=multiple]").val(-1);
	$(form).find("input[name=betPrice]").val($("#betMoneyId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=issue]").val("1");
	$(form).find("input[name=betType]").val("1");
	$(form).find("input[name=schInfo]").val(betInfo);
	$(form).find("input[name=reserved8]").val(stopTimes);
	
	var theryB = 0;
	$("#singleAreaId").children().each(function(index){
		var bb = parseFloat($(this).find(".jj").html());
		if ( bb > theryB ) {
			theryB = bb;	
		}
	});
			
	$(form).find("input[name=theoryBonus]").val(theryB);
	
	$(form).submit();
}