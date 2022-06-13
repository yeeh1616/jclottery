<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="竞彩篮球胜分差" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp" %>
<script>
        $(function () {
            var $w = $(window),
                $footer = $('#touzhulan'),//
                $content = $('#accordion'),//内容
                footer_h = $footer.height(),
                $last = $content.last(),
                position = $.browser.isIe6 ? 'absolute' : 'fixed';
            function resizeFooter() {
                var ofs = $content.offset(), wh = $w.height(), top = ofs.top + $content.height() + footer_h + 6, wtop = $w.scrollTop() + wh;
                if (wtop < top) {
                    $footer.css({ position: position, top: ($.browser.isIe6 ? wtop - footer_h : wh - footer_h), left: $last.offset().left });
                } else {
                    $footer.css({ position: 'relative', top: 4, left: 1 });
                }
            }
            $w.scroll(resizeFooter), $w.resize(resizeFooter); resizeFooter();
        })
        
    </script>
</head>

 <!-----------------------------注意这个body里面有样式---------------------------->
    <body class="lac">
    <jsp:include page="../../../include/cytxlevel2header.jsp"></jsp:include>
<!--header end-->
<div class="big_bg basket_bg" id="betPanalId">
      <div class="common_w">
    <jsp:include page="../guessbasketballheader.jsp"></jsp:include>
    <div id="navlist_tz" class="sais_t">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="sais_ts">
        <tr>
              <td width="12%" style="border-bottom:0px"><a href="javascript:void 0" class="xd">赛事<span class="xxj sais"></span></a></td>
              <td width="8%" style="border-bottom:0px"><a href="javascript:void 0" class="xd" id="showStopTimeId">停售<span class="xxj sais"></span></a></td>
        <td width="20%">客队VS主队</td>
        <td width="37%" class="lan_sfc_t"><span></span><span>1-5</span><span>6-10</span><span>11-15</span><span>16-20</span><span>21-25</span><span>26+</span></td>
        <td width="10%">数据</td>
        <td>平均欧赔</td>
      </tr>
      </table>
        </div>
    <!--赛事和停售-->
    <div class="zk_list" id="navbox_tz" style="height:0px;opacity:0;overflow:hidden;">
          <div class="cont dzm" style="display:none;">
        <div class="rq-title">
              <div class="rq-title_l fl">赛事</div>
              <div class="rq-title_r fr">
            <ul>
                  <li><a href="javascript:void 0" id="schAllSelId">全选</a></li>
                  <li><a href="javascript:void 0" id="schAllSelRId">反选</a></li>
                  <li><a href="javascript:void 0" id="schAllClrId">全清</a></li>
                </ul>
          </div>
              <div class="clear"></div>
            </div>
        <div class="dzm_c">
              <ul id="lsSsAreaId">
          </ul>
            </div>
      </div>
          <div class="cont xial_ks w-k" style="display:none; "> <a href="javascript:void 0" style="" id="showStartTimeId">开赛</a> </div>
        </div>
    <!--赛事和停售 end-->
    <div class="sais_c" id="accordion">

    </div>
    <!--悬浮栏开始-->
    <jsp:include page="../guessfooter.jsp"></jsp:include>
    <!--悬浮栏结束-->
    <div class="botoom_sm">
          <h1>竞彩投注提示</h1>
          <div>1、让球(让分)只适合“竞彩足球让球胜平负”玩法与“竞彩让分胜负”玩法,“+”为客让主，“-”为主让客。</div>
          <div>2、页面中过关投注固定奖金仅供参考，实际奖金以出票时刻奖金为准。投注区显示的中奖金额=每1元对应中奖奖金。</div>
          <div>3、过关投注完场显示的奖金仅指比赛截止投注时最终变化的过关奖金，仅供参考，派奖奖金以方案详情中最终出票时刻的奖金为准。</div>
          <div>4、单关投注，单注最高奖金限额500万元；2或3场过关投注，单注最高奖金限额20万元；4或5场过关投注，单注最高奖金限额50万元；6场过关投注，单注最高奖金限额100万元。</div>
          <div>5、单注彩票保底奖金：如果单注奖金不足2元，则补足至2元。</div>
          <!--<span>6、竞彩足球可出票时间：周一 ～ 周五 9:00-24:00 周六/日 9:00 - 次日01:00。</span><br />
				<span>7、世界杯期间竞彩销售时间安排请遵循官方通告。</span><br />--> 
        </div>
  </div>
    </div>

<jsp:include page="../surepage.jsp"></jsp:include>
<jsp:include page="../../../include/footer.jsp"></jsp:include>

<!--右侧栏 end-->
<script type="text/javascript">
(function() {
	var time = null;
	var list = $("#navlist_tz");
	var box = $("#navbox_tz");
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
<script type="text/javascript" src="/cytxhome/js/index.js"></script>
</body>

</html>