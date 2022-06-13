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
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 安全首页 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="6" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
   <!-- <div class="waring">
        	<div class="notice"><h1>您的账户有风险！</h1>
						您已填写身份证信息，但尚未进行实名认证，认证后可保障账户安全，有效防止资金被盗取。</div>
            <div class="renzheng"><input type="button" class="addbtn3" value="立即认证" /></div>
        </div>-->
        
        <div class="safebox">
        	<div class="tzxq" style="margin-top:0px">安全首页</div>
          <div class="safe_center">
           	<div class="safe_ico"><h1>安全中心</h1>
						安全购彩 快乐生活</div>
						<div class="jibie">
						
							<h1>账户安全等级 <img src="/images/dj.gif" width="258" height="10" /> <font>中</font></h1>
						    <p>您的账户安全等级为 “<strong>中</strong>” ，请进一步提升！</p>
						</div>
          </div>
          
          <div class="clear"></div>     
					<ul class="safelist">
						<c:choose>
							<c:when test="${customertags:isEmpty(mb.certiNumber) == 'false' }">
								<li><span class="ok"></span><span class="sftype">实名认证</span><span class="sfinfo">通过实名认证，可以更好地保障您的账户安全</span></li>
							</c:when>
							<c:otherwise>
								 <li class="cuowu"><span class="errs"></span><span class="sftype">实名认证</span><span class="sfinfo">通过实名认证，可以更好地保障您的账户安全</span>
                <font style="padding-top:6px">
                	<input name="button3" type="submit" class="addbtn2" id="button3" value="认证" style="width:40px;cursor:pointer"  onclick="location.href='/memberCenter/authenticat.jhtml'"/>
          	    </font>
          			</li>
							</c:otherwise>
						</c:choose>
						
						<li><span class="war"></span><span class="sftype">账户密码</span><span class="sfinfo">强度：中</span><font><a href="/memberCenter/changePass.jhtml">修改</a></font></li>
						
						<c:choose>
							<c:when test="${customertags:isEmpty(mb.passQuestion)== 'false' }">
								<li><span class="ok"></span><span class="sftype">密保问题</span><span class="sfinfo">已设置</span><font><a href="/memberCenter/passProtect.jhtml">修改</a></font>
							</c:when>
							<c:otherwise>
								<li class="cuowu"><span class="errs"></span></span><span class="sftype">密保问题</span><span class="sfinfo">您还没有设置密保问题 </span><font><a href="/memberCenter/passProtect.jhtml">设置</a></font></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${customertags:isEmpty(mb.email)== 'false' }">
								<li><span class="ok"></span><span class="sftype">邮箱地址</span><span class="sfinfo">${mb.email}</span><font><a href="/memberCenter/personDatum.jhtml">修改</a></font>
							</c:when>
							<c:otherwise>
								<li class="cuowu"><span class="errs"></span><span class="sftype">邮箱地址</span><span class="sfinfo">您还没有添加邮箱 </span><font><a href="/memberCenter/personDatum.jhtml">添加邮箱</a></font></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${customertags:isEmpty(mb.phone)== 'false' }">
								<li><span class="ok"></span><span class="sftype">手机号码</span><span class="sfinfo">${mb.phone}</span><font><a href="/memberCenter/personDatum.jhtml">修改</a></font>
							</c:when>
							<c:otherwise>
								<li class="cuowu"><span class="errs"></span><span class="sftype">手机号码</span><span class="sfinfo">您还没有添加手机号码 </span><font><a href="/memberCenter/personDatum.jhtml">添加手机</a></font></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${customertags:isEmpty(mb.bankAccount)== 'false' }">
								<li><span class="ok"></span><span class="sftype">银行卡号</span><span class="sfinfo">${mb.bankAccount}</span><font><a href="/memberCenter/bankCard.jhtml">修改</a></font>
							</c:when>
							<c:otherwise>
								<li class="cuowu"><span class="errs"></span><span class="sftype">银行卡号</span><span class="sfinfo">您还没有绑定银行卡 </span><font><a href="/memberCenter/bankCard.jhtml">绑定银行卡</a></font></li>
							</c:otherwise>
						</c:choose>
						</ul>
          
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
