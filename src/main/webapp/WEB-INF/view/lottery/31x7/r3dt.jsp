﻿<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="七乐彩" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/qlc/Qlc.js"></script>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/31x7/${p }.js"></script>

<div class="common_w" id="betPanalId">  
	<jsp:include page="./header.jsp"></jsp:include>
<div class="sais_t"></div>
<div class="jiangjin">
<!--大乐透-->
<div class="jiangjin_l">
<jsp:include page="./r3header.jsp"></jsp:include>
<div class="hq_n" style="width: 708px;" id="beforeDanAreaId">
</div>

<div class="hq_n" style="width: 708px;" id="beforeTuoAreaId">
</div>

<div class="clear"></div>
<div class="cloose_touzhu">
     <div class="wcloose_top">
            <div class="fs_bor" style="bottom: 223px;left:338px;"></div><div class="fs_sj" style="bottom: 228px;left:340px;"></div>
        <div class="wcloose_top_l fl">您选择了共<b id="betNumId">0</b> 注，共 ￥ <b id="betMoneyId">0</b> 元</div>
        <div class="wcloose_top_r fr"><a href="javascript:void 0" class="w_tianjiabtn" id="addToBetListBtnId"></a><a href="javascript:void 0" class="w_qingkbtn" id="clearAllSelBtnId">清空全部</a></div>
        <div class="clear"></div>
      </div>
  
  	  <jsp:include page="../dlt/left.jsp"></jsp:include>
        
</div>
</div>
<!--大乐透 end-->
<jsp:include page="../dlt/right.jsp"></jsp:include>
</div> 
<div class="clear"></div> 
</div>
<jsp:include page="../dlt/surepage.jsp"></jsp:include>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>