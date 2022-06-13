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
<script type="text/javascript" src="/js/membercenternew/money2.js"></script>
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
<input name="putmoneySubmit" type="submit" class="addbtn2" id="putmoneySubmit" value="提交" style="cursor:pointe;display:none"/>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">资金管理</a> > 账户充值</div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">

    <div class="gr-safedj">
      <div class="gr-safe-l">资金管理 </div>
      <div class="gr-safe-r"><a href="/memberCenterNew/capital.jhtml">&lt;&lt; 返回资金管理</a></div><div class="clear"></div>
    </div>
    
<div class="gr-lbody">     
   
    <!--具体信息begin-->
	<div class="w_gcjl">
	<c:set var="btnNum" value="5" scope="page"></c:set>
	<%@include file="titleButtonsForRecharging.jsp"%>
	</div>
	<div class="notice2"><b>提示：</b>由盛付通提供支付通道。单笔5000元，月累计20000元</div>
	<div class="cz_title">
		银行卡快捷充值
		 <font style="padding:0 0 0 50px;color: #e4393c;font-family: Arial,Helvetica,sans-serif;font-size: 20px;font-weight: 700;">
		     充值金额：${param.currMoney}
		  </font>
		  <span class="total"><a href="/memberCenterNew/putMoney.jhtml" style="color: #1C7FC3;font-size: 12px;">修改金额&gt;&gt;</a></span>
		<input type="hidden" name="currMoney" id="currMoney" value="${param.currMoney}">
		</div>
	<!--<div class="cz_money"> 
	<div class="bi-input" style="width:150px;">
				<input name="currMoney" type="text"  id="currMoney" class="bi-i-text" style="width:150px;" placeholder="输入金额" maxlength="25">
			</div>
			<span style="padding:0 10px 0 10px">元</span> <span class="st" id="currMoneyState"><img src="/images/war.gif"/ style="border: 0 none;padding:5px 5px 0 5px;vertical-align: -3px;">输入充值金额</span>
	
	</div>-->
  
	<div class="clear"></div>

<div class="zhifu_plant">
  <div class="titles cf">
    <ul class="title-list cf ">
      <li class="on">储蓄卡支付</li>
      <li>信用卡支付</li>
      <p><b></b></p>
    </ul>
  </div>
  <div class="product-wrap">
    <div class="product showx">
      <div class="paymethod">
         <ul>
         <li>
            <input type="radio" values="中国银行" value="BOC" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/BOC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="工商银行" value="ICBC" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/ICBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="建设银行" value="CCB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/CCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="招商银行" value="CMB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/CMB.png"  onclick="doCheck(this)" /> </li>
          <!--<li>
            <input type="radio" values="农业银行" value="ABC" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/ABC.png"  onclick="doCheck(this)" /> </li>-->
          <li>
            <input type="radio" values="交通银行" value="COMM" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/COMM.png"  onclick="doCheck(this)" /> </li>
          <!--<li>
            <input type="radio" values="兴业银行" value="CIB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/CIB.png"  onclick="doCheck(this)" /> </li>-->
          <li>
            <input type="radio" values="民生银行" value="CMBC" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/CMBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="浦东发展银行" value="SPDB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/SPDB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="平安银行" value="SZPAB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/SZPAB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="光大银行" value="CEB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/CEB.png"  onclick="doCheck(this)" /> </li>  
          <li>
            <input type="radio" values="广东发展银行" value="GDB" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/GDB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="中国邮政储蓄银行" value="PSBC" name="payBank" channel="2" payType="DR" style="display:none">
            <img src="/images/bank/PSBC.png"  onclick="doCheck(this)" /> </li>
        </ul>
      </div>
    </div>
    
    <div class="product">
      <div class="paymethod">
         <ul>
         	<li>
            <input type="radio" values="中国银行" value="BOC" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/BOC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="工商银行" value="ICBC" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/ICBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="建设银行" value="CCB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="招商银行" value="CMB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CMB.png"  onclick="doCheck(this)" /> </li>
          <!--<li>
            <input type="radio" values="农业银行" value="ABC" name="payBank" channel="2" style="display:none">
            <img src="/images/bank/ABC.png"  onclick="doCheck(this)" /> </li>-->
           <li>
            <input type="radio" values="交通银行" value="COMM" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/COMM.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="兴业银行" value="CIB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CIB.png"  onclick="doCheck(this)" /> </li>  
          <li>
            <input type="radio" values="民生银行" value="CMBC" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CMBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="浦东发展银行" value="SPDB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/SPDB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="平安银行" value="SZPAB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/SZPAB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="光大银行" value="CEB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CEB.png"  onclick="doCheck(this)" /> </li>  
           <li>
            <input type="radio" values="广东发展银行" value="GDB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/GDB.png"  onclick="doCheck(this)" /> </li>
           <li>
            <input type="radio" values="中国邮政储蓄银行" value="PSBC" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/PSBC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="中信银行" value="CITIC" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/CITIC.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="华夏银行" value="HXB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/HXB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="东亚银行" value="HKBEA" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/HKBEA.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="上海银行" value="BOS" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/BOS.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="南京银行" value="NJCB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/NJCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="上海农商行" value="SHRCB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/SHRCB.png"  onclick="doCheck(this)" /> </li>
          <li>
            <input type="radio" values="温州银行" value="WZCB" name="payBank" channel="2" payType="CR" style="display:none">
            <img src="/images/bank/WZCB.png"  onclick="doCheck(this)" /> </li>
        </ul>
      </div>
    </div>
  </div>
</div>
</div>
</div>

</div>
<div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
