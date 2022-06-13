<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/index_hao.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/images/top_logo.ico" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
<div class="reg_top">
	<div class="reg_top_nav">
		<script>
	   	function tLogin(){
	   		location.href="/common/login/login.jhtml?jurl=/";	
	   	}
	   </script>
    <!--<div class="member"><a style="cursor:pointer;" onclick="tLogin();" target="_blank">请登录</a> |  
    	                  <a href="/common/register/index.jhtml" target="_blank">免费注册</a></div> -->
     <div class="help"><a href="/playerintro/index.jhtml" target="_blank"><img src="/images/reg_ico.gif" width="11" height="11" /> 帮助中心</a> |    
     	                 <!--<a href="/"><img src="/images/reg_ico-02.gif" width="11" height="11" /> 返回首页</a>--></div></div>
</div>
<div class="reg_header">
	<div class="logotxt">${domain.storeName} <font></font></div>
  <div class="logotxt2">
  	<c:choose>
			<c:when test="${store.storeMobile != ''}">
				客服电话：${sessionScope.domain.storeMobile}
			</c:when>
		</c:choose>
  <font></div>
</div>