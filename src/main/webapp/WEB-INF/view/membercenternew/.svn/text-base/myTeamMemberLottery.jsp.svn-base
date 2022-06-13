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
		<c:set var="btnNum" value="1" scope="page"></c:set>
		<%@include file="titleButtonsForTeamPurchase.jsp" %>
	</div>
	
    <div class="w_gcjl_bg">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
			<tr  align="center" >
				<!--<th height="30">序号</th>
				<th>彩民</th>
				<th>方案编号</th>
				<th>彩票种类</th>
				<th>出票方式</th>
				<th>金额</th>
				<th>票数 </th>
				<th>倍数</th>
				<th>下单时间</th>
				<th>订单状态</th>
				<th>详情</th>-->
				
				<th height="30">序号</th>
				<th>彩民</th>
				<c:choose>
					<c:when test="${sessionScope.member.memberFrom == '5'}">
						<th width="5%" align="center" class="tztop">选择</th>
						<th width="5%" align="center" class="tztop">订单号</th>
					</c:when>
				<c:otherwise>
				<th width="10%" align="center" class="tztop">订单号</th>
				</c:otherwise>
				</c:choose>
				<th>彩种彩期 </th>
				<th>倍数</th>
				<th>金额</th>
				<th>奖金</th>
				<th> 状态</th>
				<th>认购时间</th>
				<th>操作</th>
			</tr>
			<c:set var="totalPrice" value="0" scope="page"></c:set><!--总购彩-->
		    <c:set var="totalBonus" value="0" scope="page"></c:set><!--总奖金-->
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">	
				<!--数据汇总-->
				<c:set var="totalPrice" value="${totalPrice + list.betPrice}" scope="page"></c:set>
				<c:set var="totalBonus" value="${totalBonus + list.finiBonus}" scope="page"></c:set>			
				<!--<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr align="center" bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr align="center" bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
			    <td>${varStatus.count+(srobj.pin.pageNo-1)*srobj.pin.pageSize}</td>
			    <td>${list.username}</td>
				<td>${list.id}</td>
				<td>${list.licenseName}</td>
				<td>${list.ticketTypeName}</td>
				<td><fmt:formatNumber value="${list.betPrice}" pattern="#,##0.00"></fmt:formatNumber></td>
				<td>${list.ticketTotalNum}</td>
				<td>${list.multiple}</td>
				<td>${list.orderDate}</td>
				<td>${list.stateName}</td>
				<td>
					<input type="hidden" name="licenseId" value="${list.licenseId}"/>
					<a id = "xq_${list.id}" name="queryOrderDetails" >详情</a>
				</td>-->
			<tr align="center" bgcolor="<c:if test="${varStatus.count%2==0}">#f4fbff</c:if><c:if test="${varStatus.count%2!=0}">#FFFFFF</c:if>">
				<td height="28" align="center">${varStatus.count}</td>
				<td>${list.username}</td>
				<c:if test="${sessionScope.member.memberFrom == '5' }">
					<td align="center">
						<c:choose><c:when test="${list.betState == '0'}">
								<input type="checkbox" name="orderId" value="${list.id}" checked onclick="return false;"/></c:when>
							<c:otherwise>--</c:otherwise></c:choose></td>
				</c:if>
				<td>${list.id}</td>
				<td>${list.licenseName}</td>
				<td>${list.multiple}</td>
				<td class="hred">
				  <fmt:formatNumber value="${list.betPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
				</td>
				<td align="center">
					<c:choose>
						<c:when test="${list.betState == 13}">
							<font color=red><fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></font>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${list.betState == 9 || list.betState == 10}">
									<font color=red>待确认</font>
								</c:when>
								<c:otherwise>0.00</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
				<td align="center">
					<c:choose>
						<c:when test="${list.betState == 13||list.betState == 9|| list.betState == 10}">
							<font color=red>${list.stateName3}</font></c:when>
						<c:otherwise>${list.stateName3}</c:otherwise>
					</c:choose>
				</td>
				<td>${list.orderDate}</td>
				<td width="8%">
					<input type="hidden" name="licenseId" value="${list.licenseId}"/>
					<a id = "xq_${list.id}" name="queryOrderDetails" >详情</a>
				</td>
				
				
			</tr>
	  		</c:forEach>
	  		<tr bgcolor="#FFFFFF">
				<td colspan="5" align="center" height="28">本页汇总:</td>
				<td align="center">
					<fmt:formatNumber value="${totalPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
				</td>
				<td align="center">
					<fmt:formatNumber value="${totalBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
				</td>
				<td colspan="3"></td>
			</tr>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
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
