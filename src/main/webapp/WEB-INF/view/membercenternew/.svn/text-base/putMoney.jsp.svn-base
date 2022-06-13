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
<script type="text/javascript" src="/js/common/base.js"></script>
<script>
	var dtype = '${param.type}';
	var oldMeney ='${param.currMoney}';
</script>
<script type="text/javascript" src="/js/membercenternew/money.js"></script>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">资金管理</a> > 账户充值 </div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">账户充值</div>
      <div class="gr-safe-r"><a href="/memberCenterNew/capital.jhtml">&lt;&lt; 返回资金管理</a></div><div class="clear"></div>
    </div>
    <!--安全等级end--> 
	<div class="gr-lbody">     
    <!--具体信息begin-->
    
	<div class="w_gcjl">
		<c:set var="btnNum" value="5" scope="page"></c:set>
		<%@include file="titleButtonsForRecharging.jsp"%>
		
		<!-- 充值操作 -->
		<div class="chongz">  
			<input type="hidden" name="payBank" id="payBank">
		   <h3>充值方式</h3>
		   <c:if test="${!empty storeObj.twoStoreId && storeObj.twoStoreId == '1'}" >
		   	<!--<div class="payment-item" id="putMoneyHFBX"  title="支持多种转账方式"><b></b>汇付宝快捷</div>-->
		   	<!--<div class="payment-item" id="putMoneyHFBJ"  title="支持多种转账方式"><b></b>汇付宝网银<font color="red">&nbsp;(支持小额快捷)&nbsp;</font></div>-->
		   </c:if>
		   <c:if test="${!empty storeYeepay && storeYeepay.state == '1'}" >
		   <!--<div class="payment-item" id="putMoneyYEEPAY"  title="易宝支付"><b></b>易宝支付<font color="red">&nbsp;(支持微信付款)&nbsp;</font></div>-->
		   </c:if>
		   <c:if test="${!empty storeObj.reserved6  && storeObj.reserved6 == '1'}" >		
		   	<!--<div class="payment-item" id="putMoneyHFBALIPAY"  title="支付宝扫一扫"><b></b>支付宝充值</div>-->
		   </c:if>
		   <c:if test="${!empty storeObj.reserved8}" >
		   	<div class="payment-item" id="putMoneySFT" title="支持信用卡,借记卡"><b></b>盛付通支付</div>
		   	 <c:if test="${storeObj.reserved6 == 'on'}" >
		   		<div class="payment-item" id="putMoneySFTQRCode" title="微信/支付宝"><b></b>微信/支付宝</div>
		  	 </c:if>
		   	<!--<div class="payment-item" id="putMoneySFTK" title="支持信用卡,借记卡"><b></b>盛付通快捷</div>-->
		   	<!--<input type="radio" values="网银支付" value="SFT" name="payBank" channel="1" style="display:none"/>
		   	<div class="payment-item" id="putMoneySFTW" title="支持信用卡,借记卡"><b></b>网银充值</div>-->
		   </c:if>
		   	
		   <!--<c:if test="${!empty storeObj.reserved6}" >		
		   	<div class="payment-item" id="putMoneyZFB"  title="支持信用卡,借记卡，支付宝钱包"><b></b>支付宝充值</div>
		   </c:if>-->
		   <c:if test="${!empty storeObj.reserved7}" >
            <div class="payment-item" id="putMoneyXunYi" title="支持信用卡,借记卡"><b></b>讯易支付</div>
           </c:if>  
		   <div class="payment-item" id="putMoneyEVM"  title="支持多种转账方式"><b></b>离线二维码</div>
		   <div class="payment-item" id="putMoneyZZCZ"  title="支持多种转账方式"><b></b>转账充值</div>
		   <div class="clear"></div>
		   
		</div>

		<div id="includDiv">
		 <jsp:include page="moneyButton.jsp"></jsp:include>  
		</div>
		<div id="includDiv2" style="display:none">
		  <iframe id='footerIframe' src='' width='100%' height='100%' frameborder='0' marginwidth='0' marginheight='0' scrolling='no'></iframe>
		</div>
  </div>
</div>
<div class="clear"></div>
</div>
<div class=" clear"></div>
</div>
</div>
<!--用户中心 end--> 
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>
