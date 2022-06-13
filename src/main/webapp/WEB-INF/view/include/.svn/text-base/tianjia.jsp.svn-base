<%@ page language="java" pageEncoding="UTF-8"%>

<div class="tianjia">
	<div class="caizhong_s">
		<div class="caizhong_s_t">
			<div class="caizhong_s_tl fl">
				双色球图表走势
			</div>
			<a href="/chart/index.jhtml" class="caizhong_s_tr fr">更多</a>
			<div class="clear"></div>
		</div>
		<div class="caizhong_s_c">
			<ul>
				<li>
					<a href="/chart/index.jhtml" class="current">综合走势</a><a
						href="/chart/index.jhtml">综合走势</a><a href="/chart/index.jhtml">综合走势</a>
				</li>
				<li>
					<a href="/chart/index.jhtml">综合走势</a><a href="/chart/ssq_hq.jhtml">红球走势</a><a
						href="/chart/ssq_lq.jhtml">篮球走势</a>
				</li>
				<li>
					<a href="#">和值走势</a><a href="#">分区走势</a><a href="#">大小走势</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="caizhong_s">
		<div class="caizhong_s_t">
			<div class="caizhong_s_tl fl">
				中奖播报
			</div>
			<a href="#" class="caizhong_s_tr fr"></a>
			<div class="clear"></div>
		</div>
		<div class="caizhong_s_c">
			<ul id="dds">
			</ul>
		</div>
	</div>
	<div class="caizhong_s no_bottom">
		<div class="caizhong_s_t">
			<div class="caizhong_s_tl fl">
				帮助中心
			</div>
			<a href="/help/help_center/help-shouye.html" class="caizhong_s_tr fr">更多</a>
			<div class="clear"></div>
		</div>
		<div class="caizhong_s_c">
			<ul>
            	<li><a href="one-zhucewenti/zhucewenti-answer/one-zcwt.html">如何注册？</a></li>
                <li><a href="nine-ofen/ofen-answer/one-ofen.html">如何使用营业厅临时帐户？</a></li>
                <li><a href="two-chongzhiwenti/chongzhiwenti-answer/one-chzwt.html">凤凰微彩支持哪些充值方式？</a></li>
                <li><a href="three-wdzh/three-zhmm.html">忘记用户名怎么办？ </a></li>
                <li><a href="five-tixian/two-lingqu.html">中奖后怎么兑奖？</a></li>
                <li><a href="five-tixian/six-lingqu.html">中奖奖金如何扣税？</a></li>
				<li><a href="five-tixian/two-tikuan.html">中奖后如何提款？</a></li>
            </ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://collection.${enName}.com/homePage/bonus.do?storeId=${domain.storeId }"></script>
<script type="text/javascript">
$(document).ready(function (){
	try {
		var json =  bonusNewests;
		var dtlist = '';
    	$.each(json,function(index,val){
			dtlist += '<li><a href="#">'+val["userName"]+"&nbsp;["+val["gameName"]+']&nbsp;<span>'+val["bonus"]+'元</span> </a></li>';
		});
		$('#dds').html(dtlist);
	} catch ( ex ) {}

});
</script>