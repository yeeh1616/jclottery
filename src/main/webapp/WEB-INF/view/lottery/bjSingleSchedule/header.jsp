<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- common JS -->
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<c:if test="${licenseId == 22 }">
<script type="text/javascript" src="/js/lottery/bjSingleSchedule/SfPassSingleSchedule.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/22/sfgg.mobile.js?time=new Date().getTime()"></script>
</c:if>
<c:if test="${licenseId == 21 }">
<script type="text/javascript" src="/js/lottery/bjSingleSchedule/SingleSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/bjSingleSchedule/common.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/21/bjdc.mobile.js?time=new Date().getTime()"></script>
</c:if>

<script type="text/javascript" src="/js/lottery/bjSingleSchedule/${p}.js"></script>

<input type="hidden" id="ndateValId" value="${ndate }"/>

<div class="jz_top">
    <div class="jz_tz fl">
  <div class="beijingd-logo"></div>
</div>
    <div class="jztz_name fl">
  <h1>北京单场</h1>
  <a class="qi_bgbj bjdcd" id="issueSId" value="1">当前期--</a>
  <span>
  <c:if test="${licenseId == 22 }">竞猜对象：足球、篮球、网球、橄榄球、排球、羽毛球、乒乓球、沙滩排球、冰球、曲棍球、手球、水球</c:if>
  <c:if test="${licenseId == 21 }">5种玩法，30种过关方式，每天最多130场赛事不间断，奖金天天派。</c:if>
  </span></div>
    <div class="bismenu">
  <ul>
        <li <c:if test="${p == 'sfgg' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=22" hidefocus="true">胜负过关</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span> </li>
        <li <c:if test="${p == 'spf' || p == 'dssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=21&p=spf" hidefocus="true">胜平负</a></li>
        <li <c:if test="${p == 'bf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=21&p=bf" hidefocus="true">比分</a></li>
        <li <c:if test="${p == 'bqc' || p == 'bqcdssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=21&p=bqc" hidefocus="true">半全场</a></li>
        <li <c:if test="${p == 'zjq' || p == 'zjqdssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=21&p=zjq" hidefocus="true">总进球</a></li>
        <li <c:if test="${p == 'sxds' || p == 'sxdsdssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=21&p=sxds" hidefocus="true">上下单双</a></li>
        <li<c:if test="${p == 'hm' }">class="active"</c:if>><a href="/merger/index.jhtml?licenseId=${licenseId }" hidefocus="true">参与合买</a></li>
      </ul>
</div>
    <div class="small_fb"></div>
  </div>
