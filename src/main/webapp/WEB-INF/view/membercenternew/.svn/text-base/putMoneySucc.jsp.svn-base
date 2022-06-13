<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-充值成功" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<c:choose>
	<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
		<body>
			<jsp:include page="../include/header.jsp"></jsp:include>
			<div class="common_w">
			<div class="hall-top">
			  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">彩民充值</a> > 充值结束</div>
			</div>
			<!--用户中心-->
			<div class="user_plant">
			<%@include file="menu.jsp" %>
			<div class="user_r">
			<!--安全等级begin-->
			<div class="gr-safedj">
				<div class="gr-safe-l">充值反馈</div>
				<div class="gr-safe-r"></div><div class="clear"></div>
			</div>
			<!--安全等级end--> 
			<div class="gr-lbody"> 
			<div class="safe-xti safebor">
				<div class="safe_succ fl"></div>
				<div class="safe_tex fl">${returnMessage}</div>
			</div>
				
			<br />
			<h3 align="center"><a href="/memberCenterNew/putMoneyList.jhtml">查看充值记录</a></h3>
			
			</div>
			</div>
			<div class=" clear"></div>
			<!--用户中心 end--> 
			</div>
			</div>
			<jsp:include page="../include/footer.jsp"></jsp:include>
			</body>
	</c:when>
	<c:otherwise>
		<body>
			<jsp:include page="../include/header.jsp"></jsp:include>
			<div class="common_w">
			<div class="hall-top">
			  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">彩民充值</a> > 充值结束</div>
			</div>
			<!--用户中心-->
			<div class="user_plant">
			<div class="user_r2">
			<!--安全等级begin-->
			<div class="gr-safedj">
				<div class="gr-safe-l">充值反馈</div>
				<div class="gr-safe-r"></div><div class="clear"></div>
			</div>
			<!--安全等级end--> 
			<div class="gr-lbody2"> 
			<div class="safe-xti safebor">
				<div class="safe_succ fl"></div>
				<div class="safe_tex fl">${returnMessage}</div>
			</div>
				
			<br />
			<h3 align="center"><a href="javascript:window.close();">关闭页面</a></h3>
			<br /><br />
			</div>
			</div>
			<div class=" clear"></div>
			<!--用户中心 end--> 
			</div>
			</div>
			<jsp:include page="../include/footer.jsp"></jsp:include>
			</body>
	</c:otherwise>
</c:choose>

</html>
