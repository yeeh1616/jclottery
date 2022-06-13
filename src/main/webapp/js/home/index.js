/**
 * <p>Desc:首页装载</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/5/8 Version 1.0
 */

var dlt2pls = 1;	// 1-大乐透，2-排列三

$(document).ready(function () {
	
	// 彩种选择区域装载
	$("#licenseSelAreaId").empty();
	var area = "";
	// 区分彩种类别：1-竞彩足球，2-竞彩篮球，3-数字彩，4-传统彩
	var guessFootballArray = new Array();
	var guessBasketballArray = new Array();
	var numberArray = new Array();
	var footballArray = new Array();
	for ( var i = 0; i < storeLicense.length; i++ ) {
		if ( storeLicense[i] == 9 ) {
			guessFootballArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 10 ) {
			guessBasketballArray.push(storeLicense[i]);
		} else if ( storeLicense[i] < 5 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] < 9 && storeLicense[i] > 4 ) {
			footballArray.push(storeLicense[i]);
		}
	}
	if ( guessFootballArray.length > 0 ) {
		area += '<li>';
		area += '<div class="inlico"><img src="/images/index_ico.jpg" width="72" height="81" /></div>';
		area += '<p class="inlty">';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=spf">胜平负</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=rqspf">让球胜平负</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=bqc">半全场</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=zjq">总进球</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=bf">比分</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=hhgg">混合过关</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=2x1">2选1</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=9&p=worldcup">冠亚军</a>';
		area += '</p>';
		area += ' </li>';
	}
	if ( guessBasketballArray.length > 0 ) {
		area += '<li>';
		area += '<div class="inlico"><img src="/images/index_ico-02.jpg" width="72" height="81" /></div>';
		area += '<p class="inlty">';
		area += '<a href="/lottery/index.jhtml?licenseId=10&p=sf">胜负</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=10&p=rfsf">让分胜负</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=10&p=sfc">胜分差</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=10&p=dxf">大小分</a>';
		area += '<a href="/lottery/index.jhtml?licenseId=10&p=hhgg">混合过关</a>';
		area += '</p>';
		area += ' </li>';
	}
	if ( footballArray.length > 0 ) {
		area += '<li>';
		area += '<div class="inlico"><img src="/images/index_ico-03.jpg" width="72" height="81" /></div>';
		area += '<p class="inlty">';
		for ( var i = 0; i < footballArray.length; i++ ) {
			if ( footballArray[i] == 5 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=5">胜负彩</a>';
			} else if ( footballArray[i] == 6 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=6">任选九</a>';
			} else if ( footballArray[i] == 7 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=7">半全场</a>';
			} else if ( footballArray[i] == 8 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=8">进球彩</a>';
			}
		}
		area += '</p>';
		area += ' </li>';
	}
	if ( numberArray.length > 0 ) {
		area += '<li>';
		area += '<div class="inlico"><img src="/images/index_ico-04.jpg" width="72" height="81" /></div>';
		area += '<p class="inlty">';
		for ( var i = 0; i < numberArray.length; i++ ) {
			if ( numberArray[i] == 4 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=4">大乐透</a>';
			} else if ( numberArray[i] == 1 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=1&p=zxpt">排列三</a>';
			} else if ( numberArray[i] == 2 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=2">排列五</a>';
			} else if ( numberArray[i] == 3 ) {
				area += '<a href="/lottery/index.jhtml?licenseId=3">七星彩</a>';
			}
		}
		area += '</p>';
		area += ' </li>';
	}
	$(area).appendTo($("#licenseSelAreaId"));
	
	// 大乐透期次信息请求
	$.ajax({
	    type: "post",
	    url: "/getCurrentGame.json",
	    async: false,
	    data: "licenseId=4",
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			$("#bonusPoolId").html(data.reserved2);
			$("#dltissueId").val(data.issue);
			var time = data.reserved1.split(",");
			$("#stopSId").html(time[3]);
			$("#stopMId").html(time[2]);
			$("#stopHId").html(time[1]);
			$("#stopDId").html(time[0]);
			// 倒计时
			setInterval("clock('')", 1000);
			
			// 随机号码生成
			setRadomNumber();
			//var t = setInterval("setRadomNumber()", 50);
			//setTimeout("cancelInterval("+t+")", 2500);
	    }
	});
	
	// 排列三期次信息请求
	$.ajax({
	    type: "post",
	    url: "/getCurrentGame.json",
	    async: false,
	    data: "licenseId=1",
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			$("#plsissueId").val(data.issue);
			var time = data.reserved1.split(",");
			$("#plsstopSId").html(time[3]);
			$("#plsstopMId").html(time[2]);
			$("#plsstopHId").html(time[1]);
			$("#plsstopDId").html(time[0]);
			// 倒计时
			setInterval("clock('pls')", 1000);
			
			// 随机号码生成
			setPlsRadomNumber();
	    }
	});
	
	// 机选号码
	$("input[name=radomSelNumberBtnId]").click(function(){
		// 随机号码生成
		if ( dlt2pls == 1 ) {
			var t = setInterval("setRadomNumber()", 50);
			setTimeout("cancelInterval("+t+")", 2000);
		} else {
			var t = setInterval("setPlsRadomNumber()", 50);
			setTimeout("cancelInterval("+t+")", 2000);
		}
	});
	// 标准选号
	$("input[name=stdSelNumberBtnId]").click(function(){
		if ( dlt2pls == 1 ) {
			location.href = '/lottery/index.jhtml?licenseId=4';
		} else {
			location.href = '/lottery/index.jhtml?licenseId=1&p=zxpt';
		}
	});
	
	// 竞彩对阵
	var html = '';
	for ( var i = 0; i < schedules.length; i++ ) {
		if ( schedules[i].spfggodds != 'null' ) {
			html += '<tr>';
			html += '<td height="32" align="center" background="/images/yc.jpg" class="lxtd">'+schedules[i].leaguename+'<p>'+schedules[i].stoptime.substring(6,10)+'</p></td>';
			html += '<td align="center" class="clolan">'+schedules[i].hostname+' VS '+schedules[i].guestname+'</td>';
			html += '<td><table border="0" cellspacing="0" cellpadding="0">';
			html += '<tr >';
			var odds = schedules[i].spfggodds.split(",");
			html += '<td style="cursor:pointer;" width="38" height="28" align="center" background="/images/yc_02.jpg" class="bftd">'+odds[0]+'</td>';
			html += '<td style="cursor:pointer;" width="38" align="center" background="/images/yc_02.jpg" class="bftd">'+odds[1]+'</td>';
			html += '<td style="cursor:pointer;" width="38" align="center" background="/images/yc_02.jpg" class="bftd">'+odds[2]+'</td>';
			html += '</tr>';
			html += '</table></td>';
			html += '</tr>';
		}
	}
	$(html).appendTo($("#guessSchId"));
	
	// 竞彩去投注
	$("#guessGotoBetBtnId").click(function(){
		location.href = '/lottery/index.jhtml?licenseId=9&p=spf';
	});
	
	// 进入投注确认页
	$("input[name=dltBetBtnId]").click(function(){
		if ( $("#totalBetNumId").html() != "0" ) {
			// 查询余额
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$("#showBalDivId").html("未登录用户");
						$.blockUI({
							message: $("#loginAreaId"),
							css: {
								width: '612px',
								height: '520px',
								left: ($(window).width() - 618) / 2 + 'px',
								top: 50 + 'px',
								border: 'none',
								cursor:'default'
							}
						});
					} else {
						// 判断余额是否足够
						var pay = parseFloat($("#totalBetMoneyId").html());
						var balance = parseFloat(data);
						if ( pay > balance ) {
							popupConfirm("温馨提示","余额不足，请您先充值！");
						} else {
							$("#sureZjTdId").hide();
							var pname = dlt2pls == 1 ? "大乐透" +$("#dltissueId").val() : "排列三直选"+$("#plsissueId").val();
							$("#sureDivIssueId").html(pname);
							var html = '<td width="165" height="33">'+pname+'单式</td>';
							html += '<td height="33">'+1+'</td>';
							html += '<td height="33">'+1+'</td>';
							var zj = "否";
							html += '<td height="33" style="display:none">'+zj+'</td>';
							html += '<td width="210" height="33">¥<span>'+2+'元</span></td>';
							$("#sureBuyOrInfoTrId").empty();
							$(html).appendTo($("#sureBuyOrInfoTrId"));
							
							var chtml = '';
							var code = '';
							if ( dlt2pls == 1 ) {
								$("#radomNumberId").children().each(function(index){
									code += $(this).html() + ",";
								});
								var cs = code.substring(0, code.length-1).split(",");
								chtml += '<li><span class="red">'+cs[0]+","+cs[1]+","+cs[2]+","+cs[3]+","+cs[4]+'</span> | <span class="blue">'+cs[5] + "," +cs[6]+'</span></li>'; 
							} else {
								$("#plsradomNumberId").children().each(function(index){
									code += $(this).html() + ",";
								});
								var cs = code.substring(0, code.length-1).split(",");
								chtml += '<li><span class="red">'+cs[0]+","+cs[1]+","+cs[2]+'</span></li>'; 
							}
							$("#sureBuyBetDetailId").empty();
							$(chtml).appendTo($("#sureBuyBetDetailId"));
							
							$("#sureBuyTotalBetMoneyId").html(2);
							$("#sureBuyBalanceId").html(formatCurrency(data));
							showSureDiv();
							//formSubmit();
						}
					}
			    }
			});
		} else {
			popupConfirm("温馨提示","请先投注！");
		}
	});
	
	$("#plsShowSelId").click(function() {
		$("#plsBetAreaId").show();
		$("#dltBetAreaId").hide();
		dlt2pls = 2;
	});
	$("#dltShowSelId").click(function() {
		$("#plsBetAreaId").hide();
		$("#dltBetAreaId").show();
		dlt2pls = 1;
	});
});



function formSubmit() {
	var form = $("#lotteryBuyFormId");
	
	var betCode = "";
	if ( dlt2pls == 1 ) {
		$("#radomNumberId").children().each(function(index){
			betCode += $(this).html() + ",";
		});
	} else {
		$("#plsradomNumberId").children().each(function(index){
			betCode += $(this).html() + ",";
		});
	}
	betCode = betCode.substring(0, betCode.length - 1);
	var cs = betCode.split(",");
	if ( dlt2pls == 1 ) {
		$(form).find("input[name=issue]").val($("#dltissueId").val());
		$(form).find("input[name=licenseId]").val("4");
		$(form).find("input[name=betCode]").val(cs[0]+","+cs[1]+","+cs[2]+","+cs[3]+","+cs[4]+"+"+cs[5]+","+cs[6]);
	} else {
		$(form).find("input[name=issue]").val($("#plsissueId").val());
		$(form).find("input[name=licenseId]").val("1");
		$(form).find("input[name=betCode]").val(cs[0]+","+cs[1]+","+cs[2]);
		$(form).find("input[name=playType]").val("zxpt");
	}
	$(form).find("input[name=singleFlag]").val("0");
	
	$(form).find("input[name=betNum]").val("1");
	$(form).find("input[name=multiple]").val("1");
	$(form).find("input[name=betPrice]").val(2);
	//$(form).find("input[name=issue]").val($("#currIssueId").html());
	$(form).find("input[name=betState]").val("1");
	$(form).find("input[name=betType]").val("1");
	var base = "0";
	$(form).find("input[name=zjFlag]").val(base);
	
	$(form).submit();
}

/**
 * 关闭定时器
 * @param timer1
 * @return
 */
function cancelInterval(timer1) {
	clearInterval(timer1);
}

/**
 * 随机号码
 * @return
 */
function setRadomNumber() {
	$("#radomNumberId").empty();
	var kjBuf = random(5, 35);
	for ( var j = 0; j < 5; j++ ) {
		$('<td width="39" height="38" align="center" background="/images/hqlq_bg.jpg">'+kjBuf[j]+'</td>').appendTo($("#radomNumberId"));
	}
	kjBuf = random(2, 12);
	for ( var j = 0; j < 2; j++ ) {
		$('<td width="39" height="38" align="center" background="/images/hqlq_bg-02.jpg">'+kjBuf[j]+'</td>').appendTo($("#radomNumberId"));
	}
}

/**
 * 随机号码
 * @return
 */
function setPlsRadomNumber() {
	$("#plsradomNumberId").empty();
	for ( var j = 0; j < 3; j++ ) {
		$('<td width="39" height="38" align="center" background="/images/hqlq_bg.jpg">'+randomOne(9)+'</td>').appendTo($("#plsradomNumberId"));
	}
	
}

function randomOne( max ) {
	return Math.floor(Math.random()*max);
}

/**
 * 生成随机数
 * 参数
 *		num,随机数个数
 *		max,随机数的最大值
 * 返回 数组
 */
function random( num, max ) {
	var buf = new Array();	
	while ( buf.length < num ) {
		var rand = Math.floor(Math.random()*max) + "";
		if ( rand == 0 )
			continue;
		if ( rand.length == 1 ) {
			rand = "0" + rand;
		}
		var repeat = false;
		for ( var i = 0; i < buf.length; i++ ) {
			if ( rand == buf[i] ) {
				repeat = true;
				break;
			}
		}
		if ( repeat ) {
			continue;
		}
		buf.push(rand);
		
	}
	buf.sort();
	
	return buf;
}

/**
 * 时钟倒计
 * @return
 */
function clock(pri) {
	var sec = parseInt($("#"+pri+"stopSId").html());
	if ( sec > 0 ) {
		if ( sec <= 10 ) {
			$("#"+pri+"stopSId").html("0"+(sec-1));
		} else {
			$("#"+pri+"stopSId").html((sec-1));
		}
	} else {
		var min = parseInt($("#"+pri+"stopMId").html());
		if ( min > 0 ) {
			if ( min <= 10 ) {
				$("#"+pri+"stopMId").html("0"+(min-1));
			} else {
				$("#"+pri+"stopMId").html((min-1));
			}
			$("#"+pri+"stopSId").html(59);
		} else {
			var hou = parseInt($("#"+pri+"stopHId").html());
			if ( hou > 0 ) {
				if ( hou <= 10 ) {
					$("#"+pri+"stopHId").html("0"+(hou-1));
				} else {
					$("#"+pri+"stopHId").html((hou-1));
				}
				$("#"+pri+"stopMId").html(59);
				$("#"+pri+"stopSId").html(59);
			} else {
				var day = parseInt($("#"+pri+"stopDId").html());
				if ( day > 0 ) {
					if ( day <= 10 ) {
						$("#"+pri+"stopHId").html("0"+(hou-1));
					} else {
						$("#"+pri+"stopHId").html((hou-1));
					}
					$("#"+pri+"stopHId").html(23);
					$("#"+pri+"stopMId").html(59);
					$("#"+pri+"stopSId").html(59);
				} else {
					// 等待下一期
					
				}
			}
		}
	}
}