<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-我的团队" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>

<script type="text/javascript" src="/js/membercenternew/myTeam.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
	<div class="sitepath fl"> 您当前的位置：
		<a href="/memberCenterNew/index.jhtml">用户中心</a>
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">我的团队</a>
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">彩民列表</a> 
  		&gt;基本信息 
	</div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj"><div class="gr-safe-l">我的团队 </div></div>
    <div class="notice2"><b>我的推广：</b>http://${agentUrl}</div>
    <!--安全等级end--> 
<div class="gr-lbody">

    <!--具体信息begin-->
	<div class="w_gcjl">
		<c:set var="btnNum" value="1" scope="page"></c:set>
		<%@include file="titleButtonsForTeamMember.jsp" %>
	</div>

    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
	  <tr>
	    <th width="5%">序号</th>
	    <th width="10%" height="30">登录名</th>
	    <th width="10%">真实名称</th>
	    <th width="15%">证件号 </th>
	    <th width="8%">省</th>
	    <th width="8%">市</th>
	    <th width="16%">联系电话</th>
	    <th width="18%"> 注册时间</th>
	    <th width="10%">操作</th>
	  </tr >
 		 <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">				
			<c:choose>
				<c:when test="${varStatus.count%2==0}">
					<tr align="center" bgcolor="#f4fbff">
				</c:when>
				<c:otherwise>
					<tr align="center" bgcolor="#FFFFFF">
				</c:otherwise>
			</c:choose>
		    <td>${varStatus.count}</td>
		    <td>${list.memberName}</td>
		    <td>${list.aliasName}</td>
		    <td>${list.certiNumber}</td>
		    <td>${list.province}</td>
		    <td>${list.city}</td>
		    <td>${list.phone}</td>
		    <td>${list.createTime}</td>
		    <td><a href="javascript:;"id="xq_${list.id}" name="memberDetail">详情</a></td>
		  </tr>
  </c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
  </div>    
<!--具体信息end--> 
    
  </div>
</div>
  <div class="clear"></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</body>
</html>
