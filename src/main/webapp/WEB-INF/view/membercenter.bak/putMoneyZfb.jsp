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
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
<script type="text/javascript" src="/js/membercenter/moneyZfb.js"></script>
<script>
	$(function(){		
		//设计案例切换
		$('.title-list li').mouseover(function(){
			var liindex = $('.title-list li').index(this);
			$(this).addClass('on').siblings().removeClass('on');
			$('.product-wrap div.product').eq(liindex).fadeIn(150).siblings('div.product').hide();
			var liWidth = $('.title-list li').width();
			$('.zhifu_plant .title-list p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
		});
		
		//设计案例hover效果
		$('.paymethod li').hover(function(){
			$(this).css("border-color","#ff6600");
			$(this).find('p > a').css('color','#ff6600');
		},function(){
			$(this).css("border-color","#fafafa");
			$(this).find('p > a').css('color','#666666');
		});
	});

	function doCheck(obj){
		$(obj).prev().attr("checked",true);
		$("#putmoneySubmit").trigger("click");
	}
</script>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 充值 </div>
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
		    <h1 class="zz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyZfb.jhtml'">支付宝</h1>
		    </c:if>	
				<c:if test="${!empty sessionScope.domain.reserved7}" >
		    <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyQuick.jhtml'">连连(含快捷)</h1>
		    </c:if>	
        <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyOutLine.jhtml'">转账充值</h1>
        <h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyList.jhtml'">充值记录</h1>  
      </div>
      <div class="notice2"><b>提示：</b>您需要有一张已开通网银支付功能的储蓄卡或信用卡，充值0手续费</div>
  <!--新增加一个DIV 网银充值-->    
      <div class="cx_plant">
     <!--注意：这里有3个LOGO 一个是支付宝(zhifub)一个是盛付通（shengft）一个是连连支付（lianl）调用对应的CSS-->
      <div class="zhifub"></div>
     <!--注意：这里有3个LOGO 一个是支付宝(zhifub)一个是盛付通（shengft）一个是连连支付（lianl）调用对应的CSS end-->
      <div class="cz_title">银行卡充值</div>
      <div class="cz_money"> 充值金额：
      <div class="bi-input" style="width:150px;">
                <input name="currMoney" type="text"  id="currMoney" class="bi-i-text" style="width:150px;" placeholder="输入金额" maxlength="25">
            </div>
        <span style="padding:0 10px 0 10px">元</span> <span class="st" id="currMoneyState"><img src="/images/war.gif"/ style="border: 0 none;padding:5px 5px 0 5px;vertical-align: -3px;">输入充值金额</span></div>
<div class="clear"></div>
<div class="zhifu_plant">
  <div class="titles cf">
    <ul class="title-list cf ">
      <li class="on">网银支付</li>
      <p><b></b></p>
    </ul>
  </div>
  <div class="product-wrap">
    <div class="product showx">
      <div class="paymethod">
         <ul>
          <li>
            <input type="radio" checked values="工商银行" value="ICBCB2C" name="payBank" style="display:none">
            <img src="/images/bank/ICBCB2C.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="建设银行" value="CCB" name="payBank" style="display:none">
            <img src="/images/bank/CCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="农业银行" value="ABC" name="payBank" style="display:none">
            <img src="/images/bank/ABC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="招商银行" value="CMB" name="payBank" style="display:none">
            <img src="/images/bank/CMB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="交通银行" value="COMM" name="payBank" style="display:none">
            <img src="/images/bank/COMM.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="中国银行" value="BOC" name="payBank" style="display:none">
            <img src="/images/bank/BOC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="光大银行" value="CEB" name="payBank" style="display:none">
            <img src="/images/bank/CEB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="民生银行" value="CMBC" name="payBank" style="display:none">
            <img src="/images/bank/CMBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="中信银行" value="CITIC" name="payBank" style="display:none">
            <img src="/images/bank/CITIC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="兴业银行" value="CIB" name="payBank" style="display:none">
            <img src="/images/bank/CIB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="华夏银行" value="HXBANK" name="payBank" style="display:none">
            <img src="/images/bank/HXB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="东亚银行" value="HKBEA" name="payBank" style="display:none">
            <img src="/images/bank/HKBEA.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="上海银行" value="SHBANK" name="payBank" style="display:none">
            <img src="/images/bank/BOS.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="中国邮政储蓄银行" value="PSBC-DEBIT" name="payBank" style="display:none">
            <img src="/images/bank/PSBC-DEBIT.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="南京银行" value="NJCB" name="payBank" style="display:none">
            <img src="/images/bank/NJCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="汉口银行" value="HKB" name="payBank" style="display:none">
            <img src="/images/bank/HKBCHINA.png"  onclick="doCheck(this)" /> </li>
          <li>
          	<input type="radio" values="浦东发展银行" value="SPDB" name="payBank" style="display:none">
            <img src="/images/bank/SPDB.png"  onclick="doCheck(this)" /> </li>
           <li>
            <input type="radio" values="广东发展银行" value="GDB" name="payBank" style="display:none">
            <img src="/images/bank/GDB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="平安银行" value="SPABANK" name="payBank" style="display:none">
            <img src="/images/bank/SZPAB.png"  onclick="doCheck(this)" /> </li>
         </ul>
      </div>
    </div>
  </div>
</div>
</div>
      <div class="clear"></div>
  <!--新增加一个DIV 网银充值 end-->  
  <!--平台支付------------------->        
      <div class="cz_title ">平台支付</div>
      <div class="zhifu_plant" style="padding-top:5px;">
  <div class="product-wrap">
    <div class="product showx" style="height:70px;">
      <div class="paymethod" style="margin-top:0px;">
        <ul>
          <li>
          <li>
            <input type="radio" values="支付宝" value="directPay" name="payBank" style="display:none">
            <img src="/images/bank/directPay.png"  onclick="doCheck(this)" /> </li>
        </ul>
      </div>
    </div>
  </div>
</div>
 <!--平台支付  end------------------->   
            <div class="clear"></div>
            <div class="cz-tijiao">
      	        	      	<c:choose>
											<c:when test="${!empty sessionScope.domain.reserved6}">
											<input name="putmoneySubmit" type="submit" class="addbtn2" id="putmoneySubmit" value="提交" style="cursor:pointe;display:none"/>
	        	      	  为了防止套现和洗钱，充值后需消费30%，剩余金额才可以提款.
											</c:when>
											<c:otherwise>
											       <font color="red">您的店铺还未开通线上充值方式！请联系您的店主或选择其他充值方式。</font>
											</c:otherwise>
										</c:choose>
                                        </div>
      <br />
      <br />
      <br />
      <br />
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
