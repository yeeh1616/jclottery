<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/${licenseId }/data.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/${licenseId }/omit.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/dlt/formBuy.js"></script>
<style>
<!--
.ly-star-logo {
	background: url(../images/smalllottery/logo_61.png);
	background-position: -750px 0px !important;
	width: 66px;
	height: 75px;
}
-->
</style>
<div class="jz_top">
      <div class="jz_tz fl">
      <c:if test="${licenseId == 3 || licenseId == 24}">
		<div class="seven-star-logo"></div>
		</c:if>
		<c:if test="${licenseId == 20}">
		<div class="ly-star-logo"></div>
	</c:if>
    
  </div>
      <div class="jztz_name fl">
    <h1>${licenseName }</h1>
    <a class="qi_bg" href="javascript:void 0" >当前期<b id="currIssueId">${game.issue }</b></a>
    <span>2元可得5,000,000元</span>
    <c:if test="${licenseId == 3}">
    <span>每周二、五、日 晚20点50分开奖</span>
    </c:if>
    <c:if test="${licenseId == 20}">
    <span>每周二、五、日 晚19点00分开奖</span>
    </c:if>
    <c:if test="${licenseId == 24}">
    <span>每周二、四、五、日 晚21点00分开奖</span>
    </c:if>
     </div>
    <div class="two_time sz_time">
    <div>
    <strong>代购截止:</strong> ${fn:substring(game.stopTime,0,16)}<span>(<b id="stopHId">${stopTime[0] }</b>小时<b id="stopMId">${stopTime[1] }</b>分<b id="stopSId">${stopTime[2] }</b>秒)</span>
    </div>
    <div>
    <strong>合买截止:</strong> ${fn:substring(game.reserved3,0,16)}<span>(<b id="coopstopHId">${coopStopTime[0] }</b>小时<b id="coopstopMId">${coopStopTime[1] }</b>分<b id="coopstopSId">${coopStopTime[2] }</b>秒)</span>
    </div>
    </div>
      <div class="bismenu">
    <ul>
          <li <c:if test="${p == 'qxc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=${licenseId }" hidefocus="true">直选</a> </li>
          <li <c:if test="${p == 'dssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=${licenseId }&p=dssc" hidefocus="true">单式上传</a></li>
          <li <c:if test="${p == 'xfhc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=${licenseId }&p=xfhc" hidefocus="true">先发起后上传</a></li>
          <li><a href="/merger/index.jhtml?licenseId=${licenseId}" hidefocus="true">参与合买</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span></li>
        </ul>
  </div>
  <div class="small_fb"></div>
 </div>