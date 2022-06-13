<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-取款记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 取款记录 </div>
  </div>
</div>
<div class="memberbox">
	<c:set var="PageId" value="4" scope="page"></c:set>
  <%@include file="menu.jsp" %>
 <div class="tzgl">
    <div class="usertab">
          	<ul>
            	<li class="out" style="cursor:pointer" onclick="location.href='/memberCenter/getMoney.jhtml'">提取现金</li>
              <li class="ck" style="cursor:pointer" onclick="location.href='/memberCenter/getMoneyList.jhtml'">取款记录</li>
              <li class="showeek">显示最近一周记录</li>
            </ul>
    </div>
    <div class="shaixuan">
    	 <form id="reportForm" name="reportForm" action="/memberCenter/getMoneyList.jhtml" method="post">
       	   我要筛选
             <select name="state" id="state">
               <option value="">状态选择</option>
								<c:forEach var="obj" items="${memberDrowStates}">
									<option value="${obj.key}" <c:if test="${obj.key eq param.state }">selected</c:if>>${obj.value}</option>
								</c:forEach>
							</select>
       　　起始日期
       <input type="text" name="beginTime" id="beginTime"
													value="${param.beginTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
			至   
			<input type="text" name="endTime" id="endTime"
													value="${param.endTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
    　
   		 <input name="button" type="submit" class="inputyellow" id="button" value="查询" style="width:62px" />
   		</form>
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
    	 <tr>
		    <td width="10%" align="center" class="tztop">序号</td>
		    <td width="20%" height="30" align="center" class="tztop">取款时间</td>
		    <td width="20%" align="center" class="tztop">处理时间 </td>
		    <td width="10%" align="center" class="tztop">提款方式</td>
		    <td width="10%" align="center" class="tztop">金额</td>
		    <td width="10%" align="center" class="tztop">状态</td>
		    <td width="20%" align="center" class="tztop"> 备注</td>
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
					<td widths="35" height="28" align="center">
						${list.id}
					</td>
					<td widths="120" align="center">
						${list.createTime}
					</td>
					<td widtsh="120" align="center">
						${list.operatorTime}
					</td>
					<td widtsh="50" align="center">
						银行卡
					</td>
					<td widtsh="90" align="center">
					  <fmt:formatNumber value="${list.money}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td widtsh="90" align="center">
						${list.stateName}
					</td>
					<td widtsh="165" align="center">
						${list.comments}
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
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
