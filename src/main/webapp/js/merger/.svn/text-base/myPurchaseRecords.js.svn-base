//判断用户是否有权查看订单详情
$(document).ready(function (){
	var restNum = $("input[name=restNum]").val();
	var totalNum = $("input[name=totalNum]").val();
	var width = $("div .jindu").width();
	width = width*(totalNum-restNum)/totalNum;
	$("div .jindu span:first-child").css("width",width);
	var orderId = $("input[name=orderId]").val();
	var showLevel = $("input[name=showLevel]").val();
	var IsShowContent =$("input[name=IsShowContent]").val();//IsShowContent
	showLevelControl(showLevel,orderId);
	
	/*$('input[type=checkbox]').click(function() {
		
	});*/
	
	$("input[name='mergerjoin']").click(function (){
		if($("#checkboxProtocol").attr("checked")){
			var sec = parseInt($("#stopSId").html());
			var min = parseInt($("#stopMId").html());
			var hou = parseInt($("#stopHId").html());
			
			var orderId = $("input[name=orderId]").val();
			var partTitile = $(this).closest("div").find("input[name=partTitile]").val();
			var licenseName = $(this).closest("div").find("input[name=licenseName]").val();
			var price = $("input[name=price]").val();//$(this).closest("div").find("input[name=price]").val();
			var issue = $(this).closest("div").find("input[name=issue]").val();//??
			var buyNum = $(this).closest("div").find("input[name=mergerNum]").val();
			var buyPrice = price * buyNum;
			var message ='你本次购买'+buyNum+'份，需要消费￥'+ buyPrice +'元。';
			var titleContent;
			if(issue!=null){
				titleContent = licenseName + ' 第' +issue + '期' + ' ' + partTitile;
			}else{
				titleContent = licenseName + partTitile;
			}
			if ( sec == 0 && min == 0 && hou == 0 ) {
				popupConfirm("温馨提示","当前期不可投注！");
				return false;
			}
			if ( $("#betDsNumId").html() != "0" ) {
				//$().ajaxStart($.blockUI).ajaxStop($.unblockUI);
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
							var pay = parseFloat($("#mergerNum").val());
							var balance = parseFloat(data);
							if ( pay > balance ) {
								popupConfirm("温馨提示","余额不足，请您先充值！");
							} else {
								if(buyNum != "" && buyNum > 0){
									$.layer({
									    shade: [0],
									    area: ['auto','auto'],
									    dialog: {
									        msg: message,
									        btns: 2,                    
									        type: 4,
									        btn: ['购买','取消'],
									        yes: function(){
												$.ajax( {
													type : "POST",
													//contentType:"application/json",
													url : "/merger/join.jhtml",
													data: "orderId="+orderId+"&joinNum="+buyNum +"&joinPrice=" +buyPrice,
													//"mj.joinUserid" :
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
									        	 layer.msg('已取消', 1, 3);
									        }
									    }
									});
									
								}else{
									layer.msg('请输入认购份数', 1, 3);
								}
							}
						}
				    }
				});
			} else {
				popupConfirm("温馨提示","请先投注！");
			}
			}else{
				layer.msg('请阅读《用户服务协议》并同意其中条款', 1, 3);
			}
	});
	
	$("#mergerNum").keyup(function (){
		var restNum = $(this).closest("div").find("input[name=restNum]").val();
		var buyNum = $(this).val();
		var strBuyNum = buyNum + "";
		if(parseInt(buyNum) > parseInt(restNum)){
			layer.msg('剩余份数不足。', 1, 3);
			$("#mergerNum").attr("value",'');//清空内容
		}
		if(strBuyNum.charCodeAt(0) == 48){
			$("#mergerNum").attr("value",'');//清空内容
		}
	});
	
    $("input[name='purchaseRecords']").click(function(){
		var url = "/memberCenterNew/mergerJoinList.jhtml";
		callMyPurchaseRecords(url);
    });
    function callMyPurchaseRecords(url)  {
    	$.ajax({
    	    type: "post",
    	    url: "/common/getAccountUsable.json",
    	    async: false,
    	    dataType: "json",
    	    success: function (data){
    			if ( data == '-1' ) {
    				$(".openlogin").click();
    			} else {
    				window.location.href=url;
    			}
    	    }
    	});
     }

    function showLevelControl(showLevel,orderId){
    	//var showLevel = $(this).closest("td").find("input[name=showLevel]").val();
    	//var orderId = $(this).closest("td").find("input[name=orderId]").val();
    	var params = "orderId="+orderId;
		var urlOfMergerOrderDetails = "/merger/mergerOrderDetails.jhtml?mergerOrderId=" + orderId;
    	
		if(showLevel == 1 || IsShowContent == 'show'){
    		$("div .con_5_r_f").css("visibility","visible");
    	}else{
    		if(showLevel == 2){
        		var successMsg = "这个订单只有参与者可以查看详情!";
        		var urlOfShowLevel = "/merger/getIsJoiner.jhtml";
        		callMergerOrderDetails(urlOfShowLevel,params,successMsg);
        	}else if(showLevel == 3){
        		var successMsg = "这个订单只有发起者可以查看详情!";
        		var urlOfShowLevel = "/merger/getIsLanucher.jhtml";
        		callMergerOrderDetails(urlOfShowLevel,params,successMsg);
        	}else if(showLevel == 4){
        		var successMsg = "这个订单截止后可以查看详情!";
        		var urlOfShowLevel = "/merger/getIsPassDeadline.jhtml";
        		callMergerOrderDetailsWithoutLogin(urlOfShowLevel,params,successMsg);
        	}
    	}
    	
		function callMergerOrderDetails(urlOfShowLevel,params,successMsg)  {
	    	$.ajax({
	    	    type: "post",
	    	    url: "/common/getAccountUsable.json",
	    	    async: false,
	    	    dataType: "json",
	    	    success: function (data){
	    			if ( data == -1 && showLevel != 1) {
						/*$("div .con_5_r_f").text(successMsg).css({'height': '31px'});
						$("div .con_5_r_f2").text(successMsg).css({'height': '31px'});
	    				$('.con_5_l').css({'line-height': '68px'});
						$('.con_5').css({'height': '68px'});*/
	    			} else if( data == -1 && showLevel == 1){
	    				$("div .con_5_r_f").css("visibility","visible");
	    			}else {
	    				callMergerOrderDetailsWithoutLogin(urlOfShowLevel,params,successMsg);
	    			}
	    	    }
	    	});
	     }
		
	    function callMergerOrderDetailsWithoutLogin(urlOfShowLevel,params,successMsg)  {
			$.ajax( {
				type : "POST",
				url : urlOfShowLevel,
				data: params,
				async:false,
				success : function(data) {
					if(data == -1){						
						/*$("div .con_5_r_f").text(successMsg).css({'height': '31px'});
						$("div .con_5_r_f2").text(successMsg).css({'height': '31px'});
						$('.con_5_l').css({'line-height': '68px'});
						$('.con_5').css({'height': '68px'});*/
						//$("div .con_5_r_f").css("visibility","visible");

						//layer.msg(successMsg,1,3);
					}else{
						$("div .con_5_r_f").css("visibility","visible");
					}
				}
			});
	     }
    }
})

