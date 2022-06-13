$(document).ready(function () {
	//登录密码
	$("#passSubmit").click(function(){
		//页面常规检查
		var oldPass = $('#oldPass').val();
		var newPass = $('#newPass').val();
		var rePass = $('#rePass').val();
		
		if(oldPass.length == 0){
			$('#oldPass').focus();
			$('#inforMessage').html("错误提示：请录入您的当前登录密码");
			return false;
		}
		if(newPass.length == 0){
			$('#newPass').focus();
			$('#inforMessage').html('错误提示：新密码不能为空！');
			return false;
		}else if(!/^[\@A-Za-z0-9\!#$%\^\&\*\.\~]{6,16}$/.test(newPass)){
			$('#newPass').focus();
			$('#inforMessage').html('错误提示：密码不符合要求!');
			return false;
		}
		if(rePass.length == 0){
			$('#rePass').focus();
			$('#inforMessage').html('错误提示：确认密码不能为空！');
			return false;
		}else if(newPass != rePass){
			$('#rePass').focus();
			$('#inforMessage').html('错误提示：两次密码输入不一致！');
			return false;
		}
		if(passVerify(oldPass)){
			$("#pageForm").remove();
			$("<form id='pageForm' action='/memberCenterNew/doChangePass.jhtml' method='post'>" 
					+ "<input type='hidden' value='" + rePass + "' name='loginPass' />"
					+ "</form>").appendTo("body");
			$("#pageForm").submit();
			return false;
		}else{
			$('#oldPass').focus();
			$('#inforMessage').html('错误提示：登录密码不正确！');
			return false;
		}
		
	});
	function passVerify(oldPass){
		var flag = false;
		$.ajax({
	    	type: "post",
	    	url: "/memberCenterNew/checkOldLoginPass.do",
	    	data: "loginPass=" + oldPass,
	    	async: false,
	    	dataType: "text",
	    	error: function(xMLHttpRequest, textStatus, errorThrown){
	    		popupConfirm("温馨提示","系统错误！请重试！");
		 	},
	    	success: function (data){
		    	if ( data == "1" ){
					flag = true;
		   		}
	    	}
		});
		return flag;
	}
});