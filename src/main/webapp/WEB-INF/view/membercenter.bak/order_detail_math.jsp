<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-数字彩方案详情" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 数字彩方案详情 </div>
  </div>
</div>
<div class="memberbox">
    <c:set var="PageId" value="1" scope="page"></c:set>
    <%@include file="menu.jsp" %>
    <div class="mbright">
   	  <div class="mrcont">
   	    <div class="mrtop">
           <div class="jcbf"> 
           <span class=" back"><a href="/memberCenter/purchasList.jhtml">返回列表</a></span>
           ${mathorder.lotteryorder.licenseName}  <font class="rq">${mathorder.lotteryorder.issue} 期</font>   <font class="bh">${mathorder.lotteryorder.id}</font>号方案详情</div>
          <div class="contniu"><a href="/lottery/index.jhtml?licenseId=${mathorder.lotteryorder.licenseId }">继续购买</a></div>
        </div>
          <div class="clear"></div>
        <div class="sekuai">
          	<ul>
            	<li class="sk01"><b>
            		<fmt:formatNumber value="${mathorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
            		</b>元<br/>
							<span>方案总金额</span></li>
							<li class="sk02"><b>
								<fmt:formatNumber value="${mathorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
								</b>元<br/>
							<span>成功出票金额</span></li>
							<li class="sk03"><b>
								<c:choose>
								<c:when test="${mathorder.lotteryorder.betState>11}">
									<fmt:formatNumber value="${mathorder.lotteryorder.initBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${mathorder.lotteryorder.betState == 9 || mathorder.lotteryorder.betState == 10}">
											待确认
										</c:when>
										<c:otherwise>
											0.00
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
								</b>元<br/>
							<span>中奖金额</span></li>
							<li class="sk05" style="width: 347px;">购买时间：${mathorder.lotteryorder.orderDate}<br/>
							方案状态：${mathorder.lotteryorder.stateName2}</li>
            </ul>
          </div>
          
          <div class="tzxq">
          	<h1 style="border:none">投注详情</h1>
          </div>
          <div style="overflow-x: auto; overflow-y: auto; height: 200px;">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7" class="football_tzxq">
					   <c:forEach var="betList" items="${mathorder.betList}" varStatus="varstatus">
					     <tr>
					     	<td height="30" align="center" bgcolor="#FFFFFF">${betList[0]}</td>
					     </tr>
					   </c:forEach>
					</table>
				</div>
			<div class="blank" style="height:10px"></div>
		    <div class="tzxq">
          	<h1 style="border:none">方案详情</h1>
    		</div>
     <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
  			<tr>
			    <td width="68" height="33" align="center" bgcolor="#d9e8f0" class="sktit">序号</td>
			    <td width="192" align="center" bgcolor="#d9e8f0" class="sktit"> 投注内容</td>
			    <td width="100" align="center" bgcolor="#d9e8f0" class="sktit"> 号码类型</td>
			    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">注数</td>
			    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">倍数</td>
			    <td width="104" align="center" bgcolor="#d9e8f0" class="sktit">投注金额</td>
			    <td width="70" align="center" bgcolor="#d9e8f0" class="sktit">状态</td>
			    <td align="center" bgcolor="#d9e8f0" class="sktit">奖金</td>
			  </tr>
			  <c:forEach var="list" items="${mathorder.ticketspin.list}" varStatus="varstatus">
				<c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#effaff"></c:when>
					<c:otherwise><tr bgcolor="#FFFFFF"></c:otherwise>
				</c:choose>
					<td align="center" height="30">
						${list.seq}
					</td>
					<td align="center">
						${fn:replace(list.betcode, ";", "<br>")}
					</td>
					<td align="center">
						${list.passType}
					</td>
					<td align="center">
						${list.betNum}
					</td>
					<td align="center">
						${list.multiple}
					</td>
					<td align="center">
						<fmt:formatNumber value="${list.betMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center">
						${list.state}
					</td>
					<td align="center">
						<font class="yuan">
							<c:choose>
								<c:when test="${list.ticketState > 11}">
									<fmt:formatNumber value="${list.bonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${list.ticketState == 9 || list.ticketState == 10}">
											待确认
										</c:when>
										<c:otherwise>
											0.00
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							</font>元
					</td>
					</tr>
				</c:forEach>
				<form id="reportForm" name="reportForm" action="/memberCenter/orderDetail.jhtml" method="post">
					<input type="hidden" name="orderId" value="${mathorder.lotteryorder.id}" />
					<input type="hidden" name="LicenseId" value="${mathorder.lotteryorder.licenseId}" />
				</form>
			  <tr>
			    <td height="44" colspan="8" align="center" bgcolor="#effaff"><div class="page">
			    <customertags:paging formId="reportForm" pageNo="${mathorder.ticketspin.pageNo}"
											count="${mathorder.ticketspin.totalCount}" pageSize="${mathorder.ticketspin.pageSize}" />
			    </div></td>
			    </tr>
			</table> 
        
      </div>
    </div>
    <div class="clear"></div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
