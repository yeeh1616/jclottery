<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../../chasing/chasingForm.jsp"></jsp:include>
<input type="hidden" value="${licenseName }" id="licenseNameId"/>
<div class="dlt-tan" style="display:none" id="sureBuyDivId">
	<div class="dlt-tan-t">
    	<a style="cursor:pointer" id="closeDivBtnId"><img src="/images/cls.gif"></a>${licenseName }<font id="sureDivIssueId">${game.issue }</font>期<span id="buyChsMergeNameId">个人代购</span>
    </div>
	<div class="dlt-tan-c">
   	  <table width="710" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td width="90" height="66" bgcolor="#d1ebf8">方案信息</td>
    <td height="66" style="border:none;">
    <table width="620" border="0" cellspacing="0" cellpadding="0" style="border:none;">
      <tbody><tr class="rj">
        <td width="165" height="33" bgcolor="#e8f0f4">玩法</td>
        <td height="33" bgcolor="#e8f0f4">注数</td>
        <td height="33" bgcolor="#e8f0f4">倍数</td>
        <td height="33" bgcolor="#e8f0f4" id="sureZjTdId">追加</td>
        <td width="210" height="33" bgcolor="#e8f0f4">总金额</td>
      </tr>
      <tr id="sureBuyOrInfoTrId">
      </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td width="90" height="96" bgcolor="#d1ebf8">投注内容</td>
    <td>
    	<ul id="sureBuyBetDetailId">
       </ul>
    </td>
  </tr>
  <tr>
    <td width="90" height="30" bgcolor="#d1ebf8">认购信息</td>
    <td>您本次购买需消费¥<span id="sureBuyTotalBetMoneyId">0</span>元，您的可投注余额¥<span id="sureBuyBalanceId">0</span>元。</td>
  </tr>
</tbody></table>
  </div>
  <div class="dlt-tan-b">
  	<span><a style="cursor:pointer" id="gobackBtnId">返回修改》</a></span>
    <a style="cursor:pointer" id="numberBuyBtnId"><img src="/images/qrtz_03.png"></a>
  </div>
  <div class="clear"></div>
</div>

<!-- 合买确认弹出层begin -->
<div class="flowDiv1_4" id="mergerSureDivId" style="display:none">
  <div class="f3tit"><h1>${licenseName }-${playName } 合买方案</h1>    <div class="cls"><a href="javascript:void 0" id="closeMergerSureDivId">x</a></div></div>
    <div class="clear"></div>
   <div class="fanganbox">
     <table width="704" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
       <tr>
         <td width="89" height="64" rowspan="2"  align="center" class="hemai3">方案信息</td>
		  <td width="51" height="31" align="center" class="hemai4">玩法</td>
		  <td width="62" align="center" class="hemai4">注数 </td>
		  <td width="56" align="center" class="hemai4">倍数 </td>
		  <td width="87" align="center" class="hemai4">总金额 </td>
		  <td width="77" align="center" class="hemai4">每份</td>
		  <td width="137" align="center" class="hemai4">保底 </td>
		  <td width="49" align="center" class="hemai4">提成 </td>
		  <td width="90" align="center" class="hemai4">保密类型</td>
		  </tr>
       <tr id="mergerSureTitleTrId">
       	</tr>
	    <tr>
         <td width="84" height="210"  align="center" class="hemai3">投注内容</td>
		  <td width="615" height="210" colspan="8" align="center" class="hemai6">
		  <div class="touzxq">投注详情</div>
		  <div class="yincang1" id="mergerSureTbodyId">
		  </div>
		  </td
	   ></tr>
       <tr>
         <td width="84" height="48"  align="center" class="hemai3">认购信息</td>
		  <td width="615" height="48" colspan="8" align="center" class="hemai5">
		  <p id="mergerSureTotalMoneyId">您本次购买1份，保底1份，需消费¥ <span> 0 </span>元</p></td
	   ></tr>
    </table>
  </div>
  <div class="queren"><input type="button" id="mergerBuyBtnId" value="确定" class="btn3"/><input type="button" value="关闭" id="mergerCancelBtnId" class="btn4"/></div>
</div>
<!-- 合买确认弹出层end -->

<!-- 追号确认弹出层begin -->
<div class="flowDiv1_4" id="chasingSureDivId" style="display:none">
  <div class="f3tit"><h1>${licenseName }方案追号</h1>    <div class="cls"><a href="javascript:void 0" id="closeChasingSureDivId">x</a></div></div>
    <div class="clear"></div>
   <div class="fanganbox">
     <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
       <tr>
         <td width="84" height="63" rowspan="2"  align="center" class="sktit3">方案信息</td>
		  <td width="57" height="31" align="center" class="sktit4">玩法</td>
		  <td width="74" align="center" class="sktit4">追号期数</td>
		  <td width="95" align="center" class="sktit4">开始期号</td>
		  <td width="90" align="center" class="sktit4">单期注数</td>
		  <td width="88" align="center" class="sktit4">追加</td>
		  <td width="97" align="center" class="sktit4">追号总金额</td>
		  <td width="109" align="center" class="sktit4">中奖后自动终止</td>
		  </tr>
       <tr id="chasingTitleSureId">
       		<td height="31" align="center" class="sktit4">复式追号 </td>
       		<td height="31" align="center" class="sktit4">2 </td>
       		<td height="31" align="center" class="sktit4">15022 </td>
       		<td height="31" align="center" class="sktit4">每期1注</td>
       		<td height="31" align="center" class="sktit4">否</td>
       		<td height="31" align="center" class="sktit4">¥  <span>4</span> 元</td>
       		<td height="31" align="center" class="sktit4">单期奖金≥<span>1000</span>元</td>
       		</tr>
	          <tr>
         <td width="84" height="111"  align="center" class="sktit3">方案信息</td>
		  <td width="615" height="111" colspan="7" align="center" class="sktit5"><div class="yincang" id="chasingSureBetListId">
		  </div></td
	   ></tr>
       <tr>
         <td width="84" height="48"  align="center" class="sktit3">方案信息</td>
		  <td width="615" height="48" colspan="7" align="center" class="sktit5"><p>您本次购买需消费 ¥  <span id="chasingTotalSureMoneyId">2 </span>元</p></td
	   ></tr>
    </table>
  </div>
  <div class="queren"><input type="button" value="确认投注" class="btn2" id="chasingFrmBtnId"/><a href="javascript:void 0" id="chasingReturnId">返回修改≥</a></div>
</div>
<!-- 追号确认弹出层end -->

<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<c:if test="${licenseId < 100 }">
<script type="text/javascript" src="/js/chasing/noFreqComm.js" ></script>
</c:if>
<script type="text/javascript" >
// 合买事件
var hem = new Hemai();
$(document).ready(function () {
	// 合买事件begin
	// 合买表单提交
	$("#mergerBuyBtnId").click(function(){
		hem.submitForm();
	});
	// 确认合买页
	$("#lotteryFormBtnId").click(function(){
		var opt = $("input[name=buyType]:checked").val();
		if ( opt == "3" ) {
			var baodi = 0;
			var totalNum = parseInt($("#totalBetMoneyId").html());
			var buyNum = parseInt($("#offerBuyId").val());
			var o = $("input[name=baodiType][type=radio]:checked").val();
			if ( o == "2" ) {
				baodi = totalNum - buyNum;
			} else if ( o == "3" ) {
				baodi = parseInt($("#partBaoInputId").val());
			} 
			var playName = $("#licenseNameId").val();
			if ( $("#playNameId").length > 0 ) {
				playName = $("#playNameId").val();
			}
			var baseM = 2;
			if ( $("#zjBoxId").length > 0 && $("#zjBoxId").attr("checked") ) {
				baseM = 3;
			}
			$("#mergerSureTitleTrId").html('<td height="31" align="center" class="hemai4">'+playName+'  </td>'+
		       		'<td height="31" align="center" class="hemai4">'+parseInt($("#totalBetMoneyId").html())/baseM/parseInt($("#multipleId").val())+'   </td>'+
		       		'<td height="31" align="center" class="hemai4">'+$("#multipleId").val()+'倍 </td>'+
		       		'<td height="31" align="center" class="hemai4"> ¥  '+$("#totalBetMoneyId").html()+'元 </td>'+
		       		'<td height="31" align="center" class="hemai4">¥  1.00 元 </td>'+
		       		'<td height="31" align="center" class="hemai4"> ¥  '+baodi+' 元('+parseInt(baodi/totalNum*100)+'%) </td>'+
		       		'<td height="31" align="center" class="hemai4">'+parseFloat($("#brokerageId").val())*100+'% </td>'+
					'<td height="31" align="center" class="hemai4">'+$("input[name=showLevel][type=radio]:checked").attr("show")+'</td>');
			$("#mergerSureTotalMoneyId").html('您本次购买'+buyNum+'份，保底'+baodi+'份，需消费¥ <span> '+$("#totalHmMoneyId").html()+' </span>元');
			// 投注数据填充
			$("#mergerSureTbodyId").empty();
			$("#betListAreaId").children().each(function(){
				$("<p>"+$(this).attr("betcode")+"</p>").appendTo($("#mergerSureTbodyId"));
			});
			// 合买确认弹出层
			$.blockUI({
				message: $("#mergerSureDivId"),
				css: {
					width: '612px',
					height: '520px',
					left: ($(window).width() - 618) / 2 + 'px',
					top: 50 + 'px',
					border: 'none',
					cursor:'default'
				}
			});
			//hem.submitForm();
		} else {
			return false;
		}
		
	});
	
	// 总份数设置begin
	/*$("#totalHemaiNumId").blur(function(){
		hem.getUnitPrice();
	});
	$("#totalHemaiNumId").keyup(function(){
		hem.getUnitPrice();
	});*/
	// 总份数设置end
	// 发起人认购设置begin
	/*$("#offerBuyId").blur(function(){
		hem.offerBuy();
		hem.calcOrderMoney();
	});*/
	$("#offerBuyId").keyup(function(){
		if ( $(this).val() != '' ) {
			hem.offerBuy();
			hem.calcOrderMoney();
		}
	});
	// 发起人认购设置end
	// 保底设置begin
	// 保底类型选择
	$("input[name=baodiType][type=radio]").click(function(){
		var v = $(this).val();
		switch( v ) {
		case "1":
			$("#baoFullMoneyId").html(0);
			$("#baoFullPerId").html(0);
			$("#partBaoInputId").val(0);
			$("#baoPartMoneyId").html(0);
			$("#baoPartPerId").html(0);
			$("#partBaoInputId").attr("disabled","disabled");
			break;
		case "2":// 全额保底
			$("#partBaoInputId").val(0);
			$("#baoPartMoneyId").html(0);
			$("#baoPartPerId").html(0);
			$("#partBaoInputId").attr("disabled","disabled");
			
			var totalNum = parseInt($("#totalBetMoneyId").html());
			var buyNum = parseInt($("#offerBuyId").val());
			var insNum = totalNum - buyNum;
			// 显示比例和支付金额
			$("#baoFullMoneyId").html(insNum);
			$("#baoFullPerId").html(parseInt(insNum/totalNum*100));
			break;
		case "3"://	部分保底
			$("#baoFullMoneyId").html(0);
			$("#baoFullPerId").html(0);

			$("#partBaoInputId").removeAttr("disabled");
			break;
		}
		hem.calcOrderMoney();
	});
	// 部分保底设置事件
	$("#partBaoInputId").keyup(function(event){
		if ( isNaN($(this).val()) ) {
			$(this).val(1);
		}
		var v = $(this).val();
		var totalNum = parseInt($("#totalBetMoneyId").html());
		// 显示比例和支付金额
		$("#baoPartMoneyId").html(v);
		$("#baoPartPerId").html(parseInt(v/totalNum*100));
		hem.calcOrderMoney();
	});
	$("#offerBaoDiId").keyup(function(){
		if ( $(this).val() != '' ) {
			hem.setBaoDi();
			hem.calcOrderMoney();
		}
	});
	// 保底设置end
	
	// 合买事件end
	$("#closeDivBtnId,#closeMergerSureDivId,#mergerCancelBtnId").click(function(){
		$.unblockUI();
	});
	$("#gobackBtnId").click(function(){
		$.unblockUI();
	});
	$("#numberBuyBtnId").click(function(){
		if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "2" || $("input[name=buyChasName]:checked").val() == "3") ) {
			chasingFormSubmit();
		} else if ( ($("input[name=buyChasName]").length > 0) && ($("input[name=buyChasName]:checked").val() == "4" ) ) {
			$("#mergerBuyFormId").find("input[name=issue]").val($("#currentIssueId").html());
			hem.submitForm();
		}else {
			formSubmit();
		}
		$.unblockUI();
	});
	$("#radomSelDsId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#radomSelDsId").keyup(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			try{
				if ( parseInt($(this).val()) > 500 ) {
					popupConfirm("温馨提示","最大机选500注");
					$(this).val(500);
					return false;
				}
			} catch ( ex ){}
			return true;
		} else {
			return false;
		}
	});
	// 倍数统一事件
	$("#multipleId").blur(function(){
		var val = $(this).val();
		if ( isNaN(val) || parseInt(val) < 1 || val == '') {
			$(this).val(1);
			calculteAll();
		}
	});
});

// 计算总投注金额（包括追号）
function calcTotalBetMoney() {
	var base = parseInt($("#totalBetNumId").html());
	var totalM = 0;
	var tos = 2;
	if ( $("#licenseId").val() == "4" && $("#zjBoxId").attr("checked") ) {
		tos = 3;
	}
	$("#chasingIssListId").children().each(function(index){
		if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
			totalM += base * parseInt($(this).find("input[type=text]").val()) * tos;
		}
	});
	$("#totalCBetMoneyId").html(totalM);
}
function showSureDiv() {
	$.blockUI({
		message: $("#sureBuyDivId"),
		css: {
			width: '612px',
			height: '520px',
			left: ($(window).width() - 718) / 2 + 'px',
			top: 50 + 'px',
			border: 'none',
			cursor:'default'
		}
	});
}
</script>