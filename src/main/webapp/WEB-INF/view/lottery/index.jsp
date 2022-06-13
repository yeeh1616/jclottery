<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<c:set var="pageName" value="购彩大厅" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<meta property="qc:admins" content="67542143476300206375" />
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/index.js"></script>

<div class="content common_w" id="haltAreaId">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 购彩大厅 </div>
  </div>

</div>

<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
</body>
</html>