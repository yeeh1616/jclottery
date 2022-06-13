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
		'multi': true,
		'displayData': 'percentage'

		/*onInit: function (){						
			$(this).css('display','none');
			if ($.browser.msie) {
				$(this).after('<div id="' + $(this).attr("id")  + 'Uploader"></div>');
				document.getElementById($(this).attr("id")  + 'Uploader').outerHTML = flashElement;
			} else {
				$(this).after(flashElement);
			}
			$("#customspot").after('<div id="' + $(this).attr('id') + 'Queue" class="fileUploadQueue"></div>');
			return false;
		}*/
	});
});

</script>
</head>

<body>
<div style="float:left">
     <fieldset style="border: 1px solid #CDCDCD; padding: 8px; padding-bottom:0px; margin: 8px 0; width:450px">
		<legend><strong>Upload Files - movedQueue Sample</strong></legend>
		<div id="fileUpload">You have a problem with your javascript</div>
		<a href="javascript:$('#fileUpload').uploadifyUpload()">Start Upload</a> |  <a href="javascript:$('#fileUpload').uploadifyClearQueue()">Clear Queue</a>
    	<p></p>
    </fieldset>
</div> 
 <div style="float:left; margin-left:20px">
 	<div id="customspot"></div>
 </div>
</body>
</html>