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
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
</head>
<body>
<!--顶部 end--> 
<!--header-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!--header end-->
<div class="common_w">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/chaseList.jhtml">追号记录</a> > 追号详情</div>
  </div>
  <script type="text/javascript" src="/js/membercenternew/purchasList.js"></script>
  <!--用户中心-->
  <div class="user_plant">
	<%@include file="menu.jsp"%>
    <div class="user_r">
      <div class="gr-lbody"> 
        <!--方案详情begin-->
        <div class="help_tzxq">
          <div class="help_tzxq_t">${mathorder.chasingOrder.licenseName}   <font class="bh">${mathorder.chasingOrder.id}</font>号追号方案详情单</span><a href="/lottery/index.jhtml?licenseId=${mathorder.chasingOrder.licenseId }" class="fanhui">继续购买</a><a href="/memberCenterNew/chaseList.jhtml" class="goon">返回列表</a></div>
          <div class="help_tzxq_c">
            <ul>
              <li class="w_fan_n"><span class="red"><fmt:formatNumber value="${mathorder.chasingOrder.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></span>元<br />
                方案总金额</li>
              <li class="w_cgongc">彩种类别：${mathorder.chasingOrder.licenseName}<br />
                总 期  数：${mathorder.chasingOrder.totalIssue} 期</li>
              <li class="w_gmsjj">购买时间：${mathorder.chasingOrder.orderDate}<br />
                方案状态：${mathorder.chasingOrder.stateName}</li>
              <div class="clear"></div>
            </ul>
            <div class="help_tzxq_tn">号码详情</div>
            <div class="help_tzxq_hm" style="overflow-y:scroll;">
            <c:forEach var="betList" items="${mathorder.betList[0]}" varStatus="vs">
              <span>${betList}</span>
            </c:forEach>
            
			  <!--<span>${fn:replace(mathorder.chasingOrder.betCode, ';', '</span>|<span>')}</span>
              --><div class="clear"></div>
          </div>
          </div>
          <div class="help_tzxq_t">追号详情</div>
          <div class="chasenumber ">
            <div class="chasenumber_top">追号总期数：
              <span>${mathorder.chasingOrder.totalIssue}</span>期<a name="${mathorder.chasingOrder.id}" name2="${mathorder.chasingOrder.licenseId}" id="qbcd" class="new_chasenumber_n">全部撤单</a> </div>
            <div class="chasenumber_xqz new_chasenumber">
              <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%">
                <tr>
                  <th width="10%">序号</th>
                  <th width="10">订单号</th>
                  <th width="20%">追号期数</th>
                  <th width="10%">倍投数</th>
                  <th width="10%">金额</th>
                  <th width="10%">奖金</th>
                  <th width="15%">预计开奖时间</th>
                  <th width="15%">状态</th>
                </tr>
				 <c:forEach var="list" items="${mathorder.lotterypin.list}" varStatus="varstatus">
					<!--下面的代码换行和变颜色的作用-->
					<tr>
					<td align="center" height="30">
						${varstatus.count+(mathorder.lotterypin.pageNo-1)*mathorder.lotterypin.pageSize}
					</td>
					<td>
						${list.id}
					</td>
					<td align="center">
						${list.licenseName}
					</td>
					<td align="center">
						${list.multiple}
					</td>
					<td align="center" class="red">
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td align="center" class="red">
						<font class="yuan">
							<fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
							</font>元
					</td>
					<td align="center">
					${fn:substring(list.reserved19,0,10)}
					</td>
					<td align="center">
					   ${fn:replace(list.betStateStr,"等待追号或等待合买","等待追号")}
					   <c:if test="${list.betState=='1'}">
						<input class="btn1"  id="${list.id}" name="cancel" type="button" value="取消"/>
					   </c:if>
					</td>
				</tr>
          </c:forEach>
              </table>
             
          </div>
           <div class="pagetotal">
							<div class="ptotal">
								<customertags:paging formId="reportForm" pageNo="${mathorder.lotterypin.pageNo}"
											count="${mathorder.lotterypin.totalCount}" pageSize="${mathorder.lotterypin.pageSize}" />
						    </div>
						</div>
        </div>
        
        <form id="reportForm" name="reportForm" action="/memberCenterNew/zhfax.jhtml" method="post">
					<input type="hidden" name="orderId" value="${mathorder.chasingOrder.id}" />
					<input type="hidden" name="LicenseId" value="${mathorder.chasingOrder.licenseId}" />
				</form>
        <!--方案详情end--> 
         
      </div>
    </div>
    <div class=" clear"></div>
    <!--用户中心 end--> 
  </div>
</div>
<!--footer-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!--footer end-->

</body>
</html>
