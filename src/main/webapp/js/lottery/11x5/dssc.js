
$(document).ready(function () {
	
	ajaxFileUpload();
	
	// 单式上传倍数控制事件 begin
	$("#dsMultipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#dsMultipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			var betNum = parseInt($("#betDsNumId").html(),10);
			$("#betDsMoneyId").html(betNum * 2 * parseInt($(this).val(),10));
		}
	});
	
	$("#lottFormBtnId").click(function(){
		// 先判断余额，如果未登录，先登录
		$.ajax({
		    type: "post",
		    url: "/common/getAccountUsable.json",
		    async: false,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == '-1' ) {
					// 尚未登录
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#totalBetMoneyId").html());
					var oo = $("input[name=buyType]:checked").val();
					var balance = parseFloat(data);
					if ( (pay > balance) && oo == "1") {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						dsscFormSubmit();
					}
				}
		    }
		});
		
	});
	
});

function ajaxFileUpload() {
	$("#fileuplodid").uploadify({
		'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
		'script':'/lottery/singleUpload.do',//后台处理的请求
		'cancelImg' :'/js/lottery/upload/images/cancel.png',//取消按钮图片
		'folder': '',
		'fileDataName' : 'file',
		'buttonImg' : '/cytxhome/images/sc_button.jpg',
		'width':121,
		'height':51,
		'multi': false,// 设置单文件上传或多文件上传
		'queueID' : "fileQueue",
		'displayData': 'speed',
		'method' : 'POST',
		'scriptData' : {"licenseId":$('#licenseId').val()},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			$("#fileuplodid").uploadifySettings('scriptData',{"licenseId":$("#licenseId").val(),"playId":$('input[type=radio][name=playTypeName]:checked').val()});
		},
		onError: function (event, queueID ,fileObj, errorObj) {
			alert("服务端号码验证失败");
			return false;
		},
		onComplete: function (event, queueID ,fileObj, response, data) {
			eval( "var bet = " + response + ";" );
			if( bet.errCode == 0 ){
				layer.alert(bet.message,0);
				return false;
			}
			var mult = parseInt($("#multipleId").val(), 10);
			if ( isNaN(mult) ) {
				mult = 1;
			}
			var base = 2;
			$("#totalBetMoneyId").html(bet.betNum * base * mult);
			$("#totalBetNumId").html(bet.betNum);
			$("#fileNameId").val(bet.fileName);
			$("#dsfileNameId").val(bet.fileName);
			
			$("#playId").val($("#dsPlayId").val());
			$("input[name=playId][type=hidden]").val($("#dsPlayId").val());
			
			layer.alert("文件上传成功，总共上传"+bet.betNum+"注",0);
		}
	});
}

//排列五标准格式
$(document).ready(function (){
	$("a[name=pailewu]").click(function (){
		var title ='请查看<11选5>单式上传标准格式样本';
		var url = "/playerintro/s11x5.jhtml";
		$.layer({
		    type: 2,
		    maxmin: true,
		    shadeClose: true,
		    title: title,
		    fix : false,
		    shade: [0.1,'#000'],
		    offset: ['20px',''],
		    area: ['490px', ($(window).height() - 350) +'px'],
		    iframe: {src:url},
		    end: function(index){
		    	refreshPageData();
		    	layer.close(index);
		    }
		}); 
	});
})

function dsscFormSubmit() {
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
				var pay = parseFloat($("#totalBetMoneyId").html());
				var balance = parseFloat(data);
				if ( pay > balance ) {
					layer.alert("余额不足，请您先充值！",0);
				} else {
					$("#singleFormId").find("input[name=playId]").val($('input[type=radio][name=playTypeName]:checked').val());
					$("#singleFormId").find("input[name=issue]").val($("#currentIssueId").html());
					$("#singleFormId").find("input[name=multiple]").val($("#multipleId").val());
					$("#singleFormId").submit();
				}
			}
	    }
	});
}