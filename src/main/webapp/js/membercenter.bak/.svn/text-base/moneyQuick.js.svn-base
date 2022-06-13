$(document).ready(function () {
	/**********************************************************************
	*******************************提款操作*******************************
	**********************************************************************/
  //刷新可取款余额
  $("#reflushMoney").click(function(){
  	$.ajax({
		   type: "post",
		   url: "/common/getAccountUsableGetMoney.json",
		   async: false,
		   dataType: "json",
		   error: function(xMLHttpRequest, textStatus, errorThrown){},
		   success: function (moneyData){
			   var money = formatCurrency(moneyData);
			   $("#getMoneyCurr").html("&nbsp;" + money + "&nbsp;");
		  }
		});
  });
  
  //提款提交
	$("#getMoneySubmit").click(function(){
		//页面常规检查
		var currMoney = $('#currMoney').val();
		if(currMoney.length == 0){
			$('#currMoney').focus();
			$('#currMoneyState').addClass('st').removeClass('qx');
			$('#currMoneyState').html('<img src="/images/war.gif"/>请输入取款金额');
			return false;
		}else{
			$('#currMoneyState').addClass('qx').removeClass('st');
			$('#currMoneyState').html('');
		}
		if(!isFloat(currMoney + '')){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').addClass('st').removeClass('qx');
			$('#currMoneyState').html('<img src="/images/war.gif"/>请输入有效金额');
			return false;
		}else{
			$('#currMoneyState').addClass('qx').removeClass('st');
			$('#currMoneyState').html('');
		}
		if(!checkMoney(currMoney)){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').addClass('st').removeClass('qx');
			$('#currMoneyState').html('<img src="/images/war.gif"/>资金格式错误，请再次确认(资金只能精确到分)');
			return false;
		}else{
			$('#currMoneyState').addClass('qx').removeClass('st');
			$('#currMoneyState').html('');
		}
		if((currMoney * 1) < 0.01){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').addClass('st').removeClass('qx');
			$('#currMoneyState').html('<img src="/images/war.gif"/>请输入有效的取款金额');
			return false;
		}else{
			$('#currMoneyState').addClass('qx').removeClass('st');
			$('#currMoneyState').html('');
		}
		//校验当前余额是否足够取款
		$.ajax({
		   type: "post",
		   url: "/common/getAccountUsableGetMoney.json",
		   async: false,
		   dataType: "json",
		   error: function(xMLHttpRequest, textStatus, errorThrown){
		   	popupConfirm("温馨提示","系统错误！请重试！");
		   },
		   success: function (moneyData){
			  if((moneyData * 1) < (currMoney * 1)){
			  	$('#currMoney').focus();
					$('#currMoneyState').addClass('st').removeClass('qx');
					$('#currMoneyState').html('<img src="/images/war.gif"/>可取额度不足');
					return false;
			  }else{
			  	//表单提交
					$("#pageForm").remove();
					$("<form id='pageForm' action='/memberCenter/doGetMoney.jhtml' method='post'>" 
							+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
							+ "</form>").appendTo("body");
							
					$("#pageForm").submit();
			  } 
		  }
		});
	});
	
	/**********************************************************************
	*******************************充值操作*******************************
	**********************************************************************/
	//充值提交
	$("#putmoneySubmit").click(function(){
		//页面常规检查
		var currMoney = $('#currMoney').val();
		if(currMoney.length == 0){
			$('#currMoney').focus();
			$('#currMoneyState').html('<img src="/images/errs.gif" style="border: 0 none;padding:5px 5px 0 5px"/><font style="color:red">请输入充值金额</font>');
			return false;
		}else{
			$('#currMoneyState').html('');
		}
		if(!isFloat(currMoney + '')){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').html('<img src="/images/errs.gif" style="border: 0 none;padding:5px 5px 0 5px"/><font style="color:red">请输入有效金额</font>');
			return false;
		}else{
			$('#currMoneyState').html('');
		}
		if(!checkMoney(currMoney)){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').addClass('st').removeClass('qx');
			$('#currMoneyState').html('<img src="/images/errs.gif" style="border: 0 none;padding:5px 5px 0 5px"/><font style="color:red">资金格式错误，请再次确认(资金只能精确到分)</font>');
			return false;
		}else{
			$('#currMoneyState').html('');
		}
		if((currMoney * 1) < 0.01){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').html('<img src="/images/errs.gif" style="border: 0 none;padding:5px 5px 0 5px"/><font style="color:red">请输入有效的充值金额</font>');
			return false;
		}else{
			$('#currMoneyState').html('');
		}
		//表单提交
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/putMoneyQuickSure.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').attr("channel") + "' name='channel' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').val() + "' name='payBank' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
	//充值确认提交
	$("#putmoneySureSubmit").click(function(){
		var currMoney = $('#currMoney').val();
		var payBank = $('#payBank').val();
		var payType = $('input:radio[name=payType]:checked').val();
		var channel = $('input:radio[name=channel]:checked').val();
		
		var msg = '<span style="line-height: 24px;font-size: 12px;">请在新开网银页面完成充值后选择：<br>';
		msg = msg + '<b style="padding:0 3px">充值成功</b>|<font style="padding:0 0 0 3px">您可以选择：</font><a href="/memberCenter/putMoneyList.jhtml" style="color:#0f3f94;">查看充值记录</a><br>';
		msg = msg + '<b style="padding:0 3px">充值失败</b>|<font style="padding:0 0 0 3px">建议您选择：</font><a href="/memberCenter/putMoney.jhtml" style="color:#0f3f94;">其他充值方式</a>';
		msg = msg + '</span>';
		$.layer({
	    shade: [0],
	    area: ['500px','180px'],
	    title:'充值确认',
	    dialog: {
	        msg: msg,
	        btns: 0,                    
	        type: 100,
	        btn: ['',''],
	        yes: function(){
	            //layer.msg('', 0, 0);
	        }, no: function(){
	            //layer.msg('', 0, 0);
	        }
	    }
	});
		//表单提交
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/doPutMoneyQuickSure.jhtml' method='post' target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
				+ "<input type='hidden' value='" + payType + "' name='payType' />"
				+ "<input type='hidden' value='" + channel + "' name='channel' />"
				+ "</form>").appendTo("body");
			
		$("#pageForm").submit();
	});
});