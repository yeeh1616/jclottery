<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>颜色前二直选</title>

<script>
</script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/luckyracing/ysq2.js"></script>
<jsp:include page="./ysheader.jsp"></jsp:include>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
        	<div class="qycodlaTit">
            	<span>玩法提示：预测12辆赛车中按顺序获得前两名的赛车颜色，单注最高奖金限额为<em class="red">470</em>元</span>
                <s class="qycodlaw" data-help="<h5>示例</h5>投注：01 02<br>以下结果皆为中奖:<br> A：冠军01 <br>B：冠军02<br>"></s>
            </div>
            <div class="qycodlBut"><!--<a href="#">近期走势</a>--><a style="cursor:pointer;">开奖视频</a></div>
            <div class="stv">
            <iframe id="showvideo" width="100%" height="600" src="/lottery/luckyracing/video.jhtml">	</iframe>  
            </div>
            <div class="qycondlCon">
            	<div class="qeConl">
                	<span class="qecondlCons2">冠军颜色</span>
                	<span class="qecondlCons1">当前遗漏</span>
                	<span class="qecondlCons2">亚军颜色</span>
                	<span class="qecondlCons1">当前遗漏</span>
                </div>
                <ul class="qecondlConr" id="line1AreaId">
                	<li>
                        <p class="qecondlConrp1 qep2a"><span class="qecondlConrp2a" bet="A" bet2="红色"><span>红色</span><span>01 02</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2b"><span class="qecondlConrp2a" bet="B" bet2="蓝色"><span>蓝色</span><span>03 04</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2c"><span class="qecondlConrp2a" bet="C" bet2="绿色"><span>绿色</span><span>05 06</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2d"><span class="qecondlConrp2a" bet="D" bet2="黄色"><span>黄色</span><span>07 08</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2e"><span class="qecondlConrp2a" bet="E" bet2="银色"><span>银色</span><span>09 10</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2f"><span class="qecondlConrp2a" bet="F" bet2="紫色"><span>紫色</span><span>11 12</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                </ul>
                <ul class="qecondlConr" id="line2AreaId">
                	<li>
                        <p class="qecondlConrp1 qep2a"><span class="qecondlConrp2a" bet="A" bet2="红色"><span>红色</span><span>01 02</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2b"><span class="qecondlConrp2a" bet="B" bet2="蓝色"><span>蓝色</span><span>03 04</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2c"><span class="qecondlConrp2a" bet="C" bet2="绿色"><span>绿色</span><span>05 06</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2d"><span class="qecondlConrp2a" bet="D" bet2="黄色"><span>黄色</span><span>07 08</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2e"><span class="qecondlConrp2a" bet="E" bet2="银色"><span>银色</span><span>09 10</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                	<li>
                        <p class="qecondlConrp1 qep2f"><span class="qecondlConrp2a" bet="F" bet2="紫色"><span>紫色</span><span>11 12</span></span></p>
                    	<p class="qecondlConrp3">19</p>
                    </li>
                </ul>
            </div>
        </div>
		<%-- <jsp:include page="./left.jsp"></jsp:include> --%>
    </div>
    <!--左侧结束-->
    <jsp:include page="./right.jsp"></jsp:include>
</div>

<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>