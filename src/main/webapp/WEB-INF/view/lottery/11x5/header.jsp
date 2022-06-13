<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/ssc.css" rel="stylesheet" type="text/css" />
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/11x5/C11x5.js"></script>
<script type="text/javascript" src="/js/lottery/11x5/common.js"></script>
<script type="text/javascript" src="/js/chasing/ChasingNo.js"></script>
<script type="text/javascript" src="/js/chasing/common.js"></script>
<style>
.qyconQsy2{width:420px; float:left; margin-left:0px; _margin-left:5px; padding:0; list-style-type:none; display:block}
.qyconQsy2 li{position:relative; float:left; width:27px; overflow:hidden; margin-left:8px; _margin-left:4px}
.qyconQsy2 li p{text-align:center}
.sscAa2{width:160px; _width:248px; float:left; margin-left:35px; _margin-left:5px; overflow:hidden}
.sscAb2{padding:0 5px; _padding:0 6px; display:block; line-height:22px; border:1px #c3c2c2 solid; background:#f5f5f5; text-align:center; color:#686767; cursor:pointer; float:left; margin-left:2px}

</style>
<jsp:include page="../common/numbercomm.jsp"></jsp:include>
<jsp:include page="../../chasing/chasingForm.jsp"></jsp:include>
<div class="titbg">
	<div class="titlogo"><img src="/images/smalllottery/logo_102.png" width="80" height="82" /></div>
    <div class="qyrcon">
    	<div class="qyrcona">
        	<div class="qyrconb">
            	<div class="qyrconba"><span class="qyrsp1">${licenseName }</span><span class="qyrsp2">${fp.startAndStopTime }，10分钟一期，每天${fp.totalDayPeriod }期，返奖率59%</span></div>
            	<div class="qyrconbb">
                	<span class="qyrsp3"><p class="qyp1">第<span class="qys1" id="historyIssueId">--</span>期开奖：</p><p class="qyp2" id="kjDescId">今天已开0期，还剩0期</p></span>
                    <span class="">
                    <div class="qiu">--</div><div class="qiu">--</div><div class="qiu">--</div>
                    <div class="qiu">--</div><div class="qiu">--</div>
                    </span>
                </div>
            </div>
            <div class="qyrconbc">
            	<span class="qyss1"><p class="qyrconbctex1">第<span class="c1" id="currentIssueId">${fp.currentIssue}</span>期</p><p>离截止时间还有</p></span>
                <span class="qyss2"><span class="z11" id="stopHId">${stopTime[0] }</span>时<span class="z11" id="stopMId">${stopTime[1] }</span>分<span class="z11" id="stopSId">${stopTime[2] }</span>秒</span>
            </div>
        </div>
        <div class="qybut">
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=q1pt" <c:if test="${freqPlayName == 'q1' }">class="qybut1"><p class="qyc11">前一</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'q1' }">class="qybut2"><p class="qyc1">前一</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=x2r2pt" <c:if test="${freqPlayName == 'x2' }">class="qybut1"><p class="qyc11">选二</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'x2' }">class="qybut2"><p class="qyc1">选二</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=x3r3pt" <c:if test="${freqPlayName == 'x3' }">class="qybut1"><p class="qyc11">选三</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'x3' }">class="qybut2"><p class="qyc1">选三</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=r4pt" <c:if test="${freqPlayName == 'r4' }">class="qybut1"><p class="qyc11">任四</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r4' }">class="qybut2"><p class="qyc1">任四</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=r5pt" <c:if test="${freqPlayName == 'r5' }">class="qybut1"><p class="qyc11">任五</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r5' }">class="qybut2"><p class="qyc1">任五</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=r6pt" <c:if test="${freqPlayName == 'r6' }">class="qybut1"><p class="qyc11">任六</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r6' }">class="qybut2"><p class="qyc1">任六</p><p class="qyc2"></p></a></c:if>
            <a href="/lottery/index.jhtml?licenseId=${licenseId }&p=r7pt" <c:if test="${freqPlayName == 'r7' }">class="qybut1"><p class="qyc11">任七</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r7' }">class="qybut2"><p class="qyc1">任七</p><p class="qyc2"></p></a></c:if>
			<a href="/lottery/index.jhtml?licenseId=${licenseId }&p=r8pt" <c:if test="${freqPlayName == 'r8' }">class="qybut1"><p class="qyc11">任八</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'r8' }">class="qybut2"><p class="qyc1">任八</p><p class="qyc2"></p></a></c:if>
			<a href="/lottery/index.jhtml?licenseId=${licenseId }&p=dssc" <c:if test="${freqPlayName == 'ds' }">class="qybut1"><p class="qyc11">单式上传</p><p class="qyc22"></p></a></c:if><c:if test="${freqPlayName != 'ds' }">class="qybut2"><p class="qyc1">单式上传</p><p class="qyc2"></p></a></c:if>
       </div>
    </div>
</div>