$(document).ready(function () {
	//认证信息提交确认
	$("#authenticatSubmit").click(function(){
		//基本校验
		var certiName = $('#certiName').val();
		var certiNumber = $('#certiNumber').val();
		var reCertiNumber = $('#reCertiNumber').val();
		var phone = $('#phone').val();
		if(certiName.length == 0){
			$('#certiName').focus();
			$('#certiNameState').addClass('errs').removeClass('war');
			$('#certiNameState').parent().toggleClass('cuowu');
			$('#certiNameMessage').html('请输入真实名称');
			return false;
		}else{
			$('#certiNameState').addClass('ok').removeClass('errs');
			$('#certiNameState').parent().removeClass('cuowu');
			$('#certiNameMessage').html('');
		}
		if(certiNumber.length == 0){
			$('#certiNumber').focus();
			$('#certiNumberState').addClass('errs').removeClass('war');
			$('#certiNumberState').parent().toggleClass('cuowu');
			$('#certiNumberMessage').html('请输入身份证号码');
			return false;
		}else if(!checkCard(certiNumber)){
			$('#certiNumber').focus();
			$('#certiNumberState').addClass('errs').removeClass('war');
			$('#certiNumberState').parent().toggleClass('cuowu');
			$('#certiNumberMessage').html('身份证号码错误');
			return false;
		}else{
			$('#certiNumberState').addClass('ok').removeClass('errs');
			$('#certiNumberState').parent().removeClass('cuowu');
			$('#certiNumberMessage').html('');
		}
		if(reCertiNumber.length == 0){
			$('#reCertiNumber').focus();
			$('#reCertiNumberState').addClass('errs').removeClass('war');
			$('#reCertiNumberState').parent().toggleClass('cuowu');
			$('#reCertiNumberMessage').html('请确认证件号码');
			return false;
		}else{
			$('#reCertiNumberState').addClass('ok').removeClass('errs');
			$('#reCertiNumberState').parent().removeClass('cuowu');
			$('#reCertiNumberMessage').html('');
		}
		if(certiNumber != reCertiNumber){
			$('#reCertiNumber').focus();
			$('#reCertiNumberState').addClass('errs').removeClass('war');
			$('#reCertiNumberState').parent().toggleClass('cuowu');
			$('#reCertiNumberMessage').html('两次输入的证件号码不一致，请重新输入');
			return false;
		}else{
			$('#reCertiNumberState').addClass('ok').removeClass('errs');
			$('#reCertiNumberState').parent().removeClass('cuowu');
			$('#reCertiNumberMessage').html('');
		}
		if(phone.length == 0){
			$('#phone').focus();
			$('#phoneState').addClass('errs').removeClass('war');
			$('#phoneState').parent().toggleClass('cuowu');
			$('#phoneMessage').html('请输入手机号码');
			return false;
		}else{
			$('#phoneState').addClass('ok').removeClass('errs');
			$('#phoneState').parent().removeClass('cuowu');
			$('#phoneMessage').html('');
		}
		
			
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/authenticatSure.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + ($('#certiName').val())+ "' name='certiName' />"
				+ "<input type='hidden' value='" + ($('#certiNumber').val())+ "' name='certiNumber' />"
				+ "<input type='hidden' value='" + ($('#phone').val())+ "' name='phone' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
	//认证信息确认入库
	$("#authenticatSureSubmit").click(function(){
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/doAuthenticat.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + ($('#certiName').val())+ "' name='certiName' />"
				+ "<input type='hidden' value='" + ($('#certiNumber').val())+ "' name='certiNumber' />"
				+ "<input type='hidden' value='" + ($('#phone').val())+ "' name='phone' />"
				+ "</form>").appendTo("body");
				
		$("#pageForm").submit();
	});
	
	//返回修改
	$("#rModify").click(function(){
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/authenticat.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + ($('#certiName').val())+ "' name='certiName' />"
				+ "<input type='hidden' value='" + ($('#certiNumber').val())+ "' name='certiNumber' />"
				+ "<input type='hidden' value='" + ($('#phone').val())+ "' name='phone' />"
				+ "</form>").appendTo("body");
			
		$("#pageForm").submit();
	});
	
});