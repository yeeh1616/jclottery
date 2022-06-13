$(document).ready(function () {
	
	$("#personDatumSubmit").click(function(){
	
	var province = $('#province').val();//省份
	var city = $('#city').val(); //城市
	var nickName = $('#nickName').val();//昵称
	var qq = $('#qq').val();//QQ
	var phone = $('#phone').val();//手机
	var email = $('#email').val();//邮箱
	
	//住址
	if(province.length == 0 || province == '—省份—' || city.length == 0 || city == '—城市—'){
		$('#province').focus();
		$('#addressErr').html('请选择住址');
		return false;
	} 
	$('#addressErr').html('');
	//昵称
	if(nickName.length == 0 || nickName == ''){
		$('#nickName').focus();
		$('#nickNameErr').html('请填写昵称');
		return false;
	}else if(!/^[\u4E00-\u9FA5a-zA-Z0-9]{2,6}$/.test(nickName)){
		$('#nickName').focus();
		$('#nickNameErr').html('昵称不符合要求');
		return false;
	}
	$('#nickNameErr').html('');
	
	//QQ
	if(qq.length == 0 || qq == ''){
		$('#qq').focus();
		$('#qqErr').html('请录入您的qq号码');
		return false;
	}else if(!/^[1-9][0-9]{4,10}$/.test(qq)){
		$('#qq').focus();
		$('#qqErr').html('您的QQ号码输入有误');
		return false;
	}
	$('#qqErr').html('');
	
	//手机
	if(phone.length == 0 || phone == ''){
		$('#phone').focus();
		$('#phoneErr').html('请录入您的手机号码');
		return false;
	}else if(!/^1[3|4|5|8|7][0-9]\d{4,8}$/.test(phone)){
		$('#phone').focus();
		$('#phoneErr').html('您的手机号码输入有误');
		return false;
	}
	$('#phoneErr').html('');
	
	//邮箱
	if(email.length == 0 || email == ''){
		$('#email').focus();
		$('#emailErr').html('请录入您的安全邮箱');
		return false;
	}else if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)){
		$('#email').focus();
		$('#emailErr').html('您的邮箱输入有误');
		return false;
	}
	$('#emailErr').html('');
	
	
	$("#pageForm").remove();
	$("<form id='pageForm' action='/memberCenterNew/doPersonDatum.jhtml' method='post'>" 
			+ "<input type='hidden' value='" + ($('input[name="gender"]:checked').val())+ "' name='gender' />"
			+ "<input type='hidden' value='" + ($('#province').val())+ "' name='province' />"
			+ "<input type='hidden' value='" + ($('#city').val())+ "' name='city' />"
			+ "<input type='hidden' value='" + ($('#qq').val())+ "' name='qq' />"
			+ "<input type='hidden' value='" + ($('#phone').val())+ "' name='phone' />"
			+ "<input type='hidden' value='" + ($('#email').val())+ "' name='email' />"
			+ "<input type='hidden' value='" + ($('#nickName').val())+ "' name='nickName' />"
			+ "</form>").appendTo("body");
			
	$("#pageForm").submit();
	});
});