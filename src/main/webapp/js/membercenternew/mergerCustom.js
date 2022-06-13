$(document).ready(function (){

	$("input[name='accept']").click(function(){
		var userid = $(this).closest("td").find("input[name=memberId]").val();
		var licenseId = $(this).closest("td").find("input[name=licenseId]").val();

		$.layer({
		    type: 2,
		    maxmin: true,
		    shadeClose: true,
		    title: "定制跟单",
		    fix : false,
		    shade: [0.1,'#000'],
		    offset: ['50px',''],
		    area: ['680px', '350px'],
		    iframe: {src: "/merger/customPage.jhtml?userid="+userid+"&licenseId="+licenseId+"&appointed="+1},
		    end: function(index){
		    	layer.close(index);
		    	location.reload();
		    }
		}); 
    	
    });
	
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
			    url: "/memberCenterNew/deleteCustom.do",
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
		var url = "/memberCenterCustomNew/custom.jhtml?type="+ type +"&licenseId=" + licenseId;
		window.location.href = url;
	});
})
