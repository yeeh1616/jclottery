/**
 * <p>Desc:新首页装载</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/5/8 Version 1.0
 */

$(document).ready(function () {	
	$.ajax({
	    type: "post",
	    url: "/getpicture.jhtml",
	    async: false,
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			$.each(data,function(index,val){
				$("#pictureshow").append("<li><a  href='http://wangdian.cp020.com"+val.imageUri+"' rel='prettyPhoto[]'><img src='http://wangdian.cp020.com"+val.imageUri+"' /></a></li>")
			});
		}
	});
	
	// 彩种选择区域装载
	$("#licenseSelAreaId").empty();
	var area = '';
	// 区分彩种类别：1-竞彩足球，2-竞彩篮球，3-数字彩，4-传统彩
	var guessFootballArray = new Array();
	var guessBasketballArray = new Array();
	var numberArray = new Array();
	var footballArray = new Array();
	var freqArray = new Array();
	var fcArray = new Array();//福彩
	var bdArray = new Array();
	 
	for ( var i = 0; i < storeLicense.length; i++ ) {
		if ( storeLicense[i] == 9 ) {
			guessFootballArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 10 ) {
			guessBasketballArray.push(storeLicense[i]);
		} else if ( storeLicense[i] < 5 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] < 9 && storeLicense[i] > 4 ) {
			footballArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 11 ||
			          storeLicense[i] == 12 ||
			          storeLicense[i] == 13 ) {
			fcArray.push(storeLicense[i]);
		} else if ( storeLicense[i] > 100 ) {
			freqArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 20 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 24 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 25 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 23 ) {
			numberArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 21 ) {
			bdArray.push(storeLicense[i]);
		} else if ( storeLicense[i] == 22 ) {
			bdArray.push(storeLicense[i]);
		}
	}
	area += '<div class="menu jingzu">'+
	    ' <div class="menu_l fl">'+
	    '   <div class="jingzu_img"></div>'+
	    ' </div>'+
	    ' <div class="menu_r fl">竞彩足球<span>返奖率高达73%</span></div>'+
	    '<div class="clear"></div>'+
	    ' <div class="tiy"><ul>';
	if ( guessFootballArray.length > 0 ) {
		area +=  '<li><a href="/lottery/index.jhtml?licenseId=9&p=hhgg">混合过关</a><i></i></li> '+
			     '<li><a class="red" href="/lottery/index.jhtml?licenseId=9&p=hhspfdg">单关足球</a></li>'+
			     '<li style="width:70px;"><a href="/lottery/index.jhtml?licenseId=9&p=hhspf">胜平负/让球</a></li>'+
			     '<li><a href="/lottery/index.jhtml?licenseId=9&p=2x1">2选1</a></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=9&p=zjq">进球数</a></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=9&p=bqc">半全场</a></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=9&p=bf">比分</a></li>'+
			      //'<li><a href="/cytxhome/eurocup/champion.html">冠亚军</a><img src="/images/new.gif"/></li>'+
			     '<li><a href="/lotteryopen/jc.jhtml" target="_blank" style="color:#df4c3d">开奖数据</a> </li>'+
			     '';
	}
	area += '</ul></div><div class="clear"></div></div>';
	area += '<div class="menu jingzu" >'+
	    '<div class="menu_l fl">'+
	      '<div class="jinglan_img"></div>'+
	    '</div>'+
	    '<div class="menu_r fl">竞彩篮球<span>猜胜负中大奖</span></div>'+
	    ' <div class="clear"></div>'+
	    '<div class="tiy"><ul>';
	if ( guessBasketballArray.length > 0 ) {
		area += ''+
				  '<li><a href="/lottery/index.jhtml?licenseId=10&p=hhgg">混合过关</a></li>'+
				  '<li><a class="red" href="/lottery/index.jhtml?licenseId=10&p=hhdg">单关篮球</a></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=10&p=sf">胜负</a><i></i></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=10&p=rfsf">让分胜负</a></li> '+
			      '<li><a href="/lottery/index.jhtml?licenseId=10&p=sfc">胜分差</a></li>'+
			      '<li><a href="/lottery/index.jhtml?licenseId=10&p=dxf">大小分</a> </li>'+
			      '<li><a href="/lotteryopen/jclq.jhtml" target="_blank" style="color:#df4c3d">开奖数据</a></li>'+
			      '';
	}
	area += '</ul></div><div class="clear"></div></div>';
	if ( bdArray.length > 0 ) {
		area += '<div class="menu jingzu"><div class="menu_l fl">'+
			'<div class="bd_img"></div></div>'+
			'<div class="menu_r fl">北京单场<span>赢长串，高奖金</span></div>'+
			'<div class="clear"></div><div class="tiy"><ul>'+
			'<li><a href="/lottery/index.jhtml?licenseId=22">胜负过关</a></li>'+
		    '<li><a class="red" href="/lottery/index.jhtml?licenseId=21&p=spf">胜平负</a></li>'+
	        '<li><a href="/lottery/index.jhtml?licenseId=21&p=bf">比分</a><i></i></li>'+
	        '<li><a href="/lottery/index.jhtml?licenseId=21&p=bqc">半全场</a></li> '+
	        '<li><a href="/lottery/index.jhtml?licenseId=21&p=zjq">总进球</a></li>'+
	        '<li><a href="/lottery/index.jhtml?licenseId=21&p=sxds">上下单双</a> </li>'+
	        '<li><a href="/lotteryopen/bjdc.jhtml" target="_blank" style="color:#df4c3d">开奖数据</a></li>'+
			'</ul></div><div class="clear"></div></div>';
	}
	area += '<div class="menu jingzu">'+
	    '<div class="menu_l fl">'+
	      '<div class="laozu_img"></div>'+
	    '</div>'+
	    '<div class="menu_r fl">传统足彩<span>最高奖金500万</span></div>'+
	    '<div class="clear"></div>'+
	    '<div class="tiy"><ul>';
	if ( footballArray.length > 0 ) {
		for ( var i = 0; i < footballArray.length; i++ ) {
			if ( footballArray[i] == 5 ) {
				area += '<li><a href="/lottery/index.jhtml?licenseId=5">胜负彩</a></li>';
			} else if ( footballArray[i] == 6 ) {
				area += '<li><a href="/lottery/index.jhtml?licenseId=6">任选九</a></li>';
			} else if ( footballArray[i] == 7 ) {
				area += '<li><a href="/lottery/index.jhtml?licenseId=7">半全场</a></li>';
			} else if ( footballArray[i] == 8 ) {
				area += '<li><a href="/lottery/index.jhtml?licenseId=8">进球彩</a></li>';
			}
		}
	}
	area +=	 '</ul></div>'+
	    '<div class="clear"></div>'+
	  '</div>';
	if ( bdArray.length == 0 ) {
		area += '<div class="menu jingzu">'+
	    '<div class="menu_l fl">'+
	      '<div class="tic_img"></div>'+
	    '</div>'+
	    '<div class="menu_r fl">体彩<span>3元中1600万</span></div>'+
	    ' <div class="clear"></div>'+
	    '<div class="tiy"><ul>';
		if ( numberArray.length > 0 ) {
		      for ( var i = 0; i < numberArray.length; i++ ) {
					if ( numberArray[i] == 4 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=4">大乐透</a></li>';
					} else if ( numberArray[i] == 1 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=1&p=zxpt">排列三</a></li>';
					} else if ( numberArray[i] == 2 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=2">排列五</a></li>';
					} else if ( numberArray[i] == 3 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=3">七星彩</a></li>';
					} else if ( numberArray[i] == 20 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=20">浙江6+1</a></li>';
					}  else if ( numberArray[i] == 23 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=23">浙江20选5</a></li>';
					} else if ( numberArray[i] == 24 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=24">江苏7位数</a></li>';
					} else if ( numberArray[i] == 25 ) {
						area += '<li><a href="/lottery/index.jhtml?licenseId=25">福建31选7</a></li>';
					}
				}
		}
		 area += '</div>'+
	     '<div class="clear"></div>'+
	   '</ul></div>';
	}
	
	area += '<div class="menu jingzu" style="border-bottom:none">'+
    '<div class="menu_l fl">'+
      '<div class="gao_img"></div>'+
    '</div>'+
   // '<div class="menu_r fl"><span>用速度争取每一次机会</span></div>'+
	//'<div class="clear"></div>'+
	'<div class="tiy"><ul>';
	try{
		if (  storeFLicense.length > 0 ) {
			for ( var i = 0; i < storeFLicense.length; i++ ) {
				area += '<li><a href="/lottery/index.jhtml?licenseId='+storeFLicense[i].licenseId+'">'+storeFLicense[i].name+'</a></li>';
			}
		}
	} catch (e){}
	area += ' </ul></div>'+
    '<div class="clear"></div>'+
  '</div>';
	if ( bdArray.length > 0 || fcArray.length > 0 ) {
		area += '<div class="all-sort-list" style="border-top:1px dashed #ccc;border-bottom:none">'+
	      '<div class="gp item">'+
	        '<div class="sm_c">更多彩种</div>'+
	        '<div class="smcz">'+
	          '<ul>'+
	            '<li><span href="javascript:void 0">更多有趣的玩法</span><a class="sy_x">>></a></li>'+
	          '</ul>'+
	        '</div>'+
	        '<div class="item-list clearfix">'+
						'<div class="close">x</div>'+
						'<div class="subitem">';
		/*if ( bdArray.length > 0 ) {
			area +=				'<dl class="fore1">'+
								'<dt><a href="/lottery/index.jhtml?licenseId=21">北京单场</a></dt>'+
								'<dd><em><a href="/lottery/index.jhtml?licenseId=21">让球胜平负</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=22">胜负过关</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=21&p=sxds">上下单双</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=21&p=bqc">半全场</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=21&p=bf">比分</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=21&p=zjq">总进球数</a></em></dd>'+
							'</dl>';
		}*/
		if ( numberArray.length > 0 && bdArray.length > 0 ) {
			area +=				'<dl class="fore1"><dt><a href="javascript:void 0">体彩</a></dt><dd>';
			for ( var i = 0; i < numberArray.length; i++ ) {
				if ( numberArray[i] == 4 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=4">大乐透</a></em>';
				} else if ( numberArray[i] == 1 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=1&p=zxpt">排列三</a></em>';
				} else if ( numberArray[i] == 2 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=2">排列五</a></em>';
				} else if ( numberArray[i] == 3 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=3">七星彩</a></em>';
				} else if ( numberArray[i] == 20 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=20">浙江6+1</a></em>';
				} else if ( numberArray[i] == 23 ) {
					area += '<li><a href="/lottery/index.jhtml?licenseId=23">浙江20选5</a></li>';
				} else if ( numberArray[i] == 24 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=24">江苏7位数</a></em>';
				} else if ( numberArray[i] == 25 ) {
					area += '<em><a href="/lottery/index.jhtml?licenseId=25">福建31选7</a></em>';
				}
			}
			area +=	'</dd></dl>';
		}
		if ( fcArray.length > 0 ) {
			area +=				'<dl class="fore2">'+
								'<dt><a href="/lottery/index.jhtml?licenseId=11">福彩</a></dt>'+
								'<dd><em><a href="/lottery/index.jhtml?licenseId=11">双色球</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=13">七乐彩</a></em>'+
								'<em><a href="/lottery/index.jhtml?licenseId=12">福彩3D</a></em></dd>'+
							'</dl>';
		}
		area	+=			'</div>'+
					'</div>'+
	      '</div>'+
	    '</div>';
		
	}
	$(area).appendTo($("#licenseSelAreaId"));
	
	$('.all-sort-list > .item').hover(function(){
		var eq = $('.all-sort-list > .item').index(this),				//获取当前滑过是第几个元素
			h = $('.all-sort-list').offset().top,						//获取当前下拉菜单距离窗口多少像素
			s = $(window).scrollTop(),									//获取游览器滚动了多少高度
			i = $(this).offset().top,									//当前元素滑过距离窗口多少像素
			item = $(this).children('.item-list').height(),				//下拉菜单子类内容容器的高度
			sort = $('.all-sort-list').height();						//父类分类列表容器的高度
		
		if ( item < sort ){												//如果子类的高度小于父类的高度
			if ( eq == 0 ){
				$(this).children('.item-list').css('top', (i-h));
			} else {
				$(this).children('.item-list').css('top', (i-h)+1);
			}
		} else {
			if ( s > h ) {												//判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
				if ( i-s > 0 ){											//则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
					$(this).children('.item-list').css('top', (s-h)+2 );
				} else {
					$(this).children('.item-list').css('top', (s-h)-(-(i-s))+2 );
				}
			} else {
				$(this).children('.item-list').css('top', 3 );
			}
		}	

		$(this).addClass('hover');
		$(this).children('.item-list').css('display','block');
	},function(){
		$(this).removeClass('hover');
		$(this).children('.item-list').css('display','none');
	});

	$('.item > .item-list > .close').click(function(){
		$(this).parent().parent().removeClass('hover');
		$(this).parent().hide();
	});
	
	// 大乐透期次信息请求
	/*$.ajax({
	    type: "post",
	    url: "/getCurrentGame.json",
	    async: false,
	    data: "licenseId=4",
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
		},
	    success: function (data){
			$("#bonusPoolId").html('停售时间：<bb>'+data.stopTime+"</bb>");
			$("#dltIssueId").html("第"+data.issue+"期");
			$("#dltStopTimeId").html("奖池：<bb>"+numToCny(data.reserved2.replaceAll(",",""))+"</bb>");
			$("#dltStopTimeId").attr("stopTime", data.stopTime);
			// 随机号码生成
			setRadomNumber();
	    }
	});*/
	
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
			$("#plsIssueId").html("第"+data.issue+"期");
			$("#plsStopTimeId").html('截止投注时间：<b>'+data.stopTime+"</b>");
			$("#plsStopTimeId").attr("stopTime", data.stopTime);
			// 随机号码生成
			setPlsRadomNumber();
	    }
	});
	
	// 大乐透/排列三切换
	/*$("li[name=jcArtN]").click(function(){
		$("li[name=jcArtN]").removeClass("artTaba").addClass("artTabb");
		$(this).removeClass("artTabb").addClass("artTaba");
		
		if ( $(this).html() == '大乐透' ) {
			$(".artTabcon").eq(0).show();
			$(".artTabcon").eq(1).hide();
		} else {
			$(".artTabcon").eq(1).show();
			$(".artTabcon").eq(0).hide();
		}
	});*/
	$("li[name=jcArtN]").click(function(){
		$("li[name=jcArtN]").removeClass("cur");
		$(this).addClass("cur");
		
		if ( $(this).html() == '凤凰指数' ) {
			$("div[name=homepanel]").eq(0).show();
			$("div[name=homepanel]").eq(1).hide();
		} else {
			$("div[name=homepanel]").eq(1).show();
			$("div[name=homepanel]").eq(0).hide();
		}
	});
	
	// 大乐透机选号码
	$("#dltRadomBtnId").click(function(){
		var t = setInterval("setRadomNumber()", 50);
		setTimeout("cancelInterval("+t+")", 1000);
	});
	// 排列三机选号码
	$("#plsRadomBtnId").click(function(){
		var t = setInterval("setPlsRadomNumber()", 50);
		setTimeout("cancelInterval("+t+")", 1000);
	});
	
	var existDlt = false;
	for ( var i = 0; i < storeLicense.length; i++ ) {
		if ( storeLicense[i] == 4 ) {
			existDlt = true;
		}
	}
	/*if ( !existDlt ) {
		$("#tcPanelId").hide();
		$("#fcPanelId").show();
	} else {
		$("#tcPanelId").show();
		$("#fcPanelId").hide();
	}*/
	$("#tcPanelId").show();
	$("#fcPanelId").hide();
	
	// 胜负彩期次信息请求
	try{
			$("#zcTobodyId").empty();
			var html = '';
			for ( var i = 0; i < schedules.length; i++ ) {
				var host = schedules[i].hostTeam;
				var guest = schedules[i].guestTeam;
				if ( host.length > 3 ) {
					host = host.substring(0,3);
				}
				if ( guest.length > 3 ) {
					guest = guest.substring(0,3);
				}
				var odds = schedules[i].averageOdds.split(",");
				html += '<tr>'+
		              '<td width="5%">'+schedules[i].gameId+'</td>'+
		              '<td width="7%" class="table1">'+schedules[i].leagueName+'</td>'+
		              '<td width="16%">'+schedules[i].raceStartTime+'</td>'+
		              '<td width="15%" class="table2">'+
		              '<a href="javascript:void 0" class="name">'+host+'</a><span class="vs">vs</span>'+
		              '<a href="javascript:void 0" class="name">'+guest+'</a></td>'+
		              '<td width="10%" class="table2"><a href="javascript:void 0">析</a><a href="javascript:void 0">欧</a><a href="javascript:void 0">亚</a></td>'+
		              '<td width="6%" >'+odds[0]+'</td>'+
		              '<td width="6%">'+odds[1]+'</td>'+
		              '<td width="6%">'+odds[2]+'</td>'+
		              '<td width="6%" class="jjbg sh_left"><a href="javascript:void 0">3</a></td>'+
		              '<td width="6%" class="jjbg"><a href="javascript:void 0">1</a></td>'+
		              '<td width="6%" class="jjbg"><a href="javascript:void 0">0</a></td>'+
		              '<td width="6%" class="jjbg_n"><input type="checkbox" disabled/></td>'+
		              '<td width="5%" class="jjbg sh_left"><a href="javascript:void 0">包</a></td>'+
		            '</tr>';
			}
			$(html).appendTo($("#zcTobodyId"));
			
			// 选中事件
			$("#zcTobodyId").find(".jjbg").click(function(){
				if ( $(this).find("a").html() == "包" ) {// 全包
					if ( $(this).parent().find(".active").length == 3 ) {
						$(this).parent().find(".active").removeClass("active");
					} else {
						$(this).parent().find(".jjbg").addClass("active");
						$(this).parent().find(".jjbg").eq(3).removeClass("active");
						
					}
				} else {
					if ( $(this).hasClass("active") ) {
						$(this).removeClass("active");
					} else {
						$(this).addClass("active");
					}
				}
				var v = $("#zcSfARjOptId").find("a.current").attr("value");
				if ( v == "6" ) {
					if ( $(this).parent().find(".active").length == 0 ) {
						$(this).parent().find("input[type=checkbox]").attr("disabled", "disabled");
					} else {
						// 设胆打开
						$(this).parent().find("input[type=checkbox]").removeAttr("disabled");
					}
				}
			});
			
			// 胜负彩/任九切换
			$("#zcSfARjOptId").find("a").click(function(){
				$("#zcSfARjOptId").find("a").removeClass("current");
				$(this).addClass("current");
				$("#zcTobodyId").find(".active").removeClass("active");
				$("#zcTobodyId").find("input[type=checkbox]").attr("disabled", "disabled");
				/*var val = $(this).attr("val");
				if ( val == "6" ) {
					// 设胆打开
					$("#zcTobodyId").find("input[type=checkbox]").removeAttr("disabled");
				} else {
					$("#zcTobodyId").find("input[type=checkbox]").attr("disabled", "disabled");
				}*/
			});
			// 清空
			$("#clearZcId").click(function(){
				$("#zcTobodyId").find(".active").removeClass("active");
				$("#zcTobodyId").find("input[type=checkbox]").attr("disabled", "disabled");
			});
			// 去投注
			$("#zcBetBtnId").click(function(){
				var v = $("#zcSfARjOptId").find("a.current").attr("value");
				var url = "/lottery/index.jhtml?licenseId="+v;
				var betCode = "";
				$("#zcTobodyId").find("tr").each(function(index){
					betCode += (index+1) + "`";
					if ( $(this).find(".active").length > 0 ) {
						$(this).find(".active").each(function(){
							betCode += $(this).find("a").html();
						});
					} else  {
						betCode += "-";
					}
					if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
						betCode += "`2,";
					} else {
						betCode += "`1,";
					}
				});
				betCode = betCode.substring(0, betCode.length - 1);
				url += "&betCode=" + betCode;
				location.href = url;
			});
	    } catch ( ex ) {}
	
	// 进入投注确认页
	$("#dltNowBetId").click(function(){
		var url = "/lottery/index.jhtml?licenseId=4";
		var betCode = "";
		$("#dltRadomUlId").find("input").each(function(index){
			betCode += $(this).val() + ",";
		});
		betCode = betCode.substring(0, betCode.length - 1);
		var cs = betCode.split(",");
		betCode = cs[0]+","+cs[1]+","+cs[2]+","+cs[3]+","+cs[4]+"+"+cs[5]+","+cs[6];
		url += "&betCode=" + betCode;
		location.href = url;
	});
	
	$("#plsNowBetId").click(function(){
		var url = "/lottery/index.jhtml?licenseId=1&p=zxpt";
		var betCode = "";
		$("#plsRadomUlId").find("input").each(function(index){
			betCode += $(this).val() + ",";
		});
		betCode = betCode.substring(0, betCode.length - 1);
		url += "&betCode=" + betCode;
		location.href = url;
	});
	
	// 满意度评价
	$("#satisBtnId").click(function(){
		var owner = $("#ownerSatisId").html();
		var info = $("#infoSatisId").html();
		var web = $("#webSatisId").html();
		$.ajax({
		    type: "post",
		    url: "/evalSatis.json",
		    async: false,
		    data: "ownerSatis="+owner+"&infoSatis="+info+"&webSatis="+web,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == 1 ) {
					layer.alert("提交成功!",0);
				} else {
					layer.alert("您已评价，不能重复评价!",0);
				}
		    }
		});
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
	
	//福彩店铺显示走势图模块
	if ( fcArray.length > 0 && 
	     numberArray.length == 0 && 
	     footballArray.length == 0 && 
	     guessFootballArray.length == 0 ) {
	    $("#fcChartId").attr("style","display:block;")
	    
	    var fcChart = '<div class="artL_tit">彩票走势图</div>';	
	    fcChart += '<div class="zs-pic"><img src="/newhome/images/zst.png" width="208" height="89" /></div>';
			fcChart += '<div class="artLa">';
			fcChart += '<div class="artLb">';
			fcChart += '<div class="zs-title">双色球走势图</div>';
			fcChart += '<ul>';
			fcChart += '<li class="artLba"><a href="/chart/ssq_index.jhtml" target="_blank">开奖分布图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/ssq_jou.jhtml" target="_blank">奇偶分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/ssq_ys.jhtml" target="_blank">余数走势图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/ssq_hq.jhtml" target="_blank">红球走势图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/ssq_lq.jhtml" target="_blank">蓝球走势图</a></li>';
			fcChart += '</ul>';
			fcChart += '</div>';
			fcChart += '</div>';
			fcChart += '<div class="artLa">';
			fcChart += '<div class="artLb">';
			fcChart += '<div class="zs-title">福彩3D走势图</div>';
			fcChart += '<ul>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_index.jhtml" target="_blank">开奖分布图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_kd.jhtml" target="_blank">跨度分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_zx.jhtml" target="_blank">组选分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_dx.jhtml" target="_blank">大小分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_jou.jhtml" target="_blank">奇偶分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/f3d_hz.jhtml" target="_blank">和值分析图</a></li>';
			fcChart += '</ul>';
			fcChart += '</div>';
			fcChart += '</div>';
			fcChart += '<div class="artLa no-bt">';
			fcChart += '<div class="artLb">';
			fcChart += '<div class="zs-title">七乐彩走势图</div>';
			fcChart += '<ul>';
			fcChart += '<li class="artLba"><a href="/chart/qlc_index.jhtml" target="_blank">开奖分布图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/qlc_jou.jhtml" target="_blank">奇偶分析图</a></li>';
			fcChart += '<li class="artLba"><a href="/chart/qlc_ys.jhtml" target="_blank">余数走势图</a></li>';
			fcChart += '</ul>';
			fcChart += '</div>';
			fcChart += '</div>';
	    
	    $(fcChart).appendTo($("#fcChartId"));
	}
	
	intiPageNews();
});

function intiPageNews() {
	// 店铺中奖信息
	//加载最新中奖信息
	try {
		var json =  bonusNewests;
		var dtlist = '';
		$.each(json,function(index,val){
			
			dtlist += '<dt><span class="numx">'+(parseInt(index,10)+1)+'</span><span class="name'
			+'">'+val["userName"]+'</span><a>'+val["gameName"]+'</a><span class="money">'+val["bonus"]+'元</span></dt>';
		});	
		$('#index_right_zxzj').html(dtlist);
	} catch ( ex ) {}
	//加载中奖排行信息
	try {
		var json =  bonusTops;
		var dtlist = '';
		$.each(json,function(index,val){
			var css = "numx";
			if ( index == 0 ) {
				css = "num_gold";
			}
			if ( index == 1 ) {
				css = "num_gold yinpai";
			}
			if ( index == 2 ) {
				css = "num_gold tongpai";
			}
			var ii = (parseInt(index,10)+1);
			if ( index == 0 || index == 1 || index == 2 ) {
				ii = "";
			}
			dtlist += '<dt><span class="'+css+'">'+ii+'</span><span class="name'
			+'">'+val["userName"]+'</span><a>'+val["gameName"]+'</a><span class="money">'+val["bonus"]+'元</span></dt>';
		});
		$('#index_right_zjph').html(dtlist);
	} catch ( ex ) {}
	//获取合买排行
	try {
		var json =  mergerTop1s;
		var dtlist = '';
		$.each(json,function(index,val){
			dtlist += '<dl><dt><span class="'+function(){
				return index >= 3?'numx':'num';
			}()+'">'+val.rank+'</span><span>'+val.userName+'</span><span class="red qian">'+val.bonus+'元</span></dt></dl>';
		});
		$('#index_left_hm_sy').html(dtlist);
	} catch ( ex ) {}
	//获取合买排行——竞技彩
	try {
		var json =  mergerTop2s;
		var dtlist = '';
		$.each(json,function(index,val){
			dtlist += '<dl><dt><span class="'+function(){
				return index >= 3?'numx':'num';
			}()+'">'+val.rank+'</span><span>'+val.userName+'</span><span class="red qian">'+val.bonus+'元</span></dt></dl>';
		});
		$('#index_left_hm_jc').html(dtlist);
	} catch ( ex ) {}
	//获取合买排行——数字彩
	try {
		var json =  mergerTop5s;
		var dtlist = '';
		$.each(json,function(index,val){
			dtlist += '<dl><dt><span class="'+function(){
				return index >= 3?'numx':'num';
			}()+'">'+val.rank+'</span><span>'+val.userName+'</span><span class="red qian">'+val.bonus+'元</span></dt></dl>';
		});
		$('#index_left_hm_szc').html(dtlist);
	} catch ( ex ) {}
	//加载最新开奖公告
	try {
		var mathlottery = '';
		var footballlotter = '';
		var high ='';
		var json =  homeOpen;
		for ( var i = 0; i < json.length; i++ ) {
			if( json[i].license == '5' || json[i].license == '7' || json[i].license == '8' ){
				footballlotter += '<dl class="notice_cont ">'+
					'<dt class="notice_c_d">'+
					'<a href="/lottery/index.jhtml?licenseId="'+json[i].license+' style="font-weight:bold;">'+json[i].game_name+'</a>'+
					'<span>'+json[i].event+'期</span><span>'+json[i].openPayTime+'</span></dt><dt class="notice_c_n">';
				var opens = json[i].result.split("-");
				for ( var j = 0; j < opens.length; j++ ) {
					footballlotter += '<span class="red">'+opens[j]+'</span>';
				}
				footballlotter += '</dt></dl>';
			} else  {
				mathlottery += '<dl class="notice_cont ">'+
					'<dt class="notice_c_d"><strong>'+json[i].game_name+'</strong><span>第'+json[i].event+'期</span>'+
					'<span>'+json[i].openPayTime+'</span></dt><dt class="notice_c_n">';
				var opens = json[i].result.split("-");
				if ( json[i].license == '1' || json[i].license == '2' || json[i].license == '3' || json[i].license == '12' || json[i].license == '24') {
					for ( var j = 0; j < opens.length; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
				} else if ( json[i].license == '4' ) {
					for ( var j = 0; j < 5; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
					for ( var j = 5; j < 7; j++ ) {
						mathlottery += '<span class="blue_ballbg blue1">'+opens[j]+'</span>';
					}
				} else if ( json[i].license == '20' ) {
					for ( var j = 0; j < 6; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
					for ( var j = 6; j < 7; j++ ) {
						mathlottery += '<span class="blue_ballbg blue1">'+opens[j]+'</span>';
					}
				} else if ( json[i].license == '11' ) {
					for ( var j = 0; j < 6; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
					for ( var j = 6; j < 7; j++ ) {
						mathlottery += '<span class="blue_ballbg blue1">'+opens[j]+'</span>';
					}
				} else if ( json[i].license == '13' ) {
					for ( var j = 0; j < 7; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
					for ( var j = 7; j < 8; j++ ) {
						mathlottery += '<span class="blue_ballbg blue1">'+opens[j]+'</span>';
					}
				} else {
					for ( var j = 0; j < opens.length; j++ ) {
						mathlottery += '<span class="red_ballbg">'+opens[j]+'</span>';
					}
				}
				var xq = "ps.jhtml",zs = "ps_index.jhtm";
				switch(json[i].license) {
				case "2":
					xq = "pw.jhtml";
					zs = "pw_index.jhtm";
					break;
				case "3":
					xq = "qx.jhtml";
					zs = "qx_index.jhtm";
					break;
				case "4":
					xq = "dlt.jhtml";
					zs = "dlt_index.jhtm";
					break;
				case "20":
					xq = "dlt.jhtml";
					zs = "dlt_index.jhtm";
					break;
				}
				
				mathlottery +='</dt><dt class="notice_b">'+
					'<a target="blank" href="/lotteryopen/'+xq+'">开奖详情</a>|'+
					'<a target="blank" href="/chart/'+zs+'">走势图</a>|'+
					'<a target="blank" href="/lottery/index.jhtml?licenseId='+json[i].license+'">投注</a></dt></dl>';
			}
		}
		$('#index_left_kjgg_zc').html(footballlotter);
		mathlottery +=mathlottery;
		$('#index_left_kjgg_szc').html(mathlottery);
		$('#index_left_kjgg_gpc').html(high);
	} catch ( ex ) {}
	//加载店铺最新公告
	try {
		$('#index_dzgg').html(SHOPKEEPER_BULLETIN[0].content);
		$('#index_right_bdgg').html(OUR_BULLETIN[0].content);
	} catch (ex){}
	//加载店主推荐
	try {
		var dtlist = '';
		$.each(tcYcs,function(index,val){
			dtlist += '<a href="/news.jhtml?conid='+val.id+'">'+val.date+'&nbsp;'+val.title+'</a>';
		});
		$('#index_right_dztj').html(dtlist);
	} catch (ex){}
	//获取新闻——竞彩
	try {
		var dtlist = '';
		dtlist = newsTitleControl(dtlist,jcNews,'【竞彩】',28,4,6,true);
		$('#jcNewsArea').html(dtlist);
	} catch ( ex ) {}
	//获取新闻——数字彩
	try {
		var dtlist = '';
		dtlist = newsTitleControl(dtlist,szNews,'【数字】',28,4,6,true);
		$('#szcNewsArea').html(dtlist);
	} catch ( ex ) {}
	//获取新闻——足彩
	try {
		var dtlist = '';
		dtlist = newsTitleControl(dtlist,zcNews,'【足彩】',28,4,6,true);
		$('#zcNewsArea').html(dtlist);
	} catch ( ex ) {}
	//获取新闻——竞彩专家
	try {
		addZjNews('jcZjNewsViewId',jcZhjs, "竞技彩");
		/*var dtlist = '';
		dtlist = newsTitleControl(dtlist,jcZhjs,'【竞彩】',28,6,6,false);
		$('#jcExpertNewsArea').html(dtlist);*/
	} catch ( ex ) {}
	//获取新闻——数字彩专家
	try {
		addZjNews('szZjNewsViewId',zcZhjs, "数字彩");
		/*var dtlist = '';
		dtlist = newsTitleControl(dtlist,szZhjs,'【数字】',28,6,6,false);
		$('#szcExpertNewsArea').html(dtlist);*/
	} catch ( ex ) {}
	//获取新闻——足彩专家
	try {
		addZjNews('zcZjNewsViewId',szZhjs, "足彩");
		/*var dtlist = '';
		dtlist = newsTitleControl(dtlist,zcZhjs,'【足彩】',28,6,6,false);
		$('#zcExpertNewsArea').html(dtlist);*/
	} catch ( ex ) {}
	
	// 竞彩对阵
	try {
		var odds = homeSchedules[0].spfggodds.split(",");
		var hml = '<div class="wei match_a_l"><p>'+homeSchedules[0].hostname+'</p><span>胜 '+odds[0]+'</span></div>'+
            '<div class="wei match_a_c"><p>平局</p><span>平 '+odds[1]+'</span></div>'+
            '<div class="wei match_a r"><p>'+homeSchedules[0].guestname+'</p><span>负 '+odds[2]+'</span></div>'+
            '<div class=" clear"></div>';
		$(hml).appendTo($("#jcRomSchId"));
	} catch ( ex ) {}
}

//人民币金额转大写程序 JavaScript版     格式：3 亿 8509 万 460 元
function numToCny(num){     
	if(num.indexOf('.')){
		return num;
	}else{
		var y = 0, w = 0, u = 0;
		var fn = parseInt(num, 10);
		y = parseInt(fn / 100000000, 10);
		w = parseInt((fn % 100000000) / 10000,10);
		u = (fn % 100000000) % 10000;
    return y + " 亿 " + w + " 万 " + u + " 元";    
  }
}   

function addZjNews(sid, dtList, title) {
	var html = '';
	for ( var i = 0; i < 6; i=i+2 ) {
		html += '<li><div class="new_lists shou_lists"> <span class="gray_s">【'+title+'】</span> <a href="/news.jhtml?conid='+dtList[i].id+'">'+dtList[i].title.substring(0,9)+'</a><a href="/news.jhtml?conid='+dtList[i+1].id+'">'+dtList[i+1].title.substring(0,6)+'</a></div></li>';
	}
	$(html).appendTo($("#"+sid));
}

function newsTitleControl(  dtlist,//dtlist 所有新闻
							json,
							newsType,//newsType 新闻类别
							total,//一行新闻的字符数（28）
							linesAmount,//新闻总行数（9，5）
							titleLen,//新闻标题长度（6）
							isMain
							){
	var divNum = 1;
	var usedLen = 0;
	var totalLen = total;//////////////////
	var restLen = totalLen - usedLen;
	$.each(json,function(index,val){
		if(divNum < linesAmount){
			title = val.title.substring(0,titleLen);/////////////////
			title = title.replace("'","");
			if(usedLen <= 0){
				dtlist += '<div class="new_lists"><span class="red">';
				
				if(title.length <= restLen && usedLen<totalLen){
					dtlist += '<a href="/news.jhtml?conid='+val.id+'" target="_blank">'+title+'</a>';
					usedLen += title.length;
					restLen = totalLen - usedLen;
				}else{
					title = title.substring(0,restLen);
					dtlist += '<a href="/news.jhtml?conid='+val.id+'" target="_blank">'+title+'</a>';
					usedLen += title.length;
					restLen = totalLen - usedLen;
				}
			}else if(usedLen >0 && usedLen <28){
				if(title.length <= restLen && usedLen<totalLen){
					dtlist += '<a href="/news.jhtml?conid='+val.id+'" target="_blank">'+title+'</a>';
					usedLen += title.length;
					restLen = totalLen - usedLen;
				}else{
					title = title.substring(0,restLen);
					dtlist += '<a  href="/news.jhtml?conid='+val.id+'" target="_blank">'+title+'</a>';
					dtlist += '<div style="clear:both;"></div></div>';
					usedLen = 0;
					divNum++;
					restLen = totalLen - usedLen;
				}
			}else if(usedLen >= totalLen){
				
				dtlist += '<div style="clear:both;"></div></div>';
				usedLen = 0;
				restLen = totalLen - usedLen;
				divNum++;
			}
		}
	});
	return dtlist;
}

function chart(val){
	switch (val.licenseId) {
	case 1:
		return 'ps_index.jhtml';//排三
	case 2:
		return 'pw_index.jhtml';//排五
	case 3:
		return 'qx_index.jhtml';//七星彩
	case 4:
		return 'dlt_index.jhtml';//大乐透
	default:
		break;
	}
}

function openDetail(val){
	switch (val.licenseId) {
	case 1:
		return 'ps.jhtml';//排三
	case 2:
		return 'pw.jhtml';//排五
	case 3:
		return 'qx.jhtml';//七星彩
	case 4:
		return 'dlt.jhtml';//大乐透
	default:
		break;
	}
}

/**
 * 构建号码区域HTML
 * @param numArray 开奖号码
 * @param Num 前区号码个数
 * @return
 */
function creatNumberSpaceHtml(numArray){
	var html = '';
	$.each(numArray,function(index,val){
		$.each(val,function(i,j){
			html += '<span class="'+(index > 0?'blue':'red')+'">'+j+'</span>';
		});
		
	});
	
	return html;
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
	var kjBuf = random(5, 35);
	var lis = $("#dltRadomUlId").find("input");
	for ( var j = 0; j < 5; j++ ) {
		$(lis[j]).val(kjBuf[j]);
	}
	kjBuf = random(2, 12);
	for ( var j = 0; j < 2; j++ ) {
		$(lis[5+j]).val(kjBuf[j]);
	}
}

function setSsqRadomNumber() {
	var kjBuf = random(6, 33);
	var lis = $("#ssqRadomUlId").children();
	for ( var j = 0; j < 6; j++ ) {
		$(lis[j]).html(kjBuf[j]);
	}
	kjBuf = random(1, 16);
	for ( var j = 0; j < 1; j++ ) {
		$(lis[6+j]).html(kjBuf[j]);
	}
}

/**
 * 随机号码
 * @return
 */
function setPlsRadomNumber() {
	var lis = $("#plsRadomUlId").find("input");
	for ( var j = 0; j < 3; j++ ) {
		$(lis[j]).val(randomOne(10));
	}
	
}

function set3dRadomNumber() {
	var lis = $("#3dRadomUlId").children();
	for ( var j = 0; j < 3; j++ ) {
		$(lis[j]).html(randomOne(10));
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
