<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民提款" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 彩民取款 </div>
</div>
<!--用户中心-->
<div class="user_plant">
<c:set var="PageId" value="4" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">账户取款 </div>
    </div>
    <!--安全等级end--> 
	<div class="gr-lbody">     
    <!--具体信息begin-->
    <div class="w_gcjl_l">
    <ul>
    <li><a href="/memberCenterNew/getMoney.jhtml" class="active">提取现金</a></li>
	<li><a href="/memberCenterNew/getMoneyList.jhtml">取款记录</a></li>
	</ul><span>显示最近一周记录</span>
    <div class="clear"></div>
    </div>
    	<div class="tk1">
        	<ul>
        		<c:choose>
					<c:when test="${customertags:isEmpty(mb.certiNumber) == 'false' }">
						<li class="link"><img src="/images/ok.gif"/>真实名称<span>已校验</span></li>
					</c:when>
					<c:otherwise>
						 <li class="link"><a href="/memberCenterNew/authenticat.jhtml">实名认证</a><img src="/images/war.gif"/>真实名称<span>未校验</span></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${customertags:isEmpty(mb.bankAccount)== 'false' }">
						<li><img src="/images/ok.gif"/>银行卡号<span>${mb.bankAccount}</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="/memberCenterNew/bankCard.jhtml">未绑定</a><img src="/images/war.gif"/>银行卡</li>
					</c:otherwise>
				</c:choose>
          </ul>
        </div>
    </div>
    <!--具体信息end--> 
  </div>
  <div class="clear"></div>
  </div>
  </div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
