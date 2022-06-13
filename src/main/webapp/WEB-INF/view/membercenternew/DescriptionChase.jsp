<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-追号方案详情" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/membercenternew/purchasList.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 追号方案详情 </div>
  </div>
</div>
<div class="memberbox">
    <c:set var="PageId" value="13" scope="page"></c:set>
    <%@include file="menu.jsp" %>
    <div class="mbright">
   	  <div class="mrcont">
   	    <div class="mrtop">
           <div class="jcbf"> 
           <span class=" back"><a href="/memberCenterNew/chaseList.jhtml">返回列表</a></span>
           ${mathorder.chasingOrder.licenseName}   <font class="bh">${mathorder.chasingOrder.id}</font>号追号方案详情单</div>
          <div class="contniu"><a href="/lottery/index.jhtml?licenseId=${mathorder.chasingOrder.licenseId}">继续购买</a></div>
        </div>
          <div class="clear"></div>
        <div class="sekuai">
          	<ul>
            	<li class="sk01" style="width: 150px;"><b>
            		<fmt:formatNumber value="${mathorder.chasingOrder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
            		</b>元<br/>
							方案总金额</li>	
							<li class="sk05" style="width: 350px;">购买时间：${mathorder.chasingOrder.orderDate}<br/>
							方案状态：${mathorder.chasingOrder.stateName}</li>
							
							<li class="sk01" style="width: 208px;">彩种类别：${mathorder.chasingOrder.licenseName}<br/> 
							总&nbsp;期&nbsp;&nbsp;数：${mathorder.chasingOrder.totalIssue} 期
							</li>
							
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
          	<h1 style="border:none">追号详情</h1>
    		</div>

     <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
     
  			<tr>
			    <td width="68" height="33" align="center" bgcolor="#d9e8f0" class="sktit">序号</td>
			    <td width="70" align="center" bgcolor="#d9e8f0" class="sktit">订单号</td>
			    <td width="150" align="center" bgcolor="#d9e8f0" class="sktit">彩种彩期</td>
			    <td width="100" align="center" bgcolor="#d9e8f0" class="sktit">投注内容</td>
			    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">注数</td>
			    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">倍数</td>
			    <td width="104" align="center" bgcolor="#d9e8f0" class="sktit">投注金额</td>
			    <td width="92" align="center" bgcolor="#d9e8f0" class="sktit">状态</td>
			    <td align="center" bgcolor="#d9e8f0" class="sktit">奖金</td>
			  </tr>
			  
			  <c:forEach var="list" items="${mathorder.lotterypin.list}" varStatus="varstatus">
			 
				<c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#effaff"></c:when>
					<c:otherwise><tr bgcolor="#FFFFFF"></c:otherwise>
				</c:choose>
					<td align="center" height="30">
						${varstatus.count+(mathorder.lotterypin.pageNo-1)*mathorder.lotterypin.pageSize}
					</td>
					<td align="center">
						${list.id}
					</td>
					<td align="center">
						${list.licenseName}
					</td>
					<td align="center">
						${fn:replace(list.betCode, ";", "<br>")}
					</td>
					<td align="center">
						${list.betNum}
					</td>
					<td align="center">
						${list.multiple}
					</td>
					<td align="center">
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center">
					   ${fn:replace(list.betStateStr,"等待追号或等待合买","等待追号")}
					   <c:if test="${list.betState=='1'}">
						<input class="btn1"  id="${list.id}" name="cancel" type="button" value="取消"/>
					   </c:if>
					</td>
					
					<td align="center">
						<font class="yuan">
							<fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
							</font>元
					</td>
					</tr>
				</c:forEach>
				<form id="reportForm" name="reportForm" action="/memberCenterNew/DescriptionChase.jhtml" method="post">
					<input type="hidden" name="orderId" value="${mathorder.chasingOrder.id}" />
					<input type="hidden" name="LicenseId" value="${mathorder.chasingOrder.licenseId}" />
				</form>
				
			  <tr>
			    <td height="44" colspan="8" align="center" bgcolor="#effaff"><div class="page">
			    <customertags:paging formId="reportForm" pageNo="${mathorder.lotterypin.pageNo}"
											count="${mathorder.lotterypin.totalCount}" pageSize="${mathorder.lotterypin.pageSize}" />
			    </div></td>
			    </tr>
			  
			</table> 
      </div>
    </div>
    <div class="clear"></div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>