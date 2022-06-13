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
<div class="common_w">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 方案详情 </div>
  </div>
  <!--用户中心-->
  <div class="user_plant">
<%@include file="menu.jsp" %>
    <div class="user_r">
      <div class="gr-lbody"> 
        
        <!--方案详情begin-->
        <div class="help_tzxq">
          <div class="help_tzxq_t"><span>${mathorder.lotteryorder.licenseName}</span> <span>${mathorder.lotteryorder.id}号方案详情</span>
          <a href="/lottery/index.jhtml?licenseId=${mathorder.lotteryorder.licenseId}" class="fanhui">继续购买</a>
          <c:if test="${mathorder.lotteryorder.licenseId == 4 && mathorder.lotteryorder.playType == 'dlt' }">
          	<a href="/lottery/index.jhtml?licenseId=${mathorder.lotteryorder.licenseId}&betCode=${mathorder.lotteryorder.betCode }" class="fanhui">复制投注</a>
          </c:if>
          <a href="/memberCenterNew/purchasList.jhtml" class="goon">返回列表</a></div>
          <div class="help_tzxq_c">
            <ul>
              <li class="w_fan">
              <span class="red">
              <fmt:formatNumber value="${mathorder.lotteryorder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
              </span>元<br />
            	    方案总金额</li>
              <li class="w_cgong">
              <span class="red">
              <fmt:formatNumber value="${mathorder.lotteryorder.ticketMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
              </span>元<br />
            	   成功出票金额</li>
              <li class="w_zjje">
              <span class="red"> 
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
              </span>元<br />
             	   中奖金额</li>
              <li class="w_gmsj">购买时间：${mathorder.lotteryorder.orderDate}<br />
            	    方案状态：${mathorder.lotteryorder.stateName2}</li>
              <div class="clear"></div>
            </ul>
           <div class="help_tzxq_tn">号码详情</div>
            <div class="help_tzxq_hm" style="overflow-y:scroll;">
            <c:forEach var="betList" items="${mathorder.betList[0]}" varStatus="vs">
              <span>${betList}</span>
            </c:forEach>
              <div class="clear"></div>
          </div>
          </div>
          <div class="help_tzxq_t">彩票详情</div>
          <div class="chasenumber_n">
            <div class="new_chasenumber">
              <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh " width="100%">
                <tr>
                  <th width="8%">序号</th>
                  <th width="25%">投注内容</th>
                  <th width="10%">号码类型</th>
                  <th width="8%">注数</th>
                  <th width="10%">倍数</th>
                  <th width="11%">投注金额</th>
                  <th width="11%">状态</th>
                  <th width="17%">奖金</th>
                </tr>
              </table>
              <div class="chasenumber_xqhn">
                <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%">
                  <c:forEach var="list" items="${mathorder.ticketspin.list}" varStatus="varstatus">
                  <c:choose>
					<c:when test="${varstatus.count%2==0}"><tr bgcolor="#f4fbff"></c:when>
					<c:otherwise><tr></c:otherwise>										
				</c:choose>
                    <td width="8%">${list.seq}</td>
                    <td width="25%">${fn:replace(list.betcode, ";", "<br>")}</td>
                    <td width="10%">${list.passType}</td>
                    <td width="9%">${list.betNum}</td>
                    <td width="10%">${list.multiple}</td>
                    <td width="11%" class="red"><fmt:formatNumber value="${list.betMoney}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
                    <td width="13%">${list.state}</td>
                    <td width="16%"class="red">
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
                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
            <div class=" clear"></div>
          </div>
        <div class=" clear"></div>
        <form id="reportForm" name="reportForm" action="/memberCenterNew/orderDetail.jhtml" method="post">
			<input type="hidden" name="orderId" value="${mathorder.lotteryorder.id}" />
			<input type="hidden" name="LicenseId" value="${mathorder.lotteryorder.licenseId}" />
		</form>
        <div class="pagetotal help_pagetotal" align="center">
          <div class="page">
			    <customertags:paging formId="reportForm" pageNo="${mathorder.ticketspin.pageNo}" count="${mathorder.ticketspin.totalCount}" pageSize="${mathorder.ticketspin.pageSize}" />
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
