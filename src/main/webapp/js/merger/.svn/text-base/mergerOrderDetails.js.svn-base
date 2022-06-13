//判断用户是否有权查看订单详情
$(document).ready(function (){
	$("a[name='custom']").click(function(){
		var id = $(this).closest("td").find("input[name=orderId]").val();//订单号
		var userid = $(this).closest("td").find("input[name=userid]").val();//发起人ID
    	var licenseId = $(this).closest("td").find("input[name=licenseId]").val();//彩种

    	//    	$.ajax({
//			type : "POST",
//			url : "/merger/isExist.jhtml",
//			data:{"userid":userid,"licenseId":licenseId,"id":id},
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
//					var urlOfMergerOrderDetails = "/merger/customPage.jhtml";//?userid=" + userid + "&&licenseId=" + licenseId;
//					$.ajax({
//						type : "POST",
//						url : urlOfMergerOrderDetails,
//						data:{"userid":userid,"licenseId":licenseId,"id":id,"appointed":0},
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
//							    area: ['680px', '300px'],
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
								/*var urlOfMergerOrderDetails = "/merger/customPage.jhtml";//?userid=" + userid + "&&licenseId=" + licenseId;
								$.ajax({
									type : "POST",
									url : urlOfMergerOrderDetails,
									data:{"userid":userid,"licenseId":licenseId,"id":id,"appointed":0},
									async:false, 
									error : function(xMLHttpRequest, textStatus, errorThrown){
										layer.msg("错误!");
									},
									success : function(data) {
										var layerId = layer.open({
										    type: 1,
										    title: false,
										    //closeBtn: false,
										    shadeClose: true,
										    area: ['680px', '300px'],
										    //skin: 'yourclass',
										    content: data
										});
										$("input[name=layerId]").val(layerId);
										
										//var url = "/playerintro/qixingcai.jhtml";
										
									}
								});*/
								
								
							}else{
								layer.msg("错误!");
							}
						}
					});
				}
		    }
		});
	});
	
    $("a[name='details']").click(function(){
    	//var showLevel = $(this).closest("td").find("input[name=showLevel]").val();
    	var orderId = $(this).closest("td").find("input[name=orderId]").val();
    	//var params = "orderId="+orderId;
    	
    	var urlOfMergerOrderDetails = "/merger/mergerOrderDetails.jhtml?mergerOrderId=" + orderId;
    	window.location.href=urlOfMergerOrderDetails;
		/*if(showLevel == 1){
    		window.location.href="/merger/mergerOrderDetails.jhtml?mergerOrderId=" + orderId;
    	}else if(showLevel == 2){
    		var errorMsg = "这个订单只有参与者可以查看详情!";
    		var successMsg = "这个订单只有参与者可以查看详情!";
    		var urlOfShowLevel = "/merger/getIsJoiner.jhtml";
    		callMergerOrderDetails(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg);
    	}else if(showLevel == 3){
    		var errorMsg = "这个订单只有发起者可以查看详情!";
    		var successMsg = "这个订单只有发起者可以查看详情!";
    		var urlOfShowLevel = "/merger/getIsLanucher.jhtml";
    		callMergerOrderDetails(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg);
    	}else if(showLevel == 4){
    		var errorMsg = "这个订单在截止后可以查看详情!";
    		var successMsg = "这个订单截止后可以查看详情!";
    		var urlOfShowLevel = "/merger/getIsPassDeadline.jhtml";
    		callMergerOrderDetailsWithoutLogin(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg);
    	}*/
    });
    /*
    function callMergerOrderDetails(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg)  {
    	$.ajax({
    	    type: "post",
    	    url: "/common/getAccountUsable.json",
    	    async: false,
    	    dataType: "json",
    	    success: function (data){
    			if ( data == '-1' ) {
        			params = params + "&isHid=1";
    				callMergerOrderDetailsWithoutLogin(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg);
    				//$("#showBalDivId").html("未登录用户");
    				/*$.blockUI({
    					message: $("#loginAreaId"),
    					css: {
    						width: '612px',
    						height: '520px',
    						left: ($(window).width() - 618) / 2 + 'px',
    						top: 50 + 'px',
    						border: 'none',
    						cursor:'default'
    					}
    				});*/
    			//} else {
    				/*$.ajax( {
    					type : "POST",
    					url : urlOfShowLevel,
    					data: params,//"orderId="+orderId,
    					async:false, //同步请求方式
    					error : function(xMLHttpRequest, textStatus, errorThrown) {
    						layer.msg(errorMsg,1,3);
    					},
    					success : function(data) {
    						if(data == -1){
    							layer.msg(successMsg,1,3);
    						}else{
        		            	window.location.href=urlOfMergerOrderDetails;
    						}
    					}
    				});*/
    			/*}
    	    }
    	});
     }*/
    /*function callMergerOrderDetailsWithoutLogin(urlOfShowLevel,urlOfMergerOrderDetails,params,errorMsg,successMsg)  {
		$.ajax( {
			type : "POST",
			url : urlOfShowLevel,
			data: params,//"orderId="+orderId,
			async:false, //同步请求方式
			error : function(xMLHttpRequest, textStatus, errorThrown) {
				layer.msg(errorMsg,1,3);
			},
			success : function(data) {
				if(data == -1){
					layer.msg(successMsg,1,3);
				}else{
	            	window.location.href=urlOfMergerOrderDetails;
				}
			}
		});
     }*/
})

