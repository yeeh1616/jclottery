<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="大乐透" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/Dlt.js"></script>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/dltpt.js"></script>
<input id="radomBetCodeId" type="hidden" value="${betCode }"/>

<div class="common_w" id="betPanalId">  
	<jsp:include page="./header.jsp"></jsp:include>
<div class="sais_t"></div>
<div class="jiangjin">
<!--大乐透-->
<div class="jiangjin_l">
<div class="hq_n" id="beforeAreaId">

</div>
<div class="lq" id="afterAreaId">

</div>
<div class="clear"></div>
<div class="cloose_touzhu">
     <div class="wcloose_top">
            <div class="fs_bor" style="bottom: 223px;left:338px;"></div><div class="fs_sj" style="bottom: 228px;left:340px;"></div>
        <div class="wcloose_top_l fl">您选择了<span class="tw_red" id="redBallNumId">0</span>个<span class="tw_red">红球</span>，<span class="tw_blue" id="blueBallNumId">0</span>个<span class="tw_blue">蓝球</span>，共<b id="betNumId">0</b> 注，共 ￥ <b id="betMoneyId">0</b> 元</div>
        <div class="wcloose_top_r fr"><a href="javascript:void 0" class="w_tianjiabtn" id="addToBetListBtnId"></a><a href="javascript:void 0" class="w_qingkbtn" id="clearAllSelBtnId">清空全部</a></div>
        <div class="clear"></div>
      </div>
  
  	  <jsp:include page="./left.jsp"></jsp:include>
        
</div>
</div>
<!--大乐透 end-->
<jsp:include page="./right.jsp"></jsp:include>
</div> 
<div class="clear"></div> 
</div>
<jsp:include page="./surepage.jsp"></jsp:include>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>