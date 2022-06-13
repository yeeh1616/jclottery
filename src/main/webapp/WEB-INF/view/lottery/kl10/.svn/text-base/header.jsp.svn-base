<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/css/ssc.css" rel="stylesheet" type="text/css" />
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<script type="text/javascript" src="/js/lottery/kl10/common.js"></script>
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
	<div class="titlogo"><img src="/images/smalllottery/kuaile.png" width="80" height="82" /></div>
    <div class="qyrcon">
    	<div class="qyrcona">
        	<div class="qyrconb">
            	<div class="qyrconba"><span class="qyrsp1">${licenseName }</span><span class="qyrsp2">${fp.startAndStopTime }，10分钟一期，每天${fp.totalDayPeriod }期，返奖率59%</span></div>
            	<div class="qyrconbb">
                	<span class="qyrsp3"><p class="qyp1">第<span class="qys1" id="historyIssueId">--</span>期开奖：</p><p class="qyp2" id="kjDescId">今天已开0期，还剩0期</p></span>
                    <span class="">
                    <div class="qiu">--</div><div class="qiu">--</div><div class="qiu">--</div>
                    <div class="qiu">--</div><div class="qiu">--</div><div class="qiu">--</div>
                    <div class="qiu">--</div>
                    <div class="qiu">--</div>
                    </span>
                </div>
            </div>
            <div class="qyrconbc">
            	<span class="qyss1"><p class="qyrconbctex1">第<span class="c1" id="currentIssueId">${fp.currentIssue}</span>期</p><p>离截止时间还有</p></span>
                <span class="qyss2"><span class="z11" id="stopMId">${stopTime[1] }</span>分<span class="z11" id="stopSId">${stopTime[2] }</span>秒</span>
            </div>
        </div>
        <div class="qybut">
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x1st" <c:if test="${p == 'x1st' }">class="qybut1"><p class="qyc11">选一数投</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x1st' }">class="qybut2"><p class="qyc1">选一数投</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x1ht" <c:if test="${p == 'x1ht' }">class="qybut1"><p class="qyc11">选一红投</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x1ht' }">class="qybut2"><p class="qyc1">选一红投</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x2r2" <c:if test="${p == 'x2r2' }">class="qybut1"><p class="qyc11">任选二</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x2r2' }">class="qybut2"><p class="qyc1">任选二</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x2lzh" <c:if test="${p == 'x2lzh' }">class="qybut1"><p class="qyc11">选二连直</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x2lzh' }">class="qybut2"><p class="qyc1">选二连直</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x2lz" <c:if test="${p == 'x2lz' }">class="qybut1"><p class="qyc11">选二连组</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x2lz' }">class="qybut2"><p class="qyc1">选二连组</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x3r3" <c:if test="${p == 'x3r3' }">class="qybut1"><p class="qyc11">任选三</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x3r3' }">class="qybut2"><p class="qyc1">任选三</p><p class="qyc2"></p></a></c:if>
            <a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x3qzh" <c:if test="${p == 'x3qzh' }">class="qybut1"><p class="qyc11">选三前直</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x3qzh' }">class="qybut2"><p class="qyc1">选三前直</p><p class="qyc2"></p></a></c:if>
			<a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x3qz" <c:if test="${p == 'x3qz' }">class="qybut1"><p class="qyc11">选三前组</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x3qz' }">class="qybut2"><p class="qyc1">选三前组</p><p class="qyc2"></p></a></c:if>
			<a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x4r4" <c:if test="${p == 'x4r4' }">class="qybut1"><p class="qyc11">任选四</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x4r4' }">class="qybut2"><p class="qyc1">任选四</p><p class="qyc2"></p></a></c:if>
			<a style="width:68px;" href="/lottery/index.jhtml?licenseId=${licenseId }&p=x5r5" <c:if test="${p == 'x5r5' }">class="qybut1"><p class="qyc11">任选五</p><p class="qyc22"></p></a></c:if><c:if test="${p != 'x5r5' }">class="qybut2"><p class="qyc1">任选五</p><p class="qyc2"></p></a></c:if>
       </div>
    </div>
</div>