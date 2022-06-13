<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-用户充值" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 线下充值 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="3" scope="page"></c:set>
  <%@include file="menu.jsp" %>
    <div class="tzgl">
    	<div class="safebox">
        <div class="sftab">
      	<c:if test="${!empty sessionScope.domain.reserved8}" >
        <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneySFT.jhtml'">网银支付</h1>
        <!--<h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneySFTZ.jhtml'">快捷支付</h1>-->
        </c:if>	
      	<c:if test="${!empty sessionScope.domain.reserved6}" >
		    <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyZfb.jhtml'">支付宝</h1>
		    </c:if>	
				<c:if test="${!empty sessionScope.domain.reserved7}" >
		    <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyQuick.jhtml'">连连(含快捷)</h1>
		    </c:if>	
        <h1 class="zz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyOutLine.jhtml'">转账充值</h1>
        <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyList.jhtml'">充值记录</h1>  
      </div>
        
        <div class="notice2"><b>提示：</b>彩民朋友汇款完成后，请联系您的店主为您的购彩账户充值。</div>
        
        <div class="buzhou">
        	<h1>1</h1>到银行柜台汇款或者ATM机转账
        </div>
        
        <div class="buzhoucont">
        	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#cfdee5">
  <tr>
    <td width="138" height="28" align="center" bgcolor="#dae8ef"><strong>开户行</strong></td>
    <td width="228" align="center" bgcolor="#dae8ef"><strong>账号 </strong></td>
    <td align="center" bgcolor="#dae8ef"><strong>收款人</strong></td>
  </tr>
   <c:forEach var="obj" items="${storeBanklist}">
   	<tr>
	    <td height="28" align="center" bgcolor="#fafafa">${obj.accountName}</td>
	    <td align="center" bgcolor="#fafafa" class="textcolr"> ${obj.account} </td>
	    <td align="center" bgcolor="#fafafa">${obj.accountUserName}</td>
	  </tr>
		</c:forEach>
	</table>

        </div>
        
        <div class="buzhou">
        	<h1>2</h1>通知店主
        </div>
        
        <div class="buzhoucont">
          <table width="100%" border="0" cellspacing="4" cellpadding="0">
            <tr>
              <td width="50%" height="30" bgcolor="#fafafa"><h1>店主名称：${store.bossName} </h1></td>
              <td width="50%" bgcolor="#fafafa"><h1>店主手机：${store.storeMobile}</h1></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#fafafa"><h1>店主电话：${store.storePhone} </h1></td>
              <td bgcolor="#fafafa"><h1>店主　QQ：${store.storeQq}</h1></td>
            </tr>
          </table>
        </div>
        
        <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
          <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
