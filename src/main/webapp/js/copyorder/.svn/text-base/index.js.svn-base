
$(document).ready(function (){
	
	// 我的复制跟单
	$("a[name=mycopy]").click(function(){
		var uri = $(this).attr("uri");
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
				} else {
					location.href = uri;
				}
			}
		});
	});
	
	$("#searchNameId").focus(function(){
		if($(this).val() == '按发起人昵称搜索'){
			$(this).val('');
		}
	}).blur(function(){
		if($(this).val() == ''){
			$(this).val('按发起人昵称搜索');
		}  
	});
	
	$("#searchId").click(function(){
		var userName = $("#searchNameId").val();
		var licenseId = $("#reportForm").find("input[name=licenseId]").val();
		var url = "/copyorder/index.jhtml?username=" + userName;
		if ( licenseId != '' ) {
			url += "&licenseId="+licenseId;
		}
		window.location.href = url;
	});
	$("input[name='mergerjoin']").click(function (){
		if ( $(this).parent().prev().find("input[name=multiple]").val() == '' ) {
			return null;
		}
		var multiple = parseInt($(this).parent().prev().prev().find("input[name=multiple]").val(),10);
		if ( isNaN(multiple) ) {
			layer.alert("倍数输入有误！",0);
			return null;
		}
		var orderId = $(this).attr("orderId");
		var betNum = parseInt($(this).attr("betNum"),10);
		var buyPrice = multiple * betNum * 2;
		var message ='你本次购买需要消费￥'+ buyPrice +'元。';
		
		// 查询余额
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
				} else {
					// 判断余额是否足够
					var balance = parseFloat(data);
					if ( buyPrice > balance ) {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						$.layer({
							title: "跟单确认",
						    shade: [0],
						    area: [300,150],
						    dialog: {
						        msg: message,
						        btns: 2,
						        type: 4,
						        btn: ['购买','取消'],
						        yes: function(){
									$.ajax( {
										type : "POST",
										url : "/copyorder/copy.json",
										data: "orderId="+orderId+"&multiple="+multiple,
										dataType: "text",
										async:false, //同步请求方式
										error : function(xMLHttpRequest, textStatus, errorThrown) {
											layer.msg("操作出错!",1,3);
											window.location.reload();
										},
										success : function(data) {
							            	layer.msg(data, 1, 1);
											window.location.reload();
										}
									}); 
						        }, no: function(){
						        	window.location.reload();
						        }
						    }
						});
						
					}
				}
		    }
		});
		
	});
	
	var nodeDialg = null;
	// 定制复制
	$("input[name=custom]").click(function(){
		var licenseId = $(this).attr("licenseId");
		var customedId = $(this).attr("userid");
		$("#cusBtnId").attr("licenseId", licenseId);
		$("#cusBtnId").attr("customedId", customedId);
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
				} else {
					nodeDialg = $.layer({
				        type : 1,
				        title : ['选择'],
				        fix : false,
				        area : ['auto','auto'],
				        shadeClose : false,
				        border : [true],
				        page : {dom : '#orPanelId'}
				     });
				}
			}
		});
	});
	
	$("#cusBtnId").click(function(){
		var licenseId = $(this).attr("licenseId");
		var customedId = $(this).attr("customedId");
		var param = "licenseId="+licenseId+"&customedId="+customedId;
		if ( $("#dbSetId").attr("checked") ) {
			if ( $("#dbMoneyId").val() != "" && $("#dbMultId").val() !="" ) {
				param += "&reserved2="+$("#dbMoneyId").val()+","+$("#dbMultId").val();
			} else {
				layer.msg("参数设置有误", 1, 1);
			}
		}
		if ( $("#gdSetId").attr("checked") ) {
			if ( $("#gdMoneyId").val() != "" ) {
				param += "&reserved3="+$("#gdMoneyId").val();
			} else {
				layer.msg("参数设置有误", 1, 1);
			}
		}
		$.ajax({
		    type: "post",
		    url: "/copyorder/copyCust.json",
		    async: false,
		    data: param,
		    dataType: "text",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				layer.msg(data, 1, 1);
				layer.close(nodeDialg);
			}
		});
	});
})