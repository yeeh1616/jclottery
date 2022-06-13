<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="用户登陆" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="/js/home/footer.js"></script>
</head>

<body class="tzfw">
<div class="header_bg second_head" style=" padding-top:0px;border-bottom: 3px solid #004889;">
  <div class=" common_w">
    <div class="shop_name fl" style="line-height:42px; font-size:22px;">凤凰微彩投注站服务系统
    </div>
    <div class="fl dl_gg"><div class="fl"><strong>店主公告：</strong></div><div class="fl"><marquee class="soroll" scrollamount="3" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()" id="index_dzgg">请各位彩民朋友登录或者联系店主为您开通帐号</marquee></div></div>
    <div class="second_kf">
    	<a href="javascript:void 0" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${sessionScope.domain.storeQq}&site=在线咨询&menu=yes');">在线客服</a>  	
    </div>
    <div class="second_phone">
    	店铺电话：
    	<c:choose>
			<c:when test="${sessionScope.domain.storeMobile != ''}">
				${sessionScope.domain.storeMobile}
			</c:when>
			<c:otherwise>
			       ${sessionScope.domain.storePhone}
			</c:otherwise>
		</c:choose>  
    	</div>
    <div class="clear"></div>
  </div>
</div>
<div class="common_w">
<form name="loginPageForm" id="loginPageForm" method="post">
<div class="tscw">
<!--提示错误，如果有错误提示下的出现，没有错误提示下面隐藏-->
<span id="inforMessage" style="display:none"></span>
</div>
<div class="con_dl">
	<input type="hidden" name="jurl" id="jurl" value="${fn:length(param.jurl)==0?"/":param.jurl}">
	<div class="con_dl_t">用户登录</div>
    <div class="shuru"><input type="text" class="text" name="username" id="username"></div>
    <div class="mima"><input type="password"  class="text" name="password" id="password"></div>
    <div class="yzm_n"><input type="text" class="text_n" name="captchaId" id="captchaId"/><a href="javascript:void 0"><img id="imgCaptcha" src="/common/captcha.do" width="107" height="36" /></a></div>
    <div class="btn" id="loginPageFormSubmit"><a href="javascript:void 0"></a></div>
</div>
</form>
</div>

</body>
</html>

