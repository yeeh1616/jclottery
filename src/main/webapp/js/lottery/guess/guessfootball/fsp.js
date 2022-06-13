/**
 * <p>Desc:竞彩足球单式上传页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/5/25 Version 1.0
 */

$(document).ready(function () {
	
	ajaxFileUpload();
	
});

function ajaxFileUpload() {
	$("#fileuplodid").uploadify({
		'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
		'script':'/lottery/singleUpload2Sch.do',//后台处理的请求
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
		'scriptData' : {"licenseId":$('#licenseId').val(),"playId":$('input[type=radio][name=playTypeName]:checked').val()},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			$("#fileuplodid").uploadifySettings('scriptData',{"licenseId":$("#licenseId").val(),"playId":$('input[type=radio][name=playTypeName]:checked').val()});
		},
		onError: function (event, queueID ,fileObj, errorObj) {
			alert("服务端号码验证失败！");
			return false;
		},
		onComplete: function (event, queueID ,fileObj, response, data) {
			eval( "var bet = " + response + ";" );
			if( bet.errCode == 0 ){
				layer.alert(bet.message,0);
				return false;
			}
			alert("文件上传成功");
		}
	});
}