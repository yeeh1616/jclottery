<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--footer-->
<%--<div class="footer_bg">
  <div class="footer_bangzhu"><c:if test="${!beHLwUnion}"><img src="${pageConfigs.web_foot_logo_path}" width="85" height="104" /></c:if>
    <div class="footer_list">
      <h1>新手上路</h1>
      <ul>
        <li> <a href="/common/register/index.jhtml" target="top"><i class="cube"></i>注册充值</a> </li>
        <li> <a href="/help/help_center/four-buy/buy.html" target="top"><i class="cube"></i>购彩流程</a> </li>
        <li> <a href="/help/help_center/five-tixian/two-lingqu.html" target="top"><i class="cube"></i>领奖流程</a> </li>
      </ul>
    </div>
    <div class="footer_list">
      <h1>帮助中心</h1>
      <ul>
        <li> <a href="/help/help_center/nine-ofen/ofen.html" target="top"><i class="cube"></i>常见问题 </a> </li>
        <li> <a href="/help/help_center/eight-shuyu/shuyu.html" target="top"><i class="cube"></i>彩票术语</a> </li>
        <li> <a href="/help/help_center/seven-wanfa/wanfa.html" target="top"><i class="cube"></i>彩种介绍</a> </li>
      </ul>
    </div>
    <div class="footer_list">
      <h1>支付方式 </h1>
      <ul>
        <li> <a href="javascript:void 0"><i class="cube"></i>支付宝支付 </a> </li>
        <li> <a href="javascript:void 0"><i class="cube"></i>微信支付</a> </li>
        <li> <a href="javascript:void 0"><i class="cube"></i>网银支付</a> </li>
      </ul>
    </div>
    <div class="footer_list">
      <h1>中奖福地 </h1>
      <ul>
        <li> <a href="#"><i class="cube"></i>大奖回顾 </a> </li>
        <li> <a href="#"><i class="cube"></i>中奖英雄榜</a> </li>
        <li> <a href="#"><i class="cube"></i>超级合买人</a></li>
      </ul>
    </div>
  </div>
  <div class="footer_bangzhub"> 
   <a href="javascript:void 0"><img  src="/cytxhome/images/1.jpg" target="_blank" /></a>
   <a href="javascript:void 0"><img  src="/cytxhome/images/2.jpg" target="_blank" /></a> 
   <!--<a href="javascript:void 0"><img  src="/cytxhome/images/3.jpg" /></a> --> 
   <a href="javascript:void 0"><img  src="/cytxhome/images/4.jpg" target="_blank" /></a> 
   <a href="http://webscan.360.cn/index/checkwebsite/url/${sessionScope.domain.netUrl}" target="_blank"><img  src="/cytxhome/images/5.jpg" /></a>
   <a href="http://v.pinpaibao.com.cn/authenticate/cert/?site=cp020.com&at=realname" target="_blank"><img src="/cytxhome/images/sm_124x47.png"></a>
    <div class="clear"></div>
    <c:if test="${!beHLwUnion}"><div class="wenzicai">${pageConfigs.web_company_name} <c:if test="${sessionScope.domain.storeMobile != null}">客服电话：${sessionScope.domain.storeMobile}</c:if> &nbsp;&nbsp;&nbsp;备案：${pageConfigs.web_beian}  &nbsp;&nbsp;&nbsp;ICP经营许可证：${pageConfigs.web_icp} </div>
    </c:if><div class="wenzits"><span class="red">郑重提示：</span>彩票有风险，购买要适度,禁止18岁以下的未成年人购买彩票。 </div>
  </div>
</div>

--%><div class="footer_tit">
      <div class="wenzicai">北京彩游天下网络科技有限责任公司 客服热线：400-110-3310 备案：京ICP备14043026号-3 </div>
      <div class="wenzits"><span class="red">郑重提示：</span>彩票有风险，购买要适度,禁止18岁以下的未成年人购买彩票。</div>
  <div class="footer_bangzhub"> <a href="javascript:void 0"><img src="/cytxhome/images/1.png" width="141" height="50" /></a> 
     <a href="javascript:void 0"><img  src="/cytxhome/images/2.png" /></a> 
     <a href="javascript:void 0"><img  src="/cytxhome/images/3.png" /></a> 
     <a href="javascript:void 0"><img  src="/cytxhome/images/4.png" /></a> 
     <a href="javascript:void 0"><img  src="/cytxhome/images/5.png" /></a>
    <div class="clear"></div>
  </div>
</div>
<!--footer end--> 

<!--用户登录-->
<div class="loginmask"></div>
<div id="loginalert">
  <div class="pd10 loginpd">
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
          <input type="text" name="username" class="loginusername" value="邮箱/用户名/手机号" />
          <input type="text" class="loginuserpasswordt" value="密码" />
          <input type="password" name="password" class="loginuserpasswordp" style="display:none" />
        </div>
        <div class="loginbtn">
          <div class="loginsubmit">
            <input type="button" value="登录" id="loginBtnId"/>
            <div class="loginsubmiting">
              <div class="loginsubmiting_inner"></div>
            </div>
          </div>
          <div class="logcheckbox fl">
            <input id="bcdl" type="checkbox"/>
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

<!--右侧栏-->
<div class="side">
  <ul>
    <li><a href="/playerintro/index.jhtml">
      <div class="sidebox"><img src="/cytxhome/images/side_icon01.png">帮助中心</div>
      </a></li>
    <li><a href="javascript:void 0">
      <div class="sidebox"><img src="/cytxhome/images/side_icon02.png">合作伙伴</div>
      </a></li>
    <li><a href="javascript:void(0);" onclick="window.open('http://wpa.qq.com/msgrd?v=5&uin=${sessionScope.domain.storeQq}&site=在线咨询&menu=yes');">
      <div class="sidebox"><img src="/cytxhome/images/side_icon04.png">QQ客服</div>
      </a></li>
    <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="/cytxhome/images/side_icon06.png"></a></li>
  </ul>
</div>
<!--右侧栏 end-->
<script type="text/javascript" src="http://${domain.collectionHost}/homePage/lic.do?storeId=${domain.storeId }"></script>
<script type="text/javascript" src="/js/home/footer.js"></script>
<c:if test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
<script>
//加载可用余额
refreshUsableMoney();

//加载站内信
try {
	refreshUsableMessage();
} catch ( ex){}

//营业厅彩民购彩车
try{
	getTemporaryOrder();
}catch(ex){}
</script>
</c:if>
<script>
$(function(){
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"124px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#1D7AD8"})	
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#c6c6c6"})	
	});
});
//回到顶部函数
function goTop(){
	$('html,body').animate({'scrollTop':0},300);
}
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7694d4f55cfc352fafe7698519fe5e73";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
