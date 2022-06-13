//银行卡展现
function demo1(){
 	$('#bdyhk').show();
 	$("#tjyhk").css("display", "none");  
 	$('#tj_yhk').show();
}

//添加银行卡
function submitInfoYHK(){
		var accountName = $('#khyh').val();//开户银行
		var reserved1 = $('#zhmc').val();//支行名称
		var accountCard = $('#yhkh').val();//银行卡号
		//校验开户银行
		if(accountName.length == 0){
			$('#khyh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入开户银行！");
			return false;
		}else if(!/^[\u4E00-\u9FA5]{2,8}$/.test(accountName)){
			$('#khyh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;
		}
		$('#yhkErr').html("&nbsp; ");
		//校验支行名称
		if(reserved1.length == 0){
			$('#zhmc').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入支行名称！");
			return false;
		}else if(!/^[\u4E00-\u9FA5]{2,16}$/.test(accountName)){
			$('#zhmc').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;
		}
		$('#yhkErr').html("&nbsp; ");
		//校验银行卡号
		if(accountCard.length == 0){
			$('#yhkh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入银行卡号！");
			return false;		
		}else if(!/^\d{16}|\d{19}$/.test(accountCard)){
			$('#yhkh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;	
		}
		$('#yhkErr').html("&nbsp; ");
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/addGetMoney.jhtml' method='post'>" 
			+ "<input type='hidden' value='" + accountName + "' name='accountName' />"
			+ "<input type='hidden' value='" + reserved1 + "' name='reserved1' />"
			+ "<input type='hidden' value='" + accountCard + "' name='accountCard' />"
			+ "<input type='hidden' value='2' name='accountState' />"
			+ "<input type='hidden' value='1' name='accountType' />"
			+ "</form>").appendTo("body");
		$("#pageForm").submit();

}
//修改银行卡 展现
function demoYHK(){
	$('#ybdyhk').css("display", "none");
	$('#bdyhk').show();
	$('#xg_yhk').css("display", "none");
	$('#bc_yhk').show();
}

//放弃修改，隐藏元素
function cancelYHK(){
	$('#ybdyhk').css("display", "");
	$('#bdyhk').hide();
	$('#xg_yhk').css("display", "");
	$('#bc_yhk').hide();
	$('#yhkErr').html("&nbsp; ");
}
//修改银行卡 提交
function updateYHK(){
		var accountName = $('#khyh').val();//开户银行
		var reserved1 = $('#zhmc').val();//支行名称
		var accountCard = $('#yhkh').val();//银行卡号
		//校验开户银行
		if(accountName.length == 0){
			$('#khyh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入开户银行！");
			return false;
		}else if(!/^[\u4E00-\u9FA5]{2,8}$/.test(accountName)){
			$('#khyh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;
		}
		$('#yhkErr').html("&nbsp; ");
		//校验支行名称
		if(reserved1.length == 0){
			$('#zhmc').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入支行名称！");
			return false;
		}else if(!/^[\u4E00-\u9FA5]{2,16}$/.test(accountName)){
			$('#zhmc').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;
		}
		$('#yhkErr').html("&nbsp; ");
		//校验银行卡号
		if(accountCard.length == 0){
			$('#yhkh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>请输入银行卡号！");
			return false;		
		}/*else if(!/^(\d{16}|\d{19})$/.test(accountCard)){
			$('#yhkh').focus();
			$('#yhkErr').html("<b class=\"ico ico-warn-sml\"></b>您的输入有误！");
			return false;	
		}*/
		$('#yhkErr').html("&nbsp; ");
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenterNew/updGetMoney.jhtml' method='post'>" 
			+ "<input type='hidden' value='" + accountName + "' name='accountName' />"
			+ "<input type='hidden' value='" + reserved1 + "' name='reserved1' />"
			+ "<input type='hidden' value='" + accountCard + "' name='accountCard' />"
			+ "<input type='hidden' value='" + yhkState + "' name='accountState' />"
			+ "<input type='hidden' value='1' name='accountType' />"
			+ "</form>").appendTo("body");
		$("#pageForm").submit();
}