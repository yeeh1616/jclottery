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

<jsp:include page="../../include/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/Dlt.js"></script>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/dtPageControl.js"></script>
<div class="content">
  <div class="dlt-left">
    <div class="dlt-l">
      <jsp:include page="./dltheader.jsp"></jsp:include>
      <div class="dlt-l-c1">
        <div class="dlt-l-c1-l">
          <div class="dlt-l-c1-l-t">前区胆码<span>至少选择1个,最多选4个</span></div>
          <div class="dlt-l-c1-l-c" id="beforeDanAreaId">
            
          </div>
          <div class="clear"></div>
        </div>
        <div class="dlt-l-c1-r">
          <div class="dlt-l-c1-r-t"> 后区胆码<span>最多选择1个</span> </div>
          <div class="dlt-l-c1-r-c" id="afterDanAreaId">
            <div class="clear"></div>
          </div>
          
        </div>
        <div class="clear"></div>
        <div class="dlt-l-c1-l">
          <div class="dlt-l-c1-l-t">前区拖码<span>前区胆码+拖码总个数不少于6个</span></div>
          <div class="dlt-l-c1-l-c" id="beforeTuoAreaId">
          </div>
          <div class="clear"></div>
          
        </div>
        <div class="dlt-l-c1-r">
          <div class="dlt-l-c1-r-t">后区拖码<span>至少选择2个</span> </div>
          <div class="dlt-l-c1-r-c" id="afterTuoAreaId">
            <div class="clear"></div>
          </div>
          
        </div>
        <div class="clear"></div>
        <div class="dlt-l-cl-b">
        	<P><span>玩法提示：</span>每注基本号码由<em>5</em>个前区号和<em>2</em>个后区号组成。</P>
        </div>
      </div>
    </div>
     <div class="dlt-l2">
    	<div class="dlt-l2t">
        	<span><a style="cursor:pointer" id="addToBetListBtnId"><img src="/images/dl_32.png" /></a>
            <a style="cursor:pointer" id="clearAllSelBtnId"><img src="/images/dl_34.png" /></a></span>
        	<p>您选择了  <b id="betNumId">0</b> 注，共 ￥ <b id="betMoneyId">0</b> 元</p>
        </div>
    </div>
	<jsp:include page="./dltleft.jsp"></jsp:include>    
  </div>
  <jsp:include page="./dltright.jsp"></jsp:include>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>