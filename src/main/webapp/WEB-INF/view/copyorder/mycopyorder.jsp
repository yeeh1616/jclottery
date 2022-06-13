<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="我的复制跟单" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/style3.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>


<script type="text/javascript" src="/js/layerNew/layer.js"></script>
<script type="text/javascript" src="/js/copyorder/index.js"></script>

<div class="common_w" id="haltAreaId">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 复制跟单 </div>
  </div>
  
  <div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="../membercenternew/menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">复制跟单 </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
	<div class="w_gcjl">
		<c:set var="btnNum" value="2" scope="page"></c:set>
		<div class="w_gcjl_l">
		<ul>
			<li><a href="/memberCenter/mycopyCust.jhtml" >我的定制复制</a></li>
			<li><a href="/memberCenter/mycopyedCust.jhtml" >我被定制的复制</a></li>
			<li><a href="/memberCenter/mycopyorder.jhtml" class="active" >我的复制跟单</a></li>
			<li><a href="/memberCenter/mycopyedorder.jhtml">他人复制我的单</a></li>
		</ul>
		<span></span>
		<div class="clear"></div>
	</div>
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
    	 <tr>
		<td width="35" height="32" class="biaoge1">序号</td>
		<td width="60" class="biaoge1">发起人</td>
		<td width="87" class="biaoge1">跟单时间</td>
		<td width="63" class="biaoge1">彩种 </td>
		<td width="62" class="biaoge1">方案倍数</td>
		<td width="62" class="biaoge1">方案金额</td>
		<td width="93" class="biaoge1">状态</td>
		<td width="93" class="biaoge1">详情</td>
	</tr>
  <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
			<tr>
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
				<td height="30" class=" biaoge4">${varStatus.count}</td><!-- 序号 -->
				<td>${list.username}</td><!-- 发起人 -->
				<td>${list.orderDate}</td><!-- 发起时间 -->
				<td>${list.licenseName}</td><!-- 彩种 -->
				<td>${list.multiple}</td><!-- 方案倍数 -->
				<td>${list.betPrice}元</td><!-- 方案金额 -->
			    <td>
					${list.stateName3 }
				</td><!-- 认购份 -->
				<td>
	    		<c:choose>
	    			<c:when test="${list.betState == '9' || list.betState == '10' || list.betState == '11' || list.betState == '12' || list.betState == '13'}">
	    				<a href="/memberCenterNew/orderDetail.jhtml?orderId=${list.id }&LicenseId=${list.licenseId}">详情</a>
	    			</c:when>
	    			<c:otherwise>
	    				--
	    			</c:otherwise>
	    		</c:choose>
	    		</td>
			</tr>
			</c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">                                
			<form id="reportForm" name="reportForm" action="/memberCenter/mycopyorder.jhtml" method="post">
		  		<input type="hidden" name="licenseId" value="${param.licenseId}" />
		  	</form>
				<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
  </div>    
    <!--具体信息end-->
  </div>
</div>
  <div class="clear"></div></div>
  
  
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
