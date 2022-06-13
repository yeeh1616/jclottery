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
            <div class="notice2"><b>提示：</b>真实姓名是您提款时的重要依据，填写后不可更改。网站不向未满18周岁的青少年出售彩票；
            	                                您的个人信息将被严格保密</div>
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class=" userxinxi">
            	<input type="hidden" name="certiName" id="certiName" value="${param.certiName}">
            	<input type="hidden" name="certiNumber" id="certiNumber" value="${param.certiNumber}">
            	<input type="hidden" name="phone" id="phone" value="${param.phone}">
						  <tr>
						    <td width="11%" height="5" align="right">&nbsp;</td>
						    <td width="33%">&nbsp;</td>
						    <td width="56%">&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="38" align="right">真实姓名：</td>
						    <td>${param.certiName}</td>
						    <td><ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">请与证件上的真实名称保持一致，提交后不可以再次修改</span>
						            </li></ul></td>
						  </tr>
						  <tr>
						    <td height="38" align="right">证件号码：</td>
						    <td>${param.certiNumber}</td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">请与证件号码保持一致，提交后不可以再次修改</span>
						            </li></ul>
						    </td>
						  </tr>
						  <tr>
						    <td height="38" align="right">手机号码：</td>
						    <td>${param.phone}</td>
						    <td>
						    <ul class="safelist2">
						          	<li><span class="war"></span><span class="sfinfo">请确保手机号码正确性</span>
						            </li></ul>
						    </td>
						  </tr>
						  <tr>
						    <td height="38">&nbsp;</td>
						    <td>
						    	 <input name="button3" type="submit" class="addbtn3" id="authenticatSureSubmit" value="提交" style="cursor:pointer"/>
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

       	  <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
