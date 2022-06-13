<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-定制跟单" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/base.css"/>
<style type="text/css">
.w_zjcx_t .current{width:125px;height:34px;background:#E8C485;color:#86704A!important;float:left;display:block;border:1px solid #CA9447;text-align:center;line-height:34px;font-size:14px;margin-left:10px;}
.w_zjcx{width:808px;}
.w_zjcx li a{width:125px;height:34px;background:#f9e6c5;color:#9a6e16 !important;float:left;display:block;border:1px solid #cdb189;text-align:center;line-height:34px;font-size:14px;margin-left:10px;}
.w_zjcx_c{border:1px solid #becfd7;}
.w_choose{height:37px;border-bottom:1px solid #a19b9b;background:#e2eaef;line-height:37px;padding-left:10px;}
.w_choose select{margin-left:10px;}
.w_choose input{width:60px;height:21px;background:#ffdd81;border:1px solid #c8ad65;line-height:21px;text-align:center;color:#705845;margin-left:20px;}
.w_table{border-top:1px solid #becfd7;border-left:1px solid #becfd7;}
.w_table th{height:30px;background:#596e79;border-bottom:1px solid #becfd7;border-right:1px solid #becfd7;text-align:center;color:#fff;background:#596e79;font-weight:normal;}
.w_zjcx_c .notice{height:30px; line-height:30px;text-align:center;border-bottom:1px solid #becfd7;}
.w_zjcx_c .explain{line-height:30px;color:#999999;padding-left:10px;padding-right:10px;}
.w_zjcx_c span{color:#333333;font-weight:bold;333333}
.w_foot{text-align:right;color:#333333;margin-top:15px;margin-right:10px;}
.w_foot input{ vertical-align:-2px;}
.table_w_o{border-top:1px solid #becfd7;border-left:1px solid #becfd7;}
.table_w_o th{height:30px;background:#596e79;border-bottom:1px solid #becfd7;border-right:1px solid #becfd7;text-align:center;color:#fff;background:#596e79;font-weight:normal;}
.table_w_o td{height:30px;text-align:center;color:#333333;border-bottom:1px solid #d3d3d3;}
.table_w_c td{height:55px;text-align:center;color:#333333;border-bottom:1px solid #d3d3d3;}
.table_w_c td .w_color{color:#ff3300;}
.table_w_oc img{margin-left:10px;float:left;margin-top:5px;}
.table_w_oc h3{margin-left:10px;float:left;line-height:55px;}
.w_zjcx_c{display:none;}
.w_show{display:block;}
.w_zjcx_t{display:block !important;}
</style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<input type="hidden" name="layerId" value=""/>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 定制跟单 </div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">定制跟单 </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
<div class="w_gcjl">
	<c:set var="btnNum" value="4" scope="page"></c:set>
	<%@include file="titleButtonsForCustom.jsp" %>
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
    	 <tr>
    <th width="5%">序号</th>
    <th width="22%">彩种</th>
    <th width="23%">发起人</th>
    <th width="25%">指定时间</th>
    <th width="25%">操作</th>
  </tr>
  <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
  	<c:choose>
		<c:when test="${varStatus.count%2==0}">
			<tr bgcolor="#f4fbff">
		</c:when>
		<c:otherwise>
			<tr bgcolor="#FFFFFF">
		</c:otherwise>
	</c:choose>
    <td>${varStatus.count}</td>
    <td>${list.licenseName}</td>
    <td>${list.memberName}</td>
    <td>${list.appointDate}</td>
 	<td class=" biaoge3 color">
 		<input type="hidden" name="memberId" value="${list.memberId}"/>
 		<input type="hidden" name="appointMemberId" value="${list.appointMemberId}"/>
 		<input type="hidden" name="licenseId" value="${list.licenseId}"/>
 		<input type="hidden" name="storeId" value="${list.storeId}"/>
 		
		<input type="button" name="accept" value="接受" class="btn"/>
		<input type="button" name="refuse" value="拒绝" class="btn"/>
	</td>
    </tr>
  </c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">                                
			<form id="reportFormz" name="reportForm" action="/memberCenterCustomNew/custom.jhtml?type=4" method="post"></form>
			<customertags:paging formId="reportFormz" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
    <div class="help_explain"> <span>说明：</span>本站所有会员都可以自由定制用户发起的方案，自定义跟单金额（最低1元）；跟单定制成功后，自动跟单会员可随意修改跟单金额
    和分数，并不改变跟单排名，也可以自由退出跟单。如跟单用户约不足时。则视为自愿放弃"自动跟单"（指定跟单人除外）再次定制跟单时。须重新定制;使用"定制跟单"功能后,会员可以正常使
    用其他合买功能</div>
  </div>    
    <!--具体信息end-->
  </div>
</div>
  <div class="clear"></div></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
<script type="text/javascript" src="/js/membercenternew/mergerCustom.js"></script>
</body>
</html>
