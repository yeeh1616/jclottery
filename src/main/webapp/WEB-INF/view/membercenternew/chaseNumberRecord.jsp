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
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 追号记录 </div>
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
	<c:set var="btnNum" value="2" scope="page"></c:set>
	<%@include file="titleButtonsForBetting.jsp" %>
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
         <tr>
		    <th width="5%">序号</th>
		    <th width="10%">订单号</th>
		    <th width="13%">彩种 </th>
		    <th width="12%">总期数/已完成/已取消</th>
		    <th width="10%">订单总额</th>
		    <th width="10%">注数</th>
		    <th width="8%">状态</th>
		    <th width="13%">下单时间</th>
		    <th width="10%">中奖终止</th>
		    <th width="10%">操作</th>
		  </tr>
		  <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
					<td height="28" align="center">
						${varStatus.count+(pagination.pageNo-1)*pagination.pageSize}
					</td>
					<td align="center">
						${list.id}
					</td>
					<td align="center">
						${list.licenseName}
					</td>
					<td align="center">
						${list.totalIssue}/${list.doneIssue}/${list.cancelIssue}
					</td>
					<td align="center" class="hred">
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center">
						${list.betNum}
					</td>
					<td align="center">
						${list.stateName} 
					</td>
					<td align="center">
						${list.orderDate}
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${list.stopBonus > 0}">
								奖金≥${list.stopBonus }
							</c:when>
							<c:otherwise>
								<c:if test="${list.winStop == 1}">
									是
								</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">
				       <a href="/memberCenterNew/zhfax.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a> 
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
