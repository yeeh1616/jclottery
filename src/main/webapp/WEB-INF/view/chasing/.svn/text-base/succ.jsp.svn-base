<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="追号成功" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="memberbox">
  <div class="tzgl" style="width:100%">
    <div class="uindex topscuess">
    
    <div class="scleft">
    
    <div class="bd_scuess">
           	<div class="sctxt">
                提交成功</div>
            <div class="scntic">
              <h1>
              	<c:choose>
									<c:when test="${sessionScope.member.memberFrom == '5' }"> <b style="color:red">您是营业厅用户，请到‘购彩记录’中确认您的方案。</b><br> </c:when>
									<c:otherwise><tr bgcolor="#FFFFFF">您好 ${sessionScope.member.memberName }  恭喜方案订单提交成功！！<br></c:otherwise>										
								</c:choose>
              </h1>
              <div class="bdxinxi"> 本次追号投注：<strong> ${order.betPrice }</strong> 元<br/>
              
              <strong><font color=red id="errMsgId">
              <c:if test="${order.reserved10 != null }">
              	店铺目前处于锁定管理状态，请立即联系店主后完成您的投注。
              </c:if>
             </font> </strong> <br />
		<!--账户余额：<strong> 10.00</strong> 元<br />
              红包余额：  <strong>10.00</strong> 元<br />-->
              <br />
              <!--<a href="#">返回继续购买</a> |--> <a href="/memberCenterNew/zhfax.jhtml?orderId=${order.id }&LicenseId=${order.licenseId}">查看方案详情</a> | <a href="/memberCenterNew/chaseList.jhtml">我的追号记录</a> </div>
            </div>
          </div>
    
    	
    
    <div class="wxts"><h1>温馨提示</h1>
      1： 平台提供的数据仅供参考，所有彩票数据均以真实彩票的票面信息为准<br />
      2： 您可以通过“方案详情”或“购买记录”查询方案提交及出票状态。</div>
    
    </div>
    </div>
        
        </div>
        <div class="clear"></div>
  </div>
  <div class="clear"></div>

<jsp:include page="../include/footer.jsp"></jsp:include>

<c:if test="${order.reserved10 != null }">
              	<script type="text/javascript" >
              		//alert($("#errMsgId").html());
              		popupConfirm("温馨提示",$("#errMsgId").html());
              	</script>
              </c:if>
</body>
</html>