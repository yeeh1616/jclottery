/**
 * <p>Desc:北单在线过滤页面</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/9/11 Version 1.0
 */

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}
var schNum = 14;
var comb = new CombAlgorithm();
var filter = new Filter();
var globallist = null;
var oddMap = new Hashtable();
var pointer = null; // 当前操作对象
$(document).ready(function () {
	var html = "";
	for ( var i = 0; i < schedules.length; i++ ) {
		var odd = schedules[i].averageOdds;
		if ( odd == 'null' ) {
			odd = '--,--,--';
		}
		oddMap.put(i, odd);
		var odds = odd.split(",");
		
		html += '<tr>'+
	        '<td width="64" height="33px" class="w_bright">'+(i+1)+'</td>'+
	        '<td width="83">'+schedules[i].hostTeam+' </td>'+
	        '<td width="83" class="w_bright">'+schedules[i].guestTeam+'</td>'+
	        '<td width="32" class="d_blue">'+odds[0]+'</td>'+
	        '<td width="32" class="d_green">'+odds[1]+'</td>'+
	        '<td width="32" class="w_bright d_red">'+odds[2]+'</td>';
		html += '<td width="28"><span class="zxgl_digt">3</span></td>';
		html += '<td width="28"><span class="zxgl_digt">1</span></td>';
		html += '<td width="28"><span class="zxgl_digt">0</span></td>';
	    html +=  '</tr>';
	}
	$(html).appendTo($("#schAreaId"));
	
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
	
	// 彩果选中
	$(".zxgl_digt").click(function(){
		if ( $(this).hasClass("zxgll_red") ) {
			$(this).removeClass("zxgll_red");
		} else {
			$(this).addClass("zxgll_red");
		}
		calcFAhead();
	});
	
	$("#qsClBtnId").click(function(){
		$("#schAreaId").find(".zxgl_digt").removeClass("zxgll_red");
		calcFAhead();
	});
	$("#qsRdBtnId").click(function(){
		$("#schAreaId").find(".zxgl_digt").removeClass("zxgll_red");
		var rom = ["3", "1", "0"];
		$("#schAreaId").find("tr").each(function(index){
			var rn = football.random(100) % 3 + 1;
			for ( var i = 0; i < rn; i++ ) {
				var v = rom[football.random(100) % 3];
				$(this).find(".zxgl_digt").each(function(ii){
					if ( $(this).html() == v ) {
						$(this).addClass("zxgll_red");
					}
				});
			}
		});
		calcFAhead();
	});
	
	// 过滤添加选择
	$(".zx_listbtnf a").click(function(){
		if ( $(this).attr("type") == "1" ) {
			var len = 9;
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
		$("#coldSchId").empty();
		var html = "";
		for ( var i = 0; i < schedules.length; i++ ) {
			var odds = schedules[i].averageOdds.split(",");
			html += '<tr sch="'+(i+1)+'">'+
		          '<td width="52">'+(i+1)+'</td>'+
		          '<td width="64" class="zx_bd">'+schedules[i].hostTeam+'</td>'+
		          '<td width="64">'+schedules[i].guestTeam+'</td>'+
		          '<td width="40" class="zx_bd d_blue">'+odds[0]+'</td>'+
		          '<td width="40" class="zx_bd d_green">'+odds[1]+'</td>'+
		          '<td width="40" class="d_red">'+odds[2]+'</td>'+
		          '<td width="35" class="zx_bd"><span class="zxgl_digt left_s " bet="3">3</span></td>'+
		          '<td width="35" class="zx_bd"><span class="zxgl_digt left_s " bet="1">1</span></td>'+
		          '<td width="34" ><span class="zxgl_digt left_s " bet="0">0</span></td>'+
		          '<td width="47" class="zx_bd"><a href="javascript:void 0" class="d_red" name="coldRmvLnId">全</a></td>'+
		        '</tr>';
		}
		$(html).appendTo($("#coldSchId"));
		// 范围
		var len = 14;
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
		if ( $("#betNumSId").html() == "0" ) {
			return false;
		}
		var betArray = new Array();
		var index = 0;
		$("#schAreaId").find("tr").each(function(index){
			if ( $(this).find(".zxgll_red").length > 0 ) {
				var sArray = new Array();
				$(this).find(".zxgll_red").each(function(ii){
					sArray.push(index+":"+$(this).html());
				});
				betArray.push(sArray);
			}
			index++;
		});
		var list = new Array();
		var slist = comb.findComb(betArray, betArray.length, 9);
		for ( var i = 0; i < slist.length; i++ ) {
			var plist = comb.findNmComb(slist[i]);
			for ( var j = 0; j < plist.length; j++ ) {
				var codes = plist[j].join(",").split(",");
				var rcode = new Array();
				var idx = 0;
				for ( var o = 0; o < 14; o++ ) {
					if ( idx > 8 ) {
						rcode.push("#");
					}
					else if ( parseInt(codes[idx].split(":")[0]) == o ) {
						rcode.push(codes[idx].split(":")[1]);
						idx++;
					} else {
						rcode.push("#");
					}
				}
				list.push(rcode);
			}
		}
		var snum = list.length;
		var expressions = new Array();
		$("#confAreaId").find("tr").each(function(index){
			if ( $(this).attr("type") == "2" || $(this).attr("type") == "4") {
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
		$("#totalBetMoneyId").html(betNum*2*parseInt($(this).val(),10));
	});
	
	$("#expBtnId").click(function(){
		var betCodes = "";
		$("#filterResultId").find("tr").each(function(index){
			betCodes += $(this).find("td").eq(1).html()+"\n";
		});
		if ( betCodes == "" ) {
			layer.alert("没有过滤结果",0);
			return false;
		}
		betCodes = betCodes.substring(0, betCodes.length - 1);
		
		$("#exportFilterDataForm").remove();
		var $form = $("<form action='/common/downfile.jhtml' method='post'></form>")
				.appendTo("body");
		var $filepath = $(
				"<input type='hidden' id='fileName' name='fileName' value='/任选九场第"+schedules[0].issue+"期过滤结果.txt' />")
				.appendTo($form);
		var $filterContent = $(
				"<input type='hidden' id='filterContent' name='content' value='' />")
				.appendTo($form);
		
		$filterContent.val(betCodes);
		$form.submit();
	});
});

function getBetOdds(i, bet) {
	var odds = oddMap.get(i).split(",");
	var ood = "";
	if ( bet == "3" ) {
		ood = odds[0];
	} else if ( bet == "1" ) {
		ood = odds[1];
	}  else if ( bet == "0" ) {
		ood = odds[2];
	}
	return ood;
}

function calcFAhead() {
	var betArray = new Array();
	$("#schAreaId").find("tr").each(function(index){
		if ( $(this).find(".zxgll_red").length > 0 ) {
			var subArray = new Array();
			$(this).find(".zxgll_red").each(function(index){
				subArray.push($(this).html());
			});
			betArray.push(subArray);
		}
	});
	var betNum = 0;
	if ( betArray.length > 8 ) {
		betNum = football.calcR9BetNum(betArray);
	}
	$("#betNumSId").html(betNum);
	$("#betMoneySId").html(betNum*2);
}

function createResult(list) {
	var html = '';
	var betNum = 0;
	for ( var i = 0; i < list.length; i++ ) {
		html += '<tr code="'+list[i].betCode+'">';
		betNum += 1;
		html += ' <td width="64">'+(i+1)+'</td>';
		html += '<td width="95">'+list[i].join("")+'</td>';
		html += '<td width="95">'+'</td>';
		//html += '<td align="center" bgcolor="#effaff">'+list[i].multiple+'</td>';
		//html += '<td align="center" bgcolor="#effaff"  class="colred"> '+new Number(list[i].baseBonus*list[i].multiple).toFixed(2)+'</td>';
		html += '</tr>';
	}
	$("#filterResultId").empty();
	
	$(html).appendTo($("#filterResultId"));
	$("#totalBetNumId").html(betNum);
	$("#totalBetMoneyId").html(betNum*2*parseInt($("#multipleId").val(),10));
}
