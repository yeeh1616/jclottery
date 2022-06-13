<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/ssc.css" rel="stylesheet" type="text/css" />
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/ssc/Ssc.js"></script>
<script type="text/javascript" src="/js/lottery/ssc/common.js"></script>
<script type="text/javascript" src="/js/chasing/ChasingNo.js"></script>
<script type="text/javascript" src="/js/chasing/common.js"></script>

<jsp:include page="../common/numbercomm.jsp"></jsp:include>
<jsp:include page="../../chasing/chasingForm.jsp"></jsp:include>
<div class="titbg">
	<div class="titlogo"><img src="/images/smalllottery/103.png" width="80" height="82" /></div>
    <div class="qyrcon">
    	<div class="qyrcona">
        	<div class="qyrconb">
            	<div class="qyrconba"><span class="qyrsp1">江西时时彩</span><span class="qyrsp2">9:00~23:00，10分钟一期，每天84期，返奖率59%</span></div>
            	<div class="qyrconbb">
                	<span class="qyrsp3"><p class="qyp1">第<span class="qys1" id="historyIssueId">--</span>期开奖：</p><p class="qyp2" id="kjDescId">今天已开0期，还剩0期</p></span>
                    <span class="">
                    <div class="qiu">--</div><div class="qiu">--</div><div class="qiu">--</div>
                    <div class="qiu">--</div><div class="qiu">--</div>
                    </span>
                </div>
            </div>
            <div class="qyrconbc">
            	<span class="qyss1"><p class="qyrconbctex1">第<span class="c1" id="currentIssueId">${fn:substring(fp.currentIssue, 2, 11)}</span>期</p><p>离截止时间还有</p></span>
                <span class="qyss2"><span class="z1" id="stopMId">${stopTime[1] }</span>分<span class="z1" id="stopSId">${stopTime[2] }</span>秒</span>
            </div>
        </div>
        <div class="qybut">
            <a href="/lottery/index.jhtml?licenseId=103&p=5xzhx" <c:if test="${freqPlayName == '5x' }">class="qybut1"><p class="qyc11">五星</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != '5x' }">class="qybut2"><p class="qyc1">五星</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=4xzhx" <c:if test="${freqPlayName == '4x' }">class="qybut1"><p class="qyc11">四星</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != '4x' }">class="qybut2"><p class="qyc1">四星</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=3xzhx" <c:if test="${freqPlayName == '3x' }">class="qybut1"><p class="qyc11">三星</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != '3x' }">class="qybut2"><p class="qyc1">三星</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=2xzhx" <c:if test="${freqPlayName == '2x' }">class="qybut1"><p class="qyc11">二星</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != '2x' }">class="qybut2"><p class="qyc1">二星</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=1xzhx" <c:if test="${freqPlayName == '1x' }">class="qybut1"><p class="qyc11">一星</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != '1x' }">class="qybut2"><p class="qyc1">一星</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=dxds" <c:if test="${freqPlayName == 'dx' }">class="qybut1"><p class="qyc11">大小单双</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'dx' }">class="qybut2"><p class="qyc1">大小单双</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=r1x" <c:if test="${freqPlayName == 'r1' }">class="qybut1"><p class="qyc11">任选一</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r1' }">class="qybut2"><p class="qyc1">任选一</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=103&p=r2x" <c:if test="${freqPlayName == 'r2' }">class="qybut1"><p class="qyc11">任选二</p></a></c:if><c:if test="${freqPlayName != 'r2' }">class="qybut2"><p class="qyc1">任选二</p></a></c:if>
        </div>
    </div>
</div>