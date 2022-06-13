<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-安全首页" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 安全中心</div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
<div class="gr-lbody">
<div class="cen-tm">
<div class="cen-tml fl"></div>
<div class="cenm fl">
<div class="cen-rtex">安全中心<span class="cen-tpgc">安全购彩</span><span class="cen-tpgc cen-happ">快乐生活</span></div>
<div>
<div class="cen-denj fl">账户安全等级:</div>
<div class="cen-secom fl">
<!---是第几等级就要都要显示几，没到那一级的去掉样式，每一级20分-->
   <c:choose>
   <c:when test="${mb.safety <= 20}">
   <div class="lv1"></div><div class=""></div><div class=""></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 20 && mb.safety <= 40}">
   <div class="lv2"></div><div class="lv2"></div><div class=""></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 40 && mb.safety <= 60}">
   <div class="lv3"></div><div class="lv3"></div><div class="lv3"></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 60 && mb.safety <= 80}">
   <div class="lv4"></div><div class="lv4"></div><div class="lv4"></div><div class="lv4"></div><div class=""></div>
   </c:when>
   <c:when test="${80 < mb.safety}">
   <div class="lv5"></div><div class="lv5"></div><div class="lv5"></div><div class="lv5"></div><div class="lv5"></div>
   </c:when>   
   </c:choose>
  </div>
  <div class="cen-fens fl"><span class="cen-zbig">${mb.safety}</span>分&nbsp;<c:choose><c:when test="${mb.safety <= 40}">低</c:when><c:when test="${mb.safety > 40 && safetyLevel <= 60}">中</c:when><c:when test="${mb.safety > 60}">高</c:when></c:choose></div>
  <div class="clear"></div>
  </div>
  </div>
  <div class="clear"></div>
  </div>
  <div>
  <div class="cen-twex">完成以下步骤，可以提升安全指数！</div>
  <div class="cen-te">
  <div class="cen-tel fl">
  <div class="cen-tele fl">
  <div class="cent-ts cenma">实名认证</div>
  <div class="cent-intro">个人身份信息官方认证，用于提款<br />
和确认身份</div>
  </div>
  <c:choose><c:when test="${mb.certiNumber eq null or mb.certiNumber eq ''}"><a href="/memberCenterNew/authenticat.jhtml"><div class="cen-telr fl">立即认证</div></a></c:when><c:otherwise><a href="/memberCenterNew/authenticat.jhtml"><div class="yb-cosa cen-telr fl">已认证</div></a></c:otherwise></c:choose><div class="clear"></div>
  </div>
  <div class="cen-ter fl">
  <div class="cen-wn fl">
  <div class="cent-ts cenma">取款设置</div>
  <div class="cent-intro">绑定银行卡是您提款时的唯一用卡，<br>
是资金提取的安全保证</div>
  </div>
  <c:choose>
  <c:when test="${key eq 'T'}">
 	 <a href="/memberCenterNew/getMoneyOptions.jhtml"><div class="cen-telr yb-cosa fl">已绑定</div></a>
  </c:when>
  <c:otherwise>
  	<a href="/memberCenterNew/getMoneyOptions.jhtml"><div class="cen-telr fl">立即绑定</div></a>
  </c:otherwise>
  </c:choose>
  </div> 
  <div class="clear"></div>
  </div>
  </div>
  <div class="cent_qbz">
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">实名认证</div><div class="fl">是取票、领票、提款的重要凭证</div><div class="clear"></div></div>
  <c:choose><c:when test="${mb.certiNumber eq null or mb.certiNumber eq ''}"><div class="cent_smr fr"><a href="/memberCenterNew/authenticat.jhtml">立即认证</a></div></c:when><c:otherwise><div class="cent_smr cenyr fr">已认证</div></c:otherwise></c:choose><div class="clear"></div>
  </div>
  
<div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">取款方式</div><div class="fl">选择哪个一种常用的取款方式；<span class="cen-zd">先实名认证后，再进行取款设置</span>
</div><div class="clear"></div></div>
  <c:choose>
  <c:when test="${key eq 'T'}">
  <div class="cent_smr cenyr fr"><a href="/memberCenterNew/getMoneyOptions.jhtml">已绑定</a></div>
  </c:when>
  <c:otherwise>
  <div class="cent_smr fr"><a href="/memberCenterNew/getMoneyOptions.jhtml">立即绑定</a></div>
  </c:otherwise>
  </c:choose>
  <div class="clear"></div>
  </div>
  
  <div class="cent_sm">
  <div class="cent_sml fl"><div class="cent-ts fl">手机号码</div><div class="fl">中大奖后，方便彩站及时通知您</div><div class="clear"></div></div>
  <c:choose><c:when test="${customertags:isEmpty(mb.phone) == 'false' }"><div class="cent_smr cenyr fr"><a href="/memberCenterNew/personDatumSucc.jhtml">修改</a></div></c:when><c:otherwise><div class="cent_smr fr"><a href="/memberCenterNew/personDatum.jhtml">立即填写</a></div></c:otherwise></c:choose><div class="clear"></div>
  </div>
  <div class="cent_sm cent-sdi">
  <div class="cent_sml fl"><div class="cent-ts fl">账户密码</div><div class="fl">强度：<c:choose><c:when test="${mb.reserved2 == 1}">弱</c:when><c:when test="${mb.reserved2 == 2}">中</c:when><c:when test="${mb.reserved2 == 3}">强</c:when></c:choose></div><div class="clear"></div></div>
  <div class="cent_smr cenyr fr"><a href="/memberCenterNew/changePass.jhtml">修改</a></div><div class="clear"></div>
  </div>
</div>
</div>
</div>
  <div class="clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
