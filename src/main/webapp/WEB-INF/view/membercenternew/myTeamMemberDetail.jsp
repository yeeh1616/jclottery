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
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
	<div class="sitepath fl"> 您当前的位置：
		<a href="/memberCenterNew/index.jhtml">用户中心</a>
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">我的团队</a>
  		&gt;<a href="/memberCenterNew/myTeam.jhtml">彩民列表</a> 
  		&gt;基本信息 &gt;团队彩民
	</div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--团队等级begin-->
    <div class="gr-safedj">
    	<div class="gr-safe-l">我的团队 </div>
    </div>
    <div class="notice2"><b>我的推广：</b>http://${agentUrl}</div>
    <!--团队等级end--> 
<div class="gr-lbody">

    <!--菜单列表信息begin-->
	<div class="w_gcjl_l">
		<ul><li><a class="active">彩民详情</a></li></ul>
		<div class="gr-safe-r gr-safe-rw"><a href="/memberCenterNew/myTeam.jhtml">&lt;&lt; 返回列表</a></div>
		<div class="clear"></div>
	</div>
	<!--菜单列表信息end-->
	
	<!--团队彩民详细信息begin-->
    <div class="w_gcjl_bg">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
		  <tr>
		    <th colspan="2" width="33%">基本信息</th>
		    <th colspan="2" width="33%">实名认证</th>
		    <th colspan="2" width="34%">账户信息</th>
		  </tr>
		  <tr>
		    <td class="gctm_l" width="13%">用户名：</td>
		    <td class="gctm_r">${mb.memberName}</td>
		    <td class="gctm_l" width="13%">真实姓名：</td>
		    <td class="gctm_r">${mb.certiName}</td>
		    <td class="gctm_l" width="13%">总资产：</td>
		    <td class="gctm_r"><fmt:formatNumber value="${memberaccount.canDrawalsAccount+memberaccount.moneyAccount+memberaccount.givenAccount}" pattern="#,##0.00"></fmt:formatNumber></td>
		    </tr>
		  <tr>
		    <td class="gctm_l">联系电话：</td>
		    <td class="gctm_r">${mb.phone}</td>
		    <td class="gctm_l">证件类型：</td>
		    <td class="gctm_r">
		    	<c:choose>
					<c:when test="${mb.certiType==1}">身份证</c:when>
					<c:when test="${mb.certiType==2}">驾驶证</c:when>
				</c:choose>
		    </td>
		    <td class="gctm_l">可用余额：</td>
		    <td class="gctm_r red"><fmt:formatNumber value="${memberaccount.canDrawalsAccount+memberaccount.moneyAccount+memberaccount.givenAccount-memberaccount.frozenAccount}" pattern="#,##0.00"></fmt:formatNumber></td>
		    </tr>
		  <tr>
		    <td class="gctm_l">安全邮箱：</td>
		    <td class="gctm_r">${mb.email}</td>
		    <td class="gctm_l">证件号码：</td>
		    <td class="gctm_r">${mb.certiNumber}</td>
		    <td class="gctm_l">红包账户：</td>
		    <td class="gctm_r"><fmt:formatNumber value="${memberaccount.givenAccount}" pattern="#,##0.00"></fmt:formatNumber></td>
		    </tr>
		  <tr>
		    <td class="gctm_l"> QQ：</td>
		    <td class="gctm_r">${mb.qq}</td>
		    <td class="gctm_l">&nbsp;</td>
		    <td>&nbsp;</td>
		    <td class="gctm_l">冻结资金：</td>
		    <td class="gctm_r"><fmt:formatNumber value="${memberaccount.frozenAccount}" pattern="#,##0.00"></fmt:formatNumber></td>
		  </tr>
    	</table>
	</div>
	<div class="tm_address">推广地址：<span>http://${agentUrl1}</span></div>
	<!--团队彩民详细信息begin-->
</div>
</div>
</div>
 <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
