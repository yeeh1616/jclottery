$(document).ready(function () {
	try {
		if ($.cookie("rmbUser") == "true") {
	        $("#bcdl").attr("checked", true);
	        $(".loginusername").val($.cookie("username"));
	        $(".loginuserpasswordp").val($.cookie("password"));
		}
	} catch (ex){}
	 
	$("#loginCloseBtnId").click(function(){
		$.unblockUI();
	});
	
	//登陆框登陆
	$("#loginBtnId").click(function(){
		var name = $("#loginformId").find("input[name=username]").val();
		var pass = $("#loginformId").find("input[name=password]").val();
		if ( name == "" ) {
			$("#loginWrongMsgId").html("请输入用户名！");
			return false;
		}
		if ( pass == "" ) {
			$("#loginWrongMsgId").html("请输入密码！");
			return false;
		}
		$.ajax({
		    type: "post",
		    url: "/common/logon.json",
		    async: false,
		    data: "username=" + name + "&password="+pass,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if (data == "-1") {
					$("#loginWrongMsgId").html("用户名或密码错误！");
					return false;
				} else {
					Save();
					if ( ($("#betMoneyId").length > 0 && $("#betMoneyId").html() != "0") || 
							($("#totalBetNumId").length > 0 && $("#totalBetNumId").html() != "0") ) {
						// 提交表单
						$(".closealert").click();
						$("#lotteryFormBtnId").click();
					} else {
						location.reload();
					}
				}
					
		    }
		});
	});
	// 登陆keyup 事件
	$("#captchaId").keyup(function(){
		$(this).val($(this).val().replace(/\D/g,''));
	});
	
	//header注册
	$("#doReg").click(function(){
		window.open('/common/register/index.jhtml');
	});
	
	logoutEvent();
	
	$("#scbzId").click(function(){
		dddFavorite("我的彩站", location.href);
	});
	
	try{
		var shtml = '';
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
			} else if ( storeLicense[i] > 100 ) {
				freqArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 11 ||
			          storeLicense[i] == 12 ||
			          storeLicense[i] == 13 ) {
			  fcArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 20 ) {
				numberArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 22 || storeLicense[i] == 21 ) {
				bdArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 23 ) {
				numberArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 24 ) {
				numberArray.push(storeLicense[i]);
			} else if ( storeLicense[i] == 25 ) {
				numberArray.push(storeLicense[i]);
			} 
		}
	
		shtml += '<div class="menu jingzu fl">'+
				        '<div class="menu_l fl">'+
				  '<div class="jingzu_img"></div>'+
				  '<p><a href="/lottery/index.jhtml?licenseId=9&p=hhgg">竞足</a></p>'+
				'</div>'+
				'<div class="second_xial fl">';
		if ( guessFootballArray.length > 0 ) {
			shtml += ''+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=hhgg">混合过关</a><i></i>  '+
		 			  '<a class="red" href="/lottery/index.jhtml?licenseId=9&p=hhspfdg">单关足球</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=2x1">2选1</a>'+
				      '<a style="width:67px" href="/lottery/index.jhtml?licenseId=9&p=hhspf">胜平负/让球</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=zjq">进球数</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=bqc">半全场</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=bf">比分</a>'+
				      //'<a href="/cytxhome/eurocup/champion.html" class="red">冠亚军</a>';
				      '<a style="color:#df4c3d" target="_blank" href="/lotteryopen/jc.jhtml">开奖数据</a> ';
		}
		shtml += '</div><div class="clear"></div></div>';
		shtml += '<div class="menu jinglan fl">'+
				    '<div class="menu_l fl">'+
				'<div class="jinglan_img"></div>'+
				'<p><a href="/lottery/index.jhtml?licenseId=10&p=hhgg">竞篮</a></p>'+
				'</div>'+
				'<div class="second_xial fl">';
		if ( guessBasketballArray.length > 0 ) {
			shtml += ''+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=hhgg">混合过关</a>'+
				      '<a class="red" href="/lottery/index.jhtml?licenseId=10&p=hhdg">单关篮球</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=sf">胜负</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=rfsf">让分胜负</a> '+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=sfc">胜分差</a>'+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=dxf">大小分</a> '+
				      '<a style="color:#df4c3d" target="_blank" href="/lotteryopen/jclq.jhtml">开奖数据</a>';
		}
		shtml += '</div><div class="clear"></div></div>';
		shtml += '<div class="menu zuqiu fl"><div class="menu_l fl"><div class="laozu_img"></div>';
		shtml += '<p><a href="/lottery/index.jhtml?licenseId=5">足球</a></p></div>';
		shtml += '<div class="second_xial fl">';
		if ( footballArray.length > 0 ) {
			
			for ( var i = 0; i < footballArray.length; i++ ) {
				if ( footballArray[i] == 5 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=5">胜负彩</a>';
				} else if ( footballArray[i] == 6 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=6">任选九</a>';
				} else if ( footballArray[i] == 7 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=7">半全场</a>';
				} else if ( footballArray[i] == 8 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=8">进球彩</a>';
				}
			}
		}
		shtml += ' <div class="clear"></div></div></div>';
		shtml += '<div class="menu ticai fl"><div class="menu_l fl">';
		shtml += '<div class="tic_img"></div><p><a href="/lottery/index.jhtml?licenseId=4">体彩</a></p>';
		shtml += '</div><div class="second_xial fl">';
		if ( numberArray.length > 0 ) {
			
			for ( var i = 0; i < numberArray.length; i++ ) {
				if ( numberArray[i] == 4 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=4">大乐透</a>';
				} else if ( numberArray[i] == 1 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=1&p=zxpt">排列三</a>';
				} else if ( numberArray[i] == 2 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=2">排列五</a>';
				} else if ( numberArray[i] == 3 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=3">七星彩</a>';
				} else if ( numberArray[i] == 20 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=20">浙江6+1</a>';
				} else if ( numberArray[i] == 23 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=23">浙江20选5</a>';
				} else if ( numberArray[i] == 24 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=24">江苏7位数</a>';
				} else if ( numberArray[i] == 25 ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId=25">福建31选7</a>';
				}
			}
			
		}
		shtml += ' <div class="clear"></div></div></div>';
		shtml += '<div class="menu menu_last fl"><div class="menu_l fl">';
		shtml += '<div class="gao_img"></div><p><a href="#">高频</a></p>';
		shtml += '</div><div class="second_xial fl">';
		try {
			if ( storeFLicense.length > 0 ) {
				for ( var i = 0; i < storeFLicense.length; i++ ) {
					shtml += '<a href="/lottery/index.jhtml?licenseId='+storeFLicense[i].licenseId+'">'+storeFLicense[i].name+'</a>';
				}
			}
		} catch(e){}
		shtml += ' <div class="clear"></div></div></div>';
		if ( bdArray.length > 0 ) {
			shtml += '<div class="menu menu_last fl" style=" border-bottom:none !important;">'+
	          '<div class="menu_l fl">'+
	            '<div class="bd_img"></div>'+
	            '<p><a href="/lottery/index.jhtml?licenseId=21">北单</a></p>'+
	          '</div>'+
	            '<div class="second_xial fl"><a href="/lottery/index.jhtml?licenseId=21">胜平负</a> '+
	            '<a href="/lottery/index.jhtml?licenseId=22">胜负过关</a> '+
	            '<a href="/lottery/index.jhtml?licenseId=21&p=sxds">上下单双</a> '+
	            '<a href="/lottery/index.jhtml?licenseId=21&p=bqc">半全场</a>'+
	            '<a href="/lottery/index.jhtml?licenseId=21&p=bf">比分</a>'+
	            '<a href="/lottery/index.jhtml?licenseId=21&p=zjq">总进球数</a> </div>'+
	          '<div class="clear"></div>'+
	        '</div>';
		}
		if ( fcArray.length > 0 ) {
			shtml += '<div class="menu menu_last fl" style=" border-bottom:none !important;">'+
	          '<div class="menu_l fl">'+
	            '<div class="fc_img"></div>'+
	            '<p><a href="/lottery/index.jhtml?licenseId=11">福彩</a></p>'+
	          '</div>'+
	            '<div class="second_xial fl"><a href="/lottery/index.jhtml?licenseId=11">双色球</a> '+
	            '<a href="/lottery/index.jhtml?licenseId=12">3D</a> '+
	            '<a href="/lottery/index.jhtml?licenseId=13">七乐彩</a> '+
	            '</div>'+
	          '<div class="clear"></div>'+
	        '</div>';
		}
		shtml += '<div class="clear"></div>';
		$(shtml).appendTo($("#commLicenAreaId"));
	}catch(ex){}
	
	
});


function dddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            layer.alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加!",0);
        }
    }
}

function logoutEvent() {
	//header退出登录
	$("#doLoginOut").click(function(){
		$.ajax({
	    type: "post",
	    url: "/common/logout.do",
	    //data: "",
	    async: false,
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
	    	layer.alert("安全退出失败！请重试！",0);
		  },
	    success: function (data){
		    if ( data == "1" ){
		    	location.href = "/";
		    } else {
		    	layer.alert("安全退出失败！请重试！",0);
		    }
	    }
		});
	});
}

//填充可用余额
function refreshUsableMoney(){
	$.ajax({
	   type: "post",
	   url: "/common/getAccountUsable.json",
	   async: false,
	   dataType: "json",
	   error: function(xMLHttpRequest, textStatus, errorThrown){},
	   success: function (moneyData){
		   try {
			   if ( moneyData == "-1" ) {
				   moneyData = "0";
			   }
			   var money = formatCurrency(moneyData);
			   $("font[name=currMoney]").html("&nbsp;" + money + "&nbsp;");
			   $("input[name=hiddenCurrMoney]").val("&nbsp;" + money + "&nbsp;");
		   } catch(e){}
	  }
	});
}

//营业厅彩民的购物车
function getTemporaryOrder(){
	$.ajax({
	   type: "post",
	   url: "/common/getTemporaryOrder.json",
	   async: false,
	   dataType: "text",
	   error: function(xMLHttpRequest, textStatus, errorThrown){
	   },
	   success: function (sdata){
	   	//alert(sdata);
	   	var ds = sdata.split(",");
		  $("#myCart").html("我的购彩车("+ds[0]+"单/" + ds[1] + "元)");
		  try{
		  	var button2 = $("#button2");
		  	if(button2 != null && button2.length > 0 && (parseInt(ds[0]) == 0)){
		  		$(button2).hide();
		  	}
		  }catch(se){}
	  }
	});
}

//隐藏余额与显示余额
$("#hiddenMoney").click(function(){
  var hidd_ = '*****';
	var moneyValue = $("font[name=currMoney]").html();
	if(moneyValue.indexOf(hidd_)>=0){
		$("font[name=currMoney]").html($("input[name=hiddenCurrMoney]").val());
		$("#hiddenMoney").html('隐藏余额');
	}
	else{
		$("font[name=currMoney]").html("&nbsp;" + hidd_ + "&nbsp;");
		$("#hiddenMoney").html('显示余额');
	}
});

//记住用户名密码
function Save() {
    if ($("#bcdl").attr("checked")) {
        var str_username = $(".loginusername").val();
        var str_password = $(".loginuserpasswordp").val();
        $.cookie("rmbUser", "true", { expires: 70 }); //存储一个带7天期限的cookie
        $.cookie("username", str_username, { expires: 70 });
        $.cookie("password", str_password, { expires: 70 });
    }
    else {
        $.cookie("rmbUser", "false", { expire: -1 });
        $.cookie("username", "", { expires: -1 });
        $.cookie("password", "", { expires: -1 });
    }
};

//填充填充站内信总条数
function refreshUsableMessage(){
	$.ajax({
	   type: "post",
	   url: "/common/getMessageUsable.json",
	   async: false,
	   dataType: "json",
	   error: function(xMLHttpRequest, textStatus, errorThrown){},
	   success: function (messageData){
		   try {
			   $("font[name=currMessage]").html(messageData);
			   $("input[name=hiddenCurrMessage]").val(messageData);
		   } catch(e){}
	  }
	});
}