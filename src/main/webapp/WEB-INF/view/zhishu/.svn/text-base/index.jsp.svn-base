<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<c:set var="pageName" value="凤凰指数" scope="page"></c:set>
	<%@include file="../include/titlePage.jsp" %>
	<link type="text/css" rel="stylesheet" href="/cytxhome/css/register.css"/>
</head>

<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js"></script>
<script type="text/javascript" src="/js/lottery/guess/common.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/9/schedules.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/zhishu/index.js"></script>

<!--指数购买前页面-->
<div class="figure">
  <div style="height:165px;"></div>
  <div class="common_w">
    <div>
      <table border="0" cellpadding="0" cellspacing="0"  class="figure_form">
        <tr>
          <th>观点</th>
          <th>场次</th>
          <th>赛事</th>
          <th>比赛时间</th>
          <th colspan="3">主队vs客队</th>
          <th>&nbsp;</th>
          <th>胜</th>
          <th>平</th>
          <th>负</th>
        </tr>
        <tbody id="accordion"></tbody>
      </table>
    <script type="text/javascript">
        $(function () {
            $(".lisd").hide();
            $(".menn").mouseover(function (){
                $(this).next(".lisd").show(500);
			});
            $(".menn").mouseout(function(){
                $(this).next(".lisd").hide(3000);
            });
        });
        
        function hideDiv(id){
        	$("#"+id).hide();
        }
        
        var interval;
        function zhishupay(money, payType){
        	$("#feiyong").attr("class","lr_layer");
        	if (payType == 1) {
        		$("#feiyong").attr("class","lr_layer lr_layer_n");	
        	}
        	$.ajax({
				type: "GET",
				url: "/zhishu/wechatpay.do",
				data: "account="+money+"&payType="+payType,
				dataType: "json",
				success: function (json) {
					if (json.code == '1') {
						$("#handworkInput").show();
						$("#wechat_qrcode").attr("src", json.img);
						interval = setInterval("refresh("+json.zhishuPayId+")", 1000);
					} else {
						alert(json.msg);
					}
				}
			});
        }
        //刷新充值结果
        function refresh(zhishuPayId){
        	$.ajax({
				type: "GET",
				url: "/zhishu/refresh_result.do",
				data: "zhishuPayId="+zhishuPayId,
				dataType: "json",
				success: function (json) {
					if(json.code == 1 && json.state == 2) {
						clearTimeout(interval);
						$("#handworkInput").hide();
						$("#handworkInputSuccess").show();
						var b="true";
						$("#cgdjs").attr("v","6");
						var timer = setInterval(function () {
							if (parseInt($("#cgdjs").attr("v")) > 1 && b =="true"){
								$("#cgdjs").attr("v",  parseInt(parseInt($("#cgdjs").attr("v"))-1));
								var s = parseInt(parseInt($("#cgdjs").attr("v"))-1);
								$("#cgdjs").text(s);
							} else {
								b = "false";
								$("#cgdjs").attr("v","6");
								$("#handworkInputSuccess").hide();
								clearInterval(timer);
								window.location.reload();
							}
						}, 1000);
					} else {
						//alert(json.msg);
					}
				}
			});
        }
    </script>
  </div>
    <div class="figure_money">
    <div class="figure_money_c fl"><img src="/cytxhome/images/tuij/time.png" width="27" height="27">倒计时：
    <span class="figure_red ftime_red"><font id="stopHId">${stopTime[0] }</font>:<font id="stopMId">${stopTime[1] }</font>:<font id="stopSId">${stopTime[2] }</font></span></div>
      <div class="figure_money_r fr">
      <a href="javascript:void 0;" onclick="zhishupay('0.01','1')" class="figure_btn">4小时/1元</a>
      <a href="javascript:void 0;" onclick="zhishupay('2.00','2')" class="figure_btn green_day">全天/2元</a> 
        
        <!-- 输入弹出层 begin --> 
        <!-- 费用弹出 --> 
        <div id="handworkInput" style="display:none;">
          <div tabindex="0" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; -webkit-user-select: none; opacity: 0.7; background: rgb(0, 0, 0);"></div>
          <div id="feiyong" class="lr_layer" style="z-index:99999;"> <a href="#" class="zhis_close fr" onclick="hideDiv('handworkInput');"></a>
            <div class="zhishi_mea">
                <div class="weixin_mea"><img id="wechat_qrcode" src="" /></div>
                <div class="clear"></div>
            </div>
          </div>
        </div>
      	<!-- 费用弹出结束 -->
        <!--支付完成--> 
        <div id="handworkInputSuccess" style="display:none;">
          <div tabindex="0" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; -webkit-user-select: none; opacity: 0.7; background: rgb(0, 0, 0);"></div>
          <div class="lr_layer lr_layer_m" style="z-index:99999;">
           <a href="#" class="zhis_close fr" onclick="hideDiv('handworkInputSuccess');"></a><div class="daojishi" id="cgdjs">5</div> </div>
        </div>
       <!--  支付完成出结束---> 
        <!-- 输入弹出层end --> 
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<input type="hidden" id="oddInfoId" value="${oddInfo }"/>
<!--指数购买前页面--> 
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
