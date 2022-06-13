<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="前一-幸运赛车" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/luckyracing/q1.js"></script>
<div class="qyta">
	<div class="qytab"><span class="qybut1"><p class="qyc3">前一</p><p class="qyc4">猜冠军</p></span></div>
    <div class="qytac"><a href="/lottery/index.jhtml?licenseId=102&p=hmzs">号码走势</a> ｜ <a href="/lottery/index.jhtml?licenseId=102&p=ylsj">遗漏走势</a> ｜ <a href="/playerintro/xysc.jhtml">玩法介绍</a></div>
</div>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
        	<div class="qycodlaTit">
            	<span>玩法提示：猜中当期比赛冠军即为中奖,根据奖金对照表派奖,单注浮动奖金最高可获<em class="red">110</em>元</span>
                <s class="qycodlaw" data-help="<h5>示例</h5>投注：01 02<br>以下结果皆为中奖:<br> A：冠军01 <br>B：冠军02<br>"></s>
                <span class="qycodlaTitp1"><a href="#">当前奖金对照表</a></span>
            </div>
            <div class="qycodlBut"><!--<a href="#">近期走势</a>--><a style="cursor:pointer;">开奖视频</a></div>
            <div class="stv">
            <iframe id="showvideo" width="100%" height="600" src="/lottery/luckyracing/video.jhtml">	</iframe> 
            </div>
            <div class="qycondlCon">
            	<div class="qycondlConl">
                	<span class="qycondlCons1">当前奖金</span>
                	<span class="qycondlCons2">选择号码</span>
                	<span class="qycondlCons1">当前遗漏</span>
                	<span class="qycondlCons1">平均遗漏</span>
                	<span class="qycondlCons1">最大遗漏</span>
                </div>
                <ul class="qycondlConr">
                	<li>
                    	<p id="@c01" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2a"><span class="qycondlConrp2a">01</span></p>
                    	<p id="g01omit" class="qycondlConrp3">-</p>
                    	<p id="g01avgomit" class="qycondlConrp3">-</p>
                    	<p id="g01maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c02" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2b"><span class="qycondlConrp2a">02</span></p>
                    	<p id="g02omit" class="qycondlConrp3">-</p>
                    	<p id="g02avgomit" class="qycondlConrp3">-</p>
                    	<p id="g02maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c03" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2c"><span class="qycondlConrp2a">03</span></p>
                    	<p id="g03omit" class="qycondlConrp3">-</p>
                    	<p id="g03avgomit" class="qycondlConrp3">-</p>
                    	<p id="g03maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c04" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2d"><span class="qycondlConrp2a">04</span></p>
                    	<p id="g04omit" class="qycondlConrp3">-</p>
                    	<p id="g04avgomit" class="qycondlConrp3">-</p>
                    	<p id="g04maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c05" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2e"><span class="qycondlConrp2a">05</span></p>
                    	<p id="g05omit" class="qycondlConrp3">-</p>
                    	<p id="g05avgomit" class="qycondlConrp3">-</p>
                    	<p id="g05maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c06" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2f"><span class="qycondlConrp2a">06</span></p>
                    	<p id="g06omit" class="qycondlConrp3">-</p>
                    	<p id="g06avgomit" class="qycondlConrp3">-</p>
                    	<p id="g06maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c07" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2g"><span class="qycondlConrp2a">07</span></p>
                    	<p id="g07omit" class="qycondlConrp3">-</p>
                    	<p id="g07avgomit" class="qycondlConrp3">-</p>
                    	<p id="g07maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c08" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2h"><span class="qycondlConrp2a">08</span></p>
                    	<p id="g08omit" class="qycondlConrp3">-</p>
                    	<p id="g08avgomit" class="qycondlConrp3">-</p>
                    	<p id="g08maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c09" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2i"><span class="qycondlConrp2a">09</span></p>
                    	<p id="g09omit" class="qycondlConrp3">-</p>
                    	<p id="g09avgomit" class="qycondlConrp3">-</p>
                    	<p id="g09maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c10" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2j"><span class="qycondlConrp2a">10</span></p>
                    	<p id="g10omit" class="qycondlConrp3">-</p>
                    	<p id="g10avgomit" class="qycondlConrp3">-</p>
                    	<p id="g10maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c11" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2k"><span class="qycondlConrp2a">11</span></p>
                    	<p id="g11omit" class="qycondlConrp3">-</p>
                    	<p id="g11avgomit" class="qycondlConrp3">-</p>
                    	<p id="g11maxomit" class="qycondlConrp3">-</p>
                    </li>
                	<li>
                    	<p id="@c12" class="qycondlConrp1">-</p>
                        <p class="qycondlConrp2 qyp2l"><span class="qycondlConrp2a">12</span></p>
                    	<p id="g12omit" class="qycondlConrp3">-</p>
                    	<p id="g12avgomit" class="qycondlConrp3">-</p>
                    	<p id="g12maxomit" class="qycondlConrp3">-</p>
                    </li>
                </ul>
            </div>
        </div>
		<jsp:include page="./left.jsp"></jsp:include>        
    </div>
    <!--左侧结束-->
    <jsp:include page="./right.jsp"></jsp:include>
</div>

<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>