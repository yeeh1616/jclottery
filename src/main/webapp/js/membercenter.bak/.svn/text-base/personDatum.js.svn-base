$(document).ready(function () {
	//表单常规校验
	/*var province = $('#province').val();
	var city = $('#city').val();
	var qq = $('#qq').val();
	var phone = $('#phone').val();
	var email =$('#email').val();
	if(province.length == 0 || province.length == '—省份—' || city.length == 0 || city == '—城市—'){
		$('#province').focus();
		$('#addressState').addClass('errs').removeClass('war');
		$('#addressState').parent().toggleClass('cuowu');
		$('#addressMessage').html('请选择您的居住地');
		return false;
	}else{
		$('#addressState').addClass('ok').removeClass('errs');
		$('#addressState').parent().removeClass('cuowu');
		$('#addressMessage').html('');
	}
	if(qq.length == 0 || (!isFloat(qq + ''))){
		$('#qq').focus();
		$('#qqState').addClass('errs').removeClass('war');
		$('#qqState').parent().toggleClass('cuowu');
		$('#qqMessage').html('请录入您的qq号码，方便我们与您联系');
		return false;
	}else{
		$('#qqState').addClass('ok').removeClass('errs');
		$('#qqState').parent().removeClass('cuowu');
		$('#qqMessage').html('');
	}
	
	if(phone.length == 0 || (!isFloat(phone + ''))){
		$('#phone').focus();
		$('#phoneState').addClass('errs').removeClass('war');
		$('#phoneState').parent().toggleClass('cuowu');
		$('#phoneMessage').html('请录入您的手机号码');
		return false;
	}else{
		$('#phoneState').addClass('ok').removeClass('errs');
		$('#phoneState').parent().removeClass('cuowu');
		$('#phoneMessage').html('');
	}
	
	if(email.length == 0 || (!isEmail(email))){
		$('#email').focus();
		$('#emailState').addClass('errs').removeClass('war');
		$('#emailState').parent().toggleClass('cuowu');
		$('#emailMessage').html('请录入您的安全邮箱');
		return false;
	}else{
		$('#emailState').addClass('ok').removeClass('errs');
		$('#emailState').parent().removeClass('cuowu');
		$('#emailMessage').html('');
	}*/
	//彩民信息提交确认
	$("#personDatumSubmit").click(function(){
		//表单常规校验
	var province = $('#province').val();
	var city = $('#city').val();
	var qq = $('#qq').val();
	var phone = $('#phone').val();
	var email =$('#email').val();
	if(province.length == 0 || province.length == '—省份—' || city.length == 0 || city == '—城市—'){
		$('#province').focus();
		$('#addressState').addClass('errs').removeClass('war');
		$('#addressState').parent().toggleClass('cuowu');
		$('#addressMessage').html('请选择您的居住地');
		return false;
	}else{
		$('#addressState').addClass('ok').removeClass('errs');
		$('#addressState').parent().removeClass('cuowu');
		$('#addressMessage').html('');
	}
	if(qq.length == 0 || (!isFloat(qq + ''))){
		$('#qq').focus();
		$('#qqState').addClass('errs').removeClass('war');
		$('#qqState').parent().toggleClass('cuowu');
		$('#qqMessage').html('请录入您的qq号码，方便我们与您联系');
		return false;
	}else{
		$('#qqState').addClass('ok').removeClass('errs');
		$('#qqState').parent().removeClass('cuowu');
		$('#qqMessage').html('');
	}
	
	if(phone.length == 0 || (!isFloat(phone + ''))){
		$('#phone').focus();
		$('#phoneState').addClass('errs').removeClass('war');
		$('#phoneState').parent().toggleClass('cuowu');
		$('#phoneMessage').html('请录入您的手机号码');
		return false;
	}else{
		$('#phoneState').addClass('ok').removeClass('errs');
		$('#phoneState').parent().removeClass('cuowu');
		$('#phoneMessage').html('');
	}
	
	if(email.length == 0 || (!isEmail(email))){
		$('#email').focus();
		$('#emailState').addClass('errs').removeClass('war');
		$('#emailState').parent().toggleClass('cuowu');
		$('#emailMessage').html('请录入您的安全邮箱');
		return false;
	}else{
		$('#emailState').addClass('ok').removeClass('errs');
		$('#emailState').parent().removeClass('cuowu');
		$('#emailMessage').html('');
	}
	
	$("#pageForm").remove();
	$("<form id='pageForm' action='/memberCenter/doPersonDatum.jhtml' method='post'>" 
			+ "<input type='hidden' value='" + ($('input[name="gender"]:checked').val())+ "' name='gender' />"
			+ "<input type='hidden' value='" + ($('#province').val())+ "' name='province' />"
			+ "<input type='hidden' value='" + ($('#city').val())+ "' name='city' />"
			+ "<input type='hidden' value='" + ($('#qq').val())+ "' name='qq' />"
			+ "<input type='hidden' value='" + ($('#phone').val())+ "' name='phone' />"
			+ "<input type='hidden' value='" + ($('#email').val())+ "' name='email' />"
			+ "</form>").appendTo("body");
			
	$("#pageForm").submit();
	});
});