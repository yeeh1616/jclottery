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
<script type="text/javascript" src="/js/jquery.form.js"></script>
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
          <div class="help_tzxq_t"><span>${guessorder.lotteryorder.licenseName}</span> <span>${guessorder.lotteryorder.id}号方案详情</span><a href="/lottery/index.jhtml?licenseId=${guessorder.lotteryorder.licenseId }" class="fanhui">继续购买</a><a href="/memberCenterNew/purchasList.jhtml" class="goon">返回列表</a></div>
          <div class="help_tzxq_c">
            <ul>
              <li class="w_fan"><span class="red"><fmt:formatNumber value="${guessorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></span>元<br />
                方案总金额</li>
              <li class="w_cgong"><span class="red"><fmt:formatNumber value="${guessorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></span>元<br />
                成功出票金额</li>
              <li class="w_zjje">
              <span class="red">
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
              </span>元<br />
                	中奖金额
                </li>
              <li class="w_gmsj">购买时间：${guessorder.lotteryorder.orderDate}<br />
                方案状态：${guessorder.lotteryorder.stateName2}</li>
              <div class="clear"></div>
            </ul>
            <div class="help_tzxq_tn gcxqym">投注详情 <span>选择场次：${fn:length(guessorder.schudles)}场 过关方式：${fn:replace(guessorder.lotteryorder.passType, 'c', '串')  }</span></div>
            <div class="help_tzxq_gcxqym">
              <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_tz">
                <tr>
                  <th width="90">场次</th>
                  <c:choose>
                  	<c:when test="${guessorder.lotteryorder.licenseId == 10}">
                  		<th width="90">客队</th>
                  		<th width="90">主队</th>
                  	</c:when>
                  	<c:otherwise>
                  		<th width="90">主队</th>
                  		<th width="90">客队</th>
                  	</c:otherwise>
                  </c:choose>
                  <th width="90">半场比分</th>
                  <th width="90">全场比分</th>
                  <th width="205">投注项</th>
                  <th>设胆</th>
                </tr>
              </table>
              <div class="help_tzxq_gcxqnr">
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class=" w_gcjl_tz_n">
                 <c:forEach var="list" items="${guessorder.schudles}" varStatus="varstatus">
                  
              	<c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#f4fbff"></c:when>
					<c:otherwise><tr></c:otherwise>										
				</c:choose>
                    <td width="90">${list.schudle}</td>
                    <c:choose>
                  	<c:when test="${guessorder.lotteryorder.licenseId == 10}">
                  		<td width="90">${list.guestName}</td>
                    	<td width="90">${list.hostName}</td>
                  	</c:when>
                  	<c:otherwise>
                  		<td width="90">${list.hostName}</td>
                    	<td width="90">${list.guestName}</td>
                  	</c:otherwise>
                  </c:choose>
                    
                    <td width="90">${list.halfScore}</td>
                    <td width="90">${list.totalScore}</td>
                    <td width="205"><div class="tzxkuai">${list.bets}</div>
                    <c:if test="${list.spValue != null}">
                    		SP:<font color=red>${list.spValue }</font>
                    </c:if>
                    </td>
                    <td>
                    <c:choose>
											<c:when test="${list.dan}"><img src="/images/touzhu_11.png" width="20" height="20" /></c:when>
											<c:otherwise></c:otherwise>
										</c:choose>			
                    </td>
                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
          </div>
          <div class="help_tzxq_t">彩票详情</div>
          <div class="chasenumber_n">
            <div class="new_chasenumber">
              <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh " width="100%">
                <tr>
                  <th width="7%">序号</th>
                  <th width="32%">场次和出票赔率</th>
                  <th width="9%">过关方式</th>
                  <th width="7%">注数</th>
                  <th width="9%">倍数</th>
                  <th width="10%">投注金额</th>
                  <th width="10%">奖金</th>
                  <th width="16%">状态</th>
                </tr>
              </table>
              <div class="chasenumber_xqhn">
                <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%">
                  <c:forEach var="list" items="${guessorder.ticketspin.list}" varStatus="varstatus">
                  <c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#f4fbff"></c:when>
					<c:otherwise><tr></c:otherwise>										
				</c:choose>
                    <td width="7%">${list.seq}</td>
                    <td width="32%" class="chasenumber_qhf">${list.schOdds}</td>
                    <td width="9%">${list.passType}</td>
                    <td width="8%">${list.betNum}</td>
                    <td width="9%">${list.multiple}</td>
                    <td width="10%" class="red"> <fmt:formatNumber value="${list.betMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
                    <td width="10%" class="red">
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
                    <td width="16%">${list.state}</td>
                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
            <div class=" clear"></div>
          </div>
        </div>
        <div class=" clear"></div>
        <div class="pagetotal help_pagetotal" align="center">
        <form id="reportForm" name="reportForm" action="/memberCenterNew/orderDetail.jhtml" method="post">
			<input type="hidden" name="orderId" value="${guessorder.lotteryorder.id}" />
			<input type="hidden" name="LicenseId" value="${guessorder.lotteryorder.licenseId}" />
		</form>
        <div class="page">
   			 <customertags:paging formId="reportForm" pageNo="${guessorder.ticketspin.pageNo}" count="${guessorder.ticketspin.totalCount}" pageSize="${guessorder.ticketspin.pageSize}" />
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
