$(document).ready(function () {
	//登录密码
	$("#passSubmit").click(function(){
		//页面常规检查
		var oldPass = $('#oldPass').val();
		var newPass = $('#newPass').val();
		var rePass = $('#rePass').val();
		if(oldPass.length == 0){
			$('#oldPass').focus();
			$('#oldPassState').addClass('errs').removeClass('war');
			$('#oldPassState').parent().toggleClass('cuowu');
			$('#oldPassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#oldPassState').addClass('ok').removeClass('errs');
			$('#oldPassState').parent().removeClass('cuowu');
			$('#oldPassMessage').html('');
		}
		if(newPass.length == 0){
			$('#newPass').focus();
			$('#newPassState').addClass('errs').removeClass('war');
			$('#newPassState').parent().toggleClass('cuowu');
			$('#newPassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#newPassState').addClass('ok').removeClass('errs');
			$('#newPassState').parent().removeClass('cuowu');
			$('#newPassMessage').html('');
		}
		if(rePass.length == 0){
			$('#rePass').focus();
			$('#rePassState').addClass('errs').removeClass('war');
			$('#rePassState').parent().toggleClass('cuowu');
			$('#rePassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#rePassState').addClass('ok').removeClass('errs');
			$('#rePassState').parent().removeClass('cuowu');
			$('#rePassMessage').html('');
		}
		if(newPass != rePass){
			$('#rePass').focus();
			$('#rePassState').addClass('errs').removeClass('war');
			$('#rePassState').parent().toggleClass('cuowu');
			$('#rePassMessage').html('两次录入的新密码不一致');
			return false;
		}else{
			$('#rePassState').addClass('ok').removeClass('errs');
			$('#rePassState').parent().removeClass('cuowu');
			$('#rePassMessage').html('');
		}
		//校验老密码是否正确
		$.ajax({
	    type: "post",
	    url: "/memberCenter/checkOldLoginPass.do",
	    data: "loginPass=" + $('#oldPass').val(),
	    async: false,
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
	    	popupConfirm("温馨提示","系统错误！请重试！");
		  },
	    success: function (data){
		    if ( data == "1" ){
		    	//老登录密码校验成功
					$('#oldPassState').addClass('ok').removeClass('errs');
					$('#oldPassState').parent().removeClass('cuowu');
					$('#oldPassMessage').html('');
					
					//表单提交
					$("#pageForm").remove();
					$("<form id='pageForm' action='/memberCenter/doChangePass.jhtml' method='post'>" 
							+ "<input type='hidden' value='" + ($('#newPass').val())+ "' name='loginPass' />"
							+ "</form>").appendTo("body");
							
					$("#pageForm").submit();
		    } else {
		    	//老登录密码校验错误
		    	$('#oldPass').focus();
					$('#oldPassState').addClass('errs').removeClass('war');
					$('#oldPassState').parent().toggleClass('cuowu');
					$('#oldPassMessage').html('您的旧密码录入错误!!');
					return false;
		    }
	    }
		});
	});
	
	//财务密码
	$("#accountPassSubmit").click(function(){
		//页面常规检查
		var oldPass = $('#oldPass').val();
		var newPass = $('#newPass').val();
		var rePass = $('#rePass').val();
		if(oldPass.length == 0){
			$('#oldPass').focus();
			$('#oldPassState').addClass('errs').removeClass('war');
			$('#oldPassState').parent().toggleClass('cuowu');
			$('#oldPassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#oldPassState').addClass('ok').removeClass('errs');
			$('#oldPassState').parent().removeClass('cuowu');
			$('#oldPassMessage').html('');
		}
		if(newPass.length == 0){
			$('#newPass').focus();
			$('#newPassState').addClass('errs').removeClass('war');
			$('#newPassState').parent().toggleClass('cuowu');
			$('#newPassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#newPassState').addClass('ok').removeClass('errs');
			$('#newPassState').parent().removeClass('cuowu');
			$('#newPassMessage').html('');
		}
		if(rePass.length == 0){
			$('#rePass').focus();
			$('#rePassState').addClass('errs').removeClass('war');
			$('#rePassState').parent().toggleClass('cuowu');
			$('#rePassMessage').html('请录入您的当前登录密码');
			return false;
		}else{
			$('#rePassState').addClass('ok').removeClass('errs');
			$('#rePassState').parent().removeClass('cuowu');
			$('#rePassMessage').html('');
		}
		if(newPass != rePass){
			$('#rePass').focus();
			$('#rePassState').addClass('errs').removeClass('war');
			$('#rePassState').parent().toggleClass('cuowu');
			$('#rePassMessage').html('两次录入的新密码不一致');
			return false;
		}else{
			$('#rePassState').addClass('ok').removeClass('errs');
			$('#rePassState').parent().removeClass('cuowu');
			$('#rePassMessage').html('');
		}
		//校验老密码是否正确
		$.ajax({
	    type: "post",
	    url: "/memberCenter/checkOldAccountPass.do",
	    data: "accountPass=" + $('#oldPass').val(),
	    async: false,
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
	    	popupConfirm("温馨提示","系统错误！请重试！");
		  },
	    success: function (data){
		    if ( data == "1" ){
		    	//老密码校验成功
					$('#oldPassState').addClass('ok').removeClass('errs');
					$('#oldPassState').parent().removeClass('cuowu');
					$('#oldPassMessage').html('');
					
					//表单提交
					$("#pageForm").remove();
					$("<form id='pageForm' action='/memberCenter/doChangeAccountPass.jhtml' method='post'>" 
							+ "<input type='hidden' value='" + ($('#newPass').val())+ "' name='loginPass' />"
							+ "</form>").appendTo("body");
							
					$("#pageForm").submit();
		    } else {
		    	//老密码校验错误
		    	$('#oldPass').focus();
					$('#oldPassState').addClass('errs').removeClass('war');
					$('#oldPassState').parent().toggleClass('cuowu');
					$('#oldPassMessage').html('您的旧密码录入错误!');
					return false;
		    }
	    }
		});
	});
	
	//密保问题
	//密保问题输入框的焦点事件
	var passAnswerDefault = "******";
	$('#passAnswer').val(passAnswerDefault);
	$('#passAnswer').focus(function(){
      $('#passAnswer').val('');
  })
  $('#passAnswer').blur(function(){
  	  if($('#passAnswer').val().length == 0)
      	$('#passAnswer').val(passAnswerDefault);
  })
	$("#passProtectSubmit").click(function(){
		//页面常规检查
		var passQuestion = $("#passQuestion").val();
		//var passQuestionMessage = $("#passQuestion").find("option:selected").text();
		var passAnswer = $("#passAnswer").val();
		
		if(passQuestion == 0){
			$('#passQuestion').focus();
			$('#passQuestionState').addClass('errs').removeClass('war');
			$('#passQuestionState').parent().toggleClass('cuowu');
			$('#passQuestionMessage').html('请选择您的密保问题');
			return false;
		}else{
			$('#passQuestionState').addClass('ok').removeClass('errs');
			$('#passQuestionState').parent().removeClass('cuowu');
			$('#passQuestionMessage').html('');
		}
		if(passAnswer.length == 0 || passAnswer == passAnswerDefault){
			$('#passAnswer').focus();
			$('#passAnswerState').addClass('errs').removeClass('war');
			$('#passAnswerState').parent().toggleClass('cuowu');
			$('#passAnswerMessage').html('请录入您的密保问题');
			return false;
		}else{
			$('#passAnswerState').addClass('ok').removeClass('errs');
			$('#passAnswerState').parent().removeClass('cuowu');
			$('#passAnswerMessage').html('');
		}
		//表单提交
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/doPassProtect.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + passQuestion + "' name='passQuestion' />"
				+ "<input type='hidden' value='" + passAnswer + "' name='passAnswer' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
});