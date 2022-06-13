$(function(){
	$("a[name='appoint']").click(function(){
		var appointMemberId = $(this).closest("td").find("input[name=appointMemberId]").val();
		var appontMemberName = $(this).closest("td").find("input[name=appontMemberName]").val();
		var licenseId = $("input[name=licenseId]").val();
		var memberId = $("input[name=memberId]").val();
		var memberName = $("input[name=memberName]").val();
		var storeId = $("input[name=storeId]").val();
		var dataJson = {"licenseId":licenseId,
					"appointMemberId":appointMemberId,
					"appontMemberName":appontMemberName,
					"memberId":memberId,
					"memberName":memberName,
					"storeId":storeId};
	    $.ajax({
		    type: "post",
		    url: "/memberCenterCustom/isAppointedFull.do",
		    data: {"licenseId":licenseId},
		    async: false,
		    error: function(xMLHttpRequest, textStatus, errorThrown){
		    	layer.msg("温馨提示:系统错误！请重试！");
			  },
		    success: function (data){
			    if ( data == 1 ){
				    $.ajax({
						type: "post",
					    url: "/memberCenterCustom/appoint.do",
						data: dataJson,
					    async: false,
					    error: function(xMLHttpRequest, textStatus, errorThrown){
					    	layer.msg("温馨提示:系统错误！请重试！");
						},
					    success: function (data){
					    	if(data == -2){
					    		layer.msg("已指定过此人");
					    	}else if(data > 0){
					    		layer.msg("完成");
					    		location.reload();
					    	}else{
					    		layer.msg("错误!");
					    	}
					    }
					});
			    }else if(data == 0){
			    	parent.layer.msg("已满员!");
			    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			    	parent.layer.close(index); //再执行关闭   
			    }else if(data == -1){
			    	parent.layer.msg("错误!");
			    	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			    	parent.layer.close(index); //再执行关闭   
			    }
		    }
		});
	});
});