/**
 * <p>Desc:在线过滤页面</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/4/29 Version 1.0
 */

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

var guess = null;

var filter = null;

var dateUtils = new DateUtils();

var globallist = null;

$(document).ready(function () {
	guess = new Guess(parseInt($("#licenseId").val()), parseInt($("#playId").val()));
	guess.init();
	filter = new Filter(guess);
	var passString = $("#passTypeId").val();
	$("#passTypeSId").html(passString.replaceAll("c", "串"));
	// 展示对阵
	var betCode = $("#betCodeId").val();
	
	// 计算注数
	var betNum = guess.calcBetNum(betCode, passString);
	$("#betMoneySId").html(betNum*2);
	$("#betNumSId").html(betNum);
	var betCodes = betCode.split("|");
	$("#schSId").html(betCodes.length);
	
	var html = "";
	for ( var i = 0; i < betCodes.length; i++ ) {
		var cInfo = betCodes[i].split(":");
		var sch = guess.scheduleMap.get(cInfo[0]);
		var date = sch.id.substring(0,8);
		var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
		
		html += '<tr><td align="center" bgcolor="#FFFFFF">'+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'</td>';
		html += '<td height="30" align="center" bgcolor="#FFFFFF"> '+sch.hostName+'  vs  '+sch.guestName+'</td>';
		html += '<td align="center" bgcolor="#FFFFFF">';
		var bets = cInfo[1].split(",");
		for ( var j = 0; j < bets.length; j++ ) {
			html += '<span class="tzxkuai">'+getBetName(guess.licenseId, guess.playId, bets[j])+'</span>';
		}
		html += '</td></tr>';
	}
	
	$(html).appendTo($("#schAreaId"));
	
	//var singlist = guess.createOptList(betCode, passString);
	
	// 表单
	$("#lotteryFormBtnId").click(function(){
		// 先判断余额，如果未登录，先登录
		$.ajax({
		    type: "post",
		    url: "/common/getAccountUsable.json",
		    async: false,
		    //data: "licenseId=" + licenseId,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == '-1' ) {
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#betMoneyId").html());
					var balance = parseFloat(data);
					if ( pay > balance ) {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						formSubmit();
					}
				}
		    }
		});
	});
	
	bonusFilterEvent();
	
	// 提交过滤
	$("#totalFltBtnId").click(function(){
		var betCode = $("#betCodeId").val();
		var passString = $("#passTypeId").val();
		var list = guess.createOptList(betCode, passString);
		$("#filterBodyId").children().each(function(index){
			var type = $(this).attr("type");
			switch ( type ) {
			case "3":
				list = filter.bonusFilte(list, $(this).attr("conf"));
				break;
			}
		});
		
		globallist = list;
		
		createResult(globallist);
	});
	
	// 设置每注奖金接近
	$("#setAverCheckId").click(function(){
		if ( $(this).attr("checked") ) {
			$("#setAverInputId").removeAttr("disabled");
		} else {
			$("#setAverInputId").attr("disabled", "disabled");
		}
	});
	
	$("#setAverInputId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#setAverInputId").keyup(function(event){
		if ( $(this).val() == "" )
			return false;
		var money = parseFloat($(this).val());
		for ( var i = 0 ; i < globallist.length; i++ ) {
			globallist[i].multiple = parseInt(money / parseFloat(globallist[i].baseBonus)) + 1;
		}
		createResult(globallist);
	});
	$("#multipleBId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleBId").keyup(function(event){
		if ( $(this).val() == "" )
			return false;
		var money = parseFloat($(this).val());
		for ( var i = 0 ; i < globallist.length; i++ ) {
			globallist[i].multiple = globallist[i].multiple * money;
		}
		createResult(globallist);
	});
});

function createResult(list) {
	var html = '';
	var betNum = 0;
	for ( var i = 0; i < list.length; i++ ) {
		html += '<tr code="'+list[i].betCode+'">';
		html += '<td height="30" align="center" bgcolor="#effaff">'+(i+1)+'</td>';
		var code = "";
		var codes = list[i].betCode.split("|");
		for ( var j = 0 ; j < codes.length; j++ ) {
			var cInfo = codes[j].split(":");
			var dd = cInfo[0].substring(0, 4)+"-"+cInfo[0].substring(4, 6)+"-"+cInfo[0].substring(6,8);
			code += dateUtils.getWeekDay2(dd) + cInfo[0].substring(8) + "_" + getBetName(guess.licenseId, guess.playId, cInfo[1]) + "×";
		}
		code = code.substring(0, code.length-1);
		betNum += list[i].multiple;
		html += '<td height="30" align="center" bgcolor="#effaff"><strong class="colred">'+code+'</strong></td>';
		html += '<td align="center" bgcolor="#effaff">'+list[i].multiple+'</td>';
		html += '<td align="center" bgcolor="#effaff"  class="colred"> '+new Number(list[i].baseBonus*list[i].multiple).toFixed(2)+'</td>';
		html += '</tr>';
	}
	$("#filterResultId").empty();
	
	$(html).appendTo($("#filterResultId"));
	$("#totalBetMoneyId").html(betNum*2);
}

function bonusFilterEvent() {
	// 过滤弹出按钮
	$(".addbtn2").click(function(){
		$.blockUI({
			message: $("#bonusConfSetId"),
			css: {
				width: '612px',
				height: '520px',
				left: ($(window).width() - 618) / 2 + 'px',
				top: 50 + 'px',
				border: 'none',
				cursor:'default'
			}
		});
	});
	$(".cls").click(function(){
		$.unblockUI();
	});
	// 添加过滤条件
	$("#bonusAddConBtnId").click(function(){
		if ( $("#startBonusId").val() == "" || $("#endBonusId").val() == "" ) {
			layer.alert("请输入奖金！",0);
			return false;
		}
		var html = '<tr conf="'+$("#startBonusId").val()+'<bonus<'+$("#endBonusId").val()+'">';
		html += '<td height="30" align="center" bgcolor="#FFFFFF">'+($("#bonusAddConfAId").children().length+1)+'</td>';
		html += '<td align="center" bgcolor="#FFFFFF">'+$("#startBonusId").val()+'≤奖金范围≤'+$("#endBonusId").val()+' </td>';
		html += '<td align="center" bgcolor="#FFFFFF" onclick="$(this).parent().remove();">删除</td></tr>';
		$(html).appendTo($("#bonusAddConfAId"));
	});
	
	// 去过滤
	$("#bonusGotoFilerId").click(function(){
		var html = "";
		$("#bonusAddConfAId").children().each(function(index){
			html += '<tr type="3" conf="'+$(this).attr("conf")+'">';
			html += '<td height="30" align="center" bgcolor="#FFFFFF" style="cursor:pointer;" onclick="$(this).parent().remove();">删除</td>';
			html += '<td align="center" bgcolor="#FFFFFF">奖金过滤</td>';
			html += '<td align="center" bgcolor="#FFFFFF">'+$(this).children().eq(1).html()+'</td>';
			html += '<td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox" checked/></td>';
			html += '</tr>';
		});
		$(html).appendTo($("#filterBodyId"));
		
		$.unblockUI();
	});
	
	$("#startBonusId").keydown(function(event){
		if ( (event.keyCode < 48 || event.keyCode > 57) && event.keyCode != 8) {
			return false;
		}
	});
	$("#endBonusId").keydown(function(event){
		if ( (event.keyCode < 48 || event.keyCode > 57) && event.keyCode != 8) {
			return false;
		}
	});
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

function formSubmit() {
	var form = $("#lotteryBuyFormId");
	
	var betCode = $("#betCodeId").val();
	var odds = "";//下单赔率 20140420001:3@2.10,1@1.11|20140420002:3@2.10
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
	$("#filterResultId").children().each(function(index){
		multiple += parseInt($(this).children().eq(2).html());
		betInfo += $(this).attr("code") + "`" + $(this).children().eq(2).html() + ";";
	});
	betInfo = betInfo.substring(0, betInfo.length - 1);
	
	$(form).find("input[name=licenseId]").val(guess.licenseId);
	$(form).find("input[name=playType]").val(guess.playId);
	//$(form).find("input[name=passType]").val(passString);
	$(form).find("input[name=singleFlag]").val("1");
	//$(form).find("input[name=betCode]").val(betCode);
	$(form).find("input[name=orderOdds]").val(odds);
	$(form).find("input[name=betNum]").val(parseInt($("#totalBetMoneyId").html())/parseInt(multiple));
	$(form).find("input[name=multiple]").val(-1);
	$(form).find("input[name=betPrice]").val($("#totalBetMoneyId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=issue]").val("1");
	$(form).find("input[name=betType]").val("1");
	$(form).find("input[name=schInfo]").val(betInfo);
	$(form).find("input[name=reserved8]").val(stopTimes);
	
	var theryB = 0;
	$("#filterResultId").children().each(function(index){
		var bb = parseFloat($(this).children().eq(3).html());
		if ( bb > theryB ) {
			theryB = bb;	
		}
	});
			
	$(form).find("input[name=theoryBonus]").val(theryB);
	
	$(form).submit();
}