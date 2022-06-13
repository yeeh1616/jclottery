<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="../../../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../../../include/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/guess/guessfootball/500wan/analyse.js"></script>

<div id="liansai" class="banxin"></div>
<div id="weilai" class="banxin"></div>
<div id="zhenrong" class="banxin"></div>
<div id="tuijian" class="banxin"></div>

<input type="hidden" value="${schudlesNO }" id="schudlesNO" />
<jsp:include page="../../common/sure.jsp"></jsp:include>

<jsp:include page="../../../include/footer.jsp"></jsp:include>

</body>
</html>