<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="jztz_name fl">
	<h1>${licenseName }</h1>
 	<a class="qi_bg">当前期${game.issue}</a> 
	<c:if test="${p == 'xfhc' && game.issue == currIssue}">
		点此<a class="" href="/lottery/index.jhtml?licenseId=${licenseId }&p=xfhc&issue=${saleIssue1}"><b>发起第<font color=red>${saleIssue1}</font>期</b></a>
	</c:if>
	<span>单注最高奖金5,000,000元</span>
</div>
<div class="bismenu">
   <ul>
      <li <c:if test="${licenseId == 5 }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=5" hidefocus="true">胜负彩</a> </li>
      <li <c:if test="${licenseId == 6 }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=6" hidefocus="true">任选九</a></li>
      <li <c:if test="${licenseId == 7 }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=7" hidefocus="true">半全场</a></li>
      <li <c:if test="${licenseId == 8 }">class="active"</c:if>><a href="/lottery/index.jhtml?licenseId=8" hidefocus="true">4场进球</a></li>
   </ul>
</div>
<div class="two_time">
	<div>
		<strong>代购截止:</strong>${game.stopTime}<span>(<label
			id="stopHId">${stopTime[0]}</label>小时<label id="stopMId">${stopTime[1]}</label>分<label
			id="stopSId">${stopTime[2]}</label>秒)</span>
	</div>
	<div>
		<strong>合买截止:</strong>${game.reserved3}<span>(<label
			id="coopstopHId">${coopStopTime[0]}</label>小时<label id="coopstopMId">${coopStopTime[1]}</label>分<label
			id="coopstopSId">${coopStopTime[2]}</label>秒)</span>
	</div>
</div>