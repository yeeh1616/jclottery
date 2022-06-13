<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/xysc.css" rel="stylesheet" type="text/css" />
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/luckyracing/LuckyRacing.js"></script>
<script type="text/javascript" src="/js/lottery/luckyracing/common.js"></script>
<script type="text/javascript" src="/js/chasing/ChasingNo.js"></script>
<script type="text/javascript" src="/js/chasing/common.js"></script>

<jsp:include page="../common/numbercomm.jsp"></jsp:include>
<<jsp:include page="../../chasing/chasingForm.jsp"></jsp:include>
<div class="titbg">
	<div class="titlogo"><img src="/images/xysc_logo.gif" width="80" height="82" /></div>
    <div class="qyrcon">
    	<div class="qyrcona">
        	<div class="qyrconb">
            	<div class="qyrconba"><span class="qyrsp1">幸运赛车</span><span class="qyrsp2">9:00~23:00，10分钟一期，每天84期，返奖率59%</span></div>
            	<div class="qyrconbb">
                	<span class="qyrsp3"><p class="qyp1">第<span class="qys1" id="historyIssueId">--</span>期开奖：</p><p class="qyp2" id="kjDescId">今天已开0期，还剩0期</p></span>
                    <span class=""><div class="qiu">--</div><div class="qiu">--</div><div class="qiu">--</div></span>
                </div>
            </div>
            <div class="qyrconbc">
            	<span class="qyss1"><p class="qyrconbctex1">第<span class="c1" id="currentIssueId">${fn:substring(fp.currentIssue, 2, 10)}</span>期</p><p>离截止时间还有</p></span>
                <span class="qyss2"><span class="z1" id="stopMId">${stopTime[1] }</span>分<span class="z1" id="stopSId">${stopTime[2] }</span>秒</span>
            </div>
        </div>
        <div class="qybut">
        	<a href="/lottery/index.jhtml?licenseId=102&p=q1" <c:if test="${freqPlayName == 'q1' }">class="qybut1"><p class="qyc11">前一</p><p class="qyc22">猜冠军</p></a></c:if><c:if test="${freqPlayName != 'q1' }">class="qybut2"><p class="qyc1">前一</p><p class="qyc2">猜冠军</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=q2zx" <c:if test="${freqPlayName == 'q2' }">class="qybut1"><p class="qyc11">前二</p><p class="qyc22">猜冠亚</p></a></c:if><c:if test="${freqPlayName != 'q2' }">class="qybut2"><p class="qyc1">前二</p><p class="qyc2">猜冠亚</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=q3zx" <c:if test="${freqPlayName == 'q3' }">class="qybut1"><p class="qyc11">前三</p><p class="qyc22">猜前三</p></a></c:if><c:if test="${freqPlayName != 'q3' }">class="qybut2"><p class="qyc1">前三</p><p class="qyc2">猜前三</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=wzdc" <c:if test="${freqPlayName == 'wz' }">class="qybut1"><p class="qyc11">位置</p><p class="qyc22">易中奖</p></a></c:if><c:if test="${freqPlayName != 'wz' }">class="qybut2"><p class="qyc1">位置</p><p class="qyc2">易中奖</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=dxjo" <c:if test="${freqPlayName == 'dx' }">class="qybut1"><p class="qyc11">大小奇偶</p><p class="qyc22">猜大小</p></a></c:if><c:if test="${freqPlayName != 'dx' }">class="qybut2"><p class="qyc1">大小奇偶</p><p class="qyc2">猜大小</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=z2fs" <c:if test="${freqPlayName == 'z2' }">class="qybut1"><p class="qyc11">组二</p><p class="qyc22">任猜冠亚</p></a></c:if><c:if test="${freqPlayName != 'z2' }">class="qybut2"><p class="qyc1">组二</p><p class="qyc2">任猜冠亚</p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=102&p=z3fs" <c:if test="${freqPlayName == 'z3' }">class="qybut1"><p class="qyc11">组三</p><p class="qyc22">任猜冠亚季</p></a></c:if><c:if test="${freqPlayName != 'z3' }">class="qybut2"><p class="qyc1">组三</p><p class="qyc2">任猜冠亚季</p></a></c:if>
            <!--<a href="/lottery/index.jhtml?licenseId=102&p=ysq1" <c:if test="${freqPlayName == 'ys' }">class="qybut1"><p class="qyc11">颜色</p><p class="qyc22">6选1</p></a></c:if><c:if test="${freqPlayName != 'ys' }">class="qybut2"><p class="qyc1">颜色</p><p class="qyc2">6选1</p></a></c:if>-->
            <a  <c:if test="${freqPlayName == 'xx' }">class="qybut1"><p class="qyc5">奖金对照表</p></a></c:if><c:if test="${freqPlayName != 'xx' }">class="qybut2"><p class="qyc5">奖金对照表</p></a></c:if>
        </div>
    </div>
</div>