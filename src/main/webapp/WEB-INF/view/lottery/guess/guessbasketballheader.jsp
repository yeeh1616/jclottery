<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- common JS -->
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<!-- DATA JS -->
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/10/schedules.js?time=new Date().getTime()"></script>
<!--<script type="text/javascript" src="http://115.28.236.76:8098/global/schudle/10/schedules.js?time=new Date().getTime()"></script>-->

<!-- GuessFootball JS -->
<script type="text/javascript" src="/js/lottery/guess/GuessBasketballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
<!-- 合买 -->
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/guess/common.js"></script>
<script type="text/javascript" src="/js/lottery/guess/guessbasketball/${p}.js"></script>

<input type="hidden" id="ndateValId" value="${ndate }"/>

<div class="jz_top">
          <div class="jz_tz fl">
        <div class="basketball-logo"></div>
      </div>
          <div class="jztz_name fl">
        <h1>竞彩篮球</h1>
        <span>73%高返奖率</span></div>
          <div class="bismenu">
        <ul>
              <li <c:if test="${p == 'hhgg' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=hhgg" hidefocus="true">混合投注</a> </li>
              <li <c:if test="${p == 'hhdg' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=hhdg" hidefocus="true">单关投注</a></li>
              <li <c:if test="${p == 'sf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=sf" hidefocus="true">胜负</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span></li>
              <li <c:if test="${p == 'rfsf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=rfsf" hidefocus="true">让分胜负</a></li>
              <li <c:if test="${p == 'sfc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=sfc" hidefocus="true">胜分差</a></li>
              <li <c:if test="${p == 'dxf' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=dxf" hidefocus="true">大小分</a></li>
              <li <c:if test="${p == 'dssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=dssc" hidefocus="true">单式上传</a></li>
              <li <c:if test="${p == 'xfhc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=10&p=xfhc" hidefocus="true">先发起后上传</a></li>
              <li><a href="/merger/index.jhtml?licenseId=10" hidefocus="true">参与合买</a></li>
            </ul>
      </div>
          <div class="small_bb" style="left:820px;"></div>
        </div>