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
<script type="text/javascript" src="/js/membercenter/money.js"></script>
<script>
	/*var currBank = '${param.payBank}';
	if(bankAry.in_array("js")){
		alert(19);
	}*/
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
        	<h1 class="zz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoney.jhtml'">在线充值</h1>
        	<h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneyList.jhtml'">充值记录</h1>  
        </div>
        
        <div class="notice2"><b>提示：</b>本次充值有<strong>盛付通</strong>提供接口支持。各银行对单笔金额与每日总额都有限制，请参考各银行的使用说明。</div>
        
        
        <div class="paymethod">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
       	    <tr>
        	      <td width="10%" height="45"><strong>充值方式：</strong></td>
        	      <td width="90%"><img src="/images/bank/${param.payBank}.png" width="148" height="48" /> 
        	      	<img src="/images/pmethdos.jpg" width="148" height="48" style="cursor:pointer" onclick="location.href='/memberCenter/putMoneySFTZ.jhtml'"/></td>
   	        </tr>
        	    <tr>
        	      <td height="45"><strong>充值金额：</strong></td>
        	      <input type="hidden" name="currMoney" id="currMoney" value="${param.currMoney}">
        	      <input type="hidden" name="payBank" id="payBank" value="${param.payBank}">
        	      <input type="hidden" name="payType" id="payType" value="${payType}">
        	      <td><span style="padding:0 8px;font-weight: bold;color: #df4c3d;font-size: 16px;">${param.currMoney}</span>元</td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong>卡种：</strong></td>
   	          <td>
   	          	<!--<input type="radio" checked value="DR" name="payType" id="payTypeDR">&nbsp;储蓄卡
   	          	<span style="padding:0 10px"></span> 
   	          	<input type="radio" value="CR" name="payType" id="payTypeCR">&nbsp;信用卡-->
   	          	<span style="padding:0 8px;font-weight: bold;color: #df4c3d;font-size: 16px;">${payTypeName}</span>
   	          </td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong>银行卡号 </strong></td>
   	          <td>
   	          	 <input type="text" name="bankCardNo" id="bankCardNo"  class="bi-input" style="width:150px;">
   	          	 <span id="bankCardNoMessage"></span>
   	          </td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong>持卡人 </strong></td>
   	          <td>
   	          	 <input type="text" name="realName" id="realName"  class="bi-input" style="width:150px;">
   	          	 <span id="realNameMessage">银行卡所有人姓名</span>
   	          </td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong>身份证 </strong></td>
   	          <td>
   	          	 <input type="text" name="idNo" id="idNo"  class="bi-input" style="width:150px;">
   	          	 <span id="idNoMessage"> 开卡时的证件号码</span>
   	          </td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong>手机号 </strong></td>
   	          <td>
   	          	 <input type="text" name="mobileNo" id="mobileNo"  class="bi-input" style="width:150px;">
   	          	 <span id="mobileNoMessage"> 银行存留号码</span>
   	          </td>
   	        </tr>
   	        <!--以下两个值仅用于信用卡-->
   	        <tr id="cardMonthID" style="${crdisplay}">
   	        	<td  height="45"> <strong> 有效期</strong></td>
   	          <td>
   	          	 <select id="cardMonth" name="cardMonth">
   	          	 	<option value="00">请选择</option>
   	          	 	<option value="01">01</option>
   	          	 	<option value="02">02</option>
   	          	 	<option value="03">03</option>
   	          	 	<option value="04">04</option>
   	          	 	<option value="05">05</option>
   	          	 	<option value="06">06</option>
   	          	 	<option value="07">07</option>
   	          	 	<option value="08">08</option>
   	          	 	<option value="09">09</option>
   	          	 	<option value="10">10</option>
   	          	 	<option value="11">11</option>
   	          	 	<option value="12">12</option>
   	          	</select>
   	          	月/
   	          	<select id="cardYear" name="cardYeat">
   	          	 	<option value="00">请选择</option>
   	          	 	<option value="14">2014</option>
   	          	 	<option value="15">2015</option>
   	          	 	<option value="16">2016</option>
   	          	 	<option value="17">2017</option>
   	          	 	<option value="18">2018</option>
   	          	 	<option value="19">2019</option>
   	          	 	<option value="20">2020</option>
   	          	 	<option value="21">2021</option>
   	          	 	<option value="22">2022</option>
   	          	 	<option value="23">2023</option>
   	          	 	<option value="24">2024</option>
   	          	 	<option value="25">2025</option>
   	          	</select>
   	          	年
   	          	<span id="myMessage">信用卡有效期</span>
   	          </td>
   	        </tr>
   	        <tr id="cvv2ID" style="${crdisplay}">
   	        	<td  height="45"> <strong> 卡后三位</strong></td>
   	          <td>
   	          	 <input type="text" name="cvv2" id="cvv2" class="bi-input" style="width:150px;">
   	          	 <span id="cvv2Message">信用卡后三位</span>
   	          </td>
   	        </tr>
   	        <tr>
   	        	<td  height="45"> <strong> 手机验证码</strong></td>
   	          <td>
   	          	 <input type="button" name="getVaCode" id="getVaCode" value="获取验证码" style="cursor:pointer">
   	          	 <input type="text" name="validateCode" id="validateCode" class="bi-input" style="width:65px;">
   	          	 <span id="validateCodeMessage">请输入短信验证码</span>
   	          </td>
   	        </tr>
      	    <tr>
      	      <td height="45">&nbsp;</td>
      	      <td><input name="putmoneyKJSureSubmit" type="submit" class="addbtn3" id="putmoneyKJSureSubmit" value="确认支付" style="cursor:pointer" /></td>
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
          <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
