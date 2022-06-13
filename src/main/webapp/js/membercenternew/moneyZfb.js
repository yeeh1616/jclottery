$(document).ready(function () {
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
		$("<form id='pageForm' action='/memberCenterNew/putMoneyZfbSure.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').val() + "' name='payBank' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
	//充值确认提交
	$("#putmoneySureSubmit").click(function(){
		var currMoney = $('#currMoney').val();
		var payBank = $('#payBank').val();
		var msg = '<span style="line-height: 24px;font-size: 12px;">请在新开网银页面完成充值后选择：<br>';
		msg = msg + '<b style="padding:0 3px">充值成功</b>|<font style="padding:0 0 0 3px">您可以选择：</font><a href="/memberCenterNew/putMoneyList.jhtml" style="color:#0f3f94;">查看充值记录</a><br>';
		msg = msg + '<b style="padding:0 3px">充值失败</b>|<font style="padding:0 0 0 3px">建议您选择：</font><a href="/memberCenterNew/putMoney.jhtml" style="color:#0f3f94;">其他充值方式</a>';
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
		$("<form id='pageForm' action='/memberCenterNew/doPutMoneyZFBSure.jhtml' method='post' target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
				+ "</form>").appendTo("body");
			
		$("#pageForm").submit();
	});
});

//充值选择提交
function doCheck(obj){
	var currMoney = $('#currMoney').val();
	var payBank = $(obj).prev().val();

	var msg = '<span style="line-height: 24px;font-size: 12px;">请在新开网银页面完成充值后选择：<br>';
	msg = msg + '<b style="padding:0 3px">充值成功</b>|<font style="padding:0 0 0 3px">您可以选择：</font><a href="/memberCenterNew/putMoneyList.jhtml" style="color:#0f3f94;">查看充值记录</a><br>';
	msg = msg + '<b style="padding:0 3px">充值失败</b>|<font style="padding:0 0 0 3px">建议您选择：</font><a href="/memberCenterNew/putMoney.jhtml" style="color:#0f3f94;">其他充值方式</a>';
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
	$("<form id='pageForm' action='/memberCenterNew/doPutMoneyZFBSure.jhtml' method='post' target='_blank'>" 
			+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
			+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
			+ "</form>").appendTo("body");
		
	$("#pageForm").submit();
}

function moneyChangeBack(){
	var currMoney = $('#currMoney').val();
	var type = $('#type').val();

	$("#pageForm").remove();
	$("<form id='pageForm' action='/memberCenterNew/moneyChangeBack.jhtml' method='post'>" 
			+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
			+ "<input type='hidden' value='" + type + "' name='type' />"
			+ "</form>").appendTo("body");
		
	$("#pageForm").submit();
}
