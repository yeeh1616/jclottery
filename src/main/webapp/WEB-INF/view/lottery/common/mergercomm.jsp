<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

<!-- 合买begin -->
<div class="con_l_c4_c1" name="mergerPanel" style="display:none">
		<div class="con_l_c4_c1_l con_l5">方案描述</div>
		<div class="con_l_c4_c1_r">
				<div class="con_l_c4_c1_r_l">
						<input type="text" value="大奖就在眼前，不要错过哦" id="partDetailId"/>
				</div>
				<div class="con_l_c4_c1_r_r">（描述最多200字）</div>
		</div>
</div>
<div class="con_l_c4_c2" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c2_l con_l5">已被分成</div>
	<div class="con_l_c4_c2_r"><span class="red1" id="totalHemaiNumId">0</span> 
	<span class="red2">份，每份</span><span class="red1"> 1 </span>
	<span class="red2">元</span>  （认购金额至少为总金额的1%，且为整数）</div>
</div>
<div class="con_l_c4_c3" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c3_l con_l5">我要认购</div>
	<div class="con_l_c4_c3_r">
		<input type="text" value="0" id="offerBuyId"/>
		<span class="red2">份，所占比例</span> 
		<span class="red1" id="offerBMId">0</span><span class="red2"> % </span> （认购金额只能是整数）
	</div>
</div>
<div class="con_l_c4_c4" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c4_l con_l5">是否保底</div>
	<div class="con_l_c4_c4_r">
		<li><input type="radio" name="baodiType" class="radio" checked value="1"/>无保底</li>
		<li><input type="radio" name="baodiType" class="radio" value="2"/>全额保底，所占比例
		 <span class="red1" id="baoFullPerId">0</span> %，需支付 <span class="red1" id="baoFullMoneyId">0 </span>元   
		     <span class="yangbb">保底说明<a name ="insTips" href=" javascript:void(0)" value="0" class="yangb_n"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></span></li>    
		<li><input type="radio" name="baodiType" class="radio" value="3"/>部分保底
		<input type="text" value="0" class="text" disabled id="partBaoInputId"/> 份，所占比例 
		<span class="red1" id="baoPartPerId">0</span> %，需支付 ¥ <span class="red1" id="baoPartMoneyId">0</span> 元</li>
	</div>
</div>
<div class="con_l_c4_c5" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c5_l con_l5">我要提成</div>
	<div class="con_l_c4_c5_r">税后奖金的
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
	<span class="yangbb">提成说明<a name ="brokerTips" href=" javascript:void(0)" value="0" class="yangb_n"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></span>
	</div>
</div>
<div class="con_l_c4_c6" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c6_l con_l5">保密类型</div>
	<div class="con_l_c4_c6_r">
		<input type="radio" class="radio" checked name="showLevel" value="1" show="公开"/><p>公开</p><input type="radio" class="radio" name="showLevel" value="4" show="截至后公开"/><p>截至后公开</p>
		<input type="radio" class="radio" name="showLevel" value="2" show="仅对跟单者公开"/> <p>仅对跟单者公开</p><input type="radio" class="radio" name="showLevel" value="3" show="永久保密"/><p>永久保密</p>
	</div>
</div>
<div class="con_l_c4_c7" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c7_l con_l5">支付信息</div>
	<div class="con_l_c4_c7_r">此次交易您需支付 ¥ <span class="red1" id="totalHmMoneyId">0 </span>元</div>
	<div class="clear"></div>
</div>
<!-- 合买end -->
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