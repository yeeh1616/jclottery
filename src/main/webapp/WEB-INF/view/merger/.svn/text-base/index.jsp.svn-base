<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="合买中心" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/style3.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.w_hrb {
	width: 802px;
	height:101px;
	margin-bottom: 10px;
	margin: auto;
	margin-top: 17px;
	background:url(/images/bangdan.png);
}
.w_hrbr {
	width: 642px;
	padding-top: 5px;
	margin-top:12px;
	color:#744a2e;
}
.w_hrbr li {
	display: block !important;
	width:100px !important;
	float: left !important;
	border-bottom: none !important;
	padding-left: 0px !important;
}
.w_hrbr li a {
	display: block !important;
	width: 93px !important;
	color:#744a2e !important;
	text-align: left;
	padding-left: 20px !important;
	padding-right:0px !important;
	float: left;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	font-weight: bold;
	background:none !important;
}
</style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>


<script type="text/javascript" src="/js/merger/mergerJoinPopup.js"></script>
<script type="text/javascript" src="/js/merger/mergerOrderDetails.js"></script>

<div class="common_w" id="haltAreaId">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 合买大厅 </div>
  </div>
<div class="memberbox ">
  	<%@include file="menu.jsp" %>
	 <div class="bdtj fl">
	 		  <div class="w_hrb">
	
    <div class="w_hrbr fr">
    	<ul id="mingrenbangId">
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="mrcont">
		  <div class="con-top">
		  <div class="clear"></div>
		  	<div class="con-top_l"><span>热门方案</span></div>
			<div class="dingdan">订单状态：
				<input type="hidden" value="${state}"/>
				<select id="searchByState" name="searchByState">
					<option value="1" <c:if test="${state == 1}" >selected = "selected"</c:if>>未满员订单</option>
					<option value="2" <c:if test="${state == 2}" >selected = "selected"</c:if>>已满员订单</option>
					<option value="3" <c:if test="${state == 3}" >selected = "selected"</c:if>>已撤销订单</option>
				</select>
			</div>
			<div class="con-top_r"><input type="text" value="按发起人昵称搜索" name="userName"/>
			<a style="cursor:pointer" name="search"><img src="/images/sousuo_03.jpg" width="24" height="25" /></a></div>
		  </div>
		  
		<!-- <div class="paixu">排序条件：<a href="#"><span>累计盈利5次以上</span></a>
		   <a href="#"><span>累计中奖5万以上（含流单）</span></a>
		   <a href="#"><span>一个月内盈利超30%以上</span></a>
		</div> -->
		
		
<table width="801" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="biaoge">
	<tbody><tr>
		<td width="35" height="32" class="biaoge1">序号</td>
		<td width="60" class="biaoge1">发起人</td>
		<td width="87" class="biaoge1">发起时间</td>
		<td width="87" class="biaoge1">截止时间</td>
		<td width="67" class="biaoge1">保底份数</td>
		<!-- <td width="113" class="biaoge1">战绩</td> -->
		<td width="63" class="biaoge1">彩种 </td>
		<td width="67" class="biaoge1">保密类型</td>
		<td width="62" class="biaoge1">方案金额</td>
		<td width="41" class="biaoge1">每份</td>
		<td width="59" class="biaoge1">提成</td>
		<td width="43" class="biaoge1">进度 </td>
		<td width="59" class="biaoge1">剩余份数</td>
		<td width="93" class="biaoge1">认购份数</td>
		<td width="49" class="biaoge1"> 操作</td>
	</tr>
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
			<tr>
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr class="biaogeColor">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td height="30" class=" biaoge4">${varStatus.count}</td><!-- 序号 -->
				<td>${list.virtualName}</td><!-- 发起人 -->
				<td>${list.orderDate}</td><!-- 发起时间 -->
				<td>${list.reserved2}</td><!-- 截止时间 -->
				<td>${list.insNum}</td><!-- 保底 -->
				<td>${list.licenseName}</td><!-- 彩种 -->
				<td>${list.showLevelName}</td><!-- 保密类型 -->
				<td>${list.betPrice}元</td><!-- 方案金额 -->
				<td>${list.singlePrice}元</td><!-- 每份 -->
				<c:choose>
					<c:when test='${list.brokerage <= 0}'>
				         <td>无提成</td>
				    </c:when>
				    <c:otherwise>
				    	<td><fmt:formatNumber type="number" value="${list.brokerage * 100}" maxFractionDigits="0"/>%</td><!-- 提成 -->
				    </c:otherwise>
				</c:choose>
				<td>${list.showProgress}</td><!-- 进度 -->
				<td>${list.totalNum - list.buyNum} </td><!-- 剩余份数 -->
				<c:choose>
			      <c:when test="${state == 2}">
			         <td>已满员</td>
			      </c:when>
			      <c:when test="${state == 3}">
			         <td>已撤单</td>
			      </c:when>
			      <c:otherwise>
				    <td>
						<input type="hidden" class="text" value="${list.id}" name="orderId"/>
						<input type="hidden" class="text" value="${list.totalNum - list.buyNum}" name="restNum"/>
						<input type="hidden" class="text" value="${list.partTitile}" name="partTitile"/>
						<input type="hidden" class="text" value="${list.singlePrice}" name="price"/>
						<input type="hidden" class="text" value="${list.licenseName}" name="licenseName"/>
						<input type="hidden" class="text" value="${list.issue}" name="issue"/>
						<input type="text" id="mergerNum" class="text" value="" name="buyNum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						<input type="button" name="mergerjoin" value="购买" class="btn"/>
					</td><!-- 认购份 -->
			      </c:otherwise>
	    		</c:choose>
	    		<td class=" biaoge3 color">
					<input type="hidden" class="text" value="${list.id}" name="orderId"/>
					<input type="hidden" class="text" value="${list.showLevel}" name="showLevel"/>
					<input type="hidden" class="text" value="${list.reserved2}" name="DeadLine"/>
					<input type="hidden" class="text" value="${list.userid}" name="userid"/>
					<input type="hidden" class="text" value="${list.licenseId}" name="licenseId"/>
					<input type="hidden" class="text" value="" name="layerId"/>
					<a name="details" style="cursor:pointer;" >详情</a></br>
					<a name="custom" style="cursor:pointer;" >定制</a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="mrtop1">
			<div class="clear"></div>
			<div class="page2">
			<form id="reportForm" name="reportForm" action="/merger/index.jhtml" method="post">
		  		<input type="hidden" name="mergerOrderId" value="${param.mergerOrderId}" />
		  		<input type="hidden" name="state" value="${state}"/>
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
<script type="text/javascript" src="http://collection.cp020.com/homePage/mergerCelebrity.do?storeId=${domain.storeId }"></script>
<script type="text/javascript">
$(document).ready(function () {
	for ( var i = 0; i < cels.length; i++ ) {
		if ( cels[i].bonus > 0 ) {
			var len = cels[i].name.length;
			if ( len > 2 ) {
				len = 2;
			}
			$('<li><a name="hrbdt" href="/merger/pindex.jhtml?uuid='+cels[i].uuid+'" target="_blank">'+cels[i].name.substring(0,len)+'**** </a></li>').appendTo($("#mingrenbangId"));
		}
	}
	$('<div class="clear"></div>').appendTo($("#mingrenbangId"));
});
</script>
</body>
</html>
