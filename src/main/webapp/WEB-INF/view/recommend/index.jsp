<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="/images/top_logo.ico" />
<title>店铺推荐</title>

<c:set var="pageName" value="本店推荐" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<div class=" common_w">
<div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 店铺推荐 </div>
  </div>
  <div class="czfl">
     <!-- new license list(start) -->
     <div class="sidebar fl">
		<h2><span onclick="location.href='/recommend/index.jhtml'">
			<a href="/recommend/index.jhtml"><img src="/images/icon_m.png" width="16" height="12"/>全部推荐</a></span></h2>
	    <ul>
	   	  <li class="zicaidan1"><h1><span class="jjc"></span>竞彩</h1>
	      	   <ul class="zicaidan_l">
	            	<li><a <c:if test="${param.type == 9}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=9">竞彩足球</a></li>
	                <li><a <c:if test="${param.type == 10}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=10">竞彩篮球</a></li>
	           </ul>
	      </li>
	      <li class="zicaidan1"><h1><span class="zzc"></span>足彩</h1>
	      	<ul class="zicaidan_l">
	      	<li><a <c:if test="${param.type == 5}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=5">胜负彩</a></li>
	        <li><a <c:if test="${param.type == 7}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=7">全半场</a></li>
	        <li><a <c:if test="${param.type == 8}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=8">进球彩</a></li>
	        </ul>
	      </li>
	    	<li class="zicaidan1 zicaidan_n"><h1><span class="ssc"></span>数字彩</h1>
	      		<ul class="zicaidan_l">
	      		<li><a <c:if test="${param.type == 1}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=1">排列三</a></li>
	        	<li><a <c:if test="${param.type == 2}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=2">排列五</a></li>
	        	<li><a <c:if test="${param.type == 3}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=3">七星彩</a></li>
	        	<li><a <c:if test="${param.type == 4}">class="side_cur"</c:if> href="/recommend/index.jhtml?type=4">大乐透</a></li>
	        	</ul>
	        </li>
	    </ul>
	</div>
	<!-- new license list(end) -->
	
	<div class="bdtj fl" style="  min-height: 477px;">
    	<div class="bdtj_title">彩票推荐</div>            
    	<ul>
   	    	<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
   	        <li>
            <a href="/news.jhtml?conid=${list.id}" target="_blank"><span class="tj">${list.title}</span>
            <span class="time">${list.createTime}</span></a></li>
        	</c:forEach>
        </ul>
        <div class="pagetotal">
        	<div class="clear"></div>
					<div class="ptotal">
			        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
					</div>
			  </div>
    </div>
    
    <div class="clear"></div>
     </div>
</div>
<form id="reportForm" name="reportForm" action="/recommend/index.jhtml" method="post">
	<input type="hidden" name="type" value="${param.type}">
</form>
<div class="clear" style="height:10px"></div>
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
</body>
</html>