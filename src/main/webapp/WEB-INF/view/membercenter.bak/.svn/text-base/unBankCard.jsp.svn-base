<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-实名认证" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/membercenter/authenticat.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 实名认证 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="11" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    	<div class="safebox">
        	<div class="tzxq" style="margin-top:0px">银行卡绑定</div>
            <div class="notice2"><b>温馨提示：</b>您的银行卡已绑定。</div>
            <div class="tk1">
            	<ul>
                	<li><img src="/images/ok.gif"/>开户行名称<span>${mb.bankName}</span></li>
                	<li><img src="/images/ok.gif"/>支行名称<span>${mb.bankUserName}</span></li>
                	<li><img src="/images/ok.gif"/>开户人名称<span>${mb.certiName}</span></li>
                	<li class="link"><a href="/memberCenter/changeBankCard.jhtml">修改银行信息</a><img src="/images/ok.gif"/>银行帐号<span>${mb.bankAccount}</span></li>
                </ul>
            </div>

       	  <div class="clear"></div>
        </div>
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
