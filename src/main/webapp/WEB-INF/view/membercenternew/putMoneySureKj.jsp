<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--=====================无快捷协议===============================-->
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
	/*var currBank = '${param.payBank}';
	if(bankAry.in_array("js")){
		alert(19);
	}*/
</script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> &gt; 
  	<a href="/memberCenterNew/capital.jhtml">资金管理</a> &gt; 账户充值 </div>
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
    <c:set var="btnNum" value="5" scope="page"></c:set>
		<%@include file="titleButtonsForRecharging.jsp"%>
    <div class="notice2"><b>提示：</b>本次充值由<strong>盛付通</strong>提供接口支持。各银行对单笔金额与每日总额都有限制，请参考各银行的使用说明。</div> 
        <div class="gr-jtma safe-tw">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" class="bf_safe">
       	    <tbody>
       	    	<tr>
        	      <td width="15%" class="bf_safe_l">充值方式：</td>
        	      <td width="85%"><div class="bfw_logo">${param.values}<a class="chk">${payTypeName}快捷</a></div>
        	      	<a href="javascript:void 0" id="currBack" class="chk_other">其他方式>></a> 
        	      </td>
   	         </tr>
        	    <tr>
        	      <td class="bf_safe_l">充值金额：</td>
        	      <td><span style="padding:0 8px;font-weight: bold;color: #df4c3d;font-size: 16px;">${param.currMoney}</span>元</td>
        	      <input type="hidden" name="currMoney" id="currMoney" value="${param.currMoney}">
        	      <input type="hidden" name="payBank" id="payBank" value="${param.payBank}">
        	      <input type="hidden" name="payType" id="payType" value="${param.payType}">
   	        </tr>
            	<c:choose>
	            	<c:when test="${fn:length(miList)>0}"><!--有银行卡信息-->
	            		<tr>
                    <td class="bf_safe_l">银行卡号：</td>
                    <td>
                    <select name="bankCardNo" id="bankCardNo"  class="other_bf">
												<c:forEach var="obj" items="${miList}">
													<option value="${obj.cardNo}" realName="${obj.holderName}" idNo="${miList[0].idNo}" mobileNo="${miList[0].phoneNumber}">${obj.cardNoHide}</option>
												</c:forEach>
										</select>
										<input type="hidden" name="realName" id="realName" value="${miList[0].holderName}">
				   	        <input type="hidden" name="idNo" id="idNo" value="${miList[0].idNo}">
				   	        <input type="hidden" name="mobileNo" id="mobileNo" value="${miList[0].phoneNumber}">
                    </td>
                </tr>
		   	        
		   	        <!--以下两个值仅用于信用卡-->
		   	        <tr id="cardMonthID" style="${crdisplay}">
		   	        	<td class="bf_safe_l"> 有效期:</td>
		   	          <td>
		   	          	 <select id="cardMonth" name="cardMonth" class="other_bf" style="width:91px">
		   	          	 	<option selected="selected" value="00">请选择</option>
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
		   	          	<select id="cardYear" name="cardYeat" class="other_bf"  style="width:91px">
		   	          	 	<option selected="selected" value="00">请选择</option>
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
		   	        	<td class="bf_safe_l">卡后三位:</td>
		   	          <td>
		   	          	 <input name="cvv2" id="cvv2" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="cvv2Message">卡背面后三位</span>
		   	          </td>
		   	        </tr>
		   	        <tr>
		   	        	<td class="bf_safe_l"> 手机验证码:</td>
		   	          <td>
		   	          	 <!--<input name="getVaCode" id="getVaCode" value="获取验证码" style="cursor:pointer" type="button" class="gf_btn">-->
		   	          	 <a href="javascript:void 0" name="getVaCode" id="getVaCode" class="gf_btn">获取验证码</a>
		   	          	 <input name="validateCode" id="validateCode" class="user_wbtwo" style="width:107px;" type="text">
		   	          	 <span id="validateCodeMessage">请输入短信验证码</span>
		   	          </td>
		   	        </tr>
	            	</c:when>
	            	<c:otherwise><!--无银行卡信息-->
	            	<tr>
		   	        	<td class="bf_safe_l"> 银行卡号：</td>
		   	          <td>
		   	          	 <input name="bankCardNo" id="bankCardNo" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="bankCardNoMessage"></span>
		   	          </td>
		   	        </tr>
		   	        <tr>
		   	        	<td class="bf_safe_l">持卡人：</td>
		   	          <td>
		   	          	 <input name="realName" id="realName" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="realNameMessage">银行卡所有人姓名</span>
		   	          </td>
		   	        </tr>
		   	        <tr>
		   	        	<td class="bf_safe_l"> 身份证：</td>
		   	          <td>
		   	          	 <input name="idNo" id="idNo" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="idNoMessage"> 开卡时的证件号码</span>
		   	          </td>
		   	        </tr>
		   	        <tr>
		   	        	<td class="bf_safe_l">手机号：</td>
		   	          <td>
		   	          	 <input name="mobileNo" id="mobileNo" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="mobileNoMessage"> 银行存留号码</span>
		   	          </td>
		   	        </tr>
		   	        <!--以下两个值仅用于信用卡-->
		   	        <tr id="cardMonthID" style="${crdisplay}">
		   	        	<td class="bf_safe_l"> 有效期:</td>
		   	          <td>
		   	          	 <select id="cardMonth" name="cardMonth" class="other_bf"  style="width:91px">
		   	          	 	<option selected="selected" value="00">请选择</option>
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
		   	          	<select id="cardYear" name="cardYeat" class="other_bf"  style="width:91px">
		   	          	 	<option selected="selected" value="00">请选择</option>
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
		   	        	<td class="bf_safe_l">卡后三位:</td>
		   	          <td>
		   	          	 <input name="cvv2" id="cvv2" class="user_wbtwo user_wbtbf" type="text">
		   	          	 <span id="cvv2Message">卡背面后三位</span>
		   	          </td>
		   	        </tr>
		   	        <tr>
		   	        	<td class="bf_safe_l"> 手机验证码:</td>
		   	          <td>
		   	          	 <!--<input name="getVaCode" id="getVaCode" value="获取验证码" style="cursor:pointer" type="button" class="gf_btn">-->
		   	          	 <a href="javascript:void 0" name="getVaCode" id="getVaCode" class="gf_btn">获取验证码</a>
		   	          	 <input name="validateCode" id="validateCode" class="user_wbtwo" style="width:107px;" type="text">
		   	          	 <span id="validateCodeMessage">请输入短信验证码</span>
		   	          </td>
		   	        </tr>
            		</c:otherwise>
            </c:choose>
      	    <tr>
      	      <td>&nbsp;</td>
      	      <td>
      	      	<input name="putmoneyKJSureSubmit" class="bf_add" id="putmoneyKJSureSubmit" value="确认支付" style="cursor:pointer" type="submit">
      	      	<a href="javascript:void 0" id="newBank" class="chk_other chk_other_n">使用同行新卡>></a> 
      	      	  <input type="hidden" name="newBankcurrMoney" id="newBankcurrMoney" value="${param.currMoney}">
        	      	<input type="hidden" name="newBankpayBank" id="newBankpayBank" value="${param.payBank}">
        	      	<input type="hidden" name="newBankpayType" id="newBankpayType" value="${param.payType}">
        	      	<input type="hidden" name="newBankpayTypeName" id="newBankpayTypeName" value="${param.values}">
      	      	</td>
   	        </tr>
   	      </tbody></table>
        </div>
    
    <!--具体信息end--> 
</div>
</div>
  <div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>