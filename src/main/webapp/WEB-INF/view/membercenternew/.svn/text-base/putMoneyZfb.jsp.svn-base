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
<script type="text/javascript" src="/js/membercenternew/moneyZfb.js"></script>
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


</script>
</head>

<body>
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

	<div class="w_gcjl">
		<c:set var="btnNum" value="5" scope="page"></c:set>
		<%@include file="titleButtonsForRecharging.jsp"%>
	</div>
	
	<div class="zf_title">
		<div class="n_zhifub"></div> 
		<span class="total mt10"><a href="javascript:moneyChangeBack();" style="color: #1C7FC3;font-size: 12px;">修改金额&gt;&gt;</a></span>
		<span class="total mt10">充值总额：<strong>￥${param.currMoney}</strong>
		</span>
		<input type="hidden" id="type" name="type" value="1" />
		<input name="currMoney" type="hidden"  id="currMoney" value="${param.currMoney}"/>
	</div>

  <div class="product-wrap">
    <div class="product showx">
      <div class="paymethod">
         <ul>
			<li style="border-color: rgb(250, 250, 250);">
	            <input type="radio" values="支付宝" value="directPay" name="payBank" style="display:none"/>
	            <img src="/images/bank/directPay.png" onclick="doCheck(this)"/> </li>
         	<li>
	            <input type="radio" values="工商银行" value="ICBCB2C" name="payBank" style="display:none"/>
	            <img src="/images/bank/ICBCB2C.png" onclick="doCheck(this)"/> </li>
			<li>
				<input type="radio" values="建设银行" value="CCB" name="payBank" style="display:none"/>
				<img src="/images/bank/CCB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="农业银行" value="ABC" name="payBank" style="display:none"/>
				<img src="/images/bank/ABC.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="招商银行" value="CMB" name="payBank" style="display:none"/>
				<img src="/images/bank/CMB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="交通银行" value="COMM" name="payBank" style="display:none"/>
				<img src="/images/bank/COMM.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="中国银行" value="BOCB2C" name="payBank" style="display:none"/>
			 	<img src="/images/bank/BOCB2C.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="光大银行" value="CEBBANK" name="payBank" style="display:none"/>
				<img src="/images/bank/CEBBANK.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="民生银行" value="CMBC" name="payBank" style="display:none"/>
				<img src="/images/bank/CMBC.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="中信银行" value="CITIC" name="payBank" style="display:none"/>
				<img src="/images/bank/CITIC.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="兴业银行" value="CIB" name="payBank" style="display:none"/>
				<img src="/images/bank/CIB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="华夏银行" value="HXBANK" name="payBank" style="display:none"/>
				<img src="/images/bank/HXB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="东亚银行" value="HKBEA" name="payBank" style="display:none"/>
				<img src="/images/bank/HKBEA.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="上海银行" value="SHBANK" name="payBank" style="display:none"/>
				<img src="/images/bank/BOS.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="中国邮政储蓄银行" value="PSBC-DEBIT" name="payBank" style="display:none"/>
				<img src="/images/bank/PSBC-DEBIT.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="南京银行" value="NJCB" name="payBank" style="display:none"/>
				<img src="/images/bank/NJCB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="汉口银行" value="HKB" name="payBank" style="display:none"/>
				<img src="/images/bank/HKBCHINA.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="浦东发展银行" value="SPDB" name="payBank" style="display:none"/>
			 	<img src="/images/bank/SPDB.png"  onclick="doCheck(this)" /> </li>
			<li>
			 	<input type="radio" values="广东发展银行" value="GDB" name="payBank" style="display:none"/>
				<img src="/images/bank/GDB.png"  onclick="doCheck(this)" /> </li>
			<li>
				<input type="radio" values="平安银行" value="SPABANK" name="payBank" style="display:none"/>
				<img src="/images/bank/SZPAB.png"  onclick="doCheck(this)" /> </li>
         </ul>
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
</body>
</html>
