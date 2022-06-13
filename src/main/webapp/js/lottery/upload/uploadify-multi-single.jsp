<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
<link rel="stylesheet" href="<%=path%>/uiwidget/uploadify-2.1.4/css/uploadify.css" type="text/css" />

<script type="text/javascript"	src="<%=path%>/uiwidget/uploadify-2.1.4/jquery-1.4.2.min.js"></script>
<script type="text/javascript"	src="<%=path%>/uiwidget/uploadify-2.1.4/core/swfobject.js"></script>
<script type="text/javascript" src="<%=path%>/uiwidget/uploadify-2.1.4/core/jquery.uploadify.v2.1.4.js"></script>



<script type="text/javascript">

$(document).ready(function() {

	var path = "<%=path%>/uiwidget/uploadify-2.1.4/";
	
	$("#fileUpload").uploadify({
		'uploader' :path+'core/uploadify.swf',//flash文件位置，注意路径
	    'script':'<%=path%>/AlanXUploadServlet',//后台处理的请求
	    'cancelImg' :path+'images/cancel.png',//取消按钮图片
		'folder': 'files',
		'multi': false,
		'displayData': 'speed'
	});

	$("#fileUpload2").uploadify({
		'uploader' :path+'core/uploadify.swf',//flash文件位置，注意路径
	    'script':'<%=path%>/AlanXUploadServlet',//后台处理的请求
	    'cancelImg' :path+'images/cancel.png',//取消按钮图片
		'folder': 'files',
		'multi': true,
		'buttonText': 'Select Files',
		'checkScript': 'uploadify/check.php',
		'displayData': 'speed',
		'simUploadLimit': 2
	});

	$("#fileUpload3").uploadify({
		'uploader' :path+'core/uploadify.swf',//flash文件位置，注意路径
	    'script':'<%=path%>/AlanXUploadServlet',//后台处理的请求
	    'cancelImg' :path+'images/cancel.png',//取消按钮图片
		'folder': 'files',
		'fileDesc': 'Image Files',
		'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
		'multi': true,
		'auto': true
	});
});

</script>
</head>

<body>
      <fieldset style="border: 1px solid #CDCDCD; padding: 8px; padding-bottom:0px; margin: 8px 0">
		<legend><strong>Uploadify - Single and Multiple Sample</strong></legend>
		<h2>Single File Upload</h2>
		<p>Display speed</p>
		<div id="fileUpload">You have a problem with your javascript</div>
		<a href="javascript:$('#fileUpload').uploadifyUpload()">Start Upload</a> |  <a href="javascript:$('#fileUpload').uploadifyClearQueue()">Clear Queue</a>
    	<p></p>
<hr width=100% size="1" color="" align="center">
		<h2>Multiple File Upload</h2>
		<p>checkScript, buttonText, simulataneous upload limit</p>
		<div id="fileUpload2">You have a problem with your javascript</div>
		<a href="javascript:$('#fileUpload2').uploadifyUpload()">Start Upload</a> |  <a href="javascript:$('#fileUpload2').uploadifyClearQueue()">Clear Queue</a>
    	<p></p>
<hr width=100% size="1" color="" align="center">
		<h2>Multiple File Auto Upload</h2>
		<p>Images Only</p>
		<div id="fileUpload3">You have a problem with your javascript</div>
		<a href="javascript:$('#fileUpload3').uploadifyUpload()">Start Upload</a> |  <a href="javascript:$('#fileUpload3').uploadifyClearQueue()">Clear Queue</a>
    	<p></p>
    </fieldset>
</body>
</html>