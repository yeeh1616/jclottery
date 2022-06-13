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
<div class="common_w">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 开奖信息 </div>
  </div>
  <!--用户中心-->
  <div class="user_plant">
   <%@include file="menu.jsp" %>
    <div class="user_r">
      <div class="gr-lbody"> 
        <!--方案详情begin-->
        <div class="help_tzxq">
          <div class="help_tzxq_t"><span>${zcorder.lotteryorder.licenseName}</span> <span>${zcorder.lotteryorder.id}号方案详情</span><a href="/lottery/index.jhtml?licenseId=${zcorder.lotteryorder.licenseId }" class="fanhui">继续购买</a><a href="/memberCenterNew/myTeamPurchas.jhtml" class="goon">返回列表</a></div>
          <div class="help_tzxq_c">
            <ul>
              <li class="w_fan"><span class="red"><fmt:formatNumber value="${zcorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></span>元<br />
                方案总金额</li>
              <li class="w_cgong"><span class="red"><fmt:formatNumber value="${zcorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></span>元<br />
                成功出票金额</li>
              <li class="w_zjje"><span class="red">
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
              </span>元<br />
                中奖金额</li>
              <li class="w_gmsj">购买时间：${zcorder.lotteryorder.orderDate}<br />
                方案状态：${zcorder.lotteryorder.stateName2}</li>
              <div class="clear"></div>
            </ul>
            <div class="help_tzxq_tn gcxqym">投注详情 <span></span></div>
            <div class="help_duizheng">
            <table border="0" cellpadding="0" cellspacing="0" class="help_duizhengb" width="100%">
 			
 						<c:choose>
							<c:when test="${zcorder.lotteryorder.licenseId == '5' || zcorder.lotteryorder.licenseId == '6'}"><!--胜负彩-->
							  <tr>
							    <td rowspan="2">对阵</td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td>${hostName}</td>
							     </c:forEach>
							    </tr>
							  <tr>
							   <c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td>${guestName}</td>
							   </c:forEach>
							  </tr>
							</c:when>
							<c:when test="${zcorder.lotteryorder.licenseId == '7'}"><!--半全场-->
							  <tr>
							    <td rowspan="2">对阵</td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td>${hostName}(半)</td>
							     	 <td>${hostName}(全)</td>
							     </c:forEach>
							    </tr>
							  <tr>
							   <c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td>${guestName}(半)</td>
							     	 <td>${guestName}(全)</td>
							   </c:forEach>
							  </tr>
							</c:when>
							<c:otherwise><!--进球彩-->
								 <tr>
							    <td rowspan="2">对阵</td>
							    <c:forEach var="hostName" items="${zcorder.hostlist}" varStatus="varstatus">
							     	 <td>${hostName}</td>
							     	 <td>${zcorder.guestlist[varstatus.index]}</td>
							     </c:forEach>
							     
							     <!--<c:forEach var="guestName" items="${zcorder.guestlist}" varStatus="varstatus">
							     	 <td>${guestName}</td>
							     </c:forEach>-->
							  </tr>
							</c:otherwise>
						</c:choose>
 			
 			</table>
 			
  <div class="help_duizheng_xx">
  <table border="0" cellpadding="0" cellspacing="0" class="help_duitouzhux" width="100%">
  <c:forEach var="betList" items="${zcorder.betList}" varStatus="varstatus">
  <tr>
    <c:choose>
    <c:when test="${zcorder.lotteryorder.licenseId == '5' || zcorder.lotteryorder.licenseId == '6'}"><td class="help_zxi">投注项</td></c:when>
    <c:when test="${zcorder.lotteryorder.licenseId == '7'}"><td width="54px"></td></c:when>
    <c:otherwise><td width="80px"></td></c:otherwise>
    </c:choose>
	<c:forEach var="bet" items="${betList}" varStatus="varstatus">
		<c:choose>
		<c:when test="${varstatus.last}"><td></c:when>
		<c:otherwise>
		<c:choose>
		<c:when test="${zcorder.lotteryorder.licenseId == '5' || zcorder.lotteryorder.licenseId == '6'}"><td width="48"></c:when>
		<c:when test="${zcorder.lotteryorder.licenseId == '7'}"><td width="56"></c:when>
		<c:otherwise><td width="81"></c:otherwise>
		</c:choose>
		</c:otherwise>
		</c:choose>
			<c:if test="${fn:indexOf(bet,':')!=-1}" >
					<c:if test="${fn:substring(bet,fn:indexOf(bet,'`')+1, fn:length(bet)) == '0'}">
					${fn:substring(bet,fn:indexOf(bet,':')+1,fn:indexOf(bet,'`'))}(胆)	
					</c:if>	
					<c:if test="${fn:substring(bet,fn:indexOf(bet,'`')+1, fn:length(bet)) != '0'}">
					${fn:substring(bet,fn:indexOf(bet,':')+1,fn:indexOf(bet,'`'))}
					</c:if>								
			</c:if>	
			<c:if test="${fn:indexOf(bet,':')==-1}" >${bet}</c:if>
		</td>
	</c:forEach>
  </tr>
  </c:forEach>
  </table>
  </div>
  </div>
  </div>


          <div class="help_tzxq_t">方案详情</div>
          <div class="chasenumber chasenumber_ws">
            <div class="chasenumber_xqz new_chasenumber">
              <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh " width="100%">
                <tr>
                  <th width="8%">序号</th>
                  <th width="24%">投注内容</th>
                  <th width="10%">号码类型</th>
                  <th width="8%">注数</th>
                  <th width="10%">倍数</th>
                  <th width="11%">投注金额</th>
                  <th width="11%">奖金</th>
                  <th width="19%" class="zhaungtai">状态</th>
                </tr>
              </table>
              <div class="chasenumber_xq new_chasenumber chasenumber_xqhn">
                <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%">
                <c:forEach var="list" items="${zcorder.ticketspin.list}" varStatus="varstatus">
                  <c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#f4fbff"></c:when>
					<c:otherwise><tr></c:otherwise>										
				</c:choose>
                    <td width="8%">${list.seq}</td>
                    <td width="25%">${fn:replace(list.betcode, ";", "<br>")}</td>
                    <td width="10%">${list.passType}</td>
                    <td width="8%">${list.betNum}</td>
                    <td width="10%">${list.multiple}</td>
                    <td width="11%" class="red"><fmt:formatNumber value="${list.betMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
                    <td width="11%" class="red">
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
                    </td>
                    <td>${list.state}</td>
                  </tr>
                </c:forEach>
                </table>
              </div>
            </div>
            <div class=" clear"></div>
            <div class="pagetotal help_pagetotal" align="center">
     		<form id="reportForm" name="reportForm" action="/memberCenterNew/myTeamOrderDetail.jhtml" method="post">
				<input type="hidden" name="orderId" value="${zcorder.lotteryorder.id}" />
				<input type="hidden" name="LicenseId" value="${zcorder.lotteryorder.licenseId}" />
			</form>
     		<div class="page">
			    <customertags:paging formId="reportForm" pageNo="${zcorder.ticketspin.pageNo}" count="${zcorder.ticketspin.totalCount}" pageSize="${zcorder.ticketspin.pageSize}" />
			</div>	
   			</div>
          </div>
        </div>
        <!--方案详情end--> 
      </div>
    </div>
    <div class=" clear"></div>
    <!--用户中心 end--> 
  </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
