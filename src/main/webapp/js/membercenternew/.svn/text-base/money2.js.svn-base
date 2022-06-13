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
		if((currMoney * 1) < 1){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#currMoneyState').html('<img src="/images/errs.gif" style="border: 0 none;padding:5px 5px 0 5px"/><font style="color:red">请输入有效的充值金额</font>');
			return false;
		}else{
			$('#currMoneyState').html('');
		}
		//表单提交
		//alert($('input[name="payBank"]:checked').attr("channel"));
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/putMoneySure.jhtml' method='post' target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').attr("channel") + "' name='channel' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').val() + "' name='payBank' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').attr("payType") + "' name='payType' />"
				+ "<input type='hidden' value='" + $('input[name="payBank"]:checked').attr("values") + "' name='values' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
	//网银充值确认提交
	$("#putmoneySureSubmit").click(function(){
		var currMoney = $('#currMoney').val();
		var payBank = $('#payBank').val();
		/*var msg = '<span style="line-height: 24px;font-size: 12px;">请在新开网银页面完成充值后选择：<br>';
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
	});*/
		//表单提交
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/doPutMoneySure.jhtml' method='post'  target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
				+ "</form>").appendTo("body");
			
		$("#pageForm").submit();
	});
	
	
	//快捷充值确认提交
	$("#putmoneyKJSureSubmit").click(function(){
		  var beNext = false;
		  var agreementNo = $('#agreementNo').val();
		  if (typeof(agreementNo) == "undefined"){
		  	beNext = getVaCodeClick();
		  }else{
		  	beNext = getVaCode2Click();
		  }
		  
		  /*
		  try{
		  	beNext = getVaCodeClick();
		  }catch(se){}
		  	
		  try{
		  	beNext = getVaCode2Click();
		  }catch(se){}
		  */
		  //alert(beNext);
		  if(beNext){
		    var validateCode = $('#validateCode').val(); 
				if(validateCode.length == 0){
					$('#validateCode').focus();
					$('#validateCodeMessage').html('<img src="/images/war.gif"/>请输入手机接收的银行验证码');	
					return false;
				}else{
				  $('#validateCodeMessage').html('');	
				}
				/*var msg = '<span style="line-height: 24px;font-size: 12px;">请在新开网银页面完成充值后选择：<br>';
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
				});*/
				//表单提交
				$("#pageForm").remove();
				$("<form id='pageForm' action='/memberCenterNew/doPutMoneyKjSure.jhtml' method='post'  target='_blank'>" 
						/*+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
						+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
						+ "<input type='hidden' value='" + bankCardNo + "' name='bankCardNo' />"
						+ "<input type='hidden' value='" + realName + "' name='realName' />"
						+ "<input type='hidden' value='" + idNo + "' name='idNo' />"
						+ "<input type='hidden' value='" + mobileNo + "' name='mobileNo' />"
						+ "<input type='hidden' value='" + cardMonth + "/" + cardYear + "' name='validThru' />"
						+ "<input type='hidden' value='" + cvv2 + "' name='cvv2' />"
						+ "<input type='hidden' value='" + payType + "' name='payType' />"*/
						+ "<input type='hidden' value='" + validateCode + "' name='validateCode' />"
						+ "</form>").appendTo("body");
					
				$("#pageForm").submit();
		  }
	});
	
	/*$("input:radio[name=payType]").click(function(){
		if($(this).attr("id")=='payTypeDR'){
			$("#cardMonthID").hide();
			$("#cvv2ID").hide();
		}else{
			$("#cardMonthID").show();
			$("#cvv2ID").show();
		}
	});*/
	
	$("#agreementNoContent").change(function(){
		var agreementNo = $(this).val();
		$("#agreementNo").val(agreementNo);
	});
	
	//获取验证码
	 $("#getVaCode").click(function(){
	   getVaCodeClick();     
	 });
	 
	 $("#getVaCode2").click(function(){
	   getVaCode2Click();      
	 });
	 
	 //确认支付页的返回
	 $("#currBack").click(function(){
	 	var currMoney = $('#currMoney').val();//金额
	  $("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/putMoneySFTZ.jhtml' method='post'  target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	 });
	 
	 //同行新卡片
	 $("#newBank").click(function(){
	 	var currMoney = $('#newBankcurrMoney').val();
	 	var payBank = $('#newBankpayBank').val();
	 	var payType = $('#newBankpayType').val();
	 	var payTypeName = $('#newBankpayTypeName').val();
	  $("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/putMoneySureKjNewK.jhtml' method='post'  target='_blank'>" 
				+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
				+ "<input type='hidden' value='" + payBank + "' name='payBank' />"
				+ "<input type='hidden' value='" + payType + "' name='payType' />"
				+ "<input type='hidden' value='" + payTypeName + "' name='values' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	 });
	 
	 //列表切换
	 $("#bankCardNo").change(function(){
		$("#realName").val($('#bankCardNo').find('option:selected').attr('realName'));
		$("#idNo").val($('#bankCardNo').find('option:selected').attr('idNo'));
		$("#mobileNo").val($('#bankCardNo').find('option:selected').attr('mobileNo'));
	});
});

//$("#getVaCode").click(function(){
	function getVaCodeClick(){
		var currMoney = $('#currMoney').val();
		var payBank = $('#payBank').val();
		var payType = $('#payType').val();
		
		var bankCardNo = $('#bankCardNo').val();
		var realName = $('#realName').val();
		var idNo = $('#idNo').val();
		var mobileNo = $('#mobileNo').val();
		
		var cardMonth = $('#cardMonth').val();
		var cardYear = $('#cardYear').val();
		var cvv2 = $('#cvv2').val();
		
		//表单基本校验
		if(bankCardNo.length == 0){
			$('#bankCardNo').focus();
			$('#bankCardNoMessage').html('<img src="/images/war.gif"/>请输入银行卡号');	
			return false;
		}else{
		  $('#bankCardNoMessage').html('');	
		}
		
		if(realName.length == 0){
			$('#realName').focus();
			$('#realNameMessage').html('<img src="/images/war.gif"/>请输入银行卡所有人姓名');	
			return false;
		}else{
		  $('#realNameMessage').html('');	
		}
		
		if(idNo.length == 0){
			$('#idNo').focus();
			$('#idNoMessage').html('<img src="/images/war.gif"/>请输入开卡时的证件号码');	
			return false;
		}else{
		  $('#idNoMessage').html('');	
		}
		
		if(mobileNo.length == 0){
			$('#mobileNo').focus();
			$('#mobileNoMessage').html('<img src="/images/war.gif"/>请输入银行存留手机号');	
			return false;
		}else{
		  $('#mobileNoMessage').html('');	
		}
		
		if(payType == 'CR'){//信用卡校验
			if(cardMonth.length == '00'){
				$('#cardMonth').focus();
				$('#ymMessage').html('<img src="/images/war.gif"/>请选择信用卡有效期‘月’');	
				return false;
			}else{
			  $('#ymMessage').html('');	
			}
			
			if(cardYear.length == '00'){
				$('#cardYear').focus();
				$('#ymMessage').html('<img src="/images/war.gif"/>请选择信用卡有效期’年‘');	
				return false;
			}else{
			  $('#ymMessage').html('');	
			}
			
			if(cvv2.length < 3){
				$('#cvv2').focus();
				$('#cvv2Message').html('<img src="/images/war.gif"/>请输入信用卡后三位');	
				return false;
			}else{
			  $('#cvv2Message').html('');	
			}
		}
    //加载中效果
		layer.msg('加载中', {icon: 16});
		var beNext = false;
		var backMessage = "";
		$.ajax({
		   type: "post",
		   url: "/memberCenterNew/checkPay.json",
		   async: false,
		   data: "currMoney=" + currMoney + "&payBank="+ payBank + "&bankCardNo="+ bankCardNo + "&realName="+ realName + "&idNo="+ idNo + "&mobileNo="+ mobileNo + "&validThru="+ (cardMonth + "/" + cardYear) + "&cvv2=" + cvv2 + "&payType="+ payType + "&beNewCard=true",
		   dataType: "text",
		   error: function(xMLHttpRequest, textStatus, errorThrown){
		   	popupConfirm("温馨提示","系统错误！请重试！");
		   },
		   success: function (bData){
			   if(bData == 'OK'){
			   		beNext = true;
			   }else{
			   	backMessage = bData;
			   }
		  }
		});
		//关闭加载效果
		layer.closeAll('loading');
		if(beNext){
				//设置所有的校验项不可变化
				//alert(275);
				//$("#payTypeDR").attr("disabled",true);
				//$("#payTypeCR").attr("disabled",true);
				$("#bankCardNo").attr("disabled", "true");
				$("#realName").attr("disabled", "true");
				$("#idNo").attr("disabled", "true");
				$("#mobileNo").attr("disabled", "true");
				try{
					$("#cardYear").attr("disabled","true");
					$("#cardMonth").attr("disabled","true");
					$("#cvv2").attr("disabled", "true"); 
				}catch(se){}
					
				$('#validateCode').focus();
		    return true;
		}else{
			$.layer({
		    shade: [0],
		    area: ['500px','100px'],
		    title:'订单校验错误信息提示',
		    dialog: {
		        msg: backMessage,
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
			return false;
		}
	}
	//});
	
	//已经支付过的银行卡
	//$("#getVaCode2").click(function(){
	function getVaCode2Click(){
		var currMoney = $('#currMoney').val();
		var payBank = "";
		var payType = "";
		
		var bankCardNo = "";
		
		var cardMonth = "";
		var cardYear = "";
		var cvv2 = "";
		var validThru = "";//cardMonth + "/" + cardYear

		var realName = $('#realName').val();
		var idNo = $('#idNo').val();
		var mobileNo = $('#mobileNo').val();
		var agreementNo = $('#agreementNo').val();
		
		//表单基本校验
		
		if(realName.length == 0){
			$('#realName').focus();
			$('#realNameMessage').html('<img src="/images/war.gif"/>请输入银行卡所有人姓名');	
			return false;
		}else{
		  $('#realNameMessage').html('');	
		}
		
		if(idNo.length == 0){
			$('#idNo').focus();
			$('#idNoMessage').html('<img src="/images/war.gif"/>请输入开卡时的证件号码');	
			return false;
		}else{
		  $('#idNoMessage').html('');	
		}
		
		if(mobileNo.length == 0){
			$('#mobileNo').focus();
			$('#mobileNoMessage').html('<img src="/images/war.gif"/>请输入银行存留手机号');	
			return false;
		}else{
		  $('#mobileNoMessage').html('');	
		}
		//加载中效果
		layer.msg('加载中', {icon: 16});
		var beNext = false;
		var backMessage = "";
		$.ajax({
		   type: "post",
		   url: "/memberCenterNew/checkPay.json",
		   async: false,
		   data: "currMoney=" + currMoney + "&payBank="+ payBank + "&bankCardNo="+ bankCardNo + "&realName="+ realName + "&idNo="+ idNo + "&mobileNo="+ mobileNo + "&validThru=" + validThru + "&cvv2=" + cvv2 + "&payType="+ payType + "&agreementNo=" + agreementNo + "&beNewCard=true",
		   dataType: "text",
		   error: function(xMLHttpRequest, textStatus, errorThrown){
		   	popupConfirm("温馨提示","系统错误！请重试！");
		   },
		   success: function (bData){
			   if(bData == 'OK'){
			   		beNext = true;
			   }else{
			   	backMessage = bData;
			   
			   }
		  }
		});
		//关闭加载效果
		layer.closeAll('loading');
		if(beNext){
			  $("#agreementNoContent").attr("disabled", "true");
				$("#bankCardNo").attr("disabled", "true");
				$("#realName").attr("disabled", "true");
				$("#idNo").attr("disabled", "true");
				$("#mobileNo").attr("disabled", "true");
				
				$('#validateCode').focus();
				try{
					//$("#cardYear").attr("disabled","true");
					//$("#cardMonth").attr("disabled","true");
					//$("#cvv2").attr("disabled", "true"); 
				}catch(se){}
		 return true;
		}else{
			$.layer({
		    shade: [0],
		    area: ['500px','100px'],
		    title:'订单校验错误信息提示',
		    dialog: {
		        msg: backMessage,
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
			return false;
		}
	}
	//});