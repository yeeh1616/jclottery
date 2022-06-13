<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<c:set var="pageName" value="首页" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<style>
body{
	background: url("/images/wc_bg.jpg") repeat-y scroll center top rgba(0, 0, 0, 0) !important;
}
</style>
</head>
<body>
<div class="topad"><img src="/images/ttt.jpg" width="1021" height="110" style="cursor:pointer" onclick="window.open('/news.jhtml?conid=36');"/></div>

<jsp:include page="../include/header.jsp"></jsp:include>

<script type="text/javascript" src="/data/home/guessFootballSchedules.js"></script>
<script type="text/javascript" src="/js/home/index.js"></script>
<div class="indexbox">

	<div class="indexmain">
    	<div class="indeleft">
        	<ul id="licenseSelAreaId">
            </ul>
            <div class="clear"></div>
        </div>
    	<div class="indexright">
        
        	<div class="inbox">
           	  <div class="flasview">
                	<div class="flash">
               	  <SCRIPT type=text/javascript>
 <!-- 
var interval_time=5 ;
var focus_width=503
var focus_height=247
var text_height=0
var text_mtop = 2;
var text_lm = 10;
var textmargin = text_mtop+"|"+text_lm;
var textcolor = "#2E5DB5|0xFF0000";
var text_align= 'left'; 
var swf_height = focus_height+text_height+text_mtop; 
var text_size = 14;
var borderStyle="1|0x000000|0";
  var pics='/images/rollpic/p1.png|/images/rollpic/p2.png|/images/rollpic/p3.png|/images/rollpic/p4.png'; 
var links='#/|#/|#/|#/'; 
var texts='1|2|3|4|5';
 document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="/images/hot_new.swf"> <param name="quality" value="high"><param name="Wmode" value="transparent">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+interval_time+'&textsize='+text_size+'">');
 document.write('<embed src="/images/hot_new.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+interval_time+'&textsize='+text_size+'" menu="false" bgcolor="#ffffff" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  document.write('</object>');
 //-->
</SCRIPT></div>
                    <div class="dzgg">
                    		<marquee style="cursor:default;padding-left: 100px;padding-top: 11px;" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="3" behavior="scroll" direction="left"> 
                    	 	<script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/indexTx.js"></script>
                    	 </marquee>
                    </div>
              </div>
                <div class="innotice">
                	<div class="intab">
                    	<a style="cursor:pointer" class="out">公告</a> <a style="cursor:pointer" class="over">预测</a>
                    </div>
                    <div class="incont" style="display: block;">
                    	<script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/indexGG.js"></script>
                    </div>
                    <div class="incont" style="display:none">
                    	<script type="text/javascript" src="/js/home/${sessionScope.domain.storeId}/indexYC.js"></script>
                    </div>
                </div>
            </div>
          <div class="inbox2">
           	<div class="qbuy"> <h1>快速购彩</h1>  <h2>本站累计中奖    23亿4049万元</h2></div>
                <div class="kscgbox">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
               	    <tr>
                	      <td width="5%" height="230" style="cursor:pointer;" id="plsShowSelId"><img src="/images/kscg.jpg" width="39" height="231" /></td>
                	      <td width="7%" style="cursor:pointer;" id="dltShowSelId"><img src="/images/kscg-02.jpg" width="51" height="231" /></td>
                	      <td width="292" valign="top" id="dltBetAreaId"><table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
                	        <tr>
                	          <td height="72"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	            <tr>
                	              <td height="24" class="clolan">奖池</td>
                	              <td align="right"><span class="clorc" id="bonusPoolId">0</span>元</td>
              	              </tr>
                	            <tr>
                	              <td height="24" class="clolan">倒计时</td>
                	              <td align="right"><span class="clorc" id="stopDId">00</span>天<span class="clorc" id="stopHId">00</span>小时<span class="clorc" id="stopMId">00</span>分<span class="clorc" id="stopSId">00</span>秒</td>
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="1" bgcolor="#d1d0d0"></td>
              	          </tr>
                	        <tr>
                	          <td height="51"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	            <tr>
                	              <td width="54%">［<span class="clorc">前区</span>］<span class="clolan"> 1-35</span>选<span class="clolan">5</span></td>
                	              <td width="46%" align="right">［<span class="clorc">后区</span>］<span class="clolan">1-12</span>选<span class="clolan">2</span></td>
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="38">
                              
                              
                              <table border="0" cellspacing="0" cellpadding="0" class="tzq">
                	            <tr id="radomNumberId">
                	              
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="28">&nbsp;</td>
              	          </tr>
                	        <tr>
                	          <td height="28"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                	            <tr>
                	              <td><input  type="button" class="bt_01" name="dltBetBtnId" value="快速投注" style="cursor:pointer;"/></td>
                	              <td align="right"><input type="submit" class="bt_02" name="radomSelNumberBtnId" value="机选" style="cursor:pointer;"/>
               	                  <input type="submit" class="bt_02" name="stdSelNumberBtnId" value="标准选号" style="cursor:pointer;"/></td>
              	              </tr>
              	            </table></td>
              	          </tr>
           	            </table></td>
           	            
           	            <td width="292" valign="top" style="display:none" id="plsBetAreaId"><table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
                	        <tr>
                	          <td height="72"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	            <tr>
                	              <td height="24" class="clolan">倒计时</td>
                	              <td align="right"><span class="clorc" id="plsstopDId">00</span>天<span class="clorc" id="plsstopHId">00</span>小时<span class="clorc" id="plsstopMId">00</span>分<span class="clorc" id="plsstopSId">00</span>秒</td>
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="1" bgcolor="#d1d0d0"></td>
              	          </tr>
                	        <tr>
                	          <td height="51"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	            <tr>
                	              <td width="54%">［<span class="clorc">排列三直选</span>］<span class="clolan"> 0-9</span>选<span class="clolan">3</span></td>
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="38">
                              
                              
                              <table border="0" cellspacing="0" cellpadding="0" class="tzq">
                	            <tr id="plsradomNumberId">
                	              
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="28">&nbsp;</td>
              	          </tr>
                	        <tr>
                	          <td height="28"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                	            <tr>
                	              <td><input  type="button" class="bt_01" name="dltBetBtnId" value="快速投注" style="cursor:pointer;"/></td>
                	              <td align="right"><input  type="submit" class="bt_02" name="radomSelNumberBtnId" value="机选" style="cursor:pointer;"/>
               	                  <input type="submit" class="bt_02" name="stdSelNumberBtnId" value="标准选号" style="cursor:pointer;"/></td>
              	              </tr>
              	            </table></td>
              	          </tr>
           	            </table></td>
           	            
                	      <td width="285" valign="top" style="border-left:solid 1px #d1d0d0">
                          
                          <table width="272" border="0" align="center" cellpadding="0" cellspacing="0">
                	        <tr>
                	          <td width="43" height="26" align="center">联  赛</td>
                	          <td width="116" align="center">对阵 </td>
                	          <td width="112" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	            <tr class="clorc">
                	              <td align="center">3</td>
                	              <td align="center">1</td>
                	              <td align="center">0</td>
              	              </tr>
              	            </table></td>
              	          </tr>
                	        <tr>
                	          <td height="1" colspan="3" bgcolor="#d1d0d0"></td>
               	            </tr>
               	            <tbody id="guessSchId"></tbody>
                	        
                	        <tr>
                	          <td height="40" colspan="2"><!--0 注 0 元        　　　　清空--></td>
                	          <td align="center"><img src="/images/tzindex.png" width="111" height="28" style="cursor:pointer;" id="guessGotoBetBtnId"/></td>
              	          </tr>
           	          </table></td>
                	      <td width="7%" style="cursor:pointer;"><img src="/images/kscg-03.jpg" width="51" height="230" /></td>
                	      <td width="5%" style="cursor:pointer;"><img src="/images/kscg-04.jpg" width="39" height="230" /></td>
           	        </tr>
           	      </table>
              </div>
          </div>
        </div>
    </div>

</div>
<jsp:include page="../lottery/common/numbercomm.jsp"></jsp:include>
<jsp:include page="../include/footer.jsp"></jsp:include>

<form id="lotteryBuyFormId" action="/lottery/bet.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value=""/>
	<input type="hidden" name="playType" value=""/>
	<input type="hidden" name="singleFlag" value=""/>
	<input type="hidden" name="betCode" value=""/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" id="issueId" value=""/>
	<input type="hidden" name="betFrom" value=""/>
	<input type="hidden" name="betType" value=""/>
	<input type="hidden" name="zjFlag" value=""/>
</form>
<input type="hidden" id="dltissueId" value=""/>
<input type="hidden" id="plsissueId" value=""/>
<script>
	$(document).ready(function () {
		var $tab = $(".incont");
		var $radio = $("div.intab a");
		$radio.click(function() {
			if ($radio.index(this) == 0) {
				$($tab[0]).show();
				$($tab[1]).hide();
				
				//$($radio[0]).addClass("out");
				//$($radio[1]).removeClass("over");
				$($radio[0]).removeClass("over").addClass('out');
				$($radio[1]).removeClass("out").addClass('over');
			}
			if ($radio.index(this) == 1) {
				$($tab[0]).hide();
				$($tab[1]).show();
				
				$($radio[0]).removeClass('out').addClass('over');
				$($radio[1]).removeClass('over').addClass('out');
				//$($radio[0]).removeClass("on");
				//$($radio[1]).addClass("on");
			}
		});
});
</script>
</body>
</html>
