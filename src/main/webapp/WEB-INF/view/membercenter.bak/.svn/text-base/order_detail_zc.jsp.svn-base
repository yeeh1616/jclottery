<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-足彩方案详情" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 足彩方案详情 </div>
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
           ${zcorder.lotteryorder.licenseName}  <font class="rq">${zcorder.lotteryorder.issue} 期</font>   
           <font class="bh">${zcorder.lotteryorder.id}</font>号方案详情</div>
          <div class="contniu"><a href="/lottery/index.jhtml?licenseId=${zcorder.lotteryorder.licenseId }">继续购买</a></div>
        </div>
          <div class="clear"></div>
        <div class="sekuai">
          	<ul>
            	<li class="sk01"><b>
            		<fmt:formatNumber value="${zcorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
            		</b>元<br/>
							<span>方案总金额</span></li>
							<li class="sk02"><b>
								<fmt:formatNumber value="${zcorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
								</b>元<br/>
							<span>成功出票金额</span></li>
							<li class="sk03"><b>
								<c:choose>
								<c:when test="${zcorder.lotteryorder.betState > 11}">
									<fmt:formatNumber value="${zcorder.lotteryorder.initBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${zcorder.lotteryorder.betState == 9 || zcorder.lotteryorder.betState == 10}">
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
							<li class="sk05" style="width: 347px;">购买时间：${zcorder.lotteryorder.orderDate}<br/>
							方案状态：${zcorder.lotteryorder.stateName2}</li>
            </ul>
          </div>
          
          <div class="tzxq">
          	<h1 style="border:none">投注详情</h1>
          </div>
          <div style="overflow-x: auto; overflow-y: auto; height: 200px;">
	          <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7" class="football_tzxq">
	          <c:choose>
							<c:when test="${zcorder.lotteryorder.licenseId == '5' || zcorder.lotteryorder.licenseId == '6'}"><!--胜负彩-->
							  <tr>
							    <td width="74" height="33" rowspan="2" align="center" bgcolor="#d9e8f0"><p>对阵</p></td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td width="52" height="30" align="center" bgcolor="#FFFFFF">${hostName}</td>
							     </c:forEach>
							    </tr>
							  <tr>
							   <c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td width="52" height="30" align="center" bgcolor="#effaff">${guestName}</td>
							   </c:forEach>
							  </tr>
							</c:when>
							<c:when test="${zcorder.lotteryorder.licenseId == '7'}"><!--半全场-->
							  <tr>
							    <td width="74" height="33" rowspan="2" align="center" bgcolor="#d9e8f0"><p>对阵</p></td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td width="52" height="30" align="center" bgcolor="#FFFFFF">${hostName}(半)</td>
							     	 <td width="52" height="30" align="center" bgcolor="#FFFFFF">${hostName}(全)</td>
							     </c:forEach>
							    </tr>
							  <tr>
							   <c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td width="52" height="30" align="center" bgcolor="#effaff">${guestName}(半)</td>
							     	 <td width="52" height="30" align="center" bgcolor="#effaff">${guestName}(全)</td>
							   </c:forEach>
							  </tr>
							</c:when>
							<c:otherwise><!--进球彩-->
								 <tr>
							    <td width="74" height="33" align="center" bgcolor="#d9e8f0"><p>对阵</p></td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td width="70" height="30" align="center" bgcolor="#FFFFFF">${hostName}</td>
							     	 <td width="70" height="30" align="center" bgcolor="#FFFFFF">${zcorder.guestlist[varstatus.index]}</td>
							     </c:forEach>
							     
							     <!--<c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td width="70" height="30" align="center" bgcolor="#FFFFFF">${guestName}</td>
							     </c:forEach>-->
							  </tr>
							</c:otherwise>
						</c:choose>
				   <c:forEach var="betList" items="${zcorder.betList}" varStatus="varstatus">
				     <tr>
				     	<td height="30" align="center" bgcolor="#FFFFFF">投注项</td>
				     		<c:forEach var="bet" items="${betList}" varStatus="varstatus">
								<td align="center" bgcolor="#FFFFFF"><strong>
									<c:if test="${fn:indexOf(bet,':')!=-1}" >
										<c:if test="${fn:substring(bet,fn:indexOf(bet,'`')+1, fn:length(bet)) == '0'}">
										${fn:substring(bet,fn:indexOf(bet,':')+1,fn:indexOf(bet,'`'))}(胆)	
										</c:if>	
										<c:if test="${fn:substring(bet,fn:indexOf(bet,'`')+1, fn:length(bet)) != '0'}">
										${fn:substring(bet,fn:indexOf(bet,':')+1,fn:indexOf(bet,'`'))}
										</c:if>								
									</c:if>	
									<c:if test="${fn:indexOf(bet,':')==-1}" >
										${bet}									
									</c:if>
								</strong>
								</td>
						 </c:forEach>
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
			  <c:forEach var="list" items="${zcorder.ticketspin.list}" varStatus="varstatus">
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
					<input type="hidden" name="orderId" value="${zcorder.lotteryorder.id}" />
					<input type="hidden" name="LicenseId" value="${zcorder.lotteryorder.licenseId}" />
				</form>
			  <tr>
			    <td height="44" colspan="8" align="center" bgcolor="#effaff"><div class="page">
			    <customertags:paging formId="reportForm" pageNo="${zcorder.ticketspin.pageNo}"
											count="${zcorder.ticketspin.totalCount}" pageSize="${zcorder.ticketspin.pageSize}" />
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
