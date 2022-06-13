<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="彩民注册" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
	</head>

	<body>
		<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>

		<!--注册内容-->
		<div class="zhuce common_w">
			<div class="zhuce_top">
				<div class="current zc fl">
					<span>1</span>填写注册信息
				</div>
				<div class="zc fl">
					<span>2</span>注册成功
				</div>
			</div>
			<div class="zhuce_c_tit">
				用户注册
			</div>
			<div class="zhuce_c_con_n">
				<form name="regform" id="regFormId" method="post"
					action="/common/register/register.jhtml">
					<input type="hidden" name="agentId" value="${sessionScope.agentId}">
					<div style="text-align: left; font-size: 14px; color: #FF0000; height: 20px;padding-left: 15px;padding-bottom: 5px;"
								id="inforMessage"></div>
					<ul>
						<li>
							<span>用户名</span>
							<input type="text" class="text" value="" name="username"
								id="unameId">
							4-16位，必须以字母开头。可以包含数字和下划线
						</li>
						<li>
							<span>密码</span>
							<input type="password" class="text" value="" name="password"
								id="psdId">
							6-16位，字母（区分大小写)、数字、字符
						</li>
						<li>
							<span>确认密码</span>
							<input type="password" class="text" value="" name="repassword"
								id="rpsdId">
							请再次输入
						</li>
						<li>
							<span>手机号码</span>
							<input type="text" class="text" value="" name="phone"
								id="phoneId">
							填写手机号码
						</li>
						<li>
							<span>验证码</span>
							<input type="text" class="text_n" name="yzCode" id="captchaId">
							<img id="imgCaptcha" src="/common/captcha.do" />
							请填写验证码
						</li>
					</ul>
					<div class="zhuce_f">
						<input type="button" class="btn" value="提交注册" id="submitBtnId" />
						<br />
						<input type="checkbox" name="agreeName" id="agreeCkbId"
							checked="checked" />
						我已阅读并同意
						<a href="/common/agreement.jhtml" target="_blank">《彩店与彩民交易协议》</a>
					</div>
				</form>
			</div>
		</div>
		<!--注册内容 end-->
		<!--footer-->
		<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
		<!--footer end-->
		<script type="text/javascript" src="/js/jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
//更新验证码
	$("#imgCaptcha").click(function(){
		$(this).attr('src', '/common/captcha.do?t='+new Date().getTime());
		$('#captcha').val('');
		$('#captcha').focus();
	});

	//用户名校验
	function checkUserName(){
		var flag = false;
		var name = $("#unameId").val();
		$.ajax({
		    type: "post",
		    url: "/common/checkUser.json",
		    async: false,
		    data: "username=" + name,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
		    success: function (data){
				if (data == "-1") {
					$("#inforMessage").html("错误提示：该用户名已被注册！");
					$("#unameId").focus();
				} else {
					$("#inforMessage").html("");
					flag = true;
				}
		    }
		});
		return flag;
	}

	  //验证码校验
	function checkCaptcha(){
		var flag = false;
		var val = $("#captchaId").val();
		$.ajax({
		    type: "post",
		    url: "/common/checkCaptcha.json",
		    async: false,
		    data: "code=" + val,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if (data == "-1") {
					$("#captchaId").focus();
					$("#inforMessage").html("错误提示：验证码错误！");
				} else {
					$("#inforMessage").html("");
					flag = true;
				}
		    }
		});
		return flag;
}
 
/*=================================================================================================*/
	//检测用户名是否存在	
	$("#unameId").blur(function(){
		if(!checkUserName()){
			return false;
		}
	});
/*=================================================================================================*/	
	//用户名校验
	function userName(){
		var name = $.trim($("#unameId").val());
		if ( name == "" ) {
			$("#unameId").focus();
			$("#inforMessage").html("错误提示：用户名不能为空！");
			return false;
			//   /^[a-zA-Z0-9\u4e00-\u9fa5]+$/
		}else {
			if(!(name.length >= 4 && name.length <= 16)){
		    	$("#unameId").focus();
				$("#inforMessage").html("错误提示：用户名长度为4—16位字符！");
		    	return false;
		    }else{
				return true;
			}
		}/*else{
			$("#unameId").focus();
			$("#inforMessage").html("错误提示：用户名不符合要求！");
			return false;
		}*/
	}
/*=================================================================================================*/
	//密码校验
	function passWord(){
		var pass = $.trim($("#psdId").val());
		if ( pass == "" ) {
			$("#psdId").focus();
			$("#inforMessage").html("错误提示：密码不能为空!");
			return false;			
		}else if(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,16}$/.test(pass)){
			if(!(pass.length >= 6 && pass.length <= 16)){
		    	$("#psdId").focus();
				$("#inforMessage").html("错误提示：密码长度为6-16位字符！");
		    	return false;
			}
		}else{
			$("#psdId").focus();
			$("#inforMessage").html("错误提示：密码不符合要求！");
	    	return false;
		}
		//确认密码校验
		if ( $.trim($("#rpsdId").val()) == "" ) {
			$("#rpsdId").focus();
			$("#inforMessage").html("错误提示：请再次输入密码！");
			return false;
		}else{
			if ( pass != $.trim($("#rpsdId").val()) ) {
				$("#psdId").focus();
				$("#inforMessage").html("错误提示：密码输入不一致!");
				return false;
			}else{
				return true;
			}
		}
	}
/*=================================================================================================*/
		//手机号码校验
	function phone(){
		var phone = $.trim($("#phoneId").val());
		if( phone == "" ){
			$("#phoneId").focus();
			$("#inforMessage").html("错误提示：请输入手机号码！");
			return false;
		}else if(phone.length == 11){
			if(/^[1][3,4,5,7,8][0-9]{9}$/.test(phone)){
				return true;
			}else{
				$("#phoneId").focus();
				$("#inforMessage").html("错误提示：不合法的手机号码！");
    			return false;								
			}
		}else{
			$("#phoneId").focus();
			$("#inforMessage").html("错误提示：请确认手机号码长度！");
    		return false;
		}
	}		
/*=================================================================================================*/
	$("#submitBtnId").click(function(){

		if(!userName()){
			return false;
		}

		if(!checkUserName()){
			return false;
		}
		
		if(!passWord()){
			return false;
		}

		if(!phone()){
			return false;
		}
			
		//验证码校验
		if ( $.trim($("#captchaId").val()) == "" ) {
			$("#captchaId").focus();
			$("#inforMessage").html("错误提示：请录入验证码!");
			return false;
		}else if(!checkCaptcha()){
			return false;
		}

		//服务条款检测
		if($("#agreeCkbId:checked").length == 0){
			$("#inforMessage").html("错误提示：请阅读‘彩民服务条款’并同意该协议！");
			return false;
		}
		
		//全部检测通过提交数据
		$("#regFormId").submit();
	});
});
</script>
	</body>
</html>