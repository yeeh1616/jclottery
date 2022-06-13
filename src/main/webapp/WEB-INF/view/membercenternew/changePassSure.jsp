<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民修改密码" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/safeIndex.jhtml">安全中心</a> > 修改密码</div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
<!--安全等级begin-->
<div class="gr-safedj">
	<div class="gr-safe-l">密码修改</div>
	<div class="gr-safe-r"><a href="/memberCenterNew/safeIndex.jhtml">&lt;&lt; 返回安全中心</a></div><div class="clear"></div>
</div>
<!--安全等级end--> 
<div class="gr-lbody">
<div class="safe-xti safebor">
	<div class="safe_succ fl"></div>
	<div class="safe_tex fl">密码修改成功！</div>
</div>   
   <br />
   <h3 align="center"><a href="/memberCenterNew/safeIndex.jhtml">返回安全中心</a></h3>
</div>
</div>
<div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>