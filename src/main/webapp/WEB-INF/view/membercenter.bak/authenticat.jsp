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
  <c:set var="PageId" value="10" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    	<div class="safebox">
        	<div class="tzxq" style="margin-top:0px">实名认证</div>
            <div class="notice2"><b>提示：</b>真实姓名是您提款时的重要依据，填写后不可更改；网站不向未满18周岁的青少年出售彩票。
            	                                您的个人信息将被严格保密</div>
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class=" userxinxi">
						  <tr>
						    <td width="11%" height="5" align="right">&nbsp;</td>
						    <td width="33%">&nbsp;</td>
						    <td width="56%">&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="38" align="right">真实姓名：</td>
						    <td><input name="certiName" type="text" class="inputcss2" id="certiName" value="${param.certiName}"/></td>
						    <td><ul class="safelist2">
						          	<li><span class="war" id="certiNameState"></span><span class="sfinfo" id="certiNameMessage">请录入您认证使用证件的真实名称</span>
						            </li></ul></td>
						  </tr>
						  <tr>
						    <td height="38" align="right">身份证号：</td>
						    <td><input name="certiNumber" type="text" class="inputcss2" id="certiNumber" value="${param.certiNumber}"/></td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war" id="certiNumberState"></span><span class="sfinfo" id="certiNumberMessage">请录入您的身份证号码</span>
						            </li></ul>
						    </td>
						  </tr>
						  <tr>
						    <td height="38" align="right">确认号码：</td>
						    <td><input name="reCertiNumber" type="text" class="inputcss2" id="reCertiNumber" value="${param.certiNumber}"/></td>
						    <td><ul class="safelist2">
						    <li class="war"><span class="war" id="reCertiNumberState"></span><span class="sfinfo" id="reCertiNumberMessage">请确认您的证件号码 </span></li>
						    </ul></td>
						  </tr>
						  <tr>
						    <td height="38" align="right">手机号码：</td>
						    <td><input name="phone" type="text" class="inputcss2" id="phone" value="${mb.phone}"/></td>
						    <td><ul class="safelist2">
						          	<li><span class="war" id="phoneState"></span><span class="sfinfo" id="phoneMessage">请确保手机号码正确性</span>
						            </li></ul></td>
						  </tr>
						  <tr>
						    <td height="38">&nbsp;</td>
						    <td><input name="button3" type="button" class="addbtn3" id="authenticatSubmit" value="提交" style="cursor:pointer"/></td>
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
