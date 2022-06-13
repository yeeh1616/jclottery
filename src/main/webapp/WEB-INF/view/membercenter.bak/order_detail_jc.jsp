<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-竞彩方案详情" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 竞彩方案详情 </div>
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
           ${guessorder.lotteryorder.licenseName}<font class="bh">${guessorder.lotteryorder.id}</font></font>号方案详情</div>
          <div class="contniu"><a href="/lottery/index.jhtml?licenseId=${guessorder.lotteryorder.licenseId }">继续购买</a></div>
        </div>
          <div class="clear"></div>
        <div class="sekuai">
          	<ul>
            	<li class="sk01"><b>
            		 <fmt:formatNumber value="${guessorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
            		</b>元<br/>
							<span>方案总金额</span></li>
							<li class="sk02"><b>
								 <fmt:formatNumber value="${guessorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
								</b>元<br/>
							<span>成功出票金额</span></li>
							<!--<li class="sk03"><b>
								 <fmt:formatNumber value="${guessorder.lotteryorder.theoryBonus}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
								</b>元<br/>
							<span>投注时理论奖金</span></li>-->
							<li class="sk03"><b>
								<c:choose>
								<c:when test="${guessorder.lotteryorder.betState > 11}">
									<fmt:formatNumber value="${guessorder.lotteryorder.initBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${guessorder.lotteryorder.betState == 9 || guessorder.lotteryorder.betState == 10}">
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
							<li class="sk05" style="width: 347px;">购买时间：${guessorder.lotteryorder.orderDate}<br/>
							方案状态：${guessorder.lotteryorder.stateName2}</li>
            </ul>
          </div>
          
          <div class="tzxq">
          	<h1>投注详情</h1>        选择场次：${fn:length(guessorder.schudles)}场 过关方式：${fn:replace(guessorder.lotteryorder.passType, 'c', '串')  }
          </div>
          <div style="overflow-x: auto; overflow-y: auto; height: 200px;">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
					  <tr>
					    <td width="108" height="33" align="center" bgcolor="#d9e8f0" class="sktit">场次</td>
					    <c:if test="${param.LicenseId == 10}">
					    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">客队</td>
					    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">主队</td>
					    </c:if>
					    <c:if test="${param.LicenseId == 9}">
					    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">主队</td>
					    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">客队</td>
					    </c:if>
					    <td width="118" align="center" bgcolor="#d9e8f0" class="sktit">半场比分</td>
					    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">全场比分</td>
					    <td width="162" align="center" bgcolor="#d9e8f0" class="sktit">投注项</td>
					    <td align="center" bgcolor="#d9e8f0" class="sktit">设胆</td>
					  </tr>
					  <c:forEach var="list" items="${guessorder.schudles}" varStatus="varstatus">
							<c:choose>
								<c:when test="${varstatus.count%2==0}"><tr bgcolor="#effaff"></c:when>
								<c:otherwise><tr bgcolor="#FFFFFF"></c:otherwise>										
							</c:choose>
							<td align="center">
								${list.schudle}
							</td>
							<c:if test="${param.LicenseId == 9}">
							<td height="30" align="center">
								${list.hostName}
							</td>
							<td align="center">
								${list.guestName}
							</td>
							</c:if>
							<c:if test="${param.LicenseId == 10}">
							<td align="center">
								${list.guestName}
							</td>
							<td height="30" align="center">
								${list.hostName}
							</td>
							</c:if>
							<td align="center">
								${list.halfScore}
							</td>
							<td align="center">
								${list.totalScore}
							</td>
							<td align="center">
								<span class="tzxkuai">${list.bets}</span>
							</td>
							<td align="center">
							<c:choose>
								<c:when test="${list.dan}"><img src="/images/touzhu_11.png" width="20" height="20" /></c:when>
								<c:otherwise></c:otherwise>
							</c:choose>										
							</td>
						</tr>
						</c:forEach>				
					</table>
				</div>
				
				<c:if test="${guessorder.lotteryorder.betState == 8}">
				<div style="float:right;"><a href="javascript:void 0" id="repeatBtnId" style="width:98px;height:35px;display: inline-block;color: #fff !important;
text-align: center;margin-top: 8px;border-radius: 3px;font-size: 16px;line-height:35px;
font-weight: bold;
margin-right:2px;background:#2E94C8;">重复下单</a><img src="/images/new.gif" width="28" height="28"/></div>
				</c:if>
				
				
			<div class="blank" style="height:10px"></div>
		    <div class="tzxq">
		          	<h1 style="border:none">彩票详情</h1>
		    </div>
		    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
		  <tr>
    <td width="68" height="33" align="center" bgcolor="#d9e8f0" class="sktit">序号</td>
    <td width="250" align="center" bgcolor="#d9e8f0" class="sktit">场次和出票赔率</td>
    <td width="88" align="center" bgcolor="#d9e8f0" class="sktit">过关方式</td>
    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">注数</td>
    <td width="56" align="center" bgcolor="#d9e8f0" class="sktit">倍数</td>
    <td width="104" align="center" bgcolor="#d9e8f0" class="sktit">投注金额</td>
    <td width="70" align="center" bgcolor="#d9e8f0" class="sktit">状态</td>
    <td align="center" bgcolor="#d9e8f0" class="sktit">奖金</td>
  </tr>
 <c:forEach var="list" items="${guessorder.ticketspin.list}" varStatus="varstatus">
	<c:choose>
		<c:when test="${varstatus.count%2==0}"><tr bgcolor="#effaff"></c:when>
		<c:otherwise><tr bgcolor="#FFFFFF"></c:otherwise>
	</c:choose>
	<td align="center">
		${list.seq}
	</td>
	<td height="30" align="left" style="padding:0 0 0 3px">
		${list.schOdds}
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
	<input type="hidden" name="orderId" id="orderRpId" value="${guessorder.lotteryorder.id}" />
	<input type="hidden" name="LicenseId" value="${guessorder.lotteryorder.licenseId}" />
</form>
  <tr>
    <td height="44" colspan="8" align="center" bgcolor="#effaff"><div class="page">
    <customertags:paging formId="reportForm" pageNo="${guessorder.ticketspin.pageNo}"
								count="${guessorder.ticketspin.totalCount}" pageSize="${guessorder.ticketspin.pageSize}" />
    </div></td>
    </tr>
</table> 
        
      </div>
    </div>
    <div class="clear"></div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function () {
	$("#repeatBtnId").click(function(){
		if ( confirm("您确定要重复投注该订单吗？") ) {
			$.ajax( {
				type : "POST",
				url : "/copyorder/repeat.json",
				data: "orderId=" + $("#orderRpId").val(),
				dataType: "text",
				async:false, //同步请求方式
				error : function(xMLHttpRequest, textStatus, errorThrown) {
					layer.alert("与服务器通讯失败！",0);
				},
				success : function(data) {
					alert(data);
					window.location.reload();
				}
			});
		}
	});
});
</script>
</body>
</html>
