<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="竞彩奖金优化" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<c:if test="${licenseId == 9}">
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/9/schedules.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/guess/GuessFootballSchedule.js"></script>
</c:if>
<c:if test="${licenseId == 10}">
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/10/schedules.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/guess/GuessBasketballSchedule.js"></script>
</c:if>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
<script type="text/javascript" src="/js/lottery/guess/bonusPageControl.js"></script>
<script type="text/javascript" src="/js/lottery/guess/common.js"></script>

<div class="memberbox" id="betPanalId">
  <div class="mbright" style="width:100%">
  <div class="guolvtop">
	竞彩奖金优化 <font style="font-size:12px; color:#9a8f87">　　　　说明： 就是针对用户投注的复式倍投方案，用户可以根据自己的需求，自行对单注注数进行分配的功能。</font></div>
    <input type="hidden" id="singCodeId" value="${singCode }"/>
    <div class="mrcont" style="padding:10px">
      <div class="tzxq" style=" margin-top:0px">
       	<h1>第一步 </h1>
       	<strong>选择优化方式</strong></div>
        
        <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#e3e8eb">
  <tr>
    <td height="90" align="center" bgcolor="#f6f9fb"><table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="255" align="left"><b>计划投注：</b>
			<input name="textfield2" type="text" class="jh" id="buyMoneyId" value="" />元
		</td>
        <td width="522" align="left" class="jhcont">
          <input type="radio" name="bonusIn" value="1" checked/>
          <span class="jhcol">平衡优化</span>  使每个单注的奖金趋于一致。<br />
          <input type="radio" name="bonusIn" value="2" />
          <span class="jhcol">博热优化</span>  使概率最高的单注奖金最大化，其他单注的奖金保本。<br />
          <input type="radio" name="bonusIn" value="3" />
          <span class="jhcol">博冷优化</span>  使奖金最高的单注奖金最大化，其他单注的奖金保本。<br />
          <input type="radio" name="bonusIn" value="4" />
          <span class="jhcol">保本优化</span>  可以自定义保本的单注组合，其他组合进行平均奖金最大化。</td>
        <td align="left"><input type="button" name="button2" id="bonusDoBtnId" class="addbtn3" value="优化" /></td>
      </tr>
    </table></td>
    </tr>
</table>
        
      <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
  <tr>
    
    <td width="70" height="33" align="center" bgcolor="#d9e8f0" class="sktit">场次 </td>
    <td width="70" align="center" bgcolor="#d9e8f0" class="sktit">赛事 </td>
    <td width="75" align="center" bgcolor="#d9e8f0" class="sktit">截止时间 </td>
    <td width="80" align="center" bgcolor="#d9e8f0" class="sktit"> 主队</td>
    <td width="80" align="center" bgcolor="#d9e8f0" class="sktit">客队</td>
    <td align="center" bgcolor="#d9e8f0" class="sktit"> 投注 </td>
  </tr>
  <tbody id="schAreaId">
  </tbody>
</table>
	<div class="blank" style="height:10px"></div>
    <div class="tzxq" style=" margin-top:0px">
       	<h1>第二步 </h1>
          	<strong>手动调节</strong></div>
  <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
  <tr>
    <td width="50" height="33" align="center" bgcolor="#d9e8f0" class="sktit">序</td>
    <td width="610" align="center" bgcolor="#d9e8f0" class="sktit">单注</td>
    <td width="120" align="center" bgcolor="#d9e8f0" class="sktit">注数</td>
    <td align="center" bgcolor="#d9e8f0" class="sktit">理论奖金</td>
    <td align="center" bgcolor="#d9e8f0" class="sktit">删除</td>
    </tr>
    <tbody id="singleAreaId">
    
    </tbody>
  </table> 
        
    <div class="blank" style="height:10px"></div>
    <div class="tzxq" style=" margin-top:0px">
       	<h1>第三步 </h1>
          	<strong> 确认投注信息</strong></div>
         <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
  <tr>
    <td bgcolor="#FFFFFF" colspan="2" align="center">
    <div class="buymethod">
    本次投注金额为  <b id="betMoneyId">0</b>元<br /><br />
      <!--您的账户余额为   0.00元<br />-->
      <input name="button" id="lotteryFormBtnId" type="button" class="qrbut" id="button" value="确认提交" />
<br />
      <input type="checkbox" name="checkbox" id="agreeId" checked/>
      我已阅读并同意<a href="#"><font color="#15afbd">《用户合买代购协议》</font></a></div></td>
  </tr>
      </table> 
    </div>
    </div>
    <div class="clear"></div>
</div>
<jsp:include page="./surepage.jsp"></jsp:include>

<jsp:include page="../../include/footer.jsp"></jsp:include>
<form id="lotteryBuyFormId" action="/lottery/bet.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value="${licenseId }"/>
	<input type="hidden" id="playId" name="playType" value="${playId }"/>
	<input type="hidden" id="passTypeId" name="passType" value="${passType}"/>
	<input type="hidden" name="singleFlag" value="1"/>
	<input type="hidden" id="betCodeId" name="betCode" value="${betCode }"/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="1"/>
	<input type="hidden" name="schInfo" value=""/>
	<input type="hidden" name="reserved8" value=""/>
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="1"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
</form>
<!-- 合买表单 -->
<form id="mergerBuyFormId" action="/merger/merge.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId}"/>
	<input type="hidden" name="playType" value="${playId }"/>
	<input type="hidden" name="passType" value="${passType}"/>
	<input type="hidden" name="singleFlag" value="3"/>
	<input type="hidden" name="betCode" value="${betCode }"/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value='<c:if test="${licenseId == 101}">${fn:substring(fp.currentIssue, 2, 10) }</c:if><c:if test="${licenseId != 101}">${game.issue }</c:if>'/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="3"/>
	<input type="hidden" name="schInfo" value=""/>
	<input type="hidden" name="zjFlag" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="1"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	
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
</form>
</body>
</html>