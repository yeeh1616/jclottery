<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民取款" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/common/base.js"></script>
<script type="text/javascript" src="/js/membercenternew/getMoney.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/capital.jhtml">资金管理</a> > 账户取款</div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="13" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">资金管理 </div>
      <div class="gr-safe-r"><a href="/memberCenterNew/capital.jhtml">&lt;&lt; 返回资金管理</a></div><div class="clear"></div>
    </div>
    <!--安全等级end--> 
	<div class="gr-lbody">     
    <!--具体信息begin-->
	<div class="w_gcjl_l">
		<ul><li><a href="/memberCenterNew/getMoney.jhtml"  class="active">账户提款</a></li></ul>
		<ul><li><a href="/memberCenterNew/getMoneyList.jhtml">取款记录</a></li></ul>
		<div class="clear"></div>
	</div>
    <div class="gr-jtma safe-tw">
      <div class="clear"></div>
      <div class="gr-jtmal">
        <div class="gr-jname tq_wid">真实姓名：</div>
        <div class="r_zs">${mb.certiName}</div>
        <div class="gr-yt"></div><div class="tq_wz fl" style="color: #F44;">真实姓名和实名认证姓名一致</div>
        </div>
      <div class="clear"></div>
      <div class="gr-jtmal">
        <div class="gr-jname tq_wid">取款方式：</div>
        <div class="fl" id="typeName" typeNameV="${typeName}">${typeName}</div>
        <div class="gr-wsha"></div>
        </div>
      <div class="clear"></div>
      <div class="gr-jtmal">
        <div class="gr-jname tq_wid">${typeName}信息：</div>
        <c:choose>
        <c:when test="${mw.accountType eq '1'}">
    	    <div class="fl" id="accountMessage" accountMessageV="${mw.accountName}<br>${mw.reserved1}<br>${mw.accountCard}">${mw.accountName}&nbsp;${mw.reserved1}&nbsp;${mw.accountCard}</div>
        </c:when>
        <c:when test="${mw.accountType eq '2'}">
        	<div class="fl" id="accountMessage" accountMessageV="${mw.accountCard}">${mw.accountCard}</div>
        </c:when>
        <c:otherwise>
	        <div class="fl" id="accountMessage" accountMessageV="${mw.accountCard}">${mw.accountCard}</div>
        </c:otherwise>
        </c:choose>
        </div>
      <div class="clear"></div>
      <div class="gr-jtmal">
        <div class="gr-jname tq_wid">可取款金额：</div>
        <div class="fl red" id="getMoneyCurr"><fmt:formatNumber value="${mones[4]}" pattern="#,###.##"  minFractionDigits="2"/></div>
        <div class="gr-wsha"><a id="reflushMoney"> 刷新余额</a></div>
      </div>
      <div class="clear"></div>
      <div class="gr-jtmal">
        <div class="gr-jname tq_wid">取款金额：</div>
        <div class="r_zs"><input name="currMoney" id="currMoney" class="user_wbtwo z_qk" type="text" placeholder="请输入取款金额" />&nbsp;元&nbsp;</div>
		<div style="text-align: left; font-size: 14px; color: #FF0000; height: 20px;padding-left: 15px;padding-bottom: 5px;" id="inforMessage"></div>        
      </div>
      <div class="clear"></div>
      <div class="safe-an tjge-an"><a name="getMoneySubmit" id="getMoneySubmit">提交</a></div>
    </div>
    </div>
    <!--具体信息end--> 
    <!-- <div style="margin-left:122px;line-height:28px;margin-bottom:20px;margin-top:10px;">
    	<b style="color:red;">取款注意事项：</b>
    	<p>1、微信与支付宝取款方式，单次取款最多100元，大于100元请选择银行方式。</p>
    	<p>2、微信与支付宝取款方式，每天只能取款3次。</p>
    	<p>3、银行取款不受以上的单次额度与取款总次数的限制。</p>
    </div> -->
  </div>
  <div class="clear"></div></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
