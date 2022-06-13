<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is a popup page for mergerjoin">
	
	<link href="/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/css/css.css" rel="stylesheet" type="text/css" />
  </head>
  

<body>
	<div class="flowDiv1_5">
	  <div class="f3tit"><h1>${param.licenseId} ${param.orderDate} ${param.partTitile}</h1>    <div class="cls"><a href="#">x</a></div></div>
	    <div class="clear"></div>
		<div class="hemai">
			<div class="rengou">认购信息</div>
			<div class="xinxi">你本次购买${buymeNum}份，需要消费￥<span>${prices}</span>元。</div>
		</div>
	  <div class="queren1">
		<form action="/merger/join.jhtml" method="post">
			<input type="hidden" name="param"/>"
			<input type="submit" value="确定" />
		</form>
	  <input type="button" class="btn4" value="关闭"></div>
	</div>
</body>

</html>
