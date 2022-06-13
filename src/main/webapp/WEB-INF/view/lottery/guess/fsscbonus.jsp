<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 复式上传奖金优化部分 -->
<div class="memberbox" id="bonusPanalId" style="display:none">
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
    本次投注金额为  <b id="fsscBetMoneyId">0</b>元<br /><br />
      <!--您的账户余额为   0.00元<br />-->
      <input name="button" id="fsscLotteryFormBtnId" type="button" class="qrbut" id="button" value="确认提交" />
<br />
    </div></td>
  </tr>
      </table> 
    </div>
    </div>
    <div class="clear"></div>
</div>
