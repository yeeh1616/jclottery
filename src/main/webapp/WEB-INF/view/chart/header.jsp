<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<head>
		<%@include file="../include/titlePage.jsp"%>
		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
		<link href="/css/index_hao.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/jquery.ui.core.js"></script>
		<script type="text/javascript" src="/js/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="/js/jquery.ui.mouse.js"></script>
		<script type="text/javascript" src="/js/jquery.ui.draggable.js"></script>
		<script type="text/javascript" src="/js/jquery.blockUI.js"></script>
		<script type="text/javascript" src="/js/common/base.js"></script>
		<script type="text/javascript" src="/data/home/${domain.storeId }/license.js"></script>
		<script type="text/javascript" src="/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>
		<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
		<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
		<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
		<link type="text/css" rel="stylesheet" href="/cytxhome/css/buy.css"/>
		<link type="text/css" rel="stylesheet" href="/cytxhome/css/user_center.css"></link>

		<script type="text/javascript" src="/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>
		<script type="text/javascript" src="/cytxhome/js/custom.js"></script>
	</head>
	<body>

<!-- 二级首页 -->
<!--顶部-->
<c:choose>
<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
<div class="header_top">
  <div class="top common_w">
    <div class="top_left fl"><span>您好!</span>
		<a href="/memberCenterNew/index.jhtml" class="n_use_name" target="_top">${sessionScope.member.memberName}</a><span>欢迎来到${domain.storeName }!</span>账户可用余额：<font name="currMoney" class="red">0.00</font>元
    	<div class="clear"></div>
    </div>
	<div class="top_right fr"><a target="_top" href="/memberCenterNew/index.jhtml" class="n_use_zhanghu">账户中心</a>|<c:if test="${sessionScope.member.memberFrom != '5' && sessionScope.member.level != '1' }"><a target="_top" href="/memberCenterNew/putMoney.jhtml" class="n_use_zhanghu">充值</a>|</c:if>
   		<a style="cursor:pointer" target="_top" id="messageId" href="/memberCenterNew/message.jhtml">站内信(<font name="currMessage" class="red">0</font>)</a>|
		<a style="cursor:pointer" target="_top" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html" target="_top">帮助中心</a>|
    	<a style="cursor:pointer" id="doLoginOut">退出登录</a>
    	<div class="clear"></div>
    </div>
  </div>
</div>
</c:when>
<c:otherwise>
<div class="header_top">
	<div class="top common_w">
		<div class="top_left fl">
			<a class="openlogin" href="javascript:" onclick="return false;">请登录</a>&nbsp;|&nbsp;<a target="_top" href="/common/register/index.jhtml">免费注册</a>&nbsp;|&nbsp;<a href="http://wangdian.cp020.com" target="_top">彩站登录</a>
		</div>
		<div class="top_right fr">
		<a target="_top" style="cursor:pointer" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html" target="_top">帮助中心</a>
		</div>			
	</div>
</div>
</c:otherwise>
</c:choose>
<!--顶部 end-->
<div class="header_bg second_head">
  <div class="common_w">
    <div class="shop_name fl">${domain.storeName }
      <div>${domain.netUrl }</div>
    </div>
 
				<div class="second_nav" id="navlist">
          <ul>
          	<c:set var="url" value="${pageContext.request.requestURI}" scope="page"></c:set>
		        <li><a href="http://${domain.netUrl}" target="_top">首页</a></li>
		        <li><a href="http://${domain.netUrl}/lottery/halt.jhtml" target="_top">购彩</a></li>
		        <li><a href="http://${domain.netUrl}/merger/index.jhtml" target="_top">合买</a></li>
		        <li><a href="http://${domain.netUrl}/copyorder/index.jhtml" target="_top">复制</a></li>
		        <li><a href="http://${domain.netUrl}/lotteryopen/index.jhtml" target="_top">开奖</a></li>
		        <li><a href="http://tubiao.cp020.com?${domain.netUrl}" target="_top">数据</a></li>
		        <li><a href="http://${domain.netUrl}/recommend/index.jhtml" target="_top">推荐</a></li>
		        <li><a href="http://${domain.netUrl}/storeintro/index.jhtml" target="_top">店铺</a></li>
		        <li><a href="http://${domain.netUrl}/wap/index.jhtml?${domain.netUrl}" target="_top">手机</a></li>
		      </ul>
        </div>
    <!-- 彩种选择end -->  
    <div class="second_kf"><a href="javascript:void 0" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${sessionScope.domain.storeQq}&site=在线咨询&menu=yes');">在线客服</a></div>
    <div class="second_phone">
    	电话：
    	<c:choose>
			<c:when test="${sessionScope.domain.storeMobile != ''}">
				${sessionScope.domain.storeMobile}
			</c:when>
			<c:otherwise>
			       400-110-3310
			</c:otherwise>
		</c:choose>  
    </div>
    <div class="clear"></div>
   
  </div>
</div>


<div class="loginmask"></div>
<div id="loginalert">
  <div class="pd10 loginpd" style="height:290px">
    <h3><i class="closealert fr"></i>
      <div class="clear"></div>
    </h3>
    <div class="loginwrap" id="loginformId">
      <div class="loginh">
        <div class="fl">会员登录</div>
        <div class="clear"></div>
      </div>
      <!----------------------------------------------------------账号登陆错误提示，不需要的时候，进行隐藏。错误时候进行调用-->
      
      <div class="wrong"><span></span><span class="login_warning" id="loginWrongMsgId"></span>
        <div class="clear"></div>
      </div><!------------------------------------------------------------->
      <div class="clear"></div>
        <div class="logininput">
          <input type="text" name="username" class="loginusername" value="邮箱/用户名/手机号" style="height:42px"/>
          <input type="text" class="loginuserpasswordt" value="密码" style="height:42px"/>
          <input type="password" name="password" class="loginuserpasswordp" style="display:none;height:42px"/>
        </div>
        <div class="loginbtn">
          <div class="loginsubmit">
            <input type="button" value="登录" id="loginBtnId"/>
            <div class="loginsubmiting">
              <div class="loginsubmiting_inner"></div>
            </div>
          </div>
          <div class="logcheckbox fl">
            <input id="bcdl" type="checkbox" checked="true" />
            记住密码</div>
          <div class="fotget"><a href="/findpassword/index.jhtml">忘记密码?</a></div>
          <div class="sigin">还没有账号?<a id="sigup_now" href="/common/register/index.jhtml">立即注册</a></div>
          <div class="clear"></div>
        </div>
    </div>
  </div>
  <div class="thirdlogin">
    <div class="pd10">
      <h4>用第三方帐号直接登录</h4>
      <ul>
        <li id="sinal"><a href="javascript:">微博账号登录</a></li>
        <li id="qql"><a href="javascript:">QQ账号登录</a></li>
        <div class="clear"></div>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
</div>
<!--用户登录 end--> 

<script type="text/javascript" src="/js/home/footer.js"></script>
	</body> 
 </html>
	