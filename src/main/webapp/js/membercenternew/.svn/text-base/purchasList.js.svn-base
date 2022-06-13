$(document).ready(function () {
	//提交出票
	$("[name='button2']").click(function(){
		  var applyids = new Array();
    	$("td input[name='orderId']:checked").each(function(){
    		applyids.push($(this).val());
    	});
    	if(applyids.length > 0){
    		popupConfirm("提示信息", "方案提交后账户将被锁定，不可再投注，是否确认出票？", true,function(){
    			$('#form1').submit();
    		});
    	}else{
    		popupConfirm("温馨提示","请选择方案后提交！");
    	}
	});
		
  $("[name='deleteOrder']").click(function(){
  	var $this = $(this);
  	popupConfirm("提示信息", "是否确认删除"+$this.attr('orderId')+"号方案?", true,function(){
  		//$.unblockUI();//关闭对话框
	  	$.ajax({
		    type: "post",
		    url: "/memberCenterNew/deleteOrder.do",
		    data: "orderId=" + $this.attr('orderId'),
		    async: false,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
		    	popupConfirm("温馨提示","系统错误！请重试！");
			  },
		    success: function (data){
			    if ( data == "1" ){
			    	popupConfirm("温馨提示","方案已删除！");
			    	//刷新可余额
			    	refreshUsableMoney();
			    	
			    	$this.parent().parent().children("td:eq(1)").html('--');
			    	$this.parent().parent().children("td:eq(7)").html('已撤单')
			    	$this.parent().html('<a href="/memberCenterNew/orderDetail.jhtml?orderId='+$(this).attr('orderId')+'&LicenseId='+$(this).attr('LicenseId')+'">详情</a>');
			    } else {
			    	popupConfirm("温馨提示","方案删除失败！");
			    }
		    }
			});
  	});
  });
  

// 追号取消操作 ChenSuibing
   $("input[name=cancel]").click(function() {
			var $this = $(this);
			var orderId = $this.attr("id");
			popupConfirm("提示信息", "是否确认取消" + orderId + "号订单?", true, function() {
				$.ajax( {
					type : "post",
					url : "/memberCenterNew/colse.do",
					data : "orderId=" + orderId,
					async : false,
					dataTaye : "text",
					error : function(xMLHttpRequest, textStatus, errorThrown) {
						popupConfirm("温馨提示", "系统错误！请重试！");
					},
					success : function(data) {
						//$this.parent().html('已取消')
						window.location.reload();
					}
				});

			});
		});
   
   
   
   $("#qbcd").click(function() {
		var $this = $(this);
		var orderId = $this.attr("name");
		var licenseId = $this.attr("name2");
		popupConfirm("提示信息", "是否确认取消全部订单?", true, function() {
			$.ajax( {
				type : "post",
				url : "/memberCenterNew/colseAll.do",
				data : "orderId=" + orderId + "&licenseId=" + licenseId,
				async : false,
				dataTaye : "text",
				error : function(xMLHttpRequest, textStatus, errorThrown) {
					popupConfirm("温馨提示", "系统错误！请重试！");
				},
				success : function(data) {
					//$this.parent().html('已取消')
					window.location.reload();
				}
			});

		});
	});
   
   
/*   $("#qbcd").click(function(){
	   var orderId =  $("input[name='o_id']");
		popupConfirm("提示信息", "是否确认取消全部订单?", true, function() {
			$.ajax( {
				type : "post",
				url : "/memberCenterNew/colseAll.do",
				data : "orderId=" + orderId,
				async : false,
				dataTaye : "text",
				error : function(xMLHttpRequest, textStatus, errorThrown) {
					popupConfirm("温馨提示", "系统错误！请重试！");
				},
				success : function(data) {
					//$this.parent().html('已取消')
					window.location.reload();
				}
			});

		});
   });*/
   
});