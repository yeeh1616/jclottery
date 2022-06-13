<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/buy.css"/>

<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>

<!-- 二级首页 -->
<!--顶部-->
<c:choose>
<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
<div class="header_top">
  <div class="top common_w">
    <div class="top_left fl"><span>您好!</span>
		<a href="/memberCenterNew/index.jhtml" class="n_use_name">${sessionScope.member.memberName}</a><span>欢迎来到${domain.storeName }!</span>账户可用余额：<font name="currMoney" class="red">0.00</font>元
    	<div class="clear"></div>
    </div>
	<div class="top_right fr"><a href="/memberCenterNew/index.jhtml" class="n_use_zhanghu">账户中心</a>|<c:if test="${sessionScope.member.memberFrom != '5' && sessionScope.member.level != '1' }"><a href="/memberCenterNew/putMoney.jhtml" class="n_use_zhanghu">充值</a>|</c:if>
   		<a style="cursor:pointer" id="messageId" href="/memberCenterNew/message.jhtml">站内信(<font name="currMessage" class="red">0</font>)</a>|
		<a style="cursor:pointer" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html">帮助中心</a>|
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
			<a class="openlogin" href="javascript:" onclick="return false;">请登录</a>&nbsp;|&nbsp;<a href="/common/register/index.jhtml">免费注册</a>&nbsp;|&nbsp;<a href="http://wangdian.cp020.com">彩站登录</a>
		</div>
		<div class="top_right fr">
		<a style="cursor:pointer" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html">帮助中心</a>
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
		        <li><a href="/">首页</a></li>
		        <li><a class="cur zkx" href="javascript:void 0">购彩<i></i></a></li>
		        <li><a class="zkx" href="javascript:void 0">合买<i></i></a></li>
		        <li><a href="/copyorder/index.jhtml">复制</a></li>
		        <li><a href="/lotteryopen/index.jhtml">开奖</a></li>
		        <li><a class="zkx" href="javascript:void 0">数据<i></i></a></li>
		        <li><a class="zkx" href="javascript:void 0">推荐<i></i></a></li>
		        <li><a href="/datacenter/jsbf.jhtml">比分</a></li>
		        <li><a href="/storeintro/index.jhtml">店铺</a></li>
		        <li><a href="/wap/index.jhtml?${domain.netUrl}">手机</a></li>
		      </ul>
        </div>
    
    <!-- 彩种选择begin -->
     <div class="box" id="navbox" style="height:0px;opacity:0;overflow:hidden;">
      <div class="cont xzcz" style="display:none;" id="commLicenAreaId">
      </div>
			<div class="cont h_xial sec_hm" style="display:none; "> <a href="/merger/index.jhtml">合买大厅</a> <a href="/memberCenterCustomNew/custom.jhtml?type=1">定制跟单</a></div>
       <div class="cont h_xial sec_sj" style="display:none;"> <a href="${domain.netUrl }">图表走势</a> <a href="/pass/index.jhtml?succFlag=1">过关统计</a> </div>
       <div class="cont h_xial sec_tj" style="display:none;"> <a href="/recommend/index.jhtml">店内推荐</a> <a href="http://tuijian.cp020.com/?${domain.netUrl}">专家</a></div>
    </div>
    <!-- 彩种选择end -->
    
    <div class="second_kf"><a href="javascript:void 0" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${sessionScope.domain.storeQq}&site=在线咨询&menu=yes');">在线客服</a></div>
    <div class="second_phone">
    	<c:choose>
			<c:when test="${store.storeMobile != ''}">
				电话：${store.storeMobile}
			</c:when>
		</c:choose>    
    </div>
    <div class="clear"></div>
   
  </div>
</div>

 <script type="text/javascript">
(function() {
	var time = null;
	var list = $("#navlist");
	var box = $("#navbox");
	var lista = list.find(".zkx");
	
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
		var index = list.find(".zkx").index($(this));
		box.find(".cont").hide().eq(index).show();
		var _height = box.find(".cont").eq(index).height()+5;
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
		var _height = $(this).height()+5;
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