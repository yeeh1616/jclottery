$(document).ready(function () {
	
	//查看团队彩民详情
	$("a[name=memberDetail]").bind("click",function(){
		var id = $(this).attr("id").substring(3);

		//验证通过表单提交		
		$("#memberDetailForm").remove(); 
		$("<form id='memberDetailForm' action='/memberCenterNew/myTeamMemberDetail.jhtml' method='post'>" 
		+ "<input type='hidden' value='" + id + "' name='id' />"
		+ "</form>").appendTo("body");
		$("#memberDetailForm").submit();
	});
	
	
	//查看购彩订单详情
	$("a[name=queryOrderDetails]").bind("click",function(){

		var orderId = $(this).attr("id").substring(3);
		var licenseId = $(this).parent().find("input[name=licenseId]").val();

		//验证通过表单提交		
		$("#orderDetailForm").remove(); 
		
		$("<form id='orderDetailForm' action='/memberCenterNew/myTeamOrderDetail.jhtml' method='post'>" 
		+ "<input type='hidden' value='" + orderId + "' name='orderId' />"
		+ "<input type='hidden' value='" + licenseId+ "' name='licenseId' />"
		+ "</form>").appendTo("body");
		
		$("#orderDetailForm").submit();

	});
	
	//查看追号详情
	$("a[name=queryChaseDetails]").bind("click",function(){

		var orderId = $(this).attr("id").substring(3);
		var licenseId = $(this).parent().find("input[name=licenseId]").val();

		//验证通过表单提交		
		$("#orderDetailForm").remove(); 
		
		$("<form id='orderDetailForm' action='/memberCenterNew/myTeamZhfax.jhtml' method='post'>" 
		+ "<input type='hidden' value='" + orderId + "' name='orderId' />"
		+ "<input type='hidden' value='" + licenseId+ "' name='licenseId' />"
		+ "</form>").appendTo("body");
		
		$("#orderDetailForm").submit();

	});
	
	
	//查看合买订单详情
	$("a[name=queryMergerDetails]").bind("click",function(){

		var mergerOrderId = $(this).attr("id").substring(3);
		var licenseId = $(this).parent().find("input[name=licenseId]").val();

		//验证通过表单提交		
		$("#orderDetailForm").remove(); 
		
		$("<form id='orderDetailForm' action='/memberCenterNew/myTeamMergerDetails.jhtml' method='post'>" 
		+ "<input type='hidden' value='" + mergerOrderId + "' name='mergerOrderId' />"
		+ "<input type='hidden' value='" + licenseId+ "' name='licenseId' />"
		+ "</form>").appendTo("body");
		
		$("#orderDetailForm").submit();

	});
	
	

});