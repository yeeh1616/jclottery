<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="找回密码——第二步" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<div class="clear"></div>
<div class="zm">
	<div class="zm-t"><img src="/images/zm2_03.png" />您好<span>${memberByFindpassword.memberName }</span>，请选择找回密码的方式：</div>
	<div class="zm-c">
		<!-- 
    	<li>
        	<a href=""><img src="/images/zm2_18.png" /></a><img src="/images/zm2_07.png" />通过手机验证码找回<span>(推荐)</span>
        </li>
         -->
    	<li>
        	<a href="javascript:void(0);">
        	<c:choose>
        	<c:when test="${memberByFindpassword.email != null }">
        	<img id="imgBtnEmail" src="/images/zm2_11.png" />
        	</c:when>
        	<c:otherwise>
        	<img src="/images/zm2_18.png" />
        	</c:otherwise>
        	</c:choose>
        	</a>
        	<img src="/images/zm2_14.png" />通过邮箱找回
        </li>
    	<li>
        	<a href="javascript:void(0);">
        	<c:choose>
        	<c:when test="${memberByFindpassword.passQuestion != null && memberByFindpassword.passAnswer != null}">
        	<img id="imgBtnQuestion" src="/images/zm2_11.png" />
        	</c:when>
        	<c:otherwise>
        	<img src="/images/zm2_18.png" />
        	</c:otherwise>
        	</c:choose>
			</a><img src="/images/zm2_20.png" />通过密保问题找回
        </li>
    </div>
    
</div>
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
    
    <!-- 弹出层 -->

<div class="zhaotan"  id="maildiv" style="display: none;">
 <div class="zhao_top">
           <span class="fl t_l">用邮箱找回密码</span>
           <span class="fr t_r"><img src="/images/x.gif" onclick="$.unblockUI()" style="cursor:pointer;" /></span>
 </div>
   <h3>你好<b>${memberByFindpassword.memberName }</b>，请输入注册的邮箱地址：</h3>
   <div class="in_1">
   <form>
          <label>邮箱地址：</label>
          <input type="text" id="txtMail" name="txtMail" class="in_t"/>
          
          <p><input id="btnSubmitMail" type="button" class="ti" value="提交" style="cursor:pointer"/></p>
          
   </form>
   </div>
</div>


<div class="zhaotan_1" style="height:326px; display: none;" id="questiondiv">
 <div class="zhao_top">
           <span class="fl t_l_1">用密保问题找回密码</span>
           <span class="fr t_r"><img src="/images/x.gif" onclick="$.unblockUI()" style="cursor:pointer;"/></span>
 </div>
  <h3>你好<b>${memberByFindpassword.memberName }</b>，请输入以下问题的答案：</h3>
  <div class="ti_d">
      <ul>
              <li><label>问题：</label><span>${memberByFindpassword.passQuestion }</span></</li>
              <li><label>答案：</label><span><input id="txtPassAnswer" type="text"  class="tq"/></span></</li>
      </ul>
  </div>
  <!-- 
   <div class="ti_d">
      <ul>
              <li><label>问题一：</label><span>我的小明或者外号是？</span></</li>
              <li><label>问题二：</label><span><input type="text"  class="tq" placeholder="请输入问题答案"/></span></</li>
      </ul>
  </div>
   -->
  <p><input id="btnSubmitQuestion" type="submit" class="ti_2" value="提交" style="cursor:pointer"/></p>
</div>

<form id="findForm">
<input type="hidden" id="email" name="email" />
<input type="hidden" id="passAnswer" name="passAnswer" />
</form>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){

	$("#btnSubmitMail").click(function(){
		$("#passAnswer").val("");
		
		$("#email").val($("#txtMail").val());
		
		$("#findForm").ajaxSubmit( {  
		      url : '/findpassword/findtypemail.jhtml',  
		      type:'post',
		      success: function(data){  
		      		if(data == 0)
		      		{
		      			popupConfirm("温馨提示","邮箱填写错误，请重新填写!");
		      			$("#email").val("");
		      			$("#txtMail").val("");
				    	return false;
		      		}else if(data == 1)
		      		{
								var splitMain = $("#txtMail").val().split('@');
								var mailServer = splitMain[1].split('.');
	
		      			window.location.href="/findpassword/findrelmail.jhtml?mailServer="+mailServer[0];
		         		return false;  
			    	}else if(data == -1)
			    	{
						popupConfirm("温馨提示","邮件发送失败，请联系管理员。");
		         		return false;  
			    	}
			  },  
		      error : function() {  
		         popupConfirm("温馨提示",'错误，请联系管理员。');
		         return false;  
		      }  
		});
	});
	
	$("#btnSubmitQuestion").click(function(){
		$("#email").val("");
		
		$("#passAnswer").val($("#txtPassAnswer").val());
		
		$("#findForm").ajaxSubmit( {  
		      url : '/findpassword/findtypquestion.jhtml',  
		      type:'post',
		      success: function(data){  
		      		if(data == 0)
		      		{
		      			popupConfirm("温馨提示","答案填写错误，请重新填写!");
		      			$("#passAnswer").val("");
		      			$("#txtPassAnswer").val("");
				    	return false;
		      		}else if(data == 1)
		      		{
		      			window.location.href="/findpassword/findpassword.jhtml";
		         		return false;  
			    	}
			  },  
		      error : function() {  
		         popupConfirm("温馨提示",'错误，请联系管理员。');
		         return false;  
		      }  
		});
	});

	$("#imgBtnEmail").click(function(){
		$.blockUI({
			message:$("#maildiv"),
			css: {
				width: '502px',
				height: '326px',
				left: ($(window).width() - 300) / 2 + 'px',
				top: ($(window).height() - 400) / 2 + 'px',
				border: 'none'
			},
			showOverlay:true
		});
	});
	
	$("#imgBtnQuestion").click(function(){
		$.blockUI({
			message:$("#questiondiv"),
			css: {
				width: '502px',
				height: '326px',
				left: ($(window).width() - 300) / 2 + 'px',
				top: ($(window).height() - 400) / 2 + 'px',
				border: 'none'
			},
			showOverlay:true
		});
	});
});


</script>
</body>
</html>