/**
 * <p>Desc:购彩首页装载</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/5/21 Version 1.0
 */

$(document).ready(function () {
	var html = '';
	var jczcFlag = false;	// 竞彩，足彩标示
	var szFlag = false;	// 数字彩标示
	var freqFlag = false;	// 高频标示
	var fucaiFlag = false;//福彩标示
	for ( var i = 0; i < storeLicense.length; i++ ) {
		if ( storeLicense[i] > 4 && storeLicense[i] < 11 ) {
			jczcFlag = true;
		} else if ( storeLicense[i] < 5 ) {
			szFlag = true;
		} else if ( storeLicense[i] > 100 ) {
			freqFlag = true;
		} else if ( storeLicense[i] == 11 || storeLicense[i] == 12  || storeLicense[i] == 13 ) {//@Author ZhangHao
			fucaiFlag = true;
		}
	}
	if ( jczcFlag ) {
		html += '<div class="hall_title"><div class="title_name">体育竞技</div></div>'+
			'<div class="row"><ul>';
		for ( var i = 0; i < storeLicense.length; i++ ) {
			switch (  storeLicense[i] ) {
			case 9:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=9&p=hhgg">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="football-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">竞彩足球</span></h2>'+
			            '<p>返奖率高达73%,过关奖金固定！</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=9&p=hhgg" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=9&p=hhgg">多种玩法,中奖乐不停。</a></div>'+
			      '</li>';
				break;
			case 10:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=10&p=hhgg">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="basketball-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">竞彩篮球</span></h2>'+
			            '<p>返奖率高达73%,过关奖金固定！</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=10&p=hhgg" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=hhgg&p=sf">多种玩法,中奖乐不停。</a></div>'+
			      '</li>';
				break;
			case 5:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=5">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="shengf-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">胜负彩</span></h2>'+
			            '<p>单注最高奖金500万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=5" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=5">14场比赛猜胜负,奖金高达数百万！</a></div>'+
			      '</li>';
				break;
			case 6:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=6">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="ren9-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">任选九</span></h2>'+
			            '<p>单注最高奖金500万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=6" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=6">14场任猜九场！</a></div>'+
			      '</li>';
				break;
			case 7:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=7">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="halfball-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">半全场</span></h2>'+
			            '<p>老足彩,人气旺大奖500万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=7" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=7">每注2元,过关斩将赢大奖！</a></div>'+
			      '</li>';
				break;
			case 8:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=8">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="fball-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">4场进球</span></h2>'+
			            '<p>老足彩,人气旺大奖500万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=8" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=8">赛事丰富竞彩乐不停！</a></div>'+
			      '</li>';
				break;
			}
		}
		html += '<div class="clear"></div></ul></div>';
	}
	if ( szFlag ) {
		html += '<div class="hall_title"><div class="title_name">体彩</div></div>'+
			'<div class="row"><ul>';
		for ( var i = 0; i < storeLicense.length; i++ ) {
			switch (  storeLicense[i] ) {
			case 1:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=1">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="pai3-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">排列三</span></h2>'+
			            '<p>体彩3位数,轻松赢千元</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=1" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=1">彩民百注直选排三幸运收获头奖！</a></div>'+
			      '</li>';
				break;
			case 2:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=2">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="pai5-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">排列五</span></h2>'+
			            '<p>体彩5位数,奖金10万元</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=2" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=2">排列五高手霸气外露连夺头奖！</a></div>'+
			      '</li>';
				break;
			case 3:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=3">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="seven-star-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">七星彩</span></h2>'+
			            '<p>体彩七位数,大奖500万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=3" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=3">幸运彩民收获头奖,大额奖金抱回家！</a></div>'+
			      '</li>';
				break;
			case 4:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=4">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="big-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">大乐透</span></h2>'+
			            '<p>3元追加,大奖1600万</p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=4" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=4">亿元奖池给力,大乐透又爆千万头奖！</a></div>'+
			      '</li>';
				break;
		}
		}
		html += '<div class="clear"></div></ul></div>';
	}
	if ( freqFlag ) {
		html += '<div class="hall_title"><div class="title_name">高频彩</div></div>'+
			'<div class="row"><ul>';
		for ( var i = 0; i < storeLicense.length; i++ ) {
			switch (  storeLicense[i] ) {
			case 102:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=102">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="dj-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">幸运赛车</span></h2>'+
			            '<p></p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=102" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=102">彩民百注幸运收获头奖！</a></div>'+
			      '</li>';
				break;
			case 101:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=101">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="sc-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">11运夺金</span></h2>'+
			            '<p></p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=101" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=101">彩民百注幸运收获头奖！</a></div>'+
			      '</li>';
				break;
		}
		}
		html += '<div class="clear"></div></ul></div>';
	}
	/* 福彩彩种 @Author ZhangHao */
	if (fucaiFlag) {
		html += '<div class="hall_title"><div class="title_name">福彩</div></div><div class="row"><ul>';
		for ( var i = 0; i < storeLicense.length; i++ ) {
			switch (  storeLicense[i] ) {
			case 11:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=11">'+
			        '<div class="cz-info-wrapper"> '+
			        '<div class="ssq-logo fl"></div>'+
			          '<div class="cz-info fl">'+
			            '<h2><span class="cz-name ">双色球</span></h2>'+
			            '<p></p>'+
			          '</div>'+
			          '<div class="clear"></div>'+
			        '</div>'+
			        '</a>'+
			        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=11" target="_blank">立即购彩</a></div>'+
			        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=11">彩民百注幸运收获头奖！</a></div>'+
			      '</li>';
				break;
			case 12:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=12">'+
				      '<div class="cz-info-wrapper"> '+
				        '<div class="sd-logo fl"></div>'+
				          '<div class="cz-info fl">'+
				            '<h2><span class="cz-name ">福彩3D</span></h2>'+
				            '<p></p>'+
				          '</div>'+
				          '<div class="clear"></div>'+
				        '</div>'+
				        '</a>'+
				        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=12" target="_blank">立即购彩</a></div>'+
				        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=12">彩民百注幸运收获头奖！</a></div>'+
				      '</li>';
				break;
			case 13:
				html += '<li>'+
				      '<a href="/lottery/index.jhtml?licenseId=13">'+
				      '<div class="cz-info-wrapper"> '+
				        '<div class="ql-logo fl"></div>'+
				          '<div class="cz-info fl">'+
				            '<h2><span class="cz-name ">七乐彩</span></h2>'+
				            '<p></p>'+
				          '</div>'+
				          '<div class="clear"></div>'+
				        '</div>'+
				        '</a>'+
				        '<div class="tz"><a class="tz-button" href="/lottery/index.jhtml?licenseId=13" target="_blank">立即购彩</a></div>'+
				        '<div class="tc-txt-bottom"><a href="/lottery/index.jhtml?licenseId=13">彩民百注幸运收获头奖！</a></div>'+
				      '</li>';
				break;
		}
		}
		html += '<div class="clear"></div></ul></div>';
	}
	$(html).appendTo($("#haltAreaId"));
});
