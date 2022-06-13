<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-个人信息" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/linkageAddress.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
<script type="text/javascript" src="/js/membercenter/personDatum.js"></script>
<script type="text/javascript" src="/js/membercenter/linkageAddress.js"></script>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 个人信息 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="7" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
        <div class="safebox">
        	<div class="tzxq" style="margin-top:0px">个人信息</div>
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class=" userxinxi">
  <tr>
    <td width="11%" height="38" align="right">登录名：</td>
    <td width="33%">${sessionScope.member.memberName}</td>
    <td width="56%">
    </td>
  </tr>
  <tr>
    <td height="38" align="right">性    别：</td>
    <td> <input type="radio" name="gender" value="1" <c:if test="${mb.gender == 1}">checked</c:if>/>
      		男
        <input type="radio" name="gender" value="2" <c:if test="${mb.gender == 2}">checked</c:if>/>
					女
		    <input type="radio" name="gender" value="0" <c:if test="${mb.gender == 0}">checked</c:if> checked/>
					保密			
		</td>
    <td></td>
  </tr>
  <tr>
    <td height="38" align="right">居住地区：</td>
    <td>
    		<c:choose>
					<c:when test="${customertags:isEmpty(mb.province)== 'false' }">
						<c:set var="province" value="${mb.province}" scope="page"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="province" value="—省份—" scope="page"></c:set>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${customertags:isEmpty(mb.city)== 'false' }">
						<c:set var="city" value="${mb.city}" scope="page"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="city" value="—城市—" scope="page"></c:set>
					</c:otherwise>
				</c:choose>
    	  <input type="text" name="province" id="province" class="inputcss2 linkageProvince" 
    	     value="${pageScope.province}" readonly="readonly" style="width:80px;height:36px;cursor:pointer;text-align:center;vertical-align:middle;"/>
        <input type="text" name="city" id="city" class="inputcss2 linkageCity" 
           value="${pageScope.city}" readonly="readonly" style="width:120px;height:36px;cursor:pointer;text-align:center;vertical-align:middle;"/>
    </td>
    <td>
     <ul class="safelist2 no_bd">
	    <li><span class="war" id="addressState"></span><span class="sfinfo" id="addressMessage">请选择您的居住地</span>
	   </ul>
    </td>
  </tr>
  <tr>
    <td height="38" align="right">QQ  号码：</td>
    <td><input name="qq" type="text" class="inputcss2" id="qq" value="${mb.qq}"/></td>
    <td>
    <ul class="safelist2 no_bd">
    <li><span class="war" id="qqState"></span><span class="sfinfo" id="qqMessage">请录入您的qq号码，方便我们与您联系</span>
    </ul>
    </td>
  </tr>
  <tr>
    <td height="38" align="right">手机号码：</td>
    <td><input name="phone" type="text" class="inputcss2" id="phone" value="${mb.phone}"/></td>
    <td><ul class="safelist2 no_bd">
    <li><span class="war" id="phoneState"></span><span class="sfinfo" id="phoneMessage">请录入您的手机号码</span>
    </ul></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="beizhu">中大奖，彩站会及时通知。</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="38" align="right">安全邮箱：</td>
    <td><input name="email" type="text" class="inputcss2" id="email" value="${mb.email}"/></td>
    <td><ul class="safelist2 no_bd">
    <li><span class="war" id="emailState"></span><span class="sfinfo" id="emailMessage">请录入您的安全邮箱</span>
    </ul></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="beizhu">设置邮箱，忘记登录密码可通过邮箱找回密码</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="38">&nbsp;</td>
    <td><input name="personDatumSubmit" type="submit" class="addbtn2" id="personDatumSubmit" value="保存" /></td>
    <td>&nbsp;</td>
  </tr>
</table>

       	  <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
