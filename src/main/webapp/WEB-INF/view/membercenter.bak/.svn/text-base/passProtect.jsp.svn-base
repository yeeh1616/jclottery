<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-密码保护" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
<script type="text/javascript" src="/js/membercenter/pass.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 设置密保 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="9" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    	<div class="safebox">
        	<div class="tzxq" style="margin-top:0px">密码保护</div>
           <!-- <div class="notice2"><b>提示：</b>本站只提供登录密码的密保，如忘记财务密码，请联系您的店主</div>-->
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class=" userxinxi">
						  <tr>
						    <td width="11%" height="20" align="right">&nbsp;</td>
						    <td width="33%">&nbsp;</td>
						    <td width="56%">&nbsp;</td>
						  </tr>
						  
						  <tr>
						  	<c:choose>
									<c:when test="${customertags:isEmpty(mb.passQuestion)== 'false' }">
										<c:set var="passQuestion" value="${mb.passQuestion}" scope="page"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="passQuestion" value="0" scope="page"></c:set>
									</c:otherwise>
								</c:choose>
						    <td height="38" align="right">密保问题：</td>
						    <td><select name="passQuestion" class="select2" id="passQuestion" style="width:258px">
						     <option selected="true" value="0" <c:if test="${pageScope.passQuestion eq '0' }">selected</c:if>>请选择密保问题</option>
                 <option value="我母亲的生日" <c:if test="${pageScope.passQuestion eq '我母亲的生日' }">selected</c:if>>我母亲的生日</option>
                 <option value="我父母的结婚纪念日" <c:if test="${pageScope.passQuestion eq '我父母的结婚纪念日' }">selected</c:if>>我父母的结婚纪念日</option>
                 <option value="我的启蒙老师" <c:if test="${pageScope.passQuestion eq '我的启蒙老师' }">selected</c:if>>我的启蒙老师</option>
                 <option value="我的结婚纪念日" <c:if test="${pageScope.passQuestion eq '我的结婚纪念日' }">selected</c:if>>我的结婚纪念日</option>
                 <option value="我最喜欢的音乐" <c:if test="${pageScope.passQuestion eq '我最喜欢的音乐' }">selected</c:if>>我最喜欢的音乐</option>
                 <option value="我的偶像" <c:if test="${pageScope.passQuestion eq '我的偶像' }">selected</c:if>>我的偶像</option>
                 <option value="我初中同桌的名字" <c:if test="${pageScope.passQuestion eq '我初中同桌的名字' }">selected</c:if>>我初中同桌的名字</option>
                 <option value="我高中的英语老师" <c:if test="${pageScope.passQuestion eq '我高中的英语老师' }">selected</c:if>>我高中的英语老师</option>
                 <option value="我家小狗的名字" <c:if test="${pageScope.passQuestion eq '我家小狗的名字' }">selected</c:if>>我家小狗的名字</option>
						     </select></td>
						    <td><ul class="safelist2">
						    <li><span class="war" id="passQuestionState"></span><span class="sfinfo" id="passQuestionMessage">请选择您的密保问题</span>
						    </ul></td>
						  </tr>
						  <tr>
						    <td height="38" align="right">密保答案：</td>
						    <td><input name="passAnswer" type="text" class="inputcss2" id="passAnswer"/></td>
						    <td><ul class="safelist2">
						     <li><span class="war" id="passAnswerState"></span><span class="sfinfo" id="passAnswerMessage">请录入您的密保答案</span>
						    </ul></td>
						  </tr>
						  <tr>
						    <td height="38">&nbsp;</td>
						    <td><input name="passProtectSubmit" type="submit" class="addbtn3" id="passProtectSubmit" value="提交"  style="cursor:pointer"/></td>
						    <td>&nbsp;</td>
						  </tr>
         	 </table>
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

       	  <div class="clear"
></div>
        </div>
        
        
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
