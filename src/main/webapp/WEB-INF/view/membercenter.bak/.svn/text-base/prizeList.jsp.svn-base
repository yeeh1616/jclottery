<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-中奖记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 中奖纪录 </div>
  </div>
</div>
<div class="memberbox">
	<c:set var="PageId" value="2" scope="page"></c:set>
  <%@include file="menu.jsp" %>
 <div class="tzgl">
    <div class="usertab">
          	<ul>
            	<li class="ck">中奖记录</li>
                <!--<li class="out">未选中</li>-->
                <li class="showeek">显示最近一周记录</li>
            </ul>
    </div>
    <div class="shaixuan">
    	 <form id="reportForm" name="reportForm" action="/memberCenter/prizeList.jhtml" method="post">
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
    
    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
    	 <tr>
		    <td width="10%" height="30" align="center" class="tztop">序号</td>
		    <td width="10%" align="center" class="tztop">订单号</td>
		    <td width="15%" align="center" class="tztop">彩种彩期 </td>
		    <td width="8%" align="center" class="tztop">倍数</td>
		    <td width="8%" align="center" class="tztop">投注额</td>
		    <td width="8%" align="center" class="tztop">奖金</td>
		    <td width="16%" align="center" class="tztop"> 状态</td>
		    <td width="15%" align="center" class="tztop">认购时间</td>
		    <td width="10%" align="center" class="tztop">操作</td>
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
					<td align="center">
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center">
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
						<a href="/memberCenter/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
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
				<td height="28" colspan="11" bgcolor="#e1eaef">
					<div class="page">
					<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
					</div>
				</td>
			</tr>
		</table>  
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
