<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/dlt.css"/>

<!-- 合买begin -->
<div class="banxin con_l_c4" id="megerPanelDivId">
<div class="jz_con_t" name="mergerPanel" style="display:none">
				<div class="jz_con_t_l"><span>竞彩合买设置 </span></div>
				<div class="jz_con_t_r"><span></span></div>
				<div class="clear"></div>
			</div>
<jsp:include page="./mergercomm.jsp"></jsp:include>
<div class="con_l_c4_c8" name="mergerPanel" style="display:none">
	<div class="con_l_c4_c8_l">
		<!--<li>
		<img src="/images/new_11.png" width="14" height="20" />weicai79，
		<img src="/images/new_12.png" width="15" height="17" />
		目前您的账户余额是<span class="red1"> ¥ 0.00 </span><span class="red3">[ 充值] </span></li>
		<li><span class="red1">要完成本次购彩，您还差： ¥ 1.00</span>   
		<span class="red3">[ 立即充值 </span>]</li>-->
		<li><input type="checkbox" checked id="mergerAgreeCheckBoxId"/>我已阅读了<span class="red3">《用户服务协议》</span>并同意其中条款</li>
	</div>
	<div class="con_l_c4_c8_r">
	<input type="button" class="btn" value="确认投注" id="mergerFormSbmBtnId"/>
	<a style="cursor:pointer;font-size:12px;" id="returnMergModId">返回修改该方案</a>
	</div>
</div>
</div>
<!-- 合买确认弹出层begin -->
<div class="flowDiv1_4" id="mergerSureDivId" style="display:none">
  <div class="f3tit"><h1>竞彩-${playName } 合买方案</h1>    <div class="cls"><a href="javascript:void 0" id="closeMergerSureDivId">x</a></div></div>
    <div class="clear"></div>
   <div class="fanganbox">
     <table width="704" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
       <tr>
         <td width="89" height="64" rowspan="2"  align="center" class="hemai3">方案信息</td>
		  <td width="51" height="31" align="center" class="hemai4">玩法</td>
		  <td width="62" align="center" class="hemai4">注数 </td>
		  <td width="56" align="center" class="hemai4">倍数 </td>
		  <td width="87" align="center" class="hemai4">总金额 </td>
		  <td width="77" align="center" class="hemai4">每份</td>
		  <td width="137" align="center" class="hemai4">保底 </td>
		  <td width="49" align="center" class="hemai4">提成 </td>
		  <td width="90" align="center" class="hemai4">保密类型</td>
		  </tr>
       <tr id="mergerSureTitleTrId">
       	</tr>
	    <tr>
         <td width="84" height="210"  align="center" class="hemai3">投注内容</td>
		  <td width="615" height="210" colspan="8" align="center" class="hemai6">
		  <div class="touzxq1">投注详情 <span id="mergerSureSchPsId">选择场次：2场  选择方式：2串1</span></div>
		  <div class="yincang3">
			  <div class="gundong_top">
			  	<table width="608" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="jcbg">
			<tr>
					<td height="57" width="86" class="jcbg1">场次 </td>
					<td width="86" class="jcbg1">主队</td>
					<td width="87" class="jcbg1">客队</td>
					<td width="87" class="jcbg1"> 投注项 </td>
					<td width="87" class="jcbg1">设胆</td>
			</tr>
			</table>
			</div>
			<div class="gundong">
		<table width="608" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="jcbg1">
		<tbody id="mergerSureTbodyId">
		</tbody>
		</table>
		  </div>
		  </div>
		  </td
	   ></tr>
       <tr>
         <td width="84" height="48"  align="center" class="hemai3">认购信息</td>
		  <td width="615" height="48" colspan="8" align="center" class="hemai5">
		  <p id="mergerSureTotalMoneyId">您本次购买1份，保底1份，需消费¥ <span> 0 </span>元</p></td
	   ></tr>
    </table>
  </div>
  <div class="queren"><input type="button" id="mergerBuyBtnId" value="确定" class="btn3"/><input type="button" value="关闭" id="mergerCancelBtnId" class="btn4"/></div>
</div>
<!-- 合买确认弹出层end -->
<!-- 合买end -->

<div id="surePanalId" style="display:none">

	<div class="content">
		<div class="touZhuQueRen">
	    	<div class="header">
	        	<div class="left"><span class="touzhuh1">投注确认页面</span>
	        		<span>竞彩
	        			<c:choose>
									<c:when test="${licenseId == 10}">
										篮球
									</c:when>
									<c:otherwise>
										足球
									</c:otherwise>
								</c:choose>
	        			－${playName }玩法</span></div>
	            <div class="right"><!--<span>方案截止时间: </span><span class="touzhuh2">2014-03-27 23:57:00</span>--></div>
	        </div>
		      	<div class="touzhucon">
		      	  <table width="100%" border="0">
		      	  	<tr>
		      	  		<td width="65%" valign="top">
		      	  			 <table width="100%" border="0">
		                  <caption>投注信息</caption>
		                  <tr>
		                    <th scope="col" width="70">赛事编号</th>
		                    <th scope="col" width="176">
		                    	<c:choose>
														<c:when test="${licenseId == 10}">
															客队  VS  主队
														</c:when>
														<c:otherwise>
															主队  VS  客队
														</c:otherwise>
													</c:choose>
		                    </th>
		                    <th colspan="1" scope="col" width="331">投注内容</th>
		                    <th scope="col" width="37"> 胆</th>
		                  </tr>
		                  <tbody id="sureSchPanalId"></tbody>
		                </table>
		      	  		</td>
		      	  		<td width="35%" valign="top">
		      	  			 <table width="100%" border="0">
					            <caption>方案信息</caption>
					              <tr>
											    <th scope="row" width="84">过关方式</th>
											    <td id="passShowId"></td>
											  </tr>
											  <tr>
											    <th scope="row">注   数</th>
											    <td id="sureBetNumId"></td>
											  </tr>
											  <tr>
											    <th scope="row">倍   数</th>
											    <td id="sureMultipleId">1 倍</td>
											  </tr>
											  <tr>
											    <th scope="row">方案金额</th>
											    <td id="sureBetMoneyId">0.00元</td>
											  </tr>
											  <tr>
											    <th scope="row">确认投注</th>
											    <td><div class="touzhuqr">
											    	<div id="showBalDivId">账户余额&nbsp;&nbsp;&nbsp;&nbsp;0.00元</div>
											        <div style="line-height:36px;"><a class="button" style="cursor:pointer" id="sureBetBtnId">提交并预约取票</a><a style="cursor:pointer;font-size:12px;" id="returnModId">返回修改该方案</a></div>
											        <div style=" width:100%; font-size:12px; clear:both;"><input id="agreeChkId" name="" type="checkbox" value="agreeId" checked/><a href="/common/agreement.jhtml" target="_blank"><span>《彩店与彩民交易协议》</span></a><br />
											&nbsp;&nbsp;&nbsp;&nbsp;并同意其中条款</div>
											    </div></td>
											  </tr>
									</table>
		      	  		</td>
		      	  	</tr>
		      	  </table>
	    </div>
	</div>

</div>

<!-- 奖金明细 -->
<div class="mingxi" id="BonusDetailAreaId" style="display:none">
  <div class="mxtit"><h1>奖金计算器</h1><span><img src="/images/close1.gif" style="cursor:pointer;" id="closeBonusAreaBtnId"/></span></div>
  <div class="scroll">
  <!--<img src="/images/scroll.gif" width="7" height="100" />--> </div>
  <div class="mxcont">
  	<div class="tztit">
    投注详情［隐藏］
    </div>
    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#1b3745" class="bet_jj">
	  <tr>
	    <td width="67" height="32" align="center" bgcolor="#596e79">赛事编号</td>
	    <td width="175" align="center" bgcolor="#596e79">
	    	<c:choose>
					<c:when test="${licenseId == 10}">
						客队  VS  主队
					</c:when>
					<c:otherwise>
						主队  VS  客队
					</c:otherwise>
				</c:choose>
	    </td>
	    <td width="187" align="center" bgcolor="#596e79">投注内容</td>
	    <td width="121" align="center" bgcolor="#596e79">最小赔率</td>
	    <td width="122" align="center" bgcolor="#596e79"> 最大赔率</td>
	    <td align="center" bgcolor="#596e79">胆</td>
	  </tr>
	</table>
  	<table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#b6b6b6" class="jjtb" >
		<tbody id="bonusAreaSchShowId">
		</tbody>
	  	<tr>
	    	<td height="30" colspan="6" align="center" bgcolor="#FFFFFF" id="bonusBAId">过关方式：  2串1       倍数： 1倍       方案总金额： 34元</td>
	    </tr>
</table>

<div class="tztit">
    奖金明细</div>
    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#1b3745" class="bet_jj" id="bonusTitleAId">
	</table>

  	<table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#b6b6b6" class="jjtb" id="bonusContAId">
	</table>


<div class="tztit" >
    拆分明细</div>
    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#1b3745" class="bet_jj">

  <tr>
    <td width="67" height="32" align="center" bgcolor="#596e79">过关方式</td>
    <td width="66" align="center" bgcolor="#596e79">中奖注数</td>
    <td width="448" align="center" bgcolor="#596e79">中奖明细</td>
    <td align="center" bgcolor="#596e79">奖金</td>
    </tr>
</table>

  	<table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#b6b6b6" class="jjtb" id="bonusDetailSId" style="display:none">

  <tr>
    <td width="67" height="30" align="center" bgcolor="#FFFFFF">3串1</td>
    <td width="66" align="center" bgcolor="#FFFFFF" class="jjvs">1</td>
    <td width="448" bgcolor="#FFFFFF"><div  class="jjnum1">1.44×3.35×1倍×2= <strong>9.64 </strong></div></td>
    <td align="center" bgcolor="#FFFFFF"><span class="jjnum"><strong>102.02</strong>元</span></td>
  </tr>
  <tr>
    <td width="67" height="45" align="center" bgcolor="#FFFFFF">3串1</td>
    <td width="66" align="center" bgcolor="#FFFFFF" class="jjvs">1</td>
    <td width="448" bgcolor="#FFFFFF"><div  class="jjnum1">1.44×3.35×1倍×2= <strong>9.64 </strong></div>
    <div  class="jjnum1">1.44×3.35×1倍×2= <strong>9.64 </strong></div></td>
    <td align="center" bgcolor="#FFFFFF"><span class="jjnum"><strong>102.02</strong>元</span></td>
  </tr>
<tr>
    <td width="67" height="30" align="center" bgcolor="#FFFFFF">合计</td>
    <td width="66" align="center" bgcolor="#FFFFFF" class="jjvs">2</td>
    <td width="448" bgcolor="#FFFFFF">&nbsp;</td>
    <td align="center" bgcolor="#FFFFFF"><span class="jjnum"><strong>102.02</strong>元</span></td>
  </tr>
</table>

  <div class="notice">注：  1、数据仅供参考，最终实际奖金请按照出票后票样的指数计算。<br />
2、该奖金计算中已经包含单一玩法的奖金，仅供参考。</div>
  </div>
</div>
</div>