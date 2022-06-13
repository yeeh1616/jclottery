//参与合买弹出层
$(document).ready(function (){
	$("#cusBtnId").click(function(){
		var id = $("#mergerOrderId").val();//订单号
		var userid = $("#userid").val();//发起人ID
    	var licenseId = $("#licenseId").val();//彩种
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
								layer.msg("定制错误!");
							}
						}
					});
				}
		    }
		});
	});
	
	try{
		// 查看出票详情
		$("#lookticketId").click(function(){
			var oid = $(this).attr("oid");
			var lid = $(this).attr("lid");
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
						location.href="/memberCenterNew/orderDetail.jhtml?orderId="+oid+"&LicenseId="+lid;
					}
			    }
			});
		});
	} catch (ex){}
	
	try{
		// 团队  查看出票详情
		$("#lookteamticketId").click(function(){
			var oid = $(this).attr("oid");
			var lid = $(this).attr("lid");
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
						//location.href="/memberCenterNew/orderDetail.jhtml?orderId="+oid+"&LicenseId="+lid;
						
						//验证通过表单提交		
						$("#purchasDetailForm").remove(); 
						$("<form id='purchasDetailForm' action='/memberCenterNew/myTeamOrderDetail.jhtml' method='post'>" 
						+ "<input type='hidden' value='" + oid + "' name='orderId' />"
						+ "<input type='hidden' value='" + lid + "' name='licenseId' />"
						+ "</form>").appendTo("body");
						$("#purchasDetailForm").submit();
					}
			    }
			});
		});
	} catch (ex){}
	
	$("#zjSetBtnId").removeAttr("checked");
	// 追加设置added at 2015/09/13
	$("#zjSetBtnId").click(function(){
		if ( $(this).attr("checked") ) {
			$("#baoSetViewId").show();
		} else {
			$("#baoSetViewId").hide();
		}
	});
	$("#zjSubmitId").click(function(){
		var insNum = $("#baodiNumId").val();
		if ( insNum == '' ) {
			layer.msg("请输入保底份数！");
			return false;
		}
		var orderId = $("#mergerOrderId").val();//订单号
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
					var balance = parseFloat(data);
					if ( insNum > balance ) {
						layer.msg("余额不足，请您先充值！");
					} 
					$.ajax({
						type : "POST",
						url : "/merger/appendIns.jhtml",
						data:{"orderId":orderId,"insNum":insNum},
						async:false, 
						error : function(xMLHttpRequest, textStatus, errorThrown){
							layer.msg("服务器连接失败！");
						},
						success : function(data) {
							layer.msg(data);
							window.location.reload();
						}
					});
				}
		    }
		});
	});
	$("#cancelBtnId").click(function(){
		layer.confirm("您确定要撤销该订单吗？", function(index){
			var orderId = $("#mergerOrderId").val();//订单号
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
							url : "/merger/cancelOrder.jhtml",
							data:{"orderId":orderId},
							async:false, 
							error : function(xMLHttpRequest, textStatus, errorThrown){
								layer.msg("服务器连接失败！");
							},
							success : function(data) {
								layer.msg(data);
								window.location.reload();
							}
						});
					}
			    }
			});
		});
	});
	
	$("input[name='downLoad']").click(function(){
		var betCode = $("input[name='betCode']").val();
		
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","/merger/saveInTxt.jhtml");
		
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","betCode");
		input1.attr("value",betCode);
		$("body").append(form);//将表单放置在web中
		form.append(input1);

		form.submit();//表单提交 
		
		
		
		
//		var betCode = $("#betCode").val();
//		var data = {"betCode":betCode};
//		$.ajax({
//			type:"post",
//			url:"/merger/saveInTxt.jhtml",
//			data:data,
//			async:true,
//			error:function(xMLHttpRequest, textStatus, errorThrown){
//				layer.msg("下载出错",1,3);
//			},
//			success:function(data){
//				layer.msg("投注内容已保存到本地",1,2);
//			}
//		});
	});
	
	var height = $('.con_6_r').height() + 6;
	//$('.con_6_l').css({'line-height': height + 'px'});
	//$('.con_6').css({'height': height + 'px'});
	
	var height = $('.con_5_r').height() + 6;
	//$('.con_5_l').css({'line-height': height + 'px'});
	//$('.con_5').css({'height': height + 'px'});
	
	var url = window.location.href;
	$("#curentUrl").attr("value",url);
	// 定义一个新的复制对象
	var clip = new ZeroClipboard( $("#copyurl"), {
	  moviePath: "/js/merger/ZeroClipboard.swf"
	} );
	// 复制内容到剪贴板成功后的操作
	clip.on( 'complete', function(client, args) {
	   //alert("复制成功，复制内容为："+ args.text);
	   //layer.msg('网址已复制到剪贴板：'+ args.text, 1, 1);
		layer.msg('网址已复制到剪贴板', 1, 1);
	} );
})
function SaveInfoToFile(folder, fileName) {
    var filePath = folder + fileName;
    var fileInfo = "hahahaha";
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var file = fso.CreateTextFile(filePath, true);
    file.Write(fileInfo);
    file.Close();
}