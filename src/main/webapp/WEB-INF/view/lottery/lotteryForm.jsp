<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<input type="hidden" id="aheadTimeId" value="${aheadtime}"/>
<input type="hidden" id="pageNameId" value="${p}"/>
<!-- 投注表单 -->
<form id="lotteryBuyFormId" action="/lottery/bet.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value="${licenseId }"/>
	<input type="hidden" name="playType" value="${p}"/>
	<input type="hidden" name="passType" value=""/>
	<input type="hidden" name="singleFlag" value=""/>
	<input type="hidden" name="betCode" value=""/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value="${game.issue }"/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="1"/>
	<input type="hidden" name="zjFlag" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	<!-- 足彩暂存号码 -->
	<input type="hidden" name="reserved5" value=""/>
	<!-- 存放竞彩之外的其他彩种当前期的截止时间 -->
	<input type="hidden" name="reserved8" value="${issueStopTime }"/>
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="2"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	<!-- 复制宣言 -->
	<input type="hidden" name="reserved20" value=""/>
</form>

<!-- 单式上传表单 -->
<form id="singleFormId" action="/lottery/singleBet.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId}"/>
	<input type="hidden" name="playId" value=""/>
	<input type="hidden" name="schs" value=""/>
	<input type="hidden" name="passType" value=""/>
	<input type="hidden" name="rqs" value=""/>
	<input type="hidden" name="multiple" value="1"/>
	<input type="hidden" id="fileNameId" name="fileName" value=""/>
	<input type="hidden" name="zjFlag" value="0"/>
	<input type="hidden" name="issue" value="${game.issue }"/>
	<input type="hidden" name="stopTime" value="${issueStopTime }"/>
	
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="2"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	<!-- 复制宣言 -->
	<input type="hidden" name="reserved20" value=""/>
</form>

<!-- 合买单式上传表单 -->
<form id="mergerSingleFormId" action="/lottery/singleMerger.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId }"/>
	<input type="hidden" name="playId" value=""/>
	<input type="hidden" name="schs" value=""/>
	<input type="hidden" name="passType" value=""/>
	<input type="hidden" name="rqs" value=""/>
	<input type="hidden" name="multiple" value="1"/>
	<input type="hidden" id="dsfileNameId" name="fileName" value=""/>
	<input type="hidden" name="zjFlag" value="0"/>
	<input type="hidden" name="issue" value="${game.issue }"/>
	<input type="hidden" name="stopTime" value="${issueStopTime }"/>
	<!-- 合买设置的信息begin -->
	<!--合买标题-->
	<input type="hidden" name="partTitile" value=""/>
	<!--方案描述-->
	<input type="hidden" name="partDetail" value=""/>
	<!--总份数-->
	<input type="hidden" name="totalNum" value=""/>
	<!--发起人购买份数-->
	<input type="hidden" name="launchNum" value=""/>
	<!--保密级别-->
	<input type="hidden" name="showLevel" value=""/>
	<!--佣金（提成比例）-->
	<input type="hidden" name="brokerage" value=""/>
	<!--保底份数-->
	<input type="hidden" name="insNum" value=""/>
	<!--合买设置的信息end-->
	
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="2"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	<!-- 复制宣言 -->
	<input type="hidden" name="reserved20" value=""/>
</form>

<!-- 合买表单 -->
<form id="mergerBuyFormId" action="/merger/merge.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId}"/>
	<input type="hidden" name="playType" value="${p }"/>
	<input type="hidden" name="passType" value=""/>
	<input type="hidden" name="singleFlag" value=""/>
	<input type="hidden" name="betCode" value=""/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value='<c:if test="${licenseId == 101}">${fn:substring(fp.currentIssue, 2, 10) }</c:if><c:if test="${licenseId != 101}">${game.issue }</c:if>'/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="3"/>
	<input type="hidden" name="zjFlag" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	
	<!-- 合买设置的信息begin -->
	<!--合买标题-->
	<input type="hidden" name="partTitile" value=""/>
	<!--方案描述-->
	<input type="hidden" name="partDetail" value=""/>
	<!--总份数-->
	<input type="hidden" name="totalNum" value=""/>
	<!--发起人购买份数-->
	<input type="hidden" name="launchNum" value=""/>
	<!--保密级别-->
	<input type="hidden" name="showLevel" value=""/>
	<!--佣金（提成比例）-->
	<input type="hidden" name="brokerage" value=""/>
	<!--保底份数-->
	<input type="hidden" name="insNum" value=""/>
	<!--合买设置的信息end-->
	
	<!-- 足彩暂存号码 -->
	<input type="hidden" name="reserved5" value=""/>
	<!-- 存放竞彩之外的其他彩种当前期的截止时间 -->
	<input type="hidden" name="reserved8" value="${issueStopTime }"/>
	
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="2"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	<!-- 复制宣言 -->
	<input type="hidden" name="reserved20" value=""/>
</form>

<!-- 先发起，后上传合买表单 -->
<form id="frsUpmergerBuyFormId" action="/merger/frsupmerge.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId}"/>
	<input type="hidden" name="playType" value="${p }"/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="issue" value='<c:if test="${licenseId == 101}">${fn:substring(fp.currentIssue, 2, 10) }</c:if><c:if test="${licenseId != 101}">${game.issue }</c:if>'/>
	
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	
	<!-- 合买设置的信息begin -->
	<!--合买标题-->
	<input type="hidden" name="partTitile" value=""/>
	<!--方案描述-->
	<input type="hidden" name="partDetail" value=""/>
	<!--总份数-->
	<input type="hidden" name="totalNum" value=""/>
	<!--发起人购买份数-->
	<input type="hidden" name="launchNum" value=""/>
	<!--保密级别-->
	<input type="hidden" name="showLevel" value=""/>
	<!--佣金（提成比例）-->
	<input type="hidden" name="brokerage" value=""/>
	<!--保底份数-->
	<input type="hidden" name="insNum" value=""/>
	<!--合买设置的信息end-->	
</form>

<!-- 追号表单 -->
<form id="chasingBuyFormId" action="/chasing/chase.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value="${licenseId }"/>
	<input type="hidden" id="chsPlayerId" name="playType" value="${p }"/>
	<input type="hidden" name="singleFlag" value=""/>
	<input type="hidden" name="betCode" value=""/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="chasingState" value="1"/>
	<input type="hidden" name="zjFlag" value="0"/>
	<input type="hidden" name="issueMult" value=""/>
	<input type="hidden" name="stopBonus" value=""/>
	<input type="hidden" name="winStop" value="0"/>
	<input type="hidden" name="betFrom" value="1"/>
</form>
