<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-合买记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/base.css"/>
<style type="text/css">
.w_zjcx{width:808px;}
.w_zjcx_t .current{width:125px;height:34px;background:#E8C485;color:#86704A!important;float:left;display:block;border:1px solid #CA9447;text-align:center;line-height:34px;font-size:14px;margin-left:10px;}
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
.table_w_c td{height:55px;text-align:center;color:#333333;border-bottom:1px solid #d3d3d3;}
.table_w_o td{height:30px;text-align:center;color:#333333;border-bottom:1px solid #d3d3d3;border-right: 1px solid #d3d3d3;}
.table_w_c td .w_color{color:#ff3300;}
.table_w_oc img{margin-left:10px;float:left;margin-top:5px;}
.table_w_oc h3{margin-left:10px;float:left;line-height:55px;}
.w_zjcx_c{display:none;}
.w_show{display:block;}
.w_zjcx_t{display:block !important;}
.table_w .biaoge3{border-right:none !important;}
</style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 定制跟单 </div>
  </div>
</div>
<div class="memberbox">
	<c:set var="PageId" value="15" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
  <div class="w_zjcx">
  	<input type="hidden" id="type" value="1"/>
	<div class="w_zjcx_t">	
		<ul>
    		<li><a id="myCustoming" href="/memberCenterCustom/custom.jhtml?type=1" class="current">我定制的跟单</a></li>
       		<li><a id="myCustomed" href="/memberCenterCustom/custom.jhtml?type=2">我被定制的记录</a></li>
        	<li><a id="myAppointed" href="/memberCenterCustom/custom.jhtml?type=3">我指定的跟单人</a></li>
       		<li><a id="myAppointToMe" href="/memberCenterCustom/custom.jhtml?type=4">我被指定的记录</a></li>
            <div class="clear"></div>
    	</ul>
    </div>
   <div class="w_zjcx_c w_show">
   <form id="reportForm" name="reportForm" action="/memberCenterCustom/custom.jhtml?type=1" method="post">
    	<div class="w_choose">我要筛选
         <select name="licenseId" id="licenseId">
               <option value="">全部彩种</option>
			<c:forEach var="obj" items="${ltype}">
				<option value="${obj.licenseId}" <c:if test="${obj.licenseId == licenseId}" >selected = "selected"</c:if>>${obj.licenseString}</option>
			</c:forEach>
		 </select>
        </div>
        <div class="table_w">
        	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_w_o">
			  <tr>
			    <th width="5%">序号</th>
			    <th width="10%">彩种</th>
			    <th width="13%">被定制人</th>
			    <th width="13%">跟单方式</th>
			    <th width="20%">跟单金额/比例</th>
			    <th width="13%">是否被指定</th>
			    <th width="20%">定制时间</th>
			    <th width="10%">操作</th>
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
			    <c:choose>
					<c:when test="${list.customMode == '1'}">
						<td>固定金额</td>
					</c:when>
					<c:otherwise>
						<td>按照比例</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${list.customMode == '1'}">
				         <td>${list.fixedCusMoney}元</td>
				    </c:when>
				    <c:otherwise>
				    	<td><fmt:formatNumber type="number" value="${list.cusProp * 100}" maxFractionDigits="0"/>%</td>
				    </c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${list.appointed == 0}">
						<td>未指定</td>
					</c:when>
					<c:otherwise>
						<td>指定${list.appointed}个</td>
					</c:otherwise>
				</c:choose>
			    <td>${list.cusDate}</td>
			    <td class=" biaoge3 color">
			    	<input type="hidden" name="customId" value="${list.id}"/>
					<a name="cancel" style="cursor:pointer;" >取消</a>
				</td>
			    </tr>
			  </c:forEach>
			  <tr>
				<td height="28" colspan="11" bgcolor="#e1eaef">
					<div class="page">
					<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
					</div>
				</td>
			  </tr>
</table>

        </div>
        <div class="explain">
        <p><span>说明：</span>本站所有会员都可以自由定制用户发起的方案，自定义跟单金额（最低1元）；跟单定制成功后，自动跟单会员可随意修改跟单金额和分数，并不改变跟单排名，也可以自由退出跟单。如跟单用户约不足时。则视为自愿放弃"自动跟单"（指定跟单人除外）再次定制跟单时。须重新定制;使用"定制跟单"功能后,会员可以正常使用其他合买功能</p></div>
</form>
</div>
</div>
</div>
<div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/layerNew/layer.js"></script>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
<script type="text/javascript" src="/js/membercenter/mergerCustom.js"></script>
</body>
</html>
