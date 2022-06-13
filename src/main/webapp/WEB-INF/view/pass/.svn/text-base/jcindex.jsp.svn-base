<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="过关统计" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/style3.css" rel="stylesheet" type="text/css" />
<style type="text/css">
/*20150730*/
.ggtji_top{margin-top:0px !important;border-left:0px;border-right:0px;}
.ggtji_jj_l{border:0px;margin-left:5px;}
.w_cqtj{padding-left:10px;}
.radio_w{margin-left:15px;margin-bottom:10px;}
.radio_w input{ vertical-align:-2px;margin-right:5px;}
.biaogetj{margin-left:4px;}
</style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>


<script type="text/javascript" src="/js/pass/index.js"></script>

<div class="common_w" id="haltAreaId">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 过关统计 </div>
  </div>
<div class="memberbox ">
  	<%@include file="menu.jsp" %>
	 <div class="bdtj fl">
<div class="mrcont">
			<div class="radio_w">
			<br>
			<span class="kjq">日期选择<select
							id="selDateId">
			<c:forEach var="list" items="${days}" varStatus="varStatus">
				<option value="${list}">${list}</option>
			</c:forEach>
			</select></span>
		<input type="radio" name="allPassName" value="1" <c:if test="${ param.succFlag eq 1 }">checked</c:if> />成功方案  
		<input type="radio" name="allPassName" value="3" <c:if test="${ param.succFlag eq 2 }">checked</c:if> />流产方案
		<input type="radio" name="allPassName" value="2" <c:if test="${ param.uuid ne null and param.uuid != ''}">checked</c:if> <c:if test="${sessionScope.member.memberName != null }">mid=${sessionScope.member.id} </c:if> />我的过关
		
		
		</div>
<table width="801" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="biaoge" >
	<tbody><tr>
		<td width="35" height="32" class="biaoge1">序号</td>
		<td width="60" class="biaoge1">发起人</td>
		<td width="60" class="biaoge1">发起时间</td>
		<td width="60" class="biaoge1">方案类型</td>
		<td width="60" class="biaoge1">玩法</td>
		<td width="62" class="biaoge1">单式/复式</td>
		<td width="60" class="biaoge1">过关方式</td>
		<td width="62" class="biaoge1">方案注数</td>
		<td width="62" class="biaoge1">方案场次</td>
		<td width="62" class="biaoge1">已开场次</td>
		<td width="62" class="biaoge1">正确场次</td>
		<td width="62" class="biaoge1">全对注数</td>
		<td width="62" class="biaoge1">投注金额</td>
		<td width="62" class="biaoge1">奖金</td>
		<td width="49" class="biaoge1"> 操作</td>
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
				<td height="30" class=" biaoge4">${varStatus.count}</td><!-- 序号 -->
				<td>${fn:substring(list.order.username,0,2)}***</td><!-- 发起人 -->
				<td>${list.orderDate}</td>
				<td>${list.schemeType}</td>
				<td>${list.playName}</td>
				<td>
					<c:choose>
						<c:when test="${list.order.singleFlag == '0'}">
							复式
						</c:when>
						<c:when test="${list.order.singleFlag == '1'}">
							单式上传
						</c:when>
						<c:when test="${list.order.singleFlag == '2'}">
							在线过滤
						</c:when>
						<c:when test="${list.order.singleFlag == '3'}">
							奖金优化
						</c:when>
						<c:otherwise>
							单式
						</c:otherwise>
					</c:choose>
				</td>
				<td>${list.passType}</td>
				<td>${list.betNum}注</td><!-- 方案倍数 -->
				<td>${list.schNum}</td>
				<td>${list.openNum}</td>
				<td>${list.winNum}</td>
				<td>${list.allRightNum }</td>
				<td><fmt:formatNumber value="${list.order.betPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></td>
				<c:choose>
					<c:when test="${list.order.finiBonus > 0}">
						<td><font color=red><fmt:formatNumber value="${list.order.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></font></td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatNumber value="${list.order.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></td>
					</c:otherwise>
				</c:choose>
	    		<td class=" biaoge3 color">
	    			<input type="button" name="mergerAppoint" value="定制" class="btn" userid="${list.userid }" licenseId="${list.licenseId }" orderId="${list.orderId }"/>
					<c:if test="${list.order.betType eq '3'}">
	    				<br/><a href="/merger/mergerOrderDetails.jhtml?mergerOrderId=${list.order.partnerNo } ">详情</a>
	    			</c:if>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="mrtop1">
			<div class="clear"></div>
			<div class="page2">
			<form id="reportForm" name="reportForm" action="/pass/index.jhtml" method="post">
		  		<input type="hidden" name="licenseId" value="${licenseId}" />
		  		<input type="hidden" name="selDate" value="${selDate}" />
		  		<input type="hidden" name="uuid" value="${param.uuid}" />
		  		<input type="hidden" name="succFlag" value="${param.succFlag}" />
		  	</form>
				<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
			</div>
		</div>

	    	<div class="clear"></div>
		</div>
        </div>
<div class="clear"></div>
</div>
</div>


<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
