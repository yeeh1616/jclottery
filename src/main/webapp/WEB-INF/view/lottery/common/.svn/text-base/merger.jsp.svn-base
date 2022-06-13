<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
$(document).ready(function () {
	$("#copyCheckId").click(function(){
		if($(this).prop("checked") ) {
			$("input[name=reserved15]").val("1");
			$("#noticeUlId").show();
		} else {
			$("input[name=reserved15]").val("2");
			$("#noticeUlId").hide();
		}
	});
	$("#copyNoticeId").blur(function(){
		$("input[name=reserved20]").val($(this).val());
	});
	$("#buyBrokerageId").change(function(){
		$("input[name=reserved16]").val($(this).val());
	});
	$('a[name=copytips]').on('mouseover', function(){
		tipsLayer = layer.tips('成功出票后，跟单大厅中会显示您的订单，其他彩民可以复制该订单的投注选项重新选择倍数进行投注。<br>'+
				'复制的订单的选项内容在开奖后跟单人方可查看，方案盈利后，您享有盈利10%的佣金，代购与合买的单子均可被复制。', this, {
	        guide: 1,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:350
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});	
});
</script>
<div class="tz_titile">
  <span>购买形式</span>
</div>
<div class="w_hm">
<div class="w_gmxs">
<ul>
    复制推广：
      <input id="copyCheckId" name="copyCheck" type="checkbox" value="1" />
       允许他人复制<font color=gray>（中奖可得复制方案奖金<font color=red>
       <select id="buyBrokerageId">
          	  <option value="0.00">0</option>
              <option value="0.01">1</option>
              <option value="0.02">2</option>
              <option value="0.03">3</option>
              <option value="0.04">4</option>
              <option value="0.05">5</option>
              <option value="0.06">6</option>
              <option value="0.07">7</option>
              <option value="0.08">8</option>
              <option value="0.09">9</option>
              <option value="0.10" selected = "selected">10</option>
        </select>
       %</font>的佣金）</font>
       <a name ="copytips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a>
</ul>
<ul id="noticeUlId" style="display:none;">
    复制宣言<img src="/images/new.gif" width="18" height="18">：
      <input id="copyNoticeId" type="text" value="" size="50" />
      
</ul>
</div>
<div class="w_gmxs">
  <ul>
    <li>请选择方式：</li>
    <li >
      <input name="buyType" type="radio" value="1" checked/>
      代购 </li>
 <li id="chaseSetBtnId" style="display:none">
      <input name="buyType" type="radio" value="2" />
      追号 </li>
    <li>
      <input type="radio" name="buyType" value="3"/>
      合买<a href="javascript:void 0" class="w_djt"></a></li>
      <li><a name ="tips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></li>
    <div class="clear"></div>
  </ul>
</div>

<jsp:include page="./chase.jsp"></jsp:include>

<table border="0" cellpadding="0" cellspacing="0" class="w_hm_b" width="100%" id="mergerPanelId" style="display:none">
  <tr>
    <td width="13%" height="94" class="left_p">方案描述</td>
    <td width="87%"><div class="wenbeny">
        <input type="text" value="大奖就在眼前不要错过哦！" id="partDetailId"/>
      </div>
      <span class="w_ms fl">(描述最多200字)</span>
      <div class="clear"></div></td>
  </tr>
  <tr>
    <td height="43" class="left_p">已被分成</td>
    <td><div class="w_fencheng fl"><span class="w_red" id="totalHemaiNumId">10 </span>份，每份<span class="w_red"> 1</span> 元 <span>（认购金额至少为总金额的1%，且为整数）</span></div></td>
  </tr>
  <tr>
    <td height="45" class="left_p">我要认购</td>
    <td><div class="w_fencheng fl">
        <input type="text" value="0" class="w_rgtx" id="offerBuyId">
        份，所占比例<span class="w_red" id="offerBMId"> 0 </span>% <span>（认购金额只能是整数）</span></div></td>
  </tr>
  <tr>
    <td height="98" class="left_p">是否保底</td>
    <td><div class="w_fencheng fl">
        <ul>
          <li>
            <input type="radio" name="baodiType" checked value="1"/>
            无保底</li>
          <li>
            <input type="radio" name="baodiType" value="2"/>
            全额保底，所占比例<span class="w_red" id="baoFullPerId"> 0</span> %，需支付<span class="w_red" id="baoFullMoneyId"> 0</span>元 保底说明<a name ="insTips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></li>
         
<li>
            <input type="radio" name="baodiType" value="3"/>
            部分保底
            <input type="text" value="1" class="w_rgtx" id="partBaoInputId">
            份，所占比例<span class="w_red" id="baoPartPerId"> 0</span> %，需支付 ¥<span class="w_red" id="baoPartMoneyId"> 0</span> 元 </li>
        </ul>
      </div></td>
  </tr>
  <tr>
    <td height="46" class="left_p">我要提成</td>
    <td><div class="wenbeny">税后奖金的
        <select id="brokerageId">
          	  <option value="0.00">无</option>
              <option value="0.01">1%</option>
              <option value="0.02">2%</option>
              <option value="0.03">3%</option>
              <option value="0.04">4%</option>
              <option value="0.05">5%</option>
              <option value="0.06">6%</option>
              <option value="0.07">7%</option>
              <option value="0.08">8%</option>
              <option value="0.09">9%</option>
              <option value="0.10">10%</option>
        </select>
        提成说明<a name ="brokerTips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></div></td>
  </tr>
  <tr>
    <td height="45" class="left_p">保密类型</td>
    <td><div class="w_gkan">
        <ul>
          <li>
            <input type="radio" checked name="showLevel" value="1" show="公开"/>
            公开</li>
          <li>
            <input type="radio" name="showLevel" value="4" show="截至后公开"/>
            截至后公开</li>
          <li>
            <input type="radio" name="showLevel" value="2" show="仅对跟单者公开"/>
            仅对跟单者公开</li>
          <li>
            <input type="radio" name="showLevel" value="3" show="永久保密"/>
            永久保密</li>
          <div class="clear"></div>
        </ul>
      </div></td>
  </tr>
  <tr>
    <td height="41" class="left_p">支付信息</td>
    <td><div class="w_fencheng fl">此次交易您需支付 ¥<span class="w_red" id="totalHmMoneyId">0</span>元</div></td>
  </tr>
</table>
</div>
<script type="text/javascript" src="/js/common/tips.js"></script>
<script type="text/javascript" >
// 合买事件
$(document).ready(function () {
	$("#offerBuyId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
});
</script>