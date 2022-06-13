<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-我的团队" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>

<script type="text/javascript" src="/js/membercenternew/myTeam.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
	<div class="sitepath fl"> 您当前的位置：
		<a href="/memberCenterNew/index.jhtml">用户中心</a>&gt;<a href="/memberCenterNew/myTeam.jhtml">我的团队</a>
	</div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj"><div class="gr-safe-l">我的团队 </div></div>
    <div class="notice2"><b>我的推广：</b>http://${agentUrl}</div>
    <!--安全等级end--> 
<div class="gr-lbody">

    <!--具体信息begin-->
	<div class="w_gcjl">
		<c:set var="btnNum" value="2" scope="page"></c:set>
		<%@include file="titleButtonsForTeamPurchase.jsp" %>
	</div>
	
    <div class="w_gcjl_bg">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
			<tr>
				<th height="28px;">序号</th>
				<th>购彩人</th>
			    <th>订单号</th>
			    <th>彩种 </th>
			    <th>总期数/已完成/已取消</th>
			    <th>订单总额</th>
			    <th>注数</th>
			    <th>状态</th>
			    <th>下单时间</th>
			    <th>中奖终止</th>
			    <th>操作</th>
			</tr>
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">				
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr align="center" bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr align="center" bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
			    	<td>${varStatus.count+(pagination.pageNo-1)*pagination.pageSize}</td>
			    	<td>${list.username}</td>
					<td>${list.id}</td>
					<td>${list.licenseName}</td>
					<td>${list.totalIssue}/${list.doneIssue}/${list.cancelIssue}</td>
					<td class="hred"><fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
					<td>${list.betNum}</td>
					<td>${list.stateName}</td>
					<td>${list.orderDate}</td>
					<td>
						<c:choose>
							<c:when test="${list.stopBonus > 0}">
								奖金≥${list.stopBonus }
							</c:when>
							<c:otherwise>
								<c:if test="${list.winStop == 1}">是</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">
						<input type="hidden" name="licenseId" value="${list.licenseId}"/>
				       <a id = "xq_${list.id}" name="queryChaseDetails" >详情</a>
					</td>
			</tr>
	  		</c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
  </div>    
<!--具体信息end--> 
    
  </div>
    <div class="clear"></div>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
