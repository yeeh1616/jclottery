
$(document).ready(function () {
	// 合买暂时不支持
	//$("input[type=radio][name=buyType][value=3]").attr("disabled", "disabled");
	
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
		'scriptData' : {"licenseId":$('#licenseId').val(), "playId":$('#dsPlayId').val()},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
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
			if ( $("#zjBoxId").attr("checked") ) {
				base = 3;
			}
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
//排列三标准格式

$(document).ready(function (){
	//var $this = $(this);
	$("a[name=danshi]").click(function (){
		//popupConfirm();
		var index=$("#dsPlayId").val();
		if(index=="1"){
			var title ='请查看<排列三直选普通>单式上传标准格式样本';
			var url = "/playerintro/pl3zxds.jhtml";
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
		}else if(index=="2"){
			var title ='请查看<排列三组三普通>单式上传标准格式样本';
			var url = "/playerintro/pl3z3ds.jhtml";
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
		}else if(index=="3"){
			var title ='请查看<排列三组六普通>单式上传标准格式样本';
			var url = "/playerintro/pl3z6ds.jhtml";
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
		}

	});
})
//大乐透标准格式
$(document).ready(function (){
	$("a[name=daletou]").click(function (){
		var title ='请查看<大乐透>单式上传标准格式样本';
		var url = "/playerintro/daletou.jhtml";
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
		    	layer.close(index);
		    }
		}); 
	});
	$("a[name=ssqds]").click(function (){
		var title ='请查看<双色球>单式上传标准格式样本';
		var url = "/playerintro/ssqds.jhtml";
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
		    	layer.close(index);
		    }
		}); 
	});
	$("a[name=qlcds]").click(function (){
		var title ='请查看<七乐彩>单式上传标准格式样本';
		var url = "/playerintro/qlcds.jhtml";
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
		    	layer.close(index);
		    }
		}); 
	});
})

//排列五标准格式
$(document).ready(function (){
	$("a[name=pailewu]").click(function (){
		var title ='请查看<排列五>单式上传标准格式样本';
		var url = "/playerintro/paile5.jhtml";
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

//七星彩标准格式
$(document).ready(function (){
	$("a[name=qixingcai]").click(function (){
		var title ='请查看<七星彩>单式上传标准格式样本';
		var url = "/playerintro/qixingcai.jhtml";
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