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
</head>

<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/index_hao.css" rel="stylesheet" type="text/css" />
<div class="clear"></div>
<div class="memberbox">
	<div class="denglu-l">
    	<img width="297" height="320" src="/images/dl_03.png" />
    </div>
  <div class="denglu-r">
    	<div class="denglu-r-t">
    	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	    <tr>
    	      <td width="50%" align="center"><img src="/images/log.jpg" width="223" height="52" /></td>
    	      <td align="center" background="/images/log2.jpg" style="cursor:pointer" onclick="location.href='http://wangdian.cp020.com/'">彩站登录</td>
  	      </tr>
  	    </table>
    	</div>
        <div class="denglu-r-c" id="loginPageForm">
        	<div style="text-align:center; font-size:14px;color:#FF0000" id="inforMessage"></div>
        	<input type="hidden" name="jurl" id="jurl" value="${fn:length(param.jurl)==0?"/":param.jurl}">
        	<dl>
           	  <dt>用户名</dt>
                <dd><input name="username" id="username" type="text" /></dd>
            </dl>
       	  <dl>
           	  <dt>密&nbsp;&nbsp;码</dt>
                <dd><input name="password" id="password" type="password" /></dd>
          </dl>
        	<dl>
           	  <dt>验证码</dt>
              <dd class="yzm"><input type="text" name="captchaId" id="captchaId" /></dd>
              <dd><a style="cursor:pointer"><img id="imgCaptcha" src="/common/captcha.do" width="107" height="36" /></a></dd>
            </dl>
			<ul>
           	  <li id="loginPageFormSubmit"><a style="cursor:pointer"><img src="/images/login_sub.gif" /></a></li>
            	<li><a href="/findpassword/index.jhtml"><u>忘记密码</u></a></li>
            	<li><a href="/common/register/index.jhtml"><u>免费注册</u></a></li>
          </ul>
            <div style="margin:30px 0px"><img src="/images/ln_03.png" /></div>
            <!--<P>合作账号登录：<span>
            	<a style="cursor:pointer"><img src="/images/dl_12.png" />qq登录</a></span><span>
            	<a style="cursor:pointer"><img src="/images/dl_09.png" />支付宝登录</a></span><span>
            	<a style="cursor:pointer"><img src="/images/dl_06.png" />sina微博登录</a></span></P>-->
        </div>
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
<script>
$(document).ready(function(){
	$(document).keydown(function(e){
		if(e.keyCode == 13) {
			$('#loginPageFormSubmit').click();
		}
	});
});
</script>
</body>
</html>
