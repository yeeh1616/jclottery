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
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
<script type="text/javascript" src="/js/membercenter/money.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 彩民取款 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="4" scope="page"></c:set>
  <%@include file="menu.jsp" %>
 <div class="tzgl">
    	<div class="safebox">
        	<div class="sftab">
        	<h1 class="zz" style="cursor:pointer" onclick="location.href='/memberCenter/getMoney.jhtml'">提取现金</h1>  
        	<h1 class="cz" style="cursor:pointer" onclick="location.href='/memberCenter/getMoneyList.jhtml'">取款记录</h1>
        </div>
             <div class="tk2">
            	<dl>
                	<dt>核实真名：</dt>
                    <td>
                    	<input name="bankUserName" type="text" class="inputcss2" id="bankUserName" value="${mb.certiName}" disabled=disabled />
                    </td>
                    <td class="qx"><img src="/images/war.gif" /><span style="padding:0 10px">取款账户名与实名验证名称一致</span></td>
                </dl>
                <div class="clear"></div>
            	<dl>
                	<dt>取款账户：</dt>
                    <dd>${mb.bankName}<span style="padding:0 10px">${mb.bankUserName}<span style="padding:0 10px">${mb.bankAccount}</dd>
                    <dd class="gy"><span style="padding:0 50px"><a href="/memberCenter/bankCard.jhtml"><u>更改银行信息</u></a></dd>
                </dl>
                <div class="clear"></div>
            	<dl>
                	<dt>可取款金额：</dt>
                    <dd id="getMoneyCurr">
                    	<fmt:formatNumber value="${mones[4]}" pattern="#,###.##"  minFractionDigits="2"/>元</dd>
                    <dd class="gy"><span style="padding:0 50px"><a style="cursor:pointer" id="reflushMoney"><u>刷新余额</u></a></dd>
                </dl>
                <div class="clear"></div>
            	<dl>
                	<dt>取款金额：</dt>
                    <dd><input type="text" name="currMoney" id="currMoney" style="padding-left:15px"/></dd>
                    <dd class="st" id="currMoneyState"><img src="/images/war.gif"/>输入取款金额</dd>
                </dl>
                <div class="clear"></div>
               <div class="button"><input name="getMoneySubmit" type="button" class="addbtn2" id="getMoneySubmit" value="提交" /></div>
                
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

       	  <div class="clear"></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
