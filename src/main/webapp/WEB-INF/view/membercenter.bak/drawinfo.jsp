<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-实名认证" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/membercenter/authenticat.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 实名认证 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="11" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
     <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
    	 <tr>
		    <td width="10%" height="30" align="center" class="tztop">账户名</td>
		    <td width="10%" align="center" class="tztop">账户类别</td>
		     <td width="15%" align="center" class="tztop">支行名称 </td>
		    <td width="15%" align="center" class="tztop">账户帐号 </td>
		    <td width="8%" align="center" class="tztop">账户状态</td>
		    <td width="8%" align="center" class="tztop">操作</td>
		  </tr>
  			
				<c:forEach items="${list}" var="list">	
			<tr>
					
					
					<td height="28" align="center">
						${list.accountName}
					</td>
					<td align="center">
						${fn:substring(list.accountType,0,fn:indexOf(list.accountType,'|')) }
					</td>
					<td align="center">
						${fn:substring(list.accountType,fn:indexOf(list.accountType,'|')+1,fn:length(list.accountType)) }
						
					</td>
					<td align="center">
						${list.accountCard}
					</td>
					<td align="center">
						<c:if test="${list.accountState==1}">
							正常
						</c:if>
						<c:if test="${list.accountState==0}">
							不可用
						</c:if>
					</td>
					<td align="center">
						<a href="/memberCenter/changeAccount.jhtml?id=${list.id }">修改</a>&nbsp;&nbsp;<a href="/memberCenter/updateDrawstate.jhtml?id=${list.id }">删除</a>
					</td>
				
				</tr>
			</c:forEach>	
		</table>  
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
