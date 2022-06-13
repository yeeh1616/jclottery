$(document).ready(function () {
	//认证信息提交确认
	$("#authenticatSubmit").click(function(){
		//基本校验
		var certiName = $('#certiName').val();//真实姓名
		var certiNumber = $('#certiNumber').val();//身份证号码
		var reCertiNumber = $('#reCertiNumber').val(); //确认号码
		var loginPass = $('#loginPass').val();//登录密码
		//真实姓名校验
		if(certiName.length == 0){
			$('#certiName').focus();
			$("#inforMessage").html("错误提示：真实姓名必填！");
			return false;
		}else if(!/[\u4E00-\u9FA5]{2,4}/.test(certiName)){
			$("#inforMessage").html("错误提示：真实姓名为2—4位汉字！");
			return false;
		}
		$("#inforMessage").html("");
		//身份证号码验证
		if(certiNumber.length == 0){
			$('#certiNumber').focus();
			$("#inforMessage").html("错误提示：身份证号必填！");
			return false;
		}else if(!checkCard(certiNumber)){
			$('#certiNumber').focus();
			$("#inforMessage").html("错误提示：身份证号码有误！");
			return false;
		}
		$("#inforMessage").html("");
		//身份证号码确认
		if(reCertiNumber.length == 0){
			$('#reCertiNumber').focus();
			$("#inforMessage").html("错误提示：确认身份证号码不能为空！");
			return false;
		}else if(certiNumber != reCertiNumber){
			$('#reCertiNumber').focus();
			$("#inforMessage").html("错误提示：两次输入不一致！");
			return false;
		}
		$("#inforMessage").html("");
		if(loginPass.length == 0){
			$('#loginPass').focus();
			$("#inforMessage").html("错误提示：登录密码必填！");
			return false;
		}else{
			$.ajax({
		    type: "post",
		    url: "/memberCenterNew/checkOldLoginPass.do",
		    async: false,
		    data: "loginPass=" + loginPass,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
		    success: function (data){
				if (data != "1") {
					$('#loginPass').focus();
					$("#inforMessage").html("错误提示：登录密码错误！");
					return false;
				}else{
					$("#inforMessage").html("");
					//验证通过表单提交		
					$("#pageForm").remove();
					$("<form id='pageForm' action='/memberCenterNew/doAuthenticat.jhtml' method='post'>" 
					+ "<input type='hidden' value='" + ($('#certiName').val())+ "' name='certiName' />"
					+ "<input type='hidden' value='" + ($('#certiNumber').val())+ "' name='certiNumber' />"
					+ "</form>").appendTo("body");
					

				  	popupConfirm("提示信息", "确认提交？ 实名认证后将无法修改。", true,function(){
				  		$("#pageForm").submit();
				  		//$.unblockUI();//关闭对话框
				  	});
				  
					
					
				}
		    }
			});
		}
		
	});
});