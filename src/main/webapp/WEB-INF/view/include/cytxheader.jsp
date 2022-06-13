<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>

<!--顶部-->
<a href="/zhishu/index.jhtml" class="header_bnnner"></a>
<c:choose>
<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
<div class="header_top">
  <div class="top common_s">
    <div class="top_left fl"><span>您好!</span>
		<a href="/memberCenterNew/index.jhtml" class="n_use_name">${sessionScope.member.memberName}</a><span></span>余额：<font name="currMoney" class="red">0.00</font>元
    	<div class="clear"></div>
    </div>
    <div class="top_center fl"><div class="notice"><i></i><span>店主公告:</span>
      <marquee class="soroll" scrollamount="3" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()" id="index_dzgg">
      </marquee>
    </div></div>
	<div class="top_right fr">
	<!--<a href="/memberCenterNew/index.jhtml" class="n_use_zhanghu">用户中心</a>|<c:if test="${sessionScope.member.memberFrom != '5' && sessionScope.member.level != '1' }">-->
	<a href="/memberCenterNew/putMoney.jhtml" class="n_use_zhanghu">充值</a>|</c:if>
   		<a style="cursor:pointer" id="messageId" href="/memberCenterNew/message.jhtml">站内信(<font name="currMessage" class="red">0</font>)</a>|
		<!--<a style="cursor:pointer" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html" target="_blank">帮助中心</a>|-->
    	<a style="cursor:pointer" id="doLoginOut">退出登录</a>
    	<div class="clear"></div>
    </div>
  </div>
</div>
</c:when>
<c:otherwise>
<div class="header_top">
	<div class="top common_s">
		<div class="top_left fl">
			<a class="openlogin" href="javascript:" onclick="return false;">请登录</a>&nbsp;|&nbsp;<a href="/common/register/index.jhtml">免费注册</a>&nbsp;|&nbsp;<a href="http://wangdian.cp020.com">彩站登录</a>
		</div>
		<div class="top_center fl"><div class="notice"><i></i><span>店主公告:</span>
      <marquee class="soroll" scrollamount="3" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()" id="index_dzgg">
      </marquee>
    </div></div>
		<div class="top_right fr">
		<a style="cursor:pointer" id="scbzId">收藏本站</a>|
    	<a href="/help/help_center/help-shouye.html" target="_blank">帮助中心</a>
		</div>			
	</div>
</div>
</c:otherwise>
</c:choose>
<!--顶部 end--> 
<!--header-->
<div class="header_bg">
  <div class="header common_s">
    <div class="shop fl"> <a href="#"></a> </div>
    <div class="shop_name fl">${domain.storeName }
      <div>${domain.netUrl }</div>
    </div>
 <!--<div style="background: url('/cytxhome/images/newyear.png');   position: absolute;
  width: 335px;
  height: 50px;
  margin-left: 300px;
  margin-top: 19px;"></div>-->
    <div class="qqkf fr"> <a href="javascript:void 0" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${sessionScope.domain.storeQq}&site=在线咨询&menu=yes');"> <i></i> 在线客服 </a> </div>
    <div class="phone fr">
    	<c:choose>
			<c:when test="${sessionScope.domain.storeMobile != ''}">
    			<div class="phone_txt">咨询热线</div>
				<div class="phone_no">${sessionScope.domain.storeMobile}</div>
			</c:when>
		</c:choose>
    </div>
    </span></div>
   
  </div>
</div>
<!--header end--> 
<!-- 菜单-->
<div class="nav_bg">
  <div class="common_s">
    <div class="cz"> <a href="#"> 请选择彩种 <b></b> </a> </div>
    <div class="nav" id="navlist">
      <ul>
        <li><a href="javascript:void 0">首页</a></li>
        <li><a class="h_list" href="javascript:void 0">购彩<i></i></a></li>
        <li><a class="h_list" href="javascript:void 0">合买<i></i></a></li>
        <li><a href="/pass/index.jhtml?succFlag=1">过关统计</a></li>
        <li><a class="h_list" href="javascript:void 0">数据<i></i></a></li>
        <li><a class="h_list" href="javascript:void 0">推荐<i></i></a></li>
        <li><a href="/datacenter/jsbf.jhtml">即时比分</a></li>
        <li><a href="/storeintro/index.jhtml">店铺介绍</a></li>
        <li class="phone_bg"><a href="/wap/index.jhtml?${domain.netUrl}"><i></i>手机购彩</a></li>
      </ul>
    </div>
    <!--弹出下拉-->
       <div class="h_box" id="navbox" style="height:0px;opacity:0;overflow:hidden;">

      <div class="cont h_xial h_gc" style="display:none;">
        <a href="/lottery/halt.jhtml">购彩大厅</a> <a href="/copyorder/index.jhtml">复制跟单</a>
      </div>
<div class="cont h_xial h_hm" style="display:none; "> <a href="/merger/index.jhtml">合买大厅</a> <a href="/memberCenterCustomNew/custom.jhtml?type=1">定制跟单</a></div>
       <div class="cont h_xial h_sj" style="display:none;"> <a href="http://tubiao.cp020.com?${domain.netUrl}" target="_blank">图表走势</a> <a href="/lotteryopen/index.jhtml">彩票开奖</a> </div>
       <div class="cont h_xial h_tj" style="display:none;"> <a href="/recommend/index.jhtml">店内推荐</a> <a href="http://tuijian.cp020.com/?${domain.netUrl}"  target="_blank">专家</a></div>
    </div>
    <script type="text/javascript">
(function() {
	var time = null;
	var list = $("#navlist");
	var box = $("#navbox");
	var lista = list.find(".h_list");
	
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
		var index = list.find(".h_list").index($(this));
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
    <!--弹出下拉 end-->
  </div>
</div>
<!-- 菜单 end-->
<script type="text/javascript">
    $(function(){
      $(".phone_bg").click(function(){
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