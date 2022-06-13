<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<script type="text/javascript" src="/js/jquery.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 12px;
	font-family: "宋体";
	color: #565656;
	background-color: #f7f7f7;
}
div, html, body, ul, li, ol, dl, dd, dt, p, h1, h2, h3, h4, h5, h6, form, fieldset, legend, img, span {
	margin: 0;
	padding: 0;
}
img {
	border: 0;
}
ul, li {
	list-style: none;
}
input {
	padding-top: 0;
	padding-bottom: 0;
	cursor: pointer;
}
select, input, img {
}
a {
	text-decoration: none;
	cursor: pointer;
	color: #565656;
}
a:hover {
	color: #cf3032 !important;
	text-decoration: none;
}
.clear {
	clear: both;
}
.fl {
	float: left;
}
.fr {
	float: right;
}
.common_w {
	width: 980px;
	margin: 0 auto;
}
/**/
.zhiding_c {
	width: 356px;
	height:421px;
	margin: auto;
	margin-top:19px;
	background:#f0f4f6;
}
.zhiding_ct {
	height: 35px;
	border: 1px solid #bac1c4;
	text-align: center;
	line-height: 35px;
	color:#583c23;
	background:#B7E882;
	font-weight:bold;
}
.zhiding_ct span{color:#DE5658;margin-left:3px;margin-left:3px;}
.zhiding_cs span{color:#DE5658;margin-left:3px;}
.zhiding_cs {
	height: 35px;
	border: 1px solid #bac1c4;
	text-align: center;
	line-height: 35px;
	color:#583c23;
	background:#FFFFCC;
	font-weight:bold;
}
.zh_table{border-top: 1px solid #bac1c4;border-left:1px solid #bac1c4;}
.zh_table th{height:31px;text-align:center;color:#583c23;background:#d1ebf8;border-bottom: 1px solid #bac1c4;border-right:1px solid #bac1c4;}
.zh_table td{height:27px;text-align:center;color:#583c23;border-bottom: 1px solid #bac1c4;border-right:1px solid #bac1c4;}
</style>
<script type="text/javascript" src="/js/membercenter/memberCenterCustom.js"></script>
</head>
<body>
<div class="zhiding_c">
   <div class="zhiding_ct">还可指定人数:<span>${10- appointedNum}</span>人</div>
   <div class="zhiding_cs">已制定/可制定:<span>${appointedNum}</span>/<span>10</span></div>
   <div class="zhiding_cc">
     	<form id="reportForm" name="reportForm" action="/memberCenterCustom/appointPopup.do" method="post">
		    <table border="0" cellpadding="0" cellspacing="0" class="zh_table" width="100%">
			  <tr>
			    <th>序号</th>
			    <th>用户名</th>
			    <th>状态</th>
			  </tr>
			  <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
		  	  	<tr>
			    <td>${varStatus.count}</td>
			    <td>${list.appontMemberName}</td>
			    <td>
				    <c:choose>
						<c:when test="${list.state == 0}">
							<span>未受理</span>
						</c:when>
						<c:when test="${list.state == 1}">
							<span>已接受</span>
						</c:when>
						<c:when test="${list.state == 2}">
							<span>被拒绝</span>
						</c:when>
					</c:choose>
			    </td>
			    </tr>
			  </c:forEach>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript" src="/js/layerNew/layer.js"></script>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
