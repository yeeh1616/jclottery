<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<c:set var="pageName" value="账户中心-彩民取款" scope="page"></c:set>
		<%@include file="../include/titlePage.jsp"%>
		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/js/common/base.js"></script>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 银行卡信息 </div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l"> 绑定${typeName} </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
    <div class="safe-xti">
    <div class="safets fl">温馨提示：</div>
    <div class="tihma fl"><p>您的${typeName}已绑定，允许修改。</p></div>
    </div>
    <div class="cent_qbz safe-tw">
  <c:if test="${mw.accountType eq '1'}">
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">开户行名称</div><div class="fl">${mw.accountName}</div><div class="clear"></div></div>
  <div class="clear"></div>
  </div>
  
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">支行名称</div><div class="fl">&nbsp;${mw.reserved1}
  </div><div class="clear"></div></div>
  </div>
  </c:if>
  
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">真实姓名</div><div class="fl">&nbsp;${mb.certiName}</div><div class="clear"></div></div>
  </div>
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">身份证号</div><div class="fl">&nbsp;${mb.certiNumber}</div><div class="clear"></div></div>
  </div>
  <div class="cent_sm cent-sdi">
  <div class="cent_sml fl"><div class="cent-ts fl">${typeName}号</div><div class="fl">&nbsp;${mw.accountCard}</div><div class="clear"></div></div>
  <div class="cent_smr fr"><a href="user_visa_o.html">修改</a></div><div class="clear"></div>
  </div>
</div>
    <!--具体信息end--> 
    
  </div>
</div>
  <div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
