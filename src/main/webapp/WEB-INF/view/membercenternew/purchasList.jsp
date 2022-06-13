<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-代购记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/membercenternew/purchasList.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 购彩记录 </div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">投注管理</div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
<div class="w_gcjl">
	<c:set var="btnNum" value="1" scope="page"></c:set>
	<%@include file="titleButtonsForBetting.jsp" %>
    <div class="w_gcjl_bg">
    	<form name="form1" id="form1" method="post" action="/memberCenterNew/changeOrderState.jhtml">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
        <tr>
			<th width="5%" height="30" align="center" class="tztop">序号</th>
			<c:choose>
			<c:when test="${sessionScope.member.memberFrom == '5'}">
			<th width="5%" align="center" class="tztop">选择</th>
			<th width="5%" align="center" class="tztop">订单号</th>
			</c:when>
			<c:otherwise>
			<th width="10%" align="center" class="tztop">订单号</th>
			</c:otherwise>
			</c:choose>
			<th width="20%" align="center" class="tztop">彩种彩期 </th>
			<th width="5%" align="center" class="tztop">倍数</th>
			<th width="8%" align="center" class="tztop">金额</th>
			<th width="8%" align="center" class="tztop">奖金</th>
			<th width="14%" align="center" class="tztop"> 状态</th>
			<th width="15%" align="center" class="tztop">认购时间</th>
			<th width="15%" align="center" class="tztop">操作</th>
		 </tr>
		 <c:set var="totalPrice" value="0" scope="page"></c:set><!--总购彩-->
		  <c:set var="totalBonus" value="0" scope="page"></c:set><!--总奖金-->
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">	
				<!--数据汇总-->
				<c:set var="totalPrice" value="${totalPrice + list.betPrice}" scope="page"></c:set>
				<c:set var="totalBonus" value="${totalBonus + list.finiBonus}" scope="page"></c:set>
				
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
					<td height="28" align="center">
						${varStatus.count}
					</td>
					<c:if test="${sessionScope.member.memberFrom == '5' }">
						<td align="center">
							<c:choose>
								<c:when test="${list.betState == '0'}">
									<input type="checkbox" name="orderId" value="${list.id}" checked onclick="return false;"/>
								</c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<td align="center">
						${list.id}
					</td>
					<td align="center">
						${list.licenseName}
					</td>
					<td align="center">
						${list.multiple}
					</td>
					<td align="center" class="hred">
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
										<c:otherwise>
											0.00
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
					</td>
					<td align="center">
						<c:choose>
								<c:when test="${list.betState == 13||list.betState == 9|| list.betState == 10}">
								<font color=red>${list.stateName3}</font>
								</c:when>
								<c:otherwise>
								${list.stateName3}
								</c:otherwise>
						</c:choose>
					</td>
					<td align="center">
						${list.orderDate}
					</td>
					<td align="center">
						<a href="/memberCenterNew/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
						<c:if test="${sessionScope.member.memberFrom == '5' &&  list.betState == '0' }">
					  	<a style="cursor:pointer" name="deleteOrder" orderId="${list.id}" LicenseId="${list.licenseId}">删除</a>
					  </c:if>
					</td>
				</tr>
			</c:forEach>
			<tr bgcolor="#FFFFFF">
			<td colspan="4" align="center" height="28">本页汇总:</td>
			<td align="center">
			<fmt:formatNumber value="${totalPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
			</td>
			<td align="center">
			<fmt:formatNumber value="${totalBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
			</td>
			<td colspan="20"></td>
			</tr>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
			<c:if test="${sessionScope.member.memberFrom == '5'}">
				<input name="button2"  type="button" class="inputyellow" id="button2" value="结账并出票" style="width:82px;cursor:pointer" />
			</c:if>
			<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
	    </div>
	</div>
  </div>    
  </form> 
    <!--具体信息end-->
  </div>
</div>
  <div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
