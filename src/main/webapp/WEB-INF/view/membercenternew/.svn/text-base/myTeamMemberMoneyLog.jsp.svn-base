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
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
	<div class="sitepath fl"> 您当前的位置：
		<a href="/memberCenterNew/index.jhtml">用户中心</a>
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">我的团队</a>
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
		<c:set var="btnNum" value="3" scope="page"></c:set>
		<%@include file="titleButtonsForTeamPay.jsp" %>
	</div>
	<div class="w_gcjl_choose">
		<form id="reportForm" name="reportForm" action="/memberCenterNew/myTeamMoneylog.jhtml" method="post">
			<span>彩民:<input type="text" name="reserved10" id="reserved10" value="${param.reserved10}"/></span>
		    <span>状态:
		    	<c:if test="${btnNum == 5}"><select name="state" id="state">
		    		<option value="">状态选择</option>
		    		<option value="1" <c:if test="${param.state eq '1'}">selected</c:if>>完结</option>
		    		<option value="2" <c:if test="${param.state eq '2'}">selected</c:if>>未完结</option>
		    	</select></c:if>
		    </span>
		    <span>起始日期:
		      <input type="text" name="createBeginTime" id="beginTime" value="${param.createBeginTime}"
							onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
		      	至<input type="text" name="createEndTime" id="endTime" value="${param.createEndTime}"
							onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
		    </span>
		    <input name="button" type="submit" class="w_gcjl_find" id="button" value="查询" style="width:62px" />
	    </form>
	</div>
	
    <div class="w_gcjl_bg">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
			<tr align="center">
				<th>序号</th>
				<th height="28">用户名</th>
				<th>交易时间</th>
				<th>收入/支出</th>
				<th>交易类型</th>
				<th>状态</th>
				<th>金额</th>
				<th>账户余额</th>
				<th>备注</th>
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
				<td>${varStatus.count+(srobj.pin.pageNo-1)*srobj.pin.pageSize}</td>
				<td>${list.reserved10}</td>
				<td>${list.createTime}</td>
				<td><c:choose><c:when test="${list.type==1}">出账</c:when><c:otherwise>入账</c:otherwise></c:choose></td>
				<td>${list.categoryName}</td>
				<td><c:choose><c:when test="${list.state==1}">完结</c:when><c:otherwise>未完结</c:otherwise></c:choose></td>
				<td>
					<c:if test="${list.type==1}">-</c:if>
					<fmt:formatNumber value="${list.money}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
				</td>
				<td><fmt:formatNumber value="${list.balance}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
				<td>${list.commont}(${list.relationId})</td>
			</tr>
	  		</c:forEach>
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
</div>
  <div class="clear"></div></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
