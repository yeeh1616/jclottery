
$(document).ready(function (){
	$("input[name='mergerAppoint']").click(function(){
		var id = $(this).attr("orderId");//订单号
		var userid = $(this).attr("userid");//发起人ID
    	var licenseId = $(this).attr("licenseId");//彩种

    	$.ajax({
		    type: "post",
		    url: "/common/getAccountUsable.json",
		    async: false,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == '-1' ) {
					$(".openlogin").click();
				}else{					
					$.ajax({
						type : "POST",
						url : "/merger/isExist.jhtml",
						data:{"userid":userid,"licenseId":licenseId,"id":id},
						async:false, 
						error : function(xMLHttpRequest, textStatus, errorThrown){
							layer.msg("错误！");
						},
						success : function(data) {
							if(data == -2){
								layer.msg("不可重复定制!");
							}else if(data == -3){
								layer.msg("您是发起人，不能定制!");
						    }else if(data == 0){
						    	$.layer({
								    type: 2,
								    maxmin: true,
								    shadeClose: true,
								    title: "定制跟单",
								    fix : false,
								    shade: [0.1,'#000'],
								    offset: ['50px',''],
								    area: ['680px', '350px'],
								    iframe: {src: "/merger/customPage.jhtml?userid="+userid+"&licenseId="+licenseId+"&id="+id+"&appointed="+0},
								    end: function(index){
								    	layer.close(index);
								    }
								}); 
							}else{
								layer.msg("错误!");
							}
						}
					});
				}
		    }
		});
	});
	
	var initIssue = $("input[name=issue][type=hidden]").val();
	if ( initIssue != '' ) {
		$("#selectIssueId").val(initIssue);
	}
	
	$("#selectIssueId").change(function(){
		var licenseId = $("input[name=licenseId]").val();
		var succFlag = $("input[name=succFlag]").val();
		var issue = $(this).val();
		location.href = '/pass/index.jhtml?licenseId='+licenseId+"&succFlag="+succFlag+"&issue="+issue;
	});
	
	$("#selDateId").change(function(){
		var licenseId = $("input[name=licenseId]").val();
		var succFlag = $("input[name=succFlag]").val();
		var issue = $(this).val();
		location.href = '/pass/index.jhtml?licenseId='+licenseId+"&succFlag="+succFlag+"&selDate="+issue;
	});
	var initDate = $("input[name=selDate][type=hidden]").val();
	if ( initDate != '' ) {
		$("#selDateId").val(initDate);
	}
	
	$("input[name=allPassName]").click(function(){
		var licenseId = $("input[name=licenseId]").val();
		var issue = $("#selectIssueId").val();
		var o = $(this).val();
		if ( o == "1" ) { // 查看全部
			location.href = '/pass/index.jhtml?licenseId='+licenseId+"&succFlag=1&issue="+issue;
		} else if (o == "3") {
			location.href = '/pass/index.jhtml?licenseId='+licenseId+"&succFlag=2&issue="+issue;
		} else if ( o == "2" ) {
			var uid = $(this).attr("mid");
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						$(".openlogin").click();
					}else{	
						location.href = '/pass/index.jhtml?licenseId='+licenseId+"&issue="+issue+"&uuid="+uid;
					}
				}
			});
		}
	});
})