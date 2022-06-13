<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="找回密码——第一步" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<div class="clear"></div>
<div class="zm">
<form id="findForm">
	<div class="zm-t"><img src="/images/r_ico-03.gif" />请输入您需要找回密码的用户名</div>
	<div class="zm-c">
    	<dl>
        	<dt>用 户 名</dt>
            <dd><input name="username" id="username" type="text" /><span style="width:164px;height:36px;color:red;margin:10px;" id="errInfo"></span></dd>
            <dd style="width: 164px;height:15px;"></dd>
        </dl>
    	<dl>
        	<dt>验 证 码</dt>
            <dd class="yzm"><input name="yzm" id="yzm" type="text" /></dd>
            <dd><a style="cursor:pointer;"><img id="imgYzm" src="/findpassword/captcha.do" width="110px" /></a></dd>
            <dd><img id="yzmTiShi" style="margin-top:10px;visibility:hidden;" src="/images/ok.gif" /></dd>
        </dl>
    </div>
    <div class="zm-b"><a style="cursor:pointer;"><img id="imgBtnSubmit" src="/images/zm_18.png" /></a></div>
</form>
</div>
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script>
$(function(){

	$("#imgYzm").click(function(){
		$("#imgYzm").attr("src","/findpassword/captcha.do?"+Math.random());
		return false;
	});
	
	$("#imgBtnSubmit").click(function(){
	
		$("#yzmTiShi").css("visibility","hidden");//隐藏验证码提示图标
		$("#errInfo").html("");//清除用户名提示
		
		$("#findForm").ajaxSubmit( {  
		      url : '/findpassword/doindex.jhtml',  
		      type:'post',
		      success: function(data){  
		      		if(data == 0)
		      		{
		      			//验证码错误
						$("#imgYzm").attr("src","/findpassword/captcha.do?"+Math.random());
						$("#yzmTiShi").attr("src","/images/errs.gif");
						$("#yzmTiShi").css("visibility","visible");
				    	return false;
		      		}else if(data == 1)
		      		{
		      			window.location.href="/findpassword/findtype.jhtml";
		         		return false;  
			    	}else if(data == 2)
			    	{
			    		$("#errInfo").html("该账户已被冻结，请联系店主");
		      			return false;
			    	}else if(data == 3)
			    	{
			    		$("#errInfo").html("该账户不存在，请重新输入");
		      			return false;
			    	}
			  },  
		      error : function() {  
		         popupConfirm("温馨提示",'错误，请联系管理员。');
		         return false;  
		      }  
		});
	});
	
});
</script>
</body>
</html>