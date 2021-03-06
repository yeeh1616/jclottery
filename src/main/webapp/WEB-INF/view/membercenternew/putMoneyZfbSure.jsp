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

	function doCheck(obj){
		$(obj).prev().attr("checked",true);
		$("#putmoneySubmit").trigger("click");
	}
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

	<div class="w_gcjl_l">
    <ul>
    	<li><a href="/memberCenterNew/putMoney.jhtml">在线充值</a></li>
		<li><a href="/memberCenterNew/putMoneyOutLine.jhtml" class="active">转账充值</a></li>
        <li><a href="/memberCenterNew/putMoneyList.jhtml">充值记录</a></li>
	</ul>
    <div class="clear"></div>
    </div>

	<div class="notice2">
		<b>提示：</b>本次充值有
		<strong>支付宝</strong>提供接口支持。各银行对单笔金额与每日总额都有限制，请参考各银行的使用说明。
	</div>
		<div class="paymethod">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="10%" height="65">
					<strong>充值方式：</strong>
				</td>
				<td width="90%">
					<img src="/images/bank/${param.payBank}.png" width="148" height="48" />
					<img src="/images/pmethdos.jpg" width="148" height="48" style="cursor: pointer" onclick="location.href='/memberCenterNew/putMoneyZfb.jhtml'" />
				</td>
			</tr>
			<tr>
				<td height="65">
					<strong>充值金额：</strong>
				</td>
				<input type="hidden" name="currMoney" id="currMoney" value="${param.currMoney}">
				<input type="hidden" name="payBank" id="payBank" value="${param.payBank}">
				<td>
					<span style="padding: 0 8px; font-weight: bold; color: #df4c3d; font-size: 16px;">${param.currMoney}</span>元
				</td>
			</tr>
			<tr>
			<td height="65">&nbsp;</td>
			<td>
				<input name="putmoneySureSubmit" type="submit" class="addbtn3" id="putmoneySureSubmit" value="确认支付" style="cursor: pointer" />
			</td>
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
		<br />
		<br />
		<br />
	<div class="clear"></div>

	</div>

	</div>
<div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
