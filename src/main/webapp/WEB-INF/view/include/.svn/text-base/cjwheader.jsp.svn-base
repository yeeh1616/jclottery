 <%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>
<!--<script type="text/javascript" src="/js/home/header.js"></script>-->
</head>

<body>
<!-- 二级首页 -->
<!--顶部-->
<div class="header_top">
  <div class="top common_w">
    <div class="top_left fl"><span>欢迎您来到${domain.storeName }!</span>
    
    <c:choose>
      		<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
      			<c:choose>
							<c:when test="${sessionScope.member.memberFrom == '5' && sessionScope.member.level == '1' }">
							您好，<a href="http://${store.netUrl}/memberCenterNew/index.jhtml" target="_top">${sessionScope.member.memberName }</a>|账户可用余额：<font name="currMoney">0.00</font>|<a style="cursor:pointer" id="doLoginOut" target="_top">退出登录</a>		
							</c:when>
							<c:otherwise>
							您好，<a href="http://${store.netUrl}/memberCenterNew/index.jhtml" target="_top">${sessionScope.member.memberName }</a>|账户可用余额：<font name="currMoney">0.00</font>
      						|<a href="http://${store.netUrl}/memberCenterNew/index.jhtml" target="_top">用户中心</a>|<a href="http://${store.netUrl}/memberCenterNew/putMoney.jhtml" target="_top">充值</a>|<a style="cursor:pointer" id="doLoginOut" target="_top">退出登录</a>		
							</c:otherwise>
				</c:choose>
      		</c:when>
      		<c:otherwise>
      			<a class="openlogin" href="http://${store.netUrl}/common/login/login.jhtml" target="_top">请登录</a>|<a href="http://${store.netUrl}/common/register/index.jhtml" target="_top">免费注册</a>|<a href="http://wangdian.cp020.com" target="_top">彩站登录</a>
      		</c:otherwise>
     </c:choose>
      <div class="clear"></div>
    </div>
    <div class="top_right fr"><a style="cursor:pointer" id="scbzId" target="_top">收藏本站</a>|<a href="http://${store.netUrl}/help/help_center/help-shouye.html" target="_top">帮助中心</a>
      <div class="clear"></div>
    </div>
  </div>
</div>

<div class="header_bg second_head">
  <div class="common_w">
    <div class="shop_name fl">${store.storeName }
      <div>${store.netUrl}</div>
    </div>
 
 <div class="second_nav">
      <ul>
      <c:set var="url" value="${pageContext.request.requestURI}" scope="page"></c:set>
				<li><a <c:if test="${fn:indexOf(url, '/home/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}" target="_top">首页</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/lottery/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/lottery/halt.jhtml" target="_top">购彩</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/merger/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/merger/index.jhtml" target="_top">合买</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/lotteryopen/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/lotteryopen/index.jhtml" target="_top">开奖 </a></li>
        <!--<li><a <c:if test="${fn:indexOf(url, '/chart/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/chart/index.jhtml" target="_top">图表</a></li>
        --><li><a <c:if test="${fn:indexOf(url, 'tubiao.cp020.com/') > -1 }">class="cur"</c:if> href="http://tubiao.cp020.com/?${store.netUrl }" target="_blank">图表</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/datacenter/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/datacenter/jsbf.jhtml" target="_top">比分</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/recommend/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/recommend/index.jhtml" target="_top">推荐</a></li>
        <li><a <c:if test="${fn:indexOf(url, 'tuijian.cp020.com/') > -1 }">class="cur"</c:if> href="http://tuijian.cp020.com/?${store.netUrl }" target="_blank">专家</a></li>
        <li><a <c:if test="${fn:indexOf(url, '/storeintro/') > -1 }">class="cur"</c:if> href="http://${store.netUrl}/storeintro/index.jhtml" target="_top">店铺</a></li>
        <!--<li class="testclass"><a href="javascript:void 0">手机</a></li>-->
        <li><a <c:if test="${fn:indexOf(url, '/wap/') > -1 }">class="cur"</c:if> href="/wap/index.jhtml?${domain.netUrl}" target="_top">手机</a></li>
      </ul>
    </div>
    
    <!-- 彩种选择begin -->
    <div class="box" id="navbox" style="height:0px;opacity:0;overflow:hidden;">
      <div class="cont" style="display:none;" id="commLicenAreaId">
      </div>
    </div>
    <!-- 彩种选择end -->
    
    <div class="second_kf"><a href="javascript:void 0" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${store.storeQq}&site=在线咨询&menu=yes');">在线客服</a></div>
    <div class="second_phone">
    	<c:choose>
			<c:when test="${store.storeMobile != ''}">
				电话：${sessionScope.domain.storeMobile}
			</c:when>
		</c:choose>  
    </div>
    <div class="clear"></div>
   
  </div>
</div>

<script type="text/javascript">
(function(){

	var time = null;
	var list = $("#navlist");
	var box = $("#navbox");
	var lista = list.find("a");
	
	for(var i=0,j=lista.length;i<j;i++){
		if(lista[i].className == "now"){
			var olda = i;
		}
	}
	
	var box_show = function(hei){
		box.stop().animate({
			height:hei,
			opacity:1
		},400);
	}
	
	var box_hide = function(){
		box.stop().animate({
			height:0,
			opacity:0
		},400);
	}
	
	lista.hover(function(){
		lista.removeClass("now");
		$(this).addClass("now");
		clearTimeout(time);
		var index = list.find("a").index($(this));
		box.find(".cont").hide().eq(index).show();
		var _height = box.find(".cont").eq(index).height()+54;
		box_show(_height)
	},function(){
		time = setTimeout(function(){	
			box.find(".cont").hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});
	
	box.find(".cont").hover(function(){
		var _index = box.find(".cont").index($(this));
		lista.removeClass("now");
		lista.eq(_index).addClass("now");
		clearTimeout(time);
		$(this).show();
		var _height = $(this).height()+54;
		box_show(_height);
	},function(){
		time = setTimeout(function(){		
			$(this).hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});

})();
</script> 
<script type="text/javascript">
    $(function(){
      $(".testclass").click(function(){
		    /*layer.tips('亲爱哒，请再坚持几天吧，我们正在加紧生产，马上就可以用了', this, {
	      guide: 1,
	      style: ['background-color:#78BA32; color:#fff', '#78BA32'],
	      maxWidth:350,
	      time: 3,
    		closeBtn:[0, true]
	  	 });*/
		 });
    });
</script>
<script type="text/javascript" src="/js/home/footer.js"></script>
</body>
</html>