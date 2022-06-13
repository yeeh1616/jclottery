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
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 购彩记录 </div>
  </div>
</div>
<script type="text/javascript" src="/js/membercenter/purchasList.js"></script>
<div class="memberbox">
	<c:set var="PageId" value="1" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    <div class="usertab">
          	<ul>
            	<li class="ck">购彩记录</li>
                <!--<li class="out">未选中</li>-->
                <li class="showeek">显示最近一周记录</li>
            </ul>
    </div>
    <div class="shaixuan">
    	 <form id="reportForm" name="reportForm" action="/memberCenter/purchasList.jhtml" method="post">
       	   我要筛选
             <select name="licenseId" id="licenseId">
               <option value="">全部彩种</option>
								<c:forEach var="obj" items="${lotteryTypes}">
									<option value="${obj.licenseId}" <c:if test="${obj.licenseId eq param.licenseId }">selected</c:if>>${obj.licenseString}</option>
								</c:forEach>
							</select>
       　　起始日期
       <input type="text" name="beginTime" id="beginTime"
													value="${param.beginTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
			至   
			<input type="text" name="endTime" id="endTime"
													value="${param.endTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
    　
   		 <input name="button" type="submit" class="inputyellow" id="button" value="查询" style="width:62px" />
   		</form>
    </div>
     
   <form name="form1" id="form1" method="post" action="/memberCenter/changeOrderState.jhtml">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
    	 <tr>
		    <td width="5%" height="30" align="center" class="tztop">序号</td>
		    <c:choose>
					<c:when test="${sessionScope.member.memberFrom == '5'}">
						 <td width="5%" align="center" class="tztop">选择</td>
						 <td width="5%" align="center" class="tztop">订单号</td>
					</c:when>
					<c:otherwise>
						 <td width="10%" align="center" class="tztop">订单号</td>
					</c:otherwise>
				</c:choose>
		    <td width="20%" align="center" class="tztop">彩种彩期 </td>
		    <td width="5%" align="center" class="tztop">倍数</td>
		    <td width="8%" align="center" class="tztop">金额</td>
		    <td width="8%" align="center" class="tztop">奖金</td>
		    <td width="14%" align="center" class="tztop"> 状态</td>
		    <td width="15%" align="center" class="tztop">认购时间</td>
		    <td width="15%" align="center" class="tztop">操作</td>
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
								<c:otherwise>
									--
								</c:otherwise>
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
					<td align="center">
					  <fmt:formatNumber value="${list.betPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center">
						<c:choose>
								<c:when test="${list.betState > 11}">
									<fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${list.betState == 9 || list.betState == 10}">
											待确认
										</c:when>
										<c:otherwise>
											0.00
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
					</td>
					<td align="center">
						${list.stateName3}
					</td>
					<td align="center">
						${list.orderDate}
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${list.reserved17 == '1' && list.betState != '9' && list.betState != '10' && list.betState != '11' && list.betState != '12' && list.betState != '13'}">
							</c:when>
							<c:otherwise>
								<a href="/memberCenter/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
							</c:otherwise>
						</c:choose>
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
			<td colspan="3"></td>
			</tr>
		  <tr>
				
				<td height="28" colspan="11" bgcolor="#e1eaef" align="right">
					<div class="page">
						<c:if test="${sessionScope.member.memberFrom == '5'}">
							<input name="button2"  type="button" class="inputyellow" id="button2" value="结账并出票" style="width:82px;cursor:pointer" />
						</c:if>
					<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
					</div>
				</td>
			</tr>
		</table> 
	</form> 
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
