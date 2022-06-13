$(document).ready(function () {
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
			   $("#getMoneyCurr").html(money);
		  }
		});
  });
  
  //提款提交
	$("#getMoneySubmit").click(function(){
		//页面常规检查
		var currMoney = $('#currMoney').val();
		var typeNameV = $('#typeName').attr('typeNameV');
		var accountMessageV = $('#accountMessage').attr('accountMessageV');
		//alert(typeNameV + ";" + accountMessageV);
		if(currMoney.length == 0){
			$('#currMoney').focus();
			$('#inforMessage').html('请输入取款金额！');
			return false;
		}
		if(!isFloat(currMoney + '')){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#inforMessage').html('请输入有效金额！');
			return false;
		}
		if(!checkMoney(currMoney)){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#inforMessage').html('资金格式错误，请再次确认(资金只能精确到分)');
			return false;
		}
		if((currMoney * 1) < 0.01){
			$('#currMoney').focus();
			$('#currMoney').val('');
			$('#inforMessage').html('请输入有效的取款金额');
			return false;
		}
//		if((currMoney * 1) < 100){
//			$('#currMoney').focus();
//			$('#currMoney').val('');
//			$('#inforMessage').html('最低取款金额为100元');
//			return false;
//		}
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
					$('#inforMessage').html('可取额度不足！');
					return false;
			  }else{
			  	//表单提交
					$("#pageForm").remove();
					$("<form id='pageForm' action='/memberCenterNew/doGetMoney.jhtml' method='post'>" 
							+ "<input type='hidden' value='" + currMoney + "' name='currMoney' />"
							+ "<input type='hidden' value='" + typeNameV + "' name='typeNameV' />"
							+ "<input type='hidden' value='" + accountMessageV + "' name='accountMessageV' />"
							+ "</form>").appendTo("body");
							
					$("#pageForm").submit();
			  } 
		  }
		});
	});
});