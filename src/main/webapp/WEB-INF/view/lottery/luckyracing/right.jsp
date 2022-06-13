<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
$(document).ready(function(){
	$('.qycodlBut').click(function(){
		var d = $('.stv').css('display');
		if(d=='none'){
			$('.stv').show();
			//$('#showvideo').attr("src","http://sc.cpdyj.com/html/live5s.swf")
		}else{
			$('.stv').hide();
		}
	});
});
</script>
<div class="qycodr">
		<!--<div class="qycodra">
			<p class="qycodrap1">幸运赛车视频开奖<span class="qycodrap2">第<span class="redb">14070766</span>期等待开奖</span></p>
            <p class="qycodrap3"><img src="/images/tv.gif" /></p>
            <p class="qycodrap4">幸运赛车公告</p>
            <p class="qycodrap5">
            	<a href="">• 幸运赛车600万大派奖 奖金增长30%</a>
				<a href="">• 关于"幸运赛车"恢复销售的公告</a>
            </p>
        </div>-->
        <!--右1视频开奖结束-->
        
        <div class="qycodrb">
        	<p class="qycodrbp1"><span class="qycodrbp1a">最新开奖</span><a href="/lottery/index.jhtml?licenseId=102&p=lskj">更多>></a></p>
            <div class="qycodrba">
            	<ul class="qycodrbaul">
                	<li class="qycodrba2">期号</li>
                	<li class="qycodrba3"><span class="qycodrbaula">冠</span></li>
                	<li class="qycodrba3"><span class="qycodrbaulb">亚</span></li>
                	<li class="qycodrba3"><span class="qycodrbaulc">季</span></li>
                </ul>
                <div id="kjListAreaId"></div>
            	
            </div>
        </div>
        <!--右2最新开奖结束-->
        <!--
        <div class="qycodrc">
        	<p class="qycodrbp1"><span class="qycodrbp1a">当前遗漏</span><a href="#">更多>></a></p>
            <div class="qycodrca">
            	<ol>
                	<li>前一遗漏</li>
                	<li class="qycodrcaollia">前二遗漏</li>
                	<li class="qycodrcaollia">前三遗漏</li>
                </ol>
            	<ul class="qycodrcolor">
                	<li>号码</li>
                	<li>未开期数</li>
                	<li>操作</li>
                </ul>
            	<ul>
                	<li>20:06</li>
                	<li>14070767</li>
                	<li class="qycodrcolora">投注</li>
                </ul>
            </div>
        </div>-->
        <!--右3当前遗漏结束-->
        
        <div class="qycodrd">
        	<p class="qycodrbp1"><span class="qycodrbp1a">冷热分析</span><a href="#">更多>></a></p>
            <div class="qycodrda">
            	<ol>
                	<li id="hotcoldAnalysis_hot">热号分析</li>
                	<li id="hotcoldAnalysis_cold" class="qycodrcaollia">冷号分析</li>
                </ol>
            	<div class="qycodrdcolor">近100期号码统计</div>
            	<div id="hcAnalysisdiv_hot">
            	<div class="qycodrdb">
                	<div class="qycodrdc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatChampionNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatChampionNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatChampionNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatChampionNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatChampionNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatChampionNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcb"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatSecondplaceNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatSecondplaceNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatSecondplaceNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatSecondplaceNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatSecondplaceNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatSecondplaceNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatRunnerupNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatRunnerupNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatRunnerupNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.heatRunnerupNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.heatRunnerupNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.heatRunnerupNO2.time}次</span>
                        </p>
                    </div>
                </div>
                </div>
                <!-- 冷号区 开始-->
                <div id="hcAnalysisdiv_cold" style="display: none;">
            	<div class="qycodrdb">
                	<div class="qycodrdc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldChampionNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldChampionNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldChampionNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldChampionNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldChampionNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldChampionNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcb"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldSecondplaceNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldSecondplaceNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldSecondplaceNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldSecondplaceNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldSecondplaceNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldSecondplaceNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldRunnerupNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldRunnerupNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldRunnerupNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.coldRunnerupNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.coldRunnerupNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.coldRunnerupNO2.time}次</span>
                        </p>
                    </div>
                </div>
                </div>
                <!-- 冷号区 结束-->
            </div>
        </div>
        <!--右4冷热分析结束-->
        <!--
        <div class="qycodre">
        	<p class="qycodrbp1"><span class="qycodrbp1a">中奖排行榜</span><a href="#">更多>></a></p>
            <div class="qycodrce">
            	<ol>
                	<li>今日</li>
                	<li class="qycodrcaollia">昨日</li>
                	<li class="qycodrcaollia">七天</li>
                	<li class="qycodrcaollia">月榜</li>
                </ol>
            	<ul>
                	<li><div class="qycodrcea">1</div></li>
                	<li><span class="qycodrcecorlor">14070767</span></li>
                	<li class="redc">110612.4</li>
                </ul>
            </div>
        </div>-->
        <!--右5中奖排行榜结束-->
        
        <div class="qyService">
        	<p class="qyServicea">7×24小时服务热线</p>
            <p class="qyServiceb">400-110-3310</p>
        </div>
        <!--右6服务热线结束-->
        
    </div>