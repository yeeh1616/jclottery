﻿<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="前二直选-幸运赛车" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>

<script>
</script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/luckyracing/q2zx.js"></script>
<jsp:include page="./q2header.jsp"></jsp:include>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
        	<div class="qycodlaTit">
            	<span>玩法提示：猜中当前期比赛冠亚军即为中奖,根据奖金对照表派奖,单注浮动奖金最高可获<em class="red">5000</em>元</span>
                <s class="qycodlaw" data-help="<h5>示例</h5>投注：01 02<br>以下结果皆为中奖:<br> A：冠军01 <br>B：冠军02<br>"></s>
                <span class="qycodlaTitp1"><a href="#">当前奖金对照表</a></span>
            </div>
            <div class="qycodlBut"><!--<a href="#">近期走势</a>--><a style="cursor:pointer;">开奖视频</a></div>
            <div class="stv">
            <iframe id="showvideo" width="100%" height="600" src="/lottery/luckyracing/video.jhtml">	</iframe>  
            </div>
            <div class=qycondlCon>
            	<div class="qyconQsall">
                    <div class="qyconQs">
                        <span class="qyconQsb">冠军选择</span>
                        <span class="qyconQsa">冠军遗漏</span>
                    </div>
                    <ul class="qyconQsy" id="gjPanelId">
                        <li>
                            <p class="qyconQsya qyp2a"><span class="qyconQsy2a">01</span></p>
                            <p id="g01omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2b"><span class="qyconQsy2a">02</span></p>
                            <p id="g02omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2c"><span class="qyconQsy2a">03</span></p>
                            <p id="g03omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2d"><span class="qyconQsy2a">04</span></p>
                            <p id="g04omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2e"><span class="qyconQsy2a">05</span></p>
                            <p id="g05omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2f"><span class="qyconQsy2a">06</span></p>
                            <p id="g06omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2g"><span class="qyconQsy2a">07</span></p>
                            <p id="g07omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2h"><span class="qyconQsy2a">08</span></p>
                            <p id="g08omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2i"><span class="qyconQsy2a">09</span></p>
                            <p id="g09omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2j"><span class="qyconQsy2a">10</span></p>
                            <p id="g10omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2k"><span class="qyconQsy2a">11</span></p>
                            <p id="g11omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2l"><span class="qyconQsy2a">12</span></p>
                            <p id="g12omit" class="qyconQsy3">-</p>
                        </li>
                    </ul>
                </div>
                <div class="qyconQsall">
                    <div class="qyconQs">
                        <span class="qyconQsb">亚军选择</span>
                        <span class="qyconQsa">亚军遗漏</span>
                    </div>
                    <ul class="qyconQsy" id="yjPanelId">
                        <li>
                            <p class="qyconQsya qyp2a"><span class="qyconQsy2a">01</span></p>
                            <p id="y01omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2b"><span class="qyconQsy2a">02</span></p>
                            <p id="y02omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2c"><span class="qyconQsy2a">03</span></p>
                            <p id="y03omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2d"><span class="qyconQsy2a">04</span></p>
                            <p id="y04omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2e"><span class="qyconQsy2a">05</span></p>
                            <p id="y05omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2f"><span class="qyconQsy2a">06</span></p>
                            <p id="y06omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2g"><span class="qyconQsy2a">07</span></p>
                            <p id="y07omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2h"><span class="qyconQsy2a">08</span></p>
                            <p id="y08omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2i"><span class="qyconQsy2a">09</span></p>
                            <p id="y09omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2j"><span class="qyconQsy2a">10</span></p>
                            <p id="y10omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2k"><span class="qyconQsy2a">11</span></p>
                            <p id="y11omit" class="qyconQsy3">-</p>
                        </li>
                        <li>
                            <p class="qyconQsya qyp2l"><span class="qyconQsy2a">12</span></p>
                            <p id="y12omit" class="qyconQsy3">-</p>
                        </li>
                    </ul>
                </div>
                
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