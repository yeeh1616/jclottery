//参与合买弹出层
$(document).ready(function (){
	$("#searchByState").change(function(){
		var checkValue=$("#searchByState").val();
		if(checkValue == 1){
			window.location.href="/merger/index.jhtml?state=1";
		}else if(checkValue == 2){
			window.location.href="/merger/index.jhtml?state=2";
		}else if(checkValue == 3){
			window.location.href="/merger/index.jhtml?state=3";
		}
	});
	$("input[name='userName']").focus(function(){
		if($(this).val() == '按发起人昵称搜索'){
			$(this).val('');
		}
	}).blur(function(){
		if($(this).val() == ''){
			$(this).val('按发起人昵称搜索');
		}  
	});
	
	$("a[name='search']").click(function(){
		var userName = $(this).closest("div").find("input[name=userName]").val();
		window.location.href="/merger/index.jhtml?username=" + userName;
	});
	$("input[name='mergerjoin']").click(function (){
		var sec = parseInt($("#stopSId").html());
		var min = parseInt($("#stopMId").html());
		var hou = parseInt($("#stopHId").html());
		
		var orderId = $(this).closest("td").find("input[name=orderId]").val();
		var partTitile = $(this).closest("td").find("input[name=partTitile]").val();
		var licenseName = $(this).closest("td").find("input[name=licenseName]").val();
		var price = $(this).closest("td").find("input[name=price]").val();
		var issue = $(this).closest("td").find("input[name=issue]").val();//??
		var buyNum = $(this).closest("td").find("input[name=buyNum]").val();
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
									title: titleContent,
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
											//window.location.reload();
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
	});
	
	$("#mergerNum").keyup(function (){
		var restNum = $(this).closest("td").find("input[name=restNum]").val();
		var buyNum = $(this).val();
		var temp = parseInt(buyNum.substring(0,1));
		if(temp == 0){
			$(this).attr("value",'');
		}
		if(parseInt(buyNum) > parseInt(restNum)){
			layer.msg('剩余份数不足。', 1, 3);
			$("#mergerNum").attr("value",'');//清空内容
		}
	});
})