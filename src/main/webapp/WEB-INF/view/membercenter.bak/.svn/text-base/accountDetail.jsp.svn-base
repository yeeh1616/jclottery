<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-账户明细" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 账户明细 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="5" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    <div class="usertab">
          	<ul>
            	<li class="ck">账户明细</li>
            	<!--<li class="out">红包明细</li>
            	<li class="out">充值记录</li>
            	<li class="out">购彩票记录</li>
            	<li class="out">中奖记录</li>
            	<li class="out">取款记录</li>-->
              <li class="showeek">显示最近一周记录</li>
            </ul>
    </div>
    <div class="shaixuan">
    	<form id="reportForm" name="reportForm" action="/memberCenter/accountDetail.jhtml" method="post">
       	   我要筛选
             <select name="category" id="category">
               <option value="">状态选择</option>
								<c:forEach var="obj" items="${memberMoneyType}">
									<option value="${obj.key}" <c:if test="${obj.key eq param.category }">selected</c:if>>${obj.value}</option>
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
	    <td width="5%" align="center" class="tztop">序号</td>
	    <td width="20%" height="30" align="center" class="tztop">交易时间</td>
	    <td width="10%" align="center" class="tztop">收入/支出</td>
	    <td width="15%" align="center" class="tztop">交易类型 </td>
	    <td width="10%" align="center" class="tztop">状态</td>
	    <td width="10%" align="center" class="tztop">金额</td>
	    <td width="10%" align="center" class="tztop">账户余额</td>
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
	    <td align="center" bgcolor="#FFFFFF">${varStatus.count}</td>
	    <td height="30" align="center" bgcolor="#FFFFFF">${list.createTime}</td>
	    <td align="center" bgcolor="#FFFFFF">${list.typeName} </td>
	    <td align="center" bgcolor="#FFFFFF">${list.categoryName2}</td>
	    <td align="center" bgcolor="#FFFFFF">${list.stateName}</td>
	    <td align="center" bgcolor="#FFFFFF">
	    	<c:if test="${list.type == 1}">
	    		-
	    	</c:if>	
	    	<fmt:formatNumber value="${list.money}" pattern="#,###.##"  minFractionDigits="2"/>
	    </td>
	    <td align="center" bgcolor="#FFFFFF"><fmt:formatNumber value="${list.balance}" pattern="#,###.##"  minFractionDigits="2"/></td>
	    <td align="center" bgcolor="#FFFFFF">${list.commont}</td>
	  </tr>
  </c:forEach>
  <tr>
    <td height="38" colspan="10" align="center" bgcolor="#e2eaef">
    	<div class="page">
  　　<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
    </div></td>
    </tr>
</table>  
      
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
