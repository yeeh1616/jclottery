<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>-${domain.storeName}</title>
<c:set var="pageName" value="排列三" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../../include/header.jsp"></jsp:include>

<script type="text/javascript" src="/js/lottery/pl3/z3hzPageControl.js"></script>
<div class="content">
  <div class="dlt-left">
    <div class="dlt-l">
      <jsp:include page="./header.jsp"></jsp:include>
      <div class="zhi_pic">
           <jsp:include page="./z3header.jsp"></jsp:include>
            <div class="zhi_pic_2" id="betAreaDivId">
            	<h3>至少选择<span>1</span>个号码球</h3>
                
           </div>
      </div>
    </div>
    <div class="dlt-l2">
    	<div class="dlt-l2t">
        	<span><a style="cursor:pointer" id="addToBetListBtnId"><img src="/images/dl_32.png" /></a>
            <a style="cursor:pointer" id="clearAllSelBtnId"><img src="/images/dl_34.png" /></a></span>
        	<p><!--您选择了<em class="red" id="redBallNumId">0</em>个<em class="red">红球</em>，<em class="blue" id="blueBallNumId">0</em>个<em class="blue">蓝球</em>，-->共<b id="betNumId">0</b> 注，共 ￥ <b id="betMoneyId">0</b> 元</p>
        </div>
	</div>
	<jsp:include page="../dlt/dltleft.jsp"></jsp:include>    
  </div>
  <jsp:include page="./right.jsp"></jsp:include>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>