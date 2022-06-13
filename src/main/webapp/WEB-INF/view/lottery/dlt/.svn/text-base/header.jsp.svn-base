<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/${licenseId }/data.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/${licenseId }/omit.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/common.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/dlt/formBuy.js"></script>
<div class="jz_top">
      <div class="jz_tz fl">
    <div class="big-logo"></div>
  </div>
      <div class="jztz_name fl">
    <h1>超级大乐透</h1>
    <a class="qi_bg" href="javascript:void 0" >当前期<b id="currIssueId">${game.issue }</b></a>
    <span>3元可得1600万</span>
    <span>每周一、三、六 晚20点50分开奖</span>
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
          <li <c:if test="${p == 'dlt' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=4" hidefocus="true">普通投注</a> </li>
          <li <c:if test="${p == 'dltdt' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=4&p=dltdt" hidefocus="true">胆拖投注</a></li>
          <li <c:if test="${p == 'filter' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=4&p=filter" hidefocus="true">缩水投注</a></li>
          <li <c:if test="${p == 'dssc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=4&p=dssc" hidefocus="true">单式上传</a></li>
          <li <c:if test="${p == 'xfhc' }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=4&p=xfhc" hidefocus="true">先发起后上传</a></li>
          <li><a href="/merger/index.jhtml?licenseId=${licenseId}" hidefocus="true">参与合买</a><span class="cz_icon cz_x">hot<i class="arrowsIcon"></i></span></li>
        </ul>
  </div>
  <div class="small_fb"></div>
 </div>