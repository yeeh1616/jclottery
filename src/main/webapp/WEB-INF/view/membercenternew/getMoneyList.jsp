<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-取款记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">资金管理</a>  > 取款记录 </div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">资金管理 </div>
      <div class="gr-safe-r"><a href="/memberCenterNew/capital.jhtml">&lt;&lt; 返回资金管理</a></div><div class="clear"></div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">
    <!--具体信息begin-->
<div class="w_gcjl">
<div class="w_gcjl_l">
	<ul><li><a href="/memberCenterNew/getMoney.jhtml">账户取款</a></li></ul>
	<ul><li><a href="/memberCenterNew/getMoneyList.jhtml" class="active">取款记录</a></li></ul>
	<span>显示最近一周记录</span>
	<div class="clear"></div>
</div>
<div class="w_gcjl_choose">
	<form id="reportForm" name="reportForm"
		action="/memberCenterNew/getMoneyList.jhtml" method="post">
		<span>我要筛选
	    	<select name="state" id="state">
				<option value="">状态选择</option>
				<c:forEach var="obj" items="${memberDrowStates}">
					<option value="${obj.key}" <c:if test="${obj.key eq param.state }">selected</c:if>>${obj.value}</option>
				</c:forEach>
			</select>
	    </span>
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
		    <th width="10%">序号</th>
		    <th width="20%">取款时间</th>
		    <th width="20%">处理时间 </th>
		    <th width="10%">提款方式</th>
		    <th width="10%">金额</th>
		    <th width="10%">状态</th>
		    <th width="20%"> 备注</th>
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
					<td widths="35" height="28" align="center">
						${list.id}
					</td>
					<td widths="120" align="center">
						${list.createTime}
					</td>
					<td widtsh="120" align="center">
						${list.operatorTime}
					</td>
					<td widtsh="50" align="center">
						${list.bankName}
					</td>
					<td widtsh="90" align="center">
					  <fmt:formatNumber value="${list.money}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td widtsh="90" align="center">
						${list.stateName}
					</td>
					<td widtsh="165" align="center">
						${list.comments}
					</td>
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
</html>
