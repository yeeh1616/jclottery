<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="排列三" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../../../include/header.jsp" />
<!--header end-->
<div class="common_w" id="betPanalId">  
<jsp:include page="pl3header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/mathlottery/pl3/zxptPageControl.js"></script>
<div class="sais_t"></div>
<div class="jiangjin">
<!--大乐透-->
<div class="jiangjin_l">
<div class="tzym-pls">
<span>
<input type="radio" name="typesel" onclick="location.href='/lottery/index.jhtml?licenseId=9&amp;p=hhspf'" checked="checked" />普通投注</span>
<span>
<input type="radio" name="typesel" onclick="location.href='/lottery/index.jhtml?licenseId=9&amp;p=spf'" />组合复式</span>
<span>
<input type="radio" name="typesel" onclick="location.href='/lottery/index.jhtml?licenseId=9&amp;p=rqspf'" />胆拖</span>
<span>
<input type="radio" name="typesel" onclick="location.href='/lottery/index.jhtml?licenseId=9&amp;p=spf'" />和值</span>
<span>
<input type="radio" name="typesel" onclick="location.href='/lottery/index.jhtml?licenseId=9&amp;p=rqspf'" />单式上传</span>
</div>
<div class="hq t_qxch" id="numberArea"></div>
<div class="clear"></div>
<jsp:include page="pl3footer.jsp"></jsp:include>
<jsp:include page="../../lotteryForm.jsp"></jsp:include>
</div>

<!--大乐透 end-->
<jsp:include page="right.jsp" />
<div class="clear"></div>
</div> 
<div class="clear"></div> 
</div>
<jsp:include page="surepage.jsp"></jsp:include>
<jsp:include page="../../../include/footer.jsp"></jsp:include>
</body>
</html>