//提示合买说明
$(document).ready(function (){
	var tipsLayer;
	
	var tipsInformation = '方案发起人承诺在合买截止时，如果方案还没有满员，发起人再投入先前承诺的资金以最大限度满足方案成交。' + '</br>'
		+'具体可分为三种情况：' + '</br>'
		+'1、如果保底资金正好等于未满员所缺资金，方案发起成功，无需返还；' + '</br>'
		+'2、如果保底资金大于未满员所缺资金，方案发起成功；系统将返还多余的保底金额到发起人的支付账户；' + '</br>'
		+'3、如果保底资金小于未满员所缺资金，合买方案流产，保底资金将全部返还到发起人的支付账户。 ' + '</br>'
		+'</br>'
		+'比如：一个100元的合买方案，保底40，彩票销售截止时，' + '</br>'
		+'如果参与合买总金额为60，因为保底40，所以60+40=100，正好合买成功；' + '</br>'
		+'如果参与合买总金额为80，离方案满员差20（100-80=20），所以必须动用保底40元中的20元，方案成功，保底剩下20元退回发起人账户；' + '</br>'
		+'如果参与合买总金额≤40，则参与金额加上保底40都不满100元，所以合买失败。';
	
	var brokerTipsInformation = '所有彩种合买的单式和复式均可设置0-10%的提成比例，合买提成比例由发起人自定义设置。'+'</br>'
	+'提成金额计算公式：提成金额=（税后奖金-方案本金）×提成比例'+'</br>'
	+'合买方案在盈利的情况下，发起人有中奖提成；'+'</br>'
	+'合买方案不盈利，发起人无中奖提成.'+'</br>'
	+'</br>'
	+'示例：合买方案为1000元，发起人设定提成比例为10%，开奖后方案中奖金额为1100元，提成金额 =（1100-1000） * 10% = 10元；'+'</br>'
	+'如开奖后方案中奖金额为900元，则发起人无方案提成。';
	
	var endChasingTips = '如果您勾选“累计奖金 ≥   X   元 终止追号（X≥0）”，只要方案中该期的中奖金额≥您设置的金额，后续的所有追号将被撤销，追号资金将返还到您的购彩平台账户；' + '</br>'
		+ '如果您的中奖金额小于设置的金额，追号将继续进行，只有当多期奖金累计≥您设置的金额后，追号才会终止，被撤销的追号订单资金将返还到您的购彩平台账户；' + '</br>'
		+ '如果您不勾选追号设置中“中奖终止追号”功能，中奖后，系统将继续执行后期的追号。';
	
	$('a[name=insTips]').on('mouseover', function(){
		tipsLayer = layer.tips(tipsInformation, this, {
	        guide: 1,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:620
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});
	
	$('a[name=brokerTips]').on('mouseover', function(){
		tipsLayer = layer.tips(brokerTipsInformation, this, {
	        guide: 1,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:550
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});
	
	$('a[name=tips]').on('mouseover', function(){
		tipsLayer = layer.tips('在比赛截止时间30分钟以内（含30分钟），该方案的已认购份数加方案保底份数之和仍未满员 ，则系统按合买方案流单处理。', this, {
	        guide: 1,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:350
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});	
	
	$('a[name=tipsInBetBuy]').click(function(){
		//alert("123");
		$.layer({
		    type: 1,
		    shade: [0],
		    area: ['auto', 'auto'],
		    title: false,
		    border: [0],
		    page: {dom : '.layer_notice'}
		});
	});
	/*$('a[name=tipsInBetBuy]').on('mouseover', function(){
		tipsLayer = layer.tips('在比赛截止时间30分钟以内（含30分钟），该方案的已认购份数加方案保底份数之和仍未满员 ，则系统按合买方案流单处理。', this, {
	        guide: 3,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:350
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});*/
	
	$('a[name=tipsOfEndChasing]').on('mouseover', function(){
		tipsLayer = layer.tips(endChasingTips, this, {
	        guide: 1,
	        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
	        maxWidth:350
	        //closeBtn:[0, true]
	    });
	}).on('mouseout',function(){
		layer.close(tipsLayer);
	});
})