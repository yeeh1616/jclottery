/**
 * <p>Desc:在线过滤页面</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/9/11 Version 1.0
 */

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

var guess = null;

var filter = null;

var dateUtils = new DateUtils();

var globallist = null;

var pointer = null; // 当前操作对象

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
	$("#stopTimeId").html(guess.getStopTime(betCodes[0].split(":")[0]));
	// 过关区域 2串1^8串1
	var plen = betCodes.length > 8 ? 8 : betCodes.length;
	for ( var i = 2; i <= plen; i++ ) {
		$('<option value="'+i+'c1">'+i+'串1</option>').appendTo($("#passTypeSId"));
	}
	$("#passTypeSId").val(passString);
	var highestBonus = guess.calcBonus(betCode, passString, 1);
	var minBonus = guess.calcMinBonus(betCode, passString, 1);
	var minAddSp = 0, maxAddSp = 0;
	var minMulSp = 1, maxMulSp = 1;
	for ( var i = 0; i < betCodes.length; i++ ) {
		var cInfo = betCodes[i].split(":");
		var bets = cInfo[1].split(",");
		var subMinAdd = parseFloat(guess.getBetOdds(cInfo[0], bets[0])), subMaxAdd = 0;
		for ( var j = 0; j < bets.length; j++ ) {
			if ( parseFloat(guess.getBetOdds(cInfo[0], bets[j])) < subMinAdd ) {
				subMinAdd = parseFloat(guess.getBetOdds(cInfo[0], bets[j]));
			}
			if ( parseFloat(guess.getBetOdds(cInfo[0], bets[j])) > subMaxAdd ) {
				subMaxAdd = parseFloat(guess.getBetOdds(cInfo[0], bets[j]));
			}
		}
		minAddSp += subMinAdd;
		maxAddSp += subMaxAdd;
		minMulSp *= subMinAdd;
		maxMulSp *= subMaxAdd;
	}
	$("#bonusCalId").html('<p>预计奖金：'+minBonus+' ^ '+highestBonus+'</p>' + 
			'<p>赔率和：'+minAddSp+' ^ '+maxAddSp+'</p>' + 
			'<p>赔率积：'+minMulSp+' ^ '+maxMulSp+'</p>');
	var html = "";
	$("#schAreaId").empty();
	for ( var i = 0; i < betCodes.length; i++ ) {
		var cInfo = betCodes[i].split(":");
		var sch = guess.scheduleMap.get(cInfo[0]);
		var date = sch.id.substring(0,8);
		var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
		
		html += '<tr>'+
            '<td width="64" height="33px" class="w_bright">'+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'</td>'+
            '<td width="83">'+sch.hostName+' </td>'+
            '<td width="83" class="w_bright">'+sch.guestName+'</td>'+
            '<td width="32" class="d_blue">'+guess.getBetOdds(cInfo[0], '3')+'</td>'+
            '<td width="32" class="d_green">'+guess.getBetOdds(cInfo[0], '1')+'</td>'+
            '<td width="32" class="w_bright d_red">'+guess.getBetOdds(cInfo[0], '0')+'</td>';
		var s = false, p = false, f = false;
		if ( cInfo[1].indexOf('3') > -1 ) {
			s = true;
		}
		if ( cInfo[1].indexOf('1') > -1 ) {
			p = true;
		}
		if ( cInfo[1].indexOf('0') > -1 ) {
			f = true;
		}
		if ( s ) {
			html += '<td width="28"><span class="zxgl_digt zxgl_blue">3</span></td>';
			if ( p ) {
				html += '<td width="28"><span class="zxgl_digt zxgll_red">1</span></td>';
				if ( f ) {
					html += '<td width="28"><span class="zxgl_digt zxgl_yellow">0</span></td>';
				} else {
					html += '<td width="28"><span class="zxgl_digt">0</span></td>';
				}
			} else {
				if ( f ) {
					html += '<td width="28"><span class="zxgl_digt zxgll_red">0</span></td>';
					html += '<td width="28"><span class="zxgl_digt">1</span></td>';
				} else {
					html += '<td width="28"><span class="zxgl_digt">1</span></td>';
					html += '<td width="28"><span class="zxgl_digt">0</span></td>';
				}
			}
		} else {
			if ( p ) {
				html += '<td width="28"><span class="zxgl_digt zxgl_blue">1</span></td>';
				if ( f ) {
					html += '<td width="28"><span class="zxgl_digt zxgll_red">0</span></td>';
					html += '<td width="28"><span class="zxgl_digt">3</span></td>';
				} else {
					html += '<td width="28"><span class="zxgl_digt">3</span></td>';
					html += '<td width="28"><span class="zxgl_digt">0</span></td>';
				}
			} else {
				if ( f ) {
					html += '<td width="28"><span class="zxgl_digt zxgl_blue">0</span></td>';
					html += '<td width="28"><span class="zxgl_digt">3</span></td>';
					html += '<td width="28"><span class="zxgl_digt">1</span></td>';
				} else {
					html += '<td width="28"><span class="zxgl_digt">3</span></td>';
					html += '<td width="28"><span class="zxgl_digt">1</span></td>';
					html += '<td width="28"><span class="zxgl_digt">0</span></td>';
				}
			}
		}
        html +=  '</tr>';
	}
	
	$(html).appendTo($("#schAreaId"));
	
	$("#passTypeSId").change(function(){
		var passString = $(this).val();
		var betCode = $("#betCodeId").val();
		var betNum = guess.calcBetNum(betCode, passString);
		$("#betNumSId").html(betNum);
		$("#betMoneySId").html(betNum*2);
	});
	
	// 选择过滤条件区域
	$("a[name=confArea]").click(function(){
		if ( $(this).hasClass("zx_listbtn") ) {
			$(this).removeClass("zx_listbtn").addClass("zx_btn_n");
			$(this).next().hide();
		} else {
			$(this).removeClass("zx_btn_n").addClass("zx_listbtn");
			$(this).next().show();
		}
	});
	
	// 过滤添加选择
	$(".zx_listbtnf a").click(function(){
		if ( $(this).attr("type") == "1" ) {
			var betCode = $("#betCodeId").val();
			var len = betCode.split("|").length;
			var html = '';
			for ( var i = 0; i <= len; i++ ) {
				html += '<option value='+i+'>'+i+'</option>';
			}
			var conf = $(this).attr("conf");
			if ( conf == "103" || conf == "112" ) {
				html = '';
				len = len * 3;
				for ( var i = 0; i <= len; i++ ) {
					html += '<option value='+i+'>'+i+'</option>';
				}
			}
			if ( conf == "113" ) {
				html = '';
				len = 9*(len-1);
				for ( var i = 0; i <= len; i++ ) {
					html += '<option value='+i+'>'+i+'</option>';
				}
			}
			$('<tr conf="'+conf+'" type="'+$(this).attr("type")+'">'+
		            '<td width="60"><a href="javascript:void 0" class="shanchu_w"></a></td>'+
		            '<td width="60"><select name="start">'+ html +
		              '</select></td>'+
		            '<td width="175">≤<span class="center_digital">'+$(this).html()+'</span>≤</td>'+
		            '<td width="60"><select name="end">'+ html +
		              '</select></td>'+
		            '<td width="60"><input type="checkbox" disabled/></td>'+
		          '</tr>').appendTo($("#confAreaId"));
		} else if ( $(this).attr("type") == "2" ) {
			var conf = $(this).attr("conf");
			$('<tr conf="'+conf+'" type="'+$(this).attr("type")+'">'+
		            '<td width="60"><a href="javascript:void 0" class="shanchu_w"></a></td>'+
		            '<td width="60"><input type="text" name="start" size=3 ></td>'+
		            '<td width="175">≤<span class="center_digital">'+$(this).html()+'</span>≤</td>'+
		            '<td width="60"><input type="text" name="end" size=3 ></td>'+
		            '<td width="60"><input type="checkbox" disabled/></td>'+
		          '</tr>').appendTo($("#confAreaId"));
		} else if ( $(this).attr("type") == "4" ) { // 奖金选取
			var conf = $(this).attr("conf");
			$('<tr conf="'+conf+'" type="'+$(this).attr("type")+'">'+
		            '<td width="60"><a href="javascript:void 0" class="shanchu_w"></a></td>'+
		            '<td width="60">第<input type="text" name="start" size=3 ></td>'+
		            '<td width="175">注<span class="center_digital">奖金从低到高</span></td>'+
		            '<td width="60">第<input type="text" name="end" size=3 ></td>'+
		            '<td width="60">注</td>'+
		          '</tr>').appendTo($("#confAreaId"));
		} else if ( $(this).attr("type") == "5" ) { // 随机选取
			var conf = $(this).attr("conf");
			$('<tr conf="'+conf+'" type="'+$(this).attr("type")+'">'+
		            '<td width="60"><a href="javascript:void 0" class="shanchu_w"></a></td>'+
		            '<td width="270" colspan="3">随机选取<input type="text" name="start" size=10 ></td>'+
		            '<td width="60">注</td>'+
		          '</tr>').appendTo($("#confAreaId"));
		} else if ( $(this).attr("type") == "6" ) { // 冷门/命中
			var conf = $(this).attr("conf");
			$('<tr conf="'+conf+'" type="'+$(this).attr("type")+'" title="'+$(this).html()+'" conf2="">'+
		            '<td width="60"><a href="javascript:void 0" class="shanchu_w"></a></td>'+
		            '<td width="60">'+$(this).html()+'</td>'+
		            '<td width="175"><a href="javascript:void 0" class="condition_w">请点击设置按钮设定条件</a></td>'+
		            '<td width="60"><a href="javascript:void 0" class="shezhi_wbtn">设置</a></td>'+
		            '<td width="70"><input type="checkbox" disabled/></td>'+
		          '</tr>').appendTo($("#confAreaId"));
		}
	});
	/* 冷门过滤 begin */
	var nodeDialg;
	$(".condition_w,.shezhi_wbtn").live('click', function(){
		pointer =  $(this).parent().parent();
		var title = $(this).parent().parent().attr("title");
		$("#coldTitleId").html(title);
		// 生成对阵信息
		var betCodes = betCode.split("|");
		$("#coldSchId").empty();
		var html = "";
		for ( var i = 0; i < betCodes.length; i++ ) {
			var cInfo = betCodes[i].split(":");
			var sch = guess.scheduleMap.get(cInfo[0]);
			var date = sch.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			html += '<tr sch="'+sch.id+'">'+
		          '<td width="52">'+dateUtils.getWeekDay2(dd)+cInfo[0].substring(8)+'</td>'+
		          '<td width="64" class="zx_bd">'+sch.hostName+'</td>'+
		          '<td width="64">'+sch.guestName+'</td>'+
		          '<td width="40" class="zx_bd d_blue">'+guess.getBetOdds(cInfo[0], '3')+'</td>'+
		          '<td width="40" class="zx_bd d_green">'+guess.getBetOdds(cInfo[0], '1')+'</td>'+
		          '<td width="40" class="d_red">'+guess.getBetOdds(cInfo[0], '0')+'</td>'+
		          '<td width="35" class="zx_bd"><span class="zxgl_digt left_s " bet="3">3</span></td>'+
		          '<td width="35" class="zx_bd"><span class="zxgl_digt left_s " bet="1">1</span></td>'+
		          '<td width="34" ><span class="zxgl_digt left_s " bet="0">0</span></td>'+
		          '<td width="47" class="zx_bd"><a href="javascript:void 0" class="d_red" name="coldRmvLnId">全</a></td>'+
		        '</tr>';
		}
		$(html).appendTo($("#coldSchId"));
		// 范围
		var len = betCodes.length;
		for ( var i = 0; i <= len; i++ ) {
			$("<option value='"+(i)+"'>"+(i)+"</option>").appendTo($("#coldStartVId"));
			$("<option value='"+(i)+"'>"+(i)+"</option>").appendTo($("#coldEndVId"));
		}
		// 已选条件
		$("#confUlId").empty();
		if ( null != pointer ) {
			if ( $(pointer).attr("conf2") != "" ) {
				var confs = $(pointer).attr("conf2").split(",");
				for ( var i = 0; i < confs.length; i++ ) {
					var ss = confs[i].split("`");
					var sss = ss[0].split("|");
					var conf = "";
					for ( var j = 0; j < sss.length; j++ ) {
						conf += sss[j].split(":")[1]+"|"
					}
					conf = conf.substring(0,conf.length-1)+"`"+ss[1];
					$('<li conf="'+confs[i]+'">'+
			            	'<span class="fl">'+conf+'</span>'+
			                '<a href="javascript:void 0" class="fr" name="coldRmvConfLnA">删除</a>'+
			          '</li>').appendTo($("#confUlId"));
				}
			}
		}
		nodeDialg = $.layer({
	        type : 1,
	        title : ['选择部门'],
	        fix : false,
	        //offset:["40px" , '50%'],
	        area : ['auto','auto'],
	        shadeClose : false,
	        page : {dom : '#coldFDivId'}
	     }
		);
	});
	$(".zxgl_digt.left_s").live('click',function(){
		if ( $(this).hasClass("zxgll_red") ) {
			$(this).removeClass("zxgll_red");
		} else {
			$(this).addClass("zxgll_red");
		}
	});
	$("a[name=coldRmvLnId]").live('click',function(){
		var len = $(this).parent().parent().find(".zxgll_red").length;
		if ( len < 3 ) {
			$(this).parent().parent().find(".zxgl_digt.left_s").addClass("zxgll_red");
		} else {
			$(this).parent().parent().find(".zxgll_red").removeClass("zxgll_red");
		}
	});
	$("#coldRmvAllBtnId").click(function(){
		$("#coldSchId").find(".zxgll_red").removeClass("zxgll_red");
	});
	$("#coldAddCondId").click(function(){
		if ( $("#coldSchId").find(".zxgll_red").length == 0 ) {
			layer.msg("请先选中场次!");
			return false;
		}
		var html = "", conf = "";
		$("#coldSchId").find("tr").each(function(ii){
			conf += $(this).attr("sch") + ":"
			if ( $(this).find(".zxgll_red").length > 0 ) {
				$(this).find(".zxgll_red").each(function(index){
					html += $(this).attr("bet");
					conf += $(this).attr("bet");
				});
			} else {
				html += "#";
				conf += "#";
			}
			html += "|";
			conf += "|";
		});
		html = html.substring(0, html.length - 1) + "`" + $("#coldStartVId").val() + "^" + $("#coldEndVId").val();
		conf = conf.substring(0, conf.length - 1) + "`" + $("#coldStartVId").val() + "^" + $("#coldEndVId").val();
		$('<li conf="'+conf+'">'+
            	'<span class="fl">'+html+'</span>'+
                '<a href="javascript:void 0" class="fr" name="coldRmvConfLnA">删除</a>'+
            '</li>').appendTo($("#confUlId"));
	});
	$("a[name=coldRmvConfLnA]").live('click', function(){
		$(this).parent().remove();
	});
	$("#coldRmvAllCondId").click(function(){
		$("#confUlId").empty();
	});
	$(".yes_btn_n").click(function(){
		layer.close(nodeDialg);
		var len = $("#confUlId").find("li").length;
		if ( len > 0 ) {
			var conf = "";
			$("#confUlId").find("li").each(function(index){
				conf += $(this).attr("conf")+","
			});
			conf = conf.substring(0, conf.length-1);
			$(pointer).attr("conf2", conf);
			$(pointer).find(".condition_w").html("您设置了"+len+"个条件");
		} else {
			$(pointer).attr("conf2", "");
			$(pointer).find(".condition_w").html("请点击设置按钮设定条件");
		}
	});
	/* 冷门过滤 end */
	
	$("input[name=start],input[name=end]").live('keydown',function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("input[name=start],input[name=end]").live('keyup',function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
		}
	});
	
	$("#confAreaId tr").live("mouseover",function(){
		$(this).addClass("active");
	});
	$("#confAreaId tr").live("mouseout",function(){
		$(this).removeClass("active");
	});
	
	$("#removeAllConfId").click(function(){
		$("#confAreaId").empty();
	});
	
	$(".shanchu_w").live('click',function(){
		$(this).parent().parent().remove();
	});
	
	// 提交过滤
	$("#totalFltBtnId").click(function(){
		var betCode = $("#betCodeId").val();
		var passString = $("#passTypeSId").val();
		var list = guess.createOptList(betCode, passString);
		var snum = list.length;
		var expressions = new Array();
		$("#confAreaId").find("tr").each(function(index){
			if ( $(this).attr("type") == "2" || $(this).attr("type") == "4" ) {
				var petion = $(this).find("input[name=start]").val() + "<base<" + $(this).find("input[name=end]").val();
				var expr = new Expression(parseInt($(this).attr("conf"), 10), petion);
				expressions.push(expr);
			} else if ( $(this).attr("type") == "5" ) {
				var petion = $(this).find("input[name=start]").val() + "<base<0";
				var expr = new Expression(parseInt($(this).attr("conf"), 10), petion);
				expressions.push(expr);
			} else if ( $(this).attr("type") == "6" ) {
				if ( $(this).attr("conf2") != "" ) {
					var expr = new Expression(parseInt($(this).attr("conf"), 10), $(this).attr("conf2"));
					expressions.push(expr);
				}
			} else {
				var petion = $(this).find("select[name=start]").val() + "<base<" + $(this).find("select[name=end]").val();
				var expr = new Expression(parseInt($(this).attr("conf"), 10), petion);
				expressions.push(expr);
			}
		});
		globallist = filter.shrink(list, expressions);
		
		var zip = new Number(parseFloat((snum-globallist.length) / snum) * 100).toFixed(2);
		$("#filterResultInfoId").html('<p>过滤前<span>'+snum+'</span>注 </p>'+
								    '<p>过滤后<span>'+globallist.length+'</span>注</p>'+
								    '<p>过滤掉<span>'+(snum-globallist.length)+'</span>注</p>'+
								    '<p>压缩：<span>'+zip+'%</span></p>');
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
	
	$("#multipleId").keyup(function(event){
		if ( $(this).val() == "" )
			return false;
		var betNum = globallist.length;
		$("#betMoneyId").html(betNum*2*parseInt($(this).val(),10));
	});
	
	$("#lotteryBonusBtnId").click(function(){
		if ( $("#betMoneyId").html() == "0" ) {
			return false;
		}
		var betCode = $("#betCodeId").val();
		var betInfo = "";
		$("#filterResultId").find("tr").each(function(index){
			betInfo += $(this).attr("code") + ";";
		});
		betInfo = betInfo.substring(0, betInfo.length - 1);
		var form = $("<form action='/lottery/indexBonus.jhtml' method='post' target='_blank'>" +
				"<input type='hidden' name='betCode' value='"+betCode+"'/>"+
				"<input type='hidden' name='passType' value='"+$("#passTypeSId").val()+"'/>"+
				"<input type='hidden' name='singCode' value='"+betInfo+"'/>"+
				"<input type='hidden' name='playId' value='"+guess.playId+"'/>"+
				"<input type='hidden' name='licenseId' value='"+guess.licenseId+"'/>"+
				"</form>");
		$(form).appendTo($("body"));
		$(form).submit();
		$(form).remove();
	});
});

function createResult(list) {
	var betCodes = $("#betCodeId").val().split("|");
	var html = '';
	var betNum = 0;
	for ( var i = 0; i < list.length; i++ ) {
		html += '<tr code="'+list[i].betCode+'">';
		var code = "";
		var codes = list[i].betCode.split("|");
		var index = 0;
		for ( var o = 0; o < betCodes.length; o++ ) {
			if ( codes.length > index && betCodes[o].split(":")[0] == codes[index].split(":")[0] ) {
				code += codes[index].split(":")[1];
				index++;
			} else {
				code += "*";
			}
		}
		/*for ( var j = 0 ; j < codes.length; j++ ) {
			var cInfo = codes[j].split(":");
			
			var dd = cInfo[0].substring(0, 4)+"-"+cInfo[0].substring(4, 6)+"-"+cInfo[0].substring(6,8);
			code += cInfo[1];
			//code += dateUtils.getWeekDay2(dd) + cInfo[0].substring(8) + "_" + getBetName(guess.licenseId, guess.playId, cInfo[1]) + "×";
		}*/
		//code = code.substring(0, code.length-1);
		betNum += list[i].multiple;
		html += ' <td width="64" style="cursor:pointer;color:#148dd8;" >'+(i+1)+'</td>';
		html += '<td width="85">'+code+'</td>';
		html += '<td width="85">'+new Number(list[i].baseBonus*list[i].multiple).toFixed(2)+'</td>';
		html += '<td><a href="javascript:void 0" onclick="remLine(this);">删除</a></td>';
		//html += '<td align="center" bgcolor="#effaff">'+list[i].multiple+'</td>';
		//html += '<td align="center" bgcolor="#effaff"  class="colred"> '+new Number(list[i].baseBonus*list[i].multiple).toFixed(2)+'</td>';
		html += '</tr>';
	}
	$("#filterResultId").empty();
	
	$(html).appendTo($("#filterResultId"));
	$("#betMoneyId").html(betNum*2*parseInt($("#multipleId").val(),10));
}

function remLine(obj) {
	$(obj).parent().parent().remove();
	var multiple = $("#multipleId").val();
	var betNum = $("#filterResultId").find("tr").length;
	$("#betMoneyId").html(betNum*2*parseInt($("#multipleId").val(),10));
	$("#filterResultId").find("tr").each(function(index){
		$(this).find("td").eq(0).html(index+1);
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

function formFSubmit() {
	if ( $("#betMoneyId").html() == "0" ) {
		return false;
	}
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
	
	var multiple = $("#multipleId").val();
	var betInfo = "";
	$("#filterResultId").find("tr").each(function(index){
		betInfo += $(this).attr("code") + "`" + multiple + ";";
	});
	betInfo = betInfo.substring(0, betInfo.length - 1);
	
	$(form).find("input[name=licenseId]").val(guess.licenseId);
	$(form).find("input[name=playType]").val(guess.playId);
	$(form).find("input[name=passType]").val($("#passTypeSId").val());
	$(form).find("input[name=singleFlag]").val("2");
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
			
	$(form).find("input[name=theoryBonus]").val(theryB);
	
	$(form).submit();
}