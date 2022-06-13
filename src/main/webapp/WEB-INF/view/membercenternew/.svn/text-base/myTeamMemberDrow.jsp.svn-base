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
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">彩民列表</a> 
  		&gt;基本信息 &gt;取款记录 
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
		<%@include file="titleButtonsForTeamPay.jsp" %>
	</div>
	<div class="w_gcjl_choose">
		<form id="reportForm" name="reportForm" action="/memberCenterNew/myTeamMemberDrow.jhtml" method="post">
			<span>彩民:<input type="text" name="reserved1" id="reserved1" value="${param.reserved1}"/></span>
		    <span>状态:
		    	<select name="state" id="state" style="width: 100px;">
					<option value="">-全部-</option>
					<option value="1" <c:if test="${param.state == '1'}">selected="selected"</c:if>>未处理</option>
					<option value="2" <c:if test="${param.state == '2'}">selected="selected"</c:if>>未处理</option>
					<option value="-1" <c:if test="${param.state == '-1'}">selected="selected"</c:if>>已拒绝</option>

				</select>
		    </span>
		    <span>起始日期:
		      <input type="text" name="beginCreateTime" id="beginTime" value="${param.beginCreateTime}"
							onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
		      	至<input type="text" name="endCreateTime" id="endTime" value="${param.endCreateTime}"
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
				<th>发起时间</th>
				<th>处理时间</th>
				<th>金额</th>
				<th>处理人</th>
				<th>状态</th>
				<th>备注信息</th>
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
					<td>${list.memberName}</td>
					<td>${list.createTime}</td>
					<td>${list.operatorTime}</td>
					<td><fmt:formatNumber value="${list.money}" pattern="#,##0.00"></fmt:formatNumber></td>
					<td >${list.operatorName}</td>
					<td>
						<c:choose>
							<c:when test="${list.state==1}">未处理</c:when>
							<c:when test="${list.state==2}">已处理</c:when>
							<c:otherwise>已拒绝</c:otherwise>	
						</c:choose>
					</td>
					<td>${list.comments}</td>
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
  <div class="clear"></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
