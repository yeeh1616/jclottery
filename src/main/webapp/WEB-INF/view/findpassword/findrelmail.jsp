<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="找回密码——第三步" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/haohao.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<div class="clear"></div>
<!----------------------------------------------------------------------------->
<div class="you_pic">
<p class="zh fl"><img src="/images/zhaohui.png" /></p>
<span class="fl hen">邮件发送成功</span>
<div class="clear"></div>
<div class="you_text">
 <span>重置密码邮件已发送到您的邮箱，请登录邮箱查收
 </span>
</div>
<div class="deng" onclick="location.href='http://mail.${param.mailServer}.com'"><button style="cursor:pointer;">立即登录到邮箱</button></div>


</div>
<div class="clear"></div>
<!-------------------------------------------------------------------------------->
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
</body>
</html>
