<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="排列三" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<link href="/css/singleupload.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../../include/header.jsp"></jsp:include>

<script type="text/javascript" src="/js/lottery/pl3/singleupload.js"></script>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
<input type="hidden" id="dsPlayId" value="3"/>
<div class="content">
  <div class="dlt-left">
  	<jsp:include page="./header.jsp"></jsp:include>
      <div class="zhi_pic">
           <jsp:include page="./z6header.jsp"></jsp:include>
      </div>
    <div class="sc" id="singPanelDivId">
		        <!--<div class="sc-bg">
		          <div class="sg">
		            <input name="uploadMode" type="radio" value="" />
		            &nbsp;手工录入</div>
		          <div class="sg">
		            <input name="uploadMode" type="radio" value="" />
		            &nbsp;文件上传</div>
		        </div>-->
		       <div >
		            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <span id="fileuplodid" style="display: none;" width="101" height="31"></span>
		            <span id="fileQueue" ></span>
		         </div>  
		         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;倍数：<input style="border:none; width:57px; height:19px; text-align:center" type="text" value="1" id="dsMultipleId" size=3/> 倍，
		         您本次上传了  <b id="betDsNumId">0</b> 注，共 <b id="betDsMoneyId">0</b> 元 </p>
		        <div class="buy"><a href="javascript:void 0" id="singleBuyBtnId">立即购买</a></div>
		        <div class="yangb"><a name ="danshi" href=" javascript:void(0)" value="2">查看标准格式样本</a></div>
		        <div class="both"></div>
		        <div class="xz"> <span>上传须知：</span><br />
		          1、请严格参照"标准格式样本"格式上传方案。<br />
		          2、文件格式必须是（.txt）文本，文件内每行仅限一注，文件大小不能超过10M。<br />
		          3、由于上传的文件较大，会导致上传时间及在本页停留时间较长，请耐心等待。<br />
		          4、网站销售截止前30分钟内，只能上传20000注以内的方案。<br />
		        </div>
		   </div>
  </div>
  <jsp:include page="./right.jsp"></jsp:include>
</div>

<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
<jsp:include page="../lotteryForm.jsp"></jsp:include>
</body>
</html>
