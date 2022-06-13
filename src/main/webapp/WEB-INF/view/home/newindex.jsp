<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../include/titlePage.jsp" %>
<link type="text/css" href="/cytxhome/css/prettyphoto.css" rel="stylesheet" />

<script type="text/javascript" src="/cytxhome/js/banner.js"></script>
<script type="text/javascript" src="/cytxhome/js/jquery.prettyphoto.js"></script>
<script type="text/javascript" src="/cytxhome/js/photo.js"></script>
<script type="text/javascript" src="/cytxhome/js/newindexpagecontrol.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/5/${game.issue }.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/9/homeschedules.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/homePage/bonus.do?storeId=${domain.storeId }"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/homePage/news.do?storeId=${domain.storeId }"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/index.js"></script>
<script type="text/javascript" src="http://${domain.storeHost}/www/data/store/STOREID_${domain.storeId }/INFO_CATEGORY/SHOPKEEPER_BULLETIN/shopkeeper_bulletin.js"></script>
<script type="text/javascript" src="http://${domain.storeHost}/www/data/store/STOREID_${domain.storeId }/INFO_CATEGORY/OUR_BULLETIN/our_bulletin.js"></script>

<script type="text/javascript" src="/js/home/newindex.js"></script>
<script type="text/javascript">
    $(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
</script>
<script>
    $(function () {
        var $tabs = $("div.tab");
        $.each($tabs, function (k, it) {
            var $li = $(this).find("li");
            var $con = $(this).find("div.tabCon div");
            $.each($li, function (i, item) {
                var _self = $(this);             
                
                _self.on("mouseover", function () {
                    var _con = $con.eq(_self.index());                    
                    _self.siblings().removeClass();
                    _self.addClass("cur");

                   _con.siblings().removeClass();
                    _con.addClass("cur");
                    
                })
            });
        })
        
    });
</script>
<script type="text/javascript">
$(document).ready(function(){	
	$("area[rel^='prettyPhoto']").prettyPhoto();
	$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
})
</script>
<script type="text/javascript">
/**
 * Code Width jQuery
 * 
 */

/**
* [sn_Lottery_choose description]
* @param  {[type]} elem   [外层box]
* @param  {[type]} numBox [滚动数字box]
* @param  {[type]} count  [最大数字限制]
* @return {[type]}        [function]
*/
var sn_Lottery_choose = function(elem, numBox, count){
  var Num = $(elem);
  var arrBall = [];
  var interval, index, i = 0;
  for(var i = 1; i < count; i++){
    arrBall.push(i);
  }
  arrBall.sort(function(){return (Math.random()<0.2?1:-1)});
  function setNum(){
    Num.find(numBox).each(function(){
      index = arrBall[Math.floor(Math.random() * (count - 1))];
      $(this).val(index);
    });
    i++;
    if( i > count + 15){
      arrBall.sort(function(){return (Math.random()<0.2?1:-1)});
      for(var j = 0; j < Num.find(numBox).length; j++){
        Num.find(numBox).eq(j).val(arrBall[j]);
      }
      return;
    }
    setTimeout(arguments.callee,10);
  }
  
  setNum();
  Num.find(numBox).each(function(){

    $(this).blur(function(){
      if(parseInt($(this).val()) > (count - 1)){
        alert("请输入小于" + (count - 1) + "的数字！")
        $(this).val("");
      }
    });
  });
}

function re_choose_number(redball, blueball){
  sn_Lottery_choose(redball.id, redball.cls, redball.count);
  if(typeof blueball != "object"){return;}
  sn_Lottery_choose(blueball.id, blueball.cls, blueball.count);
}

function clean_choose_number(id){
  $(id).find("input").val("");
}
/**
 * [sn_Tabs description]
 * @param  {[type]} elem     [触发元素]
 * @param  {[type]} box      [选项卡容器]
 * @param  {[type]} boxclass [选项卡对应容器class]
 * @param  {[type]} type     [触发类型]
 * @param  {[type]} more     [是否有更多选项]
 * @return {[type]}          []
 */
function sn_Tabs(elem, box, boxclass, type, more){
  var para = arguments;
  var timeout;
  $(elem).find("li").bind(type, function(){
    var _this = $(this);
    var i = $(this).index();
    timeout = setTimeout(function(){
      _this.addClass("activity").siblings().removeClass("activity");
      $(box).find(boxclass).eq(i).show().siblings().hide();
      if(para.length > 2){
        //sn_Lottery_choose
        var arr = [
          {
            id : "#dlt_choose",
            cls : ".redball",
            count : 36,
            blueball : {
              id : "#dlt_choose",
              cls : ".blueball",
              count : 13

            }
          },
          {
            id : "#ssq_choose",
            cls : ".redball",
            count : 33,
            blueball : {
              id : "#ssq_choose",
              cls : ".blueball",
              count : 17
            }
          },{
            id : "#ssxw_choose_ball",
            cls : ".redball",
            count : 12
          }
        ];
        re_choose_number(arr[i], arr[i].blueball);
        if(i == $(elem).find("li").length - 1){
          sn_Tabs("#sswx_buy_tag", "#ssxw_choose_ball", ".buy_type_index_ball", "mouseover");
        }
      }
      if(box == "#ssxw_choose_ball"){
        //type = false;
        sn_Lottery_choose("#ssxw_choose_ball", ".redball", 12);
      }
    },300);
  });
  
  $(elem).find("li").bind("mouseout", function(){
    clearTimeout(timeout)
  })

  if(box == "#sn_buy_box"){
    sn_Lottery_choose("#dlt_choose", ".redball", 36);
    sn_Lottery_choose("#dlt_choose", ".blueball", 13);
    sn_Lottery_random_clean();
  }

}
function sn_Lottery_random_clean(){
	$("#dlt_random").click(function(){
    sn_Lottery_choose("#dlt_choose", ".redball", 36);
    sn_Lottery_choose("#dlt_choose", ".blueball", 13);
  });
  $("#dlt_clean").click(function(){
    clean_choose_number("#dlt_choose");
  });
  $("#ssq_random").click(function(){
    sn_Lottery_choose("#ssq_choose", ".redball", 34);
    sn_Lottery_choose("#ssq_choose", ".blueball", 17);
  });
  $("#ssq_clean").click(function(){
    clean_choose_number("#ssq_choose");
  });
  $("#ssxw_random").click(function(){
    sn_Lottery_choose("#ssxw_choose_ball", ".redball", 12);
  });
  $("#ssxw_clean").click(function(){
    clean_choose_number("#ssxw_choose_ball");
  });
}

$(function(){
  
  sn_Tabs("#buy_tag", "#sn_buy_box", ".sn_buy_box", "mouseover", 0, 1);

});
</script>

</head>
<body>
	<div id='wx_pic' style='margin:0 auto;display:none;'>
<img src='/cytxhome/images/weicai-new.png' />
</div>
<jsp:include page="../include/cytxheader.jsp"></jsp:include>
<!-- 手机挑战至移动站点 -->
<c:if test="${isFromMobile eq true and fn:indexOf(header.referer,'${domain.mobileHost}') == -1}">
<script type="text/javascript">
$(document).ready(function(){
	layer.confirm("检测到您正在使用移动设备，是否进入移动wap站点？", function(index){
		location.href = "http://${domain.mobileHost}?mfrom=4";
	});
});
</script>
</c:if>

<div class="index_img"> 
<div class="content common_s"> 
  <!-- 左侧菜单-->
  <div class="main-left fl " id="licenseSelAreaId">
  </div>
  <!-- 左侧菜单 end-->
  
  <div class="side_r"> 
   <div class="s_new_bg">
    <!--滚动-->
    <!--<div class="notice"> <span>店主公告</span> <i></i>
      <marquee class="soroll" scrollamount="3" behavior="scroll" onMouseOver="this.stop()"
    onMouseOut="this.start()" id="index_dzgg"></marquee>
    </div>-->
    <!--滚动 end--> 
    <!--banner-->
    <script type="text/javascript" src="http://${domain.collectionHost}/global/js/banner/web/banner.js"></script>
    <script type="text/javascript" src="http://${domain.collectionHost}/global/js/banner/web/bannerUtil.js"></script>
    <div class="banner">
      <div class="pro-switch">
        <div class="slider">
          <div class="flexslider">
            <ul class="slides">
              <li>
                <div class="img"><a id="banner-1"><img src="http://${domain.collectionHost}/global/images/banner/web/banner-1.jpg" height="304" width="565" alt="" /></a></div>
              </li>
              <li>
                <div class="img"><a id="banner-2"><img src="http://${domain.collectionHost}/global/images/banner/web/banner-2.jpg" height="304" width="565" alt="" /></a></div>
              </li>
              <li>
                <div class="img"><a id="banner-3"><img src="http://${domain.collectionHost}/global/images/banner/web/banner-3.jpg" height="304" width="565" alt="" /></a></div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--banner end--> 
    
    <!-- -->
    <div class="side_r"> 
      <!--注册登录-->
      <div class="login">
      	<c:choose>
      		<c:when test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
      			 <div class="yideng">
			      <div class="login_out">
			      <ul>
			      <li><i class="chong"></i><a href="/memberCenterNew/putMoney.jhtml">充值</a></li>
			      <li><i class="ti"></i><a href="/memberCenterNew/getMoney.jhtml">提现</a></li>
			      <li><i class="order"></i><a href="/memberCenterNew/purchasList.jhtml">我的订单</a></li>
			      </ul>
			      </div>
		      </div>
      		</c:when>
      		<c:otherwise>
				  <div class="dl"><a class="openlogin" href="javascript:" onclick=";;">用户登录</a></div>
				  <div class="zc"><a href="/common/register/index.jhtml" >免费注册</a></div>
        <div class="clear"></div>
        </c:otherwise>
      	</c:choose>
        
      </div>
      <!--注册登录 end--> 
      <!--公告部分-->
      <div class="tab">
        <div class="tabList">
          <ul>
            <li class="cur">本店公告</li>
            <li>店主推荐</li>
            <li>购彩帮助</li>
          </ul>
        </div>
        <div class="tabCon">
          <div class="cur" id="index_right_bdgg"></div>
          <div id="index_right_dztj"> </div>
          <div id="index_right_gcbz">
          <a href="/help/help_center/one-zhucewenti/zhucewenti-answer/one-zcwt.html" target="_blank">如何注册成为会员</a><a href="/help/help_center/one-zhucewenti/zhucewenti-answer/two-zcwt.html" target="_blank">注册的用户名可以修改吗？</a> 
      <a href="/help/help_center/one-zhucewenti/zhucewenti-answer/three-zcwt.html" target="_blank">注册成功后，个人信息会被保密吗？</a> <a href="/help/help_center/two-chongzhiwenti/chongzhiwenti-answer/two-chzwt.html" target="_blank">充值未到账怎么办</a>
      <a href="/help/help_center/five-tixian/six-lingqu.html" target="_blank">中奖奖金如何扣税</a> <a href="/help/help_center/five-tixian/five-lingqu.html" target="_blank">中奖奖金如何分配</a> 
          </div>
        </div>
      </div>
      <!--公告部分 end--> 
    </div>	
    <div class=" clear"></div>
    </div>
    <div class=" clear"></div>
    
    <!-- 凤凰指数相关begin -->
    <div  class="data_price" >
    	<div class="tabList tabList_w">
            <ul>
              <li name="jcArtN" class="cur">凤凰指数</li>
              <li name="jcArtN" class="">排列三</li>
              <div class=" clear"></div>
            </ul>
      	</div>
            <div class="tabList_cont" name="homepanel">
        	<div class="tabList_cont_tit">
            	<div class="fl">大家都在猜</div>
                <div class=" clear"></div>
            </div>
            <div class="tabList_cont_cont">
            	<div class="tabList_cont_contl fl">
                	<div class="match_a" id="jcRomSchId">
                    </div>
                    <div class="blue_question fl">胜？平？负？ 想知道大家都支持哪队？</div>
                    <div class="blue_solve fl"><a href="/zhishu/index.jhtml">立即查看</a></div>
                </div>
                <a href="/zhishu/index.jhtml" class="tabList_cont_contr fr"></a>
                <div class=" clear"></div>
            </div>
        	</div>
        	<!-- 数字彩投注begin -->
    	<div name="homepanel" class="sn_buy_box ssxw_buy_box" style="display:none">
          <div class="qjxx"><span><strong>排列三</strong></span><span id="plsIssueId"><strong>停售时间：</strong>2016-02-17 19:53:00</span>
            <div class="clear"></div>
          </div>
            <div class="clear"></div>
          <div id="plsRadomUlId" class="number">
            <input type="text" class="redball" value="00">
            <input type="text" class="redball" value="00">
            <input type="text" class="redball" value="00">
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
          <%--<div class="q_bottom"> 
          <span class="d_time">奖池：<b>33亿 1363万 1603元</b></span></div>
          --%><div class="quaick_button">
            <div class="tou"><a href="javascript:void 0" id="plsNowBetId">立即投注</a></div>
            <div class="change"><a href="javascript:void 0" id="plsRadomBtnId">换一注</a></div>
          </div>
        </div>
    <!-- 数字彩投注end -->
       </div>
    <!-- 凤凰指数相关end -->
    
    
    <!--快捷投注-->
    <%--<div class="quick">
      <div class="title">
        <div class="title_name fl">数字彩快捷投注</div>
        <div class="title_plant fr" id="buy_tag">
          <ul>
            <li class="activity"><a href="javascript:void 0">大乐透</a></li>
            <li><a href="javascript:void 0">排列三</a></li>
            <div class="clear"></div>
          </ul>
        </div>
        <div class="clear"></div>
      </div>
      <div id="sn_buy_box">
        <div class="sn_buy_box ssxw_buy_box">
          <div class="qjxx"><span><strong>大乐透</strong></span><span id="dltIssueId">第2015037期</span><span class="money" id="bonusPoolId">奖池：<b>3 亿 8509 万 460 元</b></span>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
          <div id="dltRadomUlId" class="number">
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <input type="text" class="blue_ball blueball" value="00" />
            <input type="text" class="blue_ball blueball" value="00" />
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
          <div class="q_bottom"> <!--<span>开奖时间：2015年04月02日 21:32</span> <span class="jr">今日开奖</span> --><span class="d_time" id="dltStopTimeId">截止时间还有：<b>03小时20分17秒</b></span> </div>
          <div class="quaick_button">
            <div class="tou" id="clear" ><a href="javascript:void 0" id="dltNowBetId">立即投注</a></div>
            <div class="change"><a href="javascript:void 0" id="dltRadomBtnId">换一注</a></div>
          </div>
        </div>
        <div class="sn_buy_box ssxw_buy_box" style="display:none;">
          <div class="qjxx"><span><strong>排列三</strong></span><span id="plsIssueId">第2015028期</span>
            <div class="clear"></div>
          </div>
            <div class="clear"></div>
          <div id="plsRadomUlId" class="number">
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <input type="text" class="redball" value="00" />
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
          <div class="q_bottom"> <span class="d_time" id="plsStopTimeId">截止时间还有：<b>02小时20分17秒</b></span> </div>
          <div class="quaick_button">
            <div class="tou"><a href="javascript:void 0" id="plsNowBetId">立即投注</a></div>
            <div class="change"><a href="javascript:void 0" id="plsRadomBtnId">换一注</a></div>
          </div>
        </div>
      </div>
    </div>
    --%><!--快捷投注 end--> 
    
    <!--手机购彩-->
    <!--<div class="phone_er">
      <div class="title">
        <div class="title_name ">手机购彩</div>
      </div>
      <div class="erweim"> <img src="/images/twodimensionCode/${sessionScope.domain.storeId}codepic.jpg" width="107" height="107" /></div>
    </div>-->
    
    <div class="phone_er">
      <div class="title">
        <div class="title_name"><div>下载凤凰APP</div><span>随时随地快捷投注！</span><div class="clear"></div></div>
      </div>
      <div class="erweim">
        <div class="dm fl">
          <div><img src="/images/twodimensionCode/${sessionScope.domain.storeId}codepic2.jpg" width="87" height="87" /></div>
          <p>邀请码:<font color="red">${fn:split(sessionScope.domain.netUrl, ".")[0]}@${sessionScope.agentId}</font></p>
        </div>
        <div class="fl"><img src="/cytxhome/images/erwei_r.png" width="83" height="146" /></div>
      </div>
      <div class="clear"></div>
    </div>
    
    <%--<div class="phone_er">
      <div class="title">
        <div class="title_name ">手机购彩</div>
      </div>
      <div class="erweim"> 
            <div class="dm fl">
            	<c:if test="${!beHLwUnion}"><c:choose>
		            <c:when test="${sessionScope.agentId != null && sessionScope.agentId != '' }">
									<div><img src="/images/twodimensionCode/${sessionScope.domain.storeId}${sessionScope.agentId}codepic2.jpg" width="95" height="95"></div>
		              <div>邀请码:<font color=red>${fn:split(sessionScope.domain.netUrl, ".")[0]}@${sessionScope.agentId}</font></div>
								</c:when>
								<c:otherwise>
									<div><img src="/images/twodimensionCode/${sessionScope.domain.storeId}codepic2.jpg" width="95" height="95"></div>
		              <div>邀请码:<font color=red>${fn:split(sessionScope.domain.netUrl, ".")[0]}</font></div>
								</c:otherwise>
							</c:choose>
						</c:if>
      </div>
      <div class="fl">
      <img src="/images/phone_img.jpg" width="73" height="135"></div>
      </div>
      <div class="clear"></div>
    </div>

    --%><!--手机购彩 end--> 
    <!-- 公告 end--> 
    
  </div>
 </div>
</div>
   
   <!-- 第二部分begin -->
<div class="center_s_bg">
  <div class="common_s">
  <div class="side_l">
    <div class="open tab">
      <div class="notice_top">
        <div class="tabList notice_top_r fl">
          <ul>
            <li class="cur"><a href="javascript:void(0)" >数字</a></li>
            <li><a href="javascript:void(0)">足彩</a></li>
          </ul>
        </div>
       </div>
      	<div class="tabCon open_list">
		   <div class="cur" id="index_left_kjgg_szc"></div>
		   <div id="index_left_kjgg_zc"></div>
    	</div>
	</div>
  </div>
  
  <div class="side_m"> 
    <div class="zixu_w"><div class="zixu_l"><span class="jiajai jiazix"></span>彩票资讯</div></div>
    <!--彩票资讯-->
    <div class="news">
      <div class="cp_news-bg">
        <h1 class="cp_news">竞彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
      <div id="jcNewsArea" style="display:block">
      </div>
    </div>
    <div class="news">
      <div class="cp_news-bg">
        <h1 class="cp_news">数字彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
      <div id="szcNewsArea" style="display:block">
      </div>
    </div>
    <div class="news">
      <div class="cp_news-bg">
        <h1 class="cp_news">足彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
      <div id="zcNewsArea" style="display:block">
      </div>        
    </div>
    <!--彩票资讯 end--> 
    <!--专家彩民-->
    <%--<div class="news zhuanj">
      <div class="cp_news-bg">
        <h1 class="cp_news">专家彩民</h1>
        <div class="fenl"><a id="jcExpertNewsBtn" style="border-right:none"  href="javascript:void(0)" onclick="window.open('http://tuijian.${enName}.com/?${domain.netUrl }')">更多专家</a></div>
        <div class="fenl"><a id="zcExpertNewsBtn" href="javascript:void(0)">足彩</a></div>
        <div class="fenl"><a id="szcExpertNewsBtn" href="javascript:void(0)">数字彩</a></div>
        <div class="fenl"><a id="jcExpertNewsBtn" href="javascript:void(0)">竞彩</a></div>
        <div class="clear"></div>
      </div>
	  <div id="jcExpertNewsArea" style="display:block">
	  <!-- <script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/jcExpertNews.js"></script> -->
	  </div>
      <div id="szcExpertNewsArea" style="display:none">
      <!-- <script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/szcExpertFile.js"></script> -->
      </div>
      <div id="zcExpertNewsArea" style="display:none">
      <!-- <script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/zcExpertNews.js"></script> -->
      </div>  
    </div>
    --%><!--专家彩民 end--> 
  </div>
  
  <div class="side_r"> 
    <!--中奖信息-->
    <div class="tab zxzj">
      <div class="tabList">
        <ul>
          <li class="cur">中奖排行</li>
          <li>最新中奖</li>
        </ul>
      </div>
      <div class="tabCon paih_h">
        <div class="cur paih">
          <dl class="zxzj_cont" id="index_right_zjph"></dl>
        </div>
        <div class="paih">
          <dl class="zxzj_cont" id='index_right_zxzj'></dl>
        </div>
      </div>
    </div>
    <!--中奖信息 end--> 
  </div></div>
  <div class=" clear"></div>
  </div>
   <!-- 第二部分end -->
   
  <!-- 第三部分begin -->
<div class="common_s">
  <!--竞彩投注区 end--> 
    <div class="jjictz">
      <div class="title">
        <div class="title_name fl"><span class="jiajai jingji"></span>足彩投注区</div>
        <div class="title_plant fl">
          <ul id="zcSfARjOptId">
            <li><a class="current left_p" href="javascript:void 0" value="5">胜负彩</a></li>
            <li><a href="javascript:void 0" class="right_p" value="6">任选九</a></li>
            <div class="clear"></div>
          </ul>
          <div class="clear"></div>
        </div>
        <div class="fr moment_time">
          ${game.issue } 当前期 截止时间：<span>${game.stopTime }</span></div>
        <div class="clear"></div>
      </div>
      <div class="jjtz">
        <div class="jjtz_biaoge">
          <table width="780" border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <th width="5%">场次</th>
              <th width="7%">赛事</th>
              <th width="16%">比赛时间</th>
              <th>主队客队</th>
              <th width="10%">数据</th>
              <th width="6%" colspan="3">平均欧赔</th>
              <th width="6%" colspan="3">选号区</th>
              <th width="6%">设胆</th>
              <th width="5%">包</th>
            </tr>
            <tbody id="zcTobodyId">
            </tbody>
          </table>
        </div>
  	<div class="jing_f fr"><a href="javascript:void 0" id="clearZcId">清空</a>
        <input type="button" value="立即投注" class="btn" id="zcBetBtnId"/>
      </div>      
      </div>
      <div class="clear"></div>
    </div>
    <div class="ww_sxport fr">
    	<div class="exp_tit"><span class="jiajai"></span><h5>专家彩民</h5></div>
        <div class="exp_list">
         	<div class="cp_news-bg">
        <h1 class="cp_news ww_news">竞彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
      	<div class="exp_list_up">
      		<a class="exp_list_l fl"></a>
            <div class="exp_list_r fl">
            	<div class="exp_list_r_top fr">
                	<h3 class="fl">绿茵上将</h3><span class="fl">欧洲杯推荐</span><div class="clear"></div>
                    	<a href="#">葡萄牙连续两届欧洲杯跻身4强，球队实力备受肯定...</a>
                       <div class="clear"></div> 
                    </div>
            </div>
            <div class="clear"></div>
        </div></div>
        <ul id="jcZjNewsViewId">
        </ul>
        <div class="exp_list">
         	<div class="cp_news-bg">
        <h1 class="cp_news ww_news">足彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
      <div class="exp_list_up"> 
      		<a class="exp_list_l exp_list_w fl"></a>
            <div class="exp_list_r fl">
            	<div class="exp_list_r_top fr">
                	<h3 class="fl">绿茵上将</h3><span class="fl">欧洲杯推荐</span><div class="clear"></div>
                    	<a href="#">葡萄牙连续两届欧洲杯跻身4强，球队实力备受肯定...</a>
                        <div class="clear"></div>
                    </div>
            </div>
            <div class="clear"></div>
        </div></div>
        <ul id="zcZjNewsViewId">
        </ul>
     <div class="cp_news-bg">
        <h1 class="cp_news ww_news">数字彩</h1>
        <div class="fenl"><a href="#">更多</a></div>
        <div class="clear"></div>
      </div>
            <div class="clear"></div>
        <ul id="szZjNewsViewId">
        </ul>
    </div>
    <div class="clear"></div>
    
    <!--中奖展示-->
    <div class="common_s">
    	<div class="show">
      <div class="title">
        <div class="title_name"><span class="jiajai jiajiang"></span>中奖展示</div>
      </div>
      <div class="infopic">
        <div class="picbox">
          <ul class="gallery piclist" id="pictureshow">
          </ul>
        </div>
        <div class="pic_prev"></div>
        <div class="pic_next"></div>
      </div>
    </div>
    </div>
    <!--中奖展示 end--> 
  <!--竞彩投注结束 end--> 
  <div class="clear"></div>
</div>
  <!-- 第三部分end -->
  
  
<jsp:include page="../include/cytxfooter.jsp"></jsp:include>

<script> 
var mouseOverFlag;  
    var isMouseOver = Function;  
    var o = document.getElementById("index_left_kjgg_szc");
    o.innerHTML += o.innerHTML;
    o.onmouseover = isMouseOver("mouseOverFlag=1");
    o.onmouseout = isMouseOver("mouseOverFlag=0");

    function F() {
        if(o.scrollTop%18 || !mouseOverFlag) {
            o.scrollTop++;
            o.scrollTop %= o.scrollHeight / 2;
        }
        setTimeout(F, o.scrollTop%290 ? 4 : 7000);
    }
    F();
</script>

</body>
</html>