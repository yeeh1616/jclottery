<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-修改密码" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/membercenternew/changePass.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/safeIndex.jhtml">安全中心</a> > 修改密码</div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l"> 修改密码 </div>
      <div class="gr-safe-r"><a href="/memberCenterNew/safeIndex.jhtml">&lt;&lt; 返回安全中心</a></div><div class="clear"></div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
    <div class="safe-xti">
    <div class="safets fl">温馨提示：</div>
    <div class="tihma fl"><p>请输入6-20个字符，建议使用字母加数字组合、混合大小写、特殊字符（如@）等提高密码强度。</p></div>
    </div>
    <div class="gr-jtma safe-tw ">
        <div style="text-align: left; font-size: 14px; color: #FF0000; height: 20px;padding-left: 15px;padding-bottom: 5px;" id="inforMessage"></div>
        <div class="gr-jtmal">
          <div class="gr-jname safe-xgm">原密码：</div>
          <div class="r_zs">
            <input id="oldPass" name="oldPass" class="user_wbtwo" type="password" />
          </div>
        </div> <div class="clear"></div>
        <div class="gr-jtmal">
          <div class="gr-jname safe-xgm">新密码：</div>
          <div class="r_zs">
            <input id="newPass" name="newPass" class="user_wbtwo" type="password" />
          </div>
        </div> <div class="clear"></div>
        <div class="gr-jtmal">
          <div class="gr-jname safe-xgm">确认新密码：</div>
          <div class="r_zs">
            <input id="rePass" name="rePass" class="user_wbtwo" type="password" />
          </div>
        </div> <div class="clear"></div>
        <div class="clear"></div>
        <div class="safe-an grqr xgle"><a href="javascript:void 0;" id="passSubmit">修改</a></div>
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
