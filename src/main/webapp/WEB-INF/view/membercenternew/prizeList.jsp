<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-追号记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/membercenternew/purchasList.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 中奖记录 </div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">投注管理 </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
<div class="w_gcjl">
	<c:set var="btnNum" value="4" scope="page"></c:set>
	<%@include file="titleButtonsForBetting.jsp" %>
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
    	 <tr>
		    <th width="10%">序号</th>
		    <th width="10%">订单号</th>
		    <th width="15%">彩种彩期 </th>
		    <th width="8%">倍数</th>
		    <th width="8%">投注额</th>
		    <th width="8%">奖金</th>
		    <th width="16%">状态</th>
		    <th width="15%">认购时间</th>
		    <th width="10%">操作</th>
		  </tr>
		  <c:set var="totalPrice" value="0" scope="page"></c:set><!--总购彩-->
		 	 <c:set var="totalBonus" value="0" scope="page"></c:set><!--总奖金-->
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">				
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
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center" class="hred">
						<c:choose>
								<c:when test="${list.betState > 11}">
									<fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									待确认
								</c:otherwise>
							</c:choose>
					</td>
					<td align="center">
						${list.stateName2}
					</td>
					<td align="center">
						${list.orderDate}
					</td>
					<td align="center">
						<a href="/memberCenterNew/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
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
</div>
<div class="clear"></div>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
