<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-银行卡绑定" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/membercenter/bankCard.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 银行卡绑定 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="11" scope="page"></c:set>
  <%@include file="menu.jsp" %>
    <div class="tzgl">
    	<div class="safebox">
        	<div class="tzxq" style="margin-top:0px">银行卡绑定</div>
            <div class="notice2"><b>提示：</b>您需要绑定正确的银行卡之后才能提款！绑定的银行卡只用于提款,银行卡持有人必须与实名验证中真实名称一致。</div>
              <table width="100%" border="0" cellspacing="10" cellpadding="0" class=" userxinxi">
            	<input type="hidden" name="bankName" id="bankName" value="${param.bankName}">
            	<input type="hidden" name="subBankName" id="subBankName" value="${param.subBankName}">
            	<input type="hidden" name="bankAccount" id="bankAccount" value="${param.bankAccount}">
            	
            	<input type="hidden" name="bankId" id="bankId" value="${param.bankId}">
						  <tr>
						    <td width="11%" height="5" align="right">&nbsp;</td>
						    <td width="33%">&nbsp;</td>
						    <td width="56%">&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="38" align="right">真实姓名：</td>
						    <td>${param.bankUserName}</td>
						    <td><ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">银行卡开户人必须与此处的真实名称一致</span>
						            </li></ul></td>
						  </tr>
						  <tr>
						    <td height="38" align="right">开户银行：</td>
						    <td>${param.bankName}</td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">请填写您银行卡的开户行，如：中国银行</span>
						            </li></ul>
						    </td>
						  </tr>
						   <tr>
						    <td height="38" align="right">支行名称：</td>
						    <td>${param.subBankName}</td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">查询支行请拨打银行卡背面客服电话</span>
						            </li></ul>
						    </td>
						  </tr>
						   <tr>
						    <td height="38" align="right">银行卡号：</td>
						    <td>${param.bankAccount}</td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">请认真核对卡号</span>
						            </li></ul>
						    </td>
						  </tr>
						  <tr>
						    <td height="38">&nbsp;</td>
						    <td>
						    	 <input name="button3" type="submit" class="addbtn3" id="bankCardSureSubmit" value="提交" style="cursor:pointer"/>
						    	 <span style="padding:0 10px"><a id="rModify" style="cursor:pointer">返回修改</a></span>
						    </td>
						    <td>&nbsp;</td>
						  </tr>
          </table>
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
