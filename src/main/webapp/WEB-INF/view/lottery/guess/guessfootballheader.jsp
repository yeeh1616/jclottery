<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- common JS -->
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<!-- DATA JS -->
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/9/schedules.js?time=new Date().getTime()"></script>
<!-- <script type="text/javascript" src="http://115.28.236.76:8098/global/schudle/9/schedules.js?time=new Date().getTime()"></script> -->

<!-- GuessFootball JS -->
<script type="text/javascript" src="/js/lottery/guess/GuessFootballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
<!-- 合买 -->
<script type="text/javascript" src="/js/merger/Merger.js" ></script>

<script type="text/javascript" src="/js/lottery/guess/common.js"></script>
<script type="text/javascript" src="/js/lottery/guess/guessfootball/${p}.js"></script>

<input type="hidden" id="ndateValId" value="${ndate }"/>

<div class="jz_top">
    <div class="jz_tz fl">
  <div class="football-logo"></div>
</div>
    <div class="jztz_name fl">
  <h1>竞彩足球</h1>
  <span>提示：投注为全场90分钟（含伤停补时）的比分结果，不含加时赛及点球结果</span></div>
    <div class="bismenu">
  <ul>
        <li <c:if test="${p == 'hhgg' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=hhgg" hidefocus="true">混合投注</a> </li>
        <li <c:if test="${p == 'hhdg' || p == 'hhspfdg' || p == 'bqcdg' || p == 'zjqdg' || p == 'bfdg'}">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=hhspfdg" hidefocus="true">单关投注</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span></li>
        <li <c:if test="${p == 'hhspf' || p == 'spf' || p == 'rqspf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=hhspf" hidefocus="true">胜平负/让球</a></li>
        <li <c:if test="${p == '2x1' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=2x1" hidefocus="true">2选1</a></li>
        <li <c:if test="${p == 'zjq' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=zjq" hidefocus="true">进球数</a></li>
        <li <c:if test="${p == 'bqc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=bqc" hidefocus="true">半全场</a></li>
        <li <c:if test="${p == 'bf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=bf" hidefocus="true">比分</a></li>
        <li <c:if test="${p == 'dssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=dssc" hidefocus="true">单式上传</a></li>
        <li <c:if test="${p == 'xfhc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=9&p=xfhc" hidefocus="true">先发后选</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span></li>
        <li<c:if test="${p == 'hm' }">class="active"</c:if>><a href="/merger/index.jhtml?licenseId=9" hidefocus="true">参与合买</a></li>
      </ul>
</div>
    <div class="small_fb"></div>
  </div>
