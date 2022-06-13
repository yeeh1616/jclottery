<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民欠款单" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">资金管理</a> > 彩民欠款单 </div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">资金管理 </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">
    <!--具体信息begin-->
<div class="w_gcjl">
<div class="w_gcjl_l">
	<ul>
		<li><a href="/memberCenterNew/debitList.jhtml" class="active">我的欠款</a></li>
	</ul>
	<span>显示最近一周记录</span>
	<div class="clear"></div>
</div>


<div class="w_gcjl_choose">
	<form id="reportForm" name="reportForm" action="/memberCenterNew/debitList.jhtml" method="post">
       	   我要筛选
	<select name="state" id="state">
		<option value="">欠款单状态</option>
		<c:forEach var="obj" items="${debitState}">
			<option value="${obj.key}" <c:if test="${obj.key eq param.state}">selected</c:if>>${obj.value}</option>
		</c:forEach>
	</select>
	<span>
			起始日期
        <input type="text" name="beginTime" id="beginTime" value="${param.beginTime}"
		onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})"/>
			至   
		<input type="text" name="endTime" id="endTime" value="${param.endTime}"
		onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})"/>
	</span>
    <input type="submit" class="w_gcjl_find" name="button" id="button" value="查询"/>
    </form>
</div>


    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
	  	  <tr>
		    <th width="20%">序号</th>
		    <th width="20%">欠款金额</th>
		    <th width="20%">状态</th>
		    <th width="20%">欠款日期 </th>
		    <th width="20%">还款日期</th>
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
		    <td align="center" bgcolor="#FFFFFF">${varStatus.count}</td>
		    <td height="30" align="center" bgcolor="#FFFFFF">
		     <fmt:formatNumber value="${list.money}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>	
		    </td>
		    <td align="center" bgcolor="#FFFFFF">${list.stateName} </td>
		    <td align="center" bgcolor="#FFFFFF">${list.createTime}</td>
		    <td align="center" bgcolor="#FFFFFF">${list.returnTime}</td>
		  </tr>
	  </c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
  </div>    
    <!--具体信息end--> 
    
  </div>
</div>
  <div class="clear"></div></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
