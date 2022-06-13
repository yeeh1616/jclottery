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
        	<p class="qycodrbp1"><span class="qycodrbp1a">最新开奖</span><a href="#">更多>></a></p>
            <div class="qycodrba">
            	<ul class="qycodrbaul">
                	<li class="qycodrba2">期号</li>
                	<li class="qycodrba2">奖号</li>
                </ul>
                <div id="kjListAreaId"></div>
            	
            </div>
        </div>
        <!--右2最新开奖结束-->
        
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
                        	<span class="qycodrdea">${hcno.tenThousandHeatNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenThousandHeatNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenThousandHeatNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenThousandHeatNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenThousandHeatNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenThousandHeatNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcb"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.thousandHeatNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.thousandHeatNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.thousandHeatNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.thousandHeatNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.thousandHeatNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.thousandHeatNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.hundredHeatNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.hundredHeatNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.hundredHeatNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.hundredHeatNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.hundredHeatNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.hundredHeatNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcd"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenHeatNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenHeatNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenHeatNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenHeatNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenHeatNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenHeatNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdce"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.bitsHeatNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.bitsHeatNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.bitsHeatNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.bitsHeatNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.bitsHeatNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.bitsHeatNO2.time}次</span>
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
                        	<span class="qycodrdea">${hcno.tenThousandColdNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenThousandColdNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenThousandColdNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenThousandColdNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenThousandColdNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenThousandColdNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcb"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.thousandColdNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.thousandColdNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.thousandColdNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.thousandColdNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.thousandColdNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.thousandColdNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcc"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.hundredColdNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.hundredColdNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.hundredColdNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.hundredColdNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.hundredColdNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.hundredColdNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdcd"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenColdNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenColdNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenColdNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.tenColdNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.tenColdNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.tenColdNO2.time}次</span>
                        </p>
                    </div>
                </div>
                <div class="qycodrdb">
                	<div class="qycodrdce"></div>
                	<div class="qycodrdd">
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.bitsColdNO1.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.bitsColdNO1.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.bitsColdNO1.time}次</span>
                        </p>
                    	<p class="qycodrde">
                        	<span class="qycodrdea">${hcno.bitsColdNO2.code}</span>
                            <span class="qycodrdeb"><span style="width:${1.1*hcno.bitsColdNO2.time}px;" class="qycodrdeba"></span></span>
                            <span class="qycodrdec">${hcno.bitsColdNO2.time}次</span>
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