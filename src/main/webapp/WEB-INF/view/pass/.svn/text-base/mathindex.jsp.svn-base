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
		  <div class="sfc_top">
				<div class="sfc_c_c">
					<span class="sfc_b">${licenseName }</span><span class="kjq">第<select
							id="selectIssueId">
							<c:forEach var="list" items="${pagination.header.gameList}" varStatus="varStatus">
								<option value="${list.issue }">${list.issue }</option>
							</c:forEach>
							</select>期  <span id="date0_">开奖日期：${pagination.header.openDate }</span></span>
				</div>
			</div>
			<div class="jiangjin_">
				<div class="jiangjin_l" style="min-height: 75px; width: 799px;">
					
					<div class="fl">
						<div class="z_money">
							<p>
								本期销量：
								<span id="money0_">${pagination.header.sail }</span>
							</p>
							<p>
								奖池滚存：
								<span id="pool0_">${pagination.header.bonusPool }</span>
							</p>
						</div>

						<div class="open_zs ret" id="openCodeAreaId">
							<c:if test="${licenseId == 4}">
								<c:forEach var="list" items="${pagination.header.openCodeList}" varStatus="varStatus">
									<c:if test="${varStatus.count > 5}">
										<i class="blue">${list }</i>
									</c:if>
									<c:if test="${varStatus.count < 6}">
										<i>${list }</i>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${licenseId == 11}">
								<c:forEach var="list" items="${pagination.header.openCodeList}" varStatus="varStatus">
									<c:if test="${varStatus.count > 6}">
										<i class="blue">${list }</i>
									</c:if>
									<c:if test="${varStatus.count <= 6}">
										<i>${list }</i>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${licenseId == 13}">
								<c:forEach var="list" items="${pagination.header.openCodeList}" varStatus="varStatus">
									<c:if test="${varStatus.count > 7}">
										<i class="blue">${list }</i>
									</c:if>
									<c:if test="${varStatus.count <= 7}">
										<i>${list }</i>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${licenseId == 1 || licenseId == 2 || licenseId == 3 || licenseId == 12}">
								<c:forEach var="list" items="${pagination.header.openCodeList}" varStatus="varStatus">
									<i>${list }</i>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="clear"></div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="jingjin_b" id="payDesc_">
						<tr>
							<th width="30%">奖项</th>
							<th width="35%">中奖注数</th>
							<th width="35%" >中奖金额（元）</th>
						</tr>
						<c:forEach var="list" items="${pagination.header.bos}" varStatus="varStatus">
							<tr>
								<td>${list.name }</td>
								<td>${list.num }</td>
								<td>${list.bonus }</td>
							</tr>
							</c:forEach>
						</table>
				</div>
				<div class="clear"></div>
			</div>
			<br/>
			<div class="radio_w">
		<input type="radio" name="allPassName" value="1" <c:if test="${ param.uuid eq null and param.succFlag eq 1 }">checked</c:if> />成功方案  
		<input type="radio" name="allPassName" value="3" <c:if test="${ param.uuid eq null and param.succFlag eq 2 }">checked</c:if> />流单方案
		<input type="radio" name="allPassName" value="2" <c:if test="${ param.uuid ne null}">checked</c:if> <c:if test="${sessionScope.member.memberName != null }">mid=${sessionScope.member.id} </c:if> />我的过关
		</div>
<table width="801" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="biaoge" >
	<tbody><tr>
		<td width="35" height="32" class="biaoge1">序号</td>
		<td width="60" class="biaoge1">发起人</td>
		<td width="60" class="biaoge1">方案类型</td>
		<td width="62" class="biaoge1">方案注数</td>
		<c:forEach var="list" items="${pagination.header.bos}" varStatus="varStatus">
			<td width="62" class="biaoge1">${fn:substring(list.name,0,fn:indexOf(list.name,'(')) }</td>
		</c:forEach>
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
				<td>${list.schemeType}</td>
				<td>${list.betNum}注</td><!-- 方案倍数 -->
				<c:forEach var="list1" items="${list.prize}" varStatus="varStatus1">
					<c:if test="${list1 > 0}">
						<td><font color=red>${list1}</font>注</td>
					</c:if>
					<c:if test="${list1 == 0}">
						<td>${list1}注</td>
					</c:if>
				</c:forEach>
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
		  		<input type="hidden" name="uuid" value="${param.uuid}" />
		  		<input type="hidden" name="issue" value="${param.issue}" />
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
