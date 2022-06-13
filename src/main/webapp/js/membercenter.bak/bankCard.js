$(document).ready(function () {
	//银行卡信息提交确认
	$("#bankCardSubmit").click(function(){
		//基本校验
		  var bankUserName = $('#bankUserName').val();
		  var subBankName = $('#subBankName').val();
		  var bankAccount = $('#bankAccount').val();
		  var bankId = $('#bankId').val();
  
			if(bankUserName.length == 0){
				$('#bankUserName').focus();
				$('#bankUserNameState').addClass('errs').removeClass('war');
				$('#bankUserNameState').parent().toggleClass('cuowu');
				$('#bankUserNameMessage').html("真实名称输入项不能为空,请先<a href='/memberCenter/authenticat.jhtml'>实名验证。</a>");
				return false;
			}else{
				$('#bankUserNameState').addClass('ok').removeClass('errs');
				$('#bankUserNameState').parent().removeClass('cuowu');
				$('#bankUserNameMessage').html('');
			}
			
			if(bankId == null){
				$('#bankId').focus();
				$('#bankIdState').addClass('errs').removeClass('war');
				$('#bankIdState').parent().toggleClass('cuowu');
				$('#bankIdMessage').html('请录入开户行');
				return false;
			}else{
				$('#bankIdState').addClass('ok').removeClass('errs');
				$('#bankIdState').parent().removeClass('cuowu');
				$('#bankIdMessage').html('');
			}
			
			if(subBankName.length == 0){
				$('#subBankName').focus();
				$('#subBankNameState').addClass('errs').removeClass('war');
				$('#subBankNameState').parent().toggleClass('cuowu');
				$('#subBankNameMessage').html('请录入支行详细名称');
				return false;
			}else{
				$('#subBankNameState').addClass('ok').removeClass('errs');
				$('#subBankNameState').parent().removeClass('cuowu');
				$('#subBankNameMessage').html('');
			}
			
			if(bankAccount.length == 0){
				$('#bankAccount').focus();
				$('#bankAccountState').addClass('errs').removeClass('war');
				$('#bankAccountState').parent().toggleClass('cuowu');
				$('#bankAccountMessage').html('请录入银行卡号');
				return false;
			}if(!bankCard(bankAccount)){
				$('#bankAccount').focus();
				$('#bankAccountState').addClass('errs').removeClass('war');
				$('#bankAccountState').parent().toggleClass('cuowu');
				$('#bankAccountMessage').html('银行卡只允许是数字与空格');
				return false;
			}else{
				$('#bankAccountState').addClass('ok').removeClass('errs');
				$('#bankAccountState').parent().removeClass('cuowu');
				$('#bankAccountMessage').html('');
			}
			
			$("#pageForm").remove();
			$("<form id='pageForm' action='/memberCenter/bankCardSure.jhtml' method='post'>" 
					+ "<input type='hidden' value='" + ($('#bankUserName').val())+ "' name='bankUserName' />"
					+ "<input type='hidden' value='" + ($('#bankId').val())+ "' name='bankId' />"
					+ "<input type='hidden' value='" + ($('#bankId').val())+ "' name='bankName' />"
					//+ "<input type='hidden' value='" + ($("#bankId").find("option:selected").text())+ "' name='bankName' />"
					+ "<input type='hidden' value='" + ($('#subBankName').val())+ "' name='subBankName' />"
					+ "<input type='hidden' value='" + ($('#bankAccount').val())+ "' name='bankAccount' />"
					+ "</form>").appendTo("body");
					
			$("#pageForm").submit();
		});
		
		//银行卡信息确认入库
		$("#bankCardSureSubmit").click(function(){
			$("#pageForm").remove();
			$("<form id='pageForm' action='/memberCenter/doBankCard.jhtml' method='post'>" 
					+ "<input type='hidden' value='" + ($('#bankName').val())+ "' name='bankName' />"
					+ "<input type='hidden' value='" + ($('#subBankName').val())+ "' name='subBankName' />"
					+ "<input type='hidden' value='" + ($('#bankAccount').val())+ "' name='bankAccount' />"
					+ "</form>").appendTo("body");
					
			$("#pageForm").submit();
		});
	
	//返回修改
	$("#rModify").click(function(){
		$("#pageForm").remove();
		$("<form id='pageForm' action='/memberCenter/bankCard.jhtml' method='post'>" 
				+ "<input type='hidden' value='" + ($('#bankUserName').val())+ "' name='bankUserName' />"
				+ "<input type='hidden' value='" + ($('#bankId').val())+ "' name='bankId' />"
				+ "<input type='hidden' value='" + ($('#bankName').val())+ "' name='bankName' />"
				+ "<input type='hidden' value='" + ($('#subBankName').val())+ "' name='subBankName' />"
				+ "<input type='hidden' value='" + ($('#bankAccount').val())+ "' name='bankAccount' />"
				+ "</form>").appendTo("body");
			
		$("#pageForm").submit();
	});
	
});