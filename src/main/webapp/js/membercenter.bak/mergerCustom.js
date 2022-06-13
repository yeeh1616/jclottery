$(document).ready(function (){

	$("input[name='accept']").click(function(){
//		var id = $(this).closest("td").find("input[name=orderId]").val();//订单号
//		var userid = $(this).closest("td").find("input[name=userid]").val();//发起人ID
//    	var licenseId = $(this).closest("td").find("input[name=licenseId]").val();//彩种
		var userid = $(this).closest("td").find("input[name=memberId]").val();
		var licenseId = $(this).closest("td").find("input[name=licenseId]").val();

    	var dataJson = {"userid":userid,
    			        "licenseId":licenseId,
    			        "appointed":1};
    	
    	$.ajax({
			type : "POST",
			url : "/merger/customPage.jhtml",
			data:dataJson,
			async:false, 
			error : function(xMLHttpRequest, textStatus, errorThrown){
				layer.msg("错误!");
			},
			success : function(data) {
				var layerId = layer.open({
				    type: 1,
				    title: false,
				    end:function(){location.reload();},
				    shadeClose: true,
				    area: ['680px', '300px'],
				    content: data
				});
				$("input[name=layerId]").val(layerId);
			}
		});
    });
//    	$.ajax({
//			type : "POST",
//			url : "/memberCenterCustom/isExist.do",
//			data:dataJson,
//			async:false, 
//			error : function(xMLHttpRequest, textStatus, errorThrown){
//				layer.msg("错误！");
//			},
//			success : function(data) {
//				if(data == -2){
//					layer.msg("不可重复定制!");
//				}else if(data == -3){
//					layer.msg("您是发起人，不能定制!");
//			    }else if(data == 0){
//					$.ajax({
//						type : "POST",
//						url : "/merger/customPage.jhtml",
//						data:dataJson,
//						async:false, 
//						error : function(xMLHttpRequest, textStatus, errorThrown){
//							layer.msg("错误!");
//						},
//						success : function(data) {
//							var layerId = layer.open({
//							    type: 1,
//							    title: false,
//							    //closeBtn: false,
//							    shadeClose: true,
//							    area: ['782px', '457px'],
//							    //skin: 'yourclass',
//							    content: data
//							});
//							$("input[name=layerId]").val(layerId);
//						}
//					});
//				}else{
//					layer.msg("错误!");
//				}
//			}
//		});
//	});
	
//	$("input[name='accept']").click(function(){
//		var memberId = $(this).closest("td").find("input[name=memberId]").val();
//		var licenseId = $(this).closest("td").find("input[name=licenseId]").val();
//		var dataJson = {"memberId":memberId,
//			            "licenseId":licenseId};
//	    $.ajax({
//		    type: "post",
//		    url: "/memberCenterCustom/acceptAppoint.do",
//		    data: dataJson,
//		    async: false,
//		    error: function(xMLHttpRequest, textStatus, errorThrown){
//		    	layer.msg("温馨提示:系统错误！请重试！");
//			},
//		    success: function (data){
//			    if ( data == 1 ){
//			    	layer.msg("已接受该邀请");
//			    	location.reload();
//			    } else {
//			    	layer.msg("温馨提示:操作失败！");
//			    }
//		    }
//		});
//	});
	
	$("input[name='refuse']").click(function(){
		var memberId = $(this).closest("td").find("input[name=memberId]").val();
		var licenseId = $(this).closest("td").find("input[name=licenseId]").val();
		var dataJson = {"memberId":memberId,
			            "licenseId":licenseId};
	    $.ajax({
		    type: "post",
		    url: "/memberCenterCustom/refuseAppoint.do",
		    data: dataJson,
		    async: false,
		    error: function(xMLHttpRequest, textStatus, errorThrown){
		    	layer.msg("温馨提示:系统错误！请重试！");
			},
		    success: function (data){
			    if ( data == 1 ){
			    	layer.msg("已拒绝该邀请");
			    	location.reload();
			    } else {
			    	layer.msg("温馨提示:操作失败！");
			    }
		    }
		});
	});
	
	$("input[name='appoint']").click(function(){
		var licenseId=$(this).attr("id");
	    data="?licenseId="+licenseId;
		layer.open({
		    type: 2,
		    title: '指定跟单人',
		    shadeClose: true,
		    shade: 0.8,
		    area: ['400px', '500px'],
		    end:function(){
				location.reload();
			},
		    content: '/memberCenterCustom/appointPopup.do'+ data
		});
	});
	$("input[name='appointedNames']").click(function(){
		var licenseId=$(this).attr("id");
	    data="?licenseId="+licenseId;
		layer.open({
		    type: 2,
		    title: '指定跟单人',
		    shadeClose: true,
		    shade: 0.8,
		    area: ['400px', '500px'],
		    end:function(){
				location.reload();
			},
		    content: '/memberCenterCustom/appointedByMePopup.do'+ data
		});
	});
	$("a[name='cancel']").click(function(){
		//var customId = $("input[name='customId']").val();
		var customId = $(this).parent().find("input[name='customId']").val();
		layer.confirm('确认要取消定制跟单？', {
		    btn: ['是','否'], //按钮
		    shade: false //不显示遮罩
		}, function(){
			$.ajax({
			    type: "post",
			    url: "/memberCenter/deleteCustom.do",
			    data: {"customId":customId},
			    async: true,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
			    	layer.msg("温馨提示:系统错误！请重试！");
				  },
			    success: function (data){
				    if ( data == "1" ){
				    	
				    	layer.msg("温馨提示:跟单已取消！");
				    	location.reload();
				    } else {
				    	layer.msg("温馨提示:取消跟单操作失败！");
				    }
			    }
			});
		}, function(){
		});
	  });
	$("#licenseId").change(function(){
		var licenseId = $("#licenseId").val();
		var type = $("#type").val();
		var url = "/memberCenterCustom/custom.jhtml?type="+ type +"&licenseId=" + licenseId;
		window.location.href = url;
	});
})
