<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-修改密码" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/membercenter/pass.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 修改密码 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="8" scope="page"></c:set>
  <%@include file="menu.jsp" %>
 <div class="tzgl">
    	<div class="safebox">
        	<div class="sftab">
        	<h1 class="zz" style="cursor:pointer" onclick="location.href='/memberCenter/changePass.jhtml'">登录密码</h1>  
        	<!--<h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/changeAccountPass.jhtml'">财务密码</h1>-->
        </div>
            <div class="notice2"><b>提示：</b>建议使用字母加数字组合、混合大小写、特殊字符（如@）等提高密码强度。</div>
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class="userxinxi">
					  <tr>
					    <td width="11%" height="20" align="right">&nbsp;</td>
					    <td width="33%">&nbsp;</td>
					    <td width="56%">&nbsp;</td>
					  </tr>
					  <tr>
					    <td height="38" align="right">当前密码：</td>
					    <td><input name="oldPass" type="password" class="inputcss2" id="oldPass" /></td>
					    <td><ul class="safelist2">
			          	<li><span class="war" id="oldPassState"></span><span class="sfinfo" id="oldPassMessage">请录入您的当前密码</span>
			            </li></ul></td>
					  </tr>
					  <tr>
					    <td height="38" align="right">新 密 码：</td>
					    <td><input name="newPass" type="password" class="inputcss2" id="newPass" /></td>
					    <td>
					    <ul class="safelist2">
			          	<li><span class="war" id="newPassState"></span><span class="sfinfo" id="newPassMessage">请录入您的新密码</span>
			            </li></ul>
					    </td>
					  </tr>
					  <tr>
					    <td height="38" align="right">确认密码：</td>
					    <td><input name="rePass" type="password" class="inputcss2" id="rePass" /></td>
					    <td><ul class="safelist2">
					        <li><span class="war" id="rePassState"></span><span class="sfinfo" id="rePassMessage">请确认您的新密码</span>
					    </ul></td>
					  </tr>
					  <tr>
					    <td height="38">&nbsp;</td>
					    <td><input name="passSubmit" type="submit" class="addbtn3" id="passSubmit" value="提交" style="cursor:pointer"/></td>
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

       	  <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
