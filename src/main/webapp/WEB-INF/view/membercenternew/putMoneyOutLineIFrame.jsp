<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-用户充值" scope="page"></c:set>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/buy.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/user_center.css"></link>
<script type="text/javascript" src="/js/jquery.js"></script>
</head>

<body>

<!--用户中心-->

	<div class="gr-lbody" style="width: 759px!important; padding-left:0px !important;padding-right:0px !important;" >     
    <!--具体信息begin--> 
    <div class="w_zxcz ">
    	<div class="w_zxcz_title">第一步  到银行柜台汇款或者ATM机转账</div>
        <div class="w_zxcz_cont">
        	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_zxczb">
				  <tr>
				    <th width="25%">类型</th>
				    <th width="25%">开户行</th>
				    <th width="30%">账号</th>
				    <th width="20%">收款人</th>
				  </tr>
				  <c:forEach var="obj" items="${storeBanklist}">
				   	<tr>
				   		<c:choose>
				        <c:when test="${obj.type == 1}"><td>银行卡</td></c:when>
				        <c:when test="${obj.type == 2}"><td>支付宝</td></c:when>
				        <c:when test="${obj.type == 3}"><td>财付通</td></c:when>
				        <c:when test="${obj.type == 4}"><td>微信</td></c:when>
				   		</c:choose>
				   		<c:choose>
					    <c:when test="${obj.type == 2 || obj.type == 3 || obj.type == 4}"><td> - - </td></c:when>
					    <c:otherwise><td>${obj.accountName}</td></c:otherwise>
				   		</c:choose>
					    <td> ${obj.account} </td>
					    <td>${obj.accountUserName}</td>
					  </tr>
				  </c:forEach>
				</table>
				        </div>
				<div class="w_zxcz_title">第二步  通知店主</div>
				<div class="w_zxcz_contt">
		        	<ul>
		            	<li>店主名称：${store.bossName}</li>
		                <li>店主手机：${store.storePhone}</li>
		                <li>店主电话：${store.storeMobile}</li>
		                <li>店主　QQ：${store.storeQq}</li>
		                <div class=" clear"></div>
		            </ul>
		        </div>
			</div>
		</div>
    <!--具体信息end--> 
  <div class="clear"></div>
 </body>
 <script>
 		$(window.parent.document).find("#footerIframe").load(function(){
			var main = $(window.parent.document).find("#footerIframe");
			var thisheight = $(document).height()+30;
			main.height(thisheight);
		});
 </script>
</html>
