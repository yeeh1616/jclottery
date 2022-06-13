<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

	<div class="con_t">
			<div class="con_t_l">
					<h3><span>${lo.virtualName }</span>的${lo.licenseName}  方案详情</h3>
					<p>方案编号：${mo.id }</p>
			</div>
			<div class="con_t_r">
					<p>发起时间：${lo.orderDate }</p>
					<p class="rengou">认购截至时间：${mo.reserved2 }</p>
			</div>
			<div class="clear"></div>
	</div>
	<div class="con_1">
			<div class="con_1_l gy">发起人信息</div>
			<div class="con_1_r">
					<p><span class="blue">发起人：<a href="/merger/pindex.jhtml?uuid=${mo.userid }" target="_blank">${lo.virtualName }</a>
					<span class="dzrq_n"> 
						<c:forEach begin="1" step="1" end="${hrb.level}" varStatus="varStatus">
						<a  class="huangguan_n" href="/merger/pindex.jhtml?uuid=${mo.userid }" target="_blank"></a> 
						</c:forEach>
						<c:forEach begin="1" step="1" end="${hrb.lastLevel}" varStatus="varStatus">
						<a href="javascript:void 0" class="huangguan_l"></a> 
						</c:forEach>
						<span class="dzrq_m">定制人气：
						<span class="red">${hrb.cusNum }</span>人 
						<a href="javascript:void 0" class="dzrq_blue" id="cusBtnId">我要定制</a>
					</span></span></span><br>
					<span class="blue">认购份数：${mo.launchNum}</span></br>
					<span class="blue">方案描述：${mo.partDetail }</span></p>
					<p><!-- 定制人数：<span class="red">50人</span> <span class="blue">我要定制</span> 关注人数：<span class="red">50人</span> <span class="blue">我要关注</span>--> <a style="cursor:pointer">
							<input type="hidden" value="" id="curentUrl"/>
							<input type="button" value="复制方案地址" id="copyurl" data-clipboard-target="curentUrl"/>
							</a></p>
			</div>
			<div class="clear"></div>
	</div>
	<div class="con_2">
			<div class="con_2_l gy">方案进度</div>
			<div class="con_2_r">
					<div class="con_2_r1">
							<div class="con_2_r1_l">
									<!--<p>认购截至还有：2天7小时3分钟</p>-->
							</div>
							<!-- <div class="con_2_r1_r">方案进度帮助
							<a style="cursor:pointer"><img width="18" height="18" src="/images/chkan/xiaowen.png"/></a></div> -->
							<input type="hidden" id="isMeetTheTopOfMergerNumber" name="isMeetTheTopOfMergerNumber" value="${mo.buyNum >= mo.totalNum}"/>
							<input type="hidden" id="stateOfTickets" name="stateOfTickets" value="${lo.betState}"/>
					</div>
					<div class="clear"></div>
					<div class="fajd">
					<div class="fajd1"><img id="imgOfProcess01" width="26" height="26" src="/images/chkan/jindu2.png"/></div>
					<div class="fajd2"><img id="imgOfProcess02" width="145" height="6" src="/images/chkan/images/jindu3_03.jpg"/></div>
					<div class="fajd3"><img id="imgOfProcess03" width="26" height="26" src="/images/chkan/jindu1.png"/></div>
					<div class="fajd4"><img id="imgOfProcess04" width="145" height="6" src="/images/chkan/images/jindu3_03.jpg"/></div>
					<div class="fajd5"><img id="imgOfProcess05" width="26" height="26" src="/images/chkan/jindu1.png"/></div>
					<div class="fajd6"><img id="imgOfProcess06" width="145" height="6" src="/images/chkan/images/jindu3_03.jpg"/></div>
					<div class="fajd1"><img id="imgOfProcess07" width="26" height="26" src="/images/chkan/jindu1.png"/></div>
					<div class="fajd2" id="backgroundProcess08"><img id="imgOfProcess08" width="145" height="6" src="/images/chkan/images/jindu3_03.jpg"/></div>
					<div class="fajd1" id="backgroundProcess09"><img id="imgOfProcess09" width="26" height="26" src="/images/chkan/jindu1.png"/></div>
					</div>
					<div class="fq">
						<ul>
							<li class="fq1" id="prizeResult01">未满员</li>
							<li class="fq1" id="prizeResult02">已满员</li>
							<li class="fq1" id="prizeResult03">已出票</li>
							<li class="fq1" id="prizeResult04">预计开奖</li>
							<li class="fq1 dengdai" id="prizeResult05">等待派奖</li>
						</ul>
					</div>
			</div>
			<div class="clear"></div>
	</div>
	<div class="con_3">
			<div class="con_3_l gy">方案信息</div>
			<div class="con_3_r">
					<div class="xinxi">
							<table width="836" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff" class="biaoge">
									<tbody><tr>
											<td width="60" height="31" class="biaoge1">方案金额</td>
											<!-- <td width="53" class="biaoge1">投注方式</td> -->
											<td width="28" class="biaoge1">注数</td>
											<td width="42" class="biaoge1">倍数</td>
											<td width="42" class="biaoge1">保底</td>
											<td width="55" class="biaoge1">提成比例</td>
											<td width="60" class="biaoge1">发起人认购 </td>
											<td width="60" class="biaoge1">已认购人数</td>
											<td width="60" class="biaoge1">方案状态</td>
											<td width="60" class="biaoge1">出票状态</td>
											<!-- <td width="72" class="biaoge1">中奖情况</td> -->
											<td width="75" class="biaoge1">保密类型</td>
									</tr>
									<tr>
											<td height="31">${mo.betPrice} </td>
											<!-- <td>复式 ？</td> -->
											<td>${lo.betNum }</td>
											<td>${lo.multiple} </td>
											<td>${mo.insNum}</td>
											<!-- <td>${mo.brokerage * 100}%</td> -->
											<c:choose>
												<c:when test='${mo.brokerage <= 0}'>
											         <td>无提成</td>
											    </c:when>
											    <c:otherwise>
											    	<td><fmt:formatNumber type="number" value="${mo.brokerage*100}" maxFractionDigits="0"/>%</td><!-- 提成 -->
											    </c:otherwise>
											</c:choose>
											<td>${mo.launchNum}</td>
											<td><span class="red">${pagination.totalCount}</span>人</td>
											<td><span class="red">
											<c:choose>
      											<c:when test="${mo.state == '1'}">未满员</c:when>
      											<c:when test="${mo.state == '2'}">已满员</c:when>
      											<c:when test="${mo.state == '3'}">已撤单</c:when>
      										</c:choose>(${mo.showProgress})</span></td>
											<td>${lo.stateName}</td>
											<!-- <td>中奖情况?</td> -->
											<td>${mo.showLevelName}</td>
									</tr>
							</tbody></table>
					</div>
			</div>
			<div class="clear"></div>
	</div>
	<c:choose>
	<c:when test="${mo.state == '1'}">
		<div class="con_4">
				<li>
						<p>认购进度：</p>
						<div class="jindu"><span></span></div>
						<p>${mo.showProgress}</p>
						<c:if test="${lo.theoryBonus != null && (lo.licenseId == 9 || lo.licenseId == 10)}">
							<p class="jingjin">最高理论奖金：<span class="red">${lo.theoryBonus }</span>元</p>
						</c:if>
						<c:if test="${sessionScope.member.id == mo.userid}">
							<p class="jingjin">
								<input type="checkbox" id="zjSetBtnId"/>追加保底<img src="/images/new.gif" width="18" height="18"/>
								<span id="baoSetViewId" style="display:none">保底份数：<input type="text" id="baodiNumId" class="text" value="" name="baodiNum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								<a href="javascript:void 0" id="zjSubmitId" style="width: 50px;height: 21px;background:#F6FAD6;;line-height: 21px;text-align: center;display:inline-block;font-size:12px;border-radius:3px;border: 1px solid #c9c9c9;color: #525252 !important;">提交</a>
								
								</span>
							</p>
							<p class="jingjin">
								<a href="javascript:void 0" id="cancelBtnId">我要撤单</a><img src="/images/new.gif" width="18" height="18"/>
							</p>
						</c:if>
						<div class="clear"></div>
				</li>
				<li>						
				我要认购： 
				<input type="text" id="mergerNum" class="text" value="" name="mergerNum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
				(剩余${mo.totalNum - mo.buyNum }份)<!--       预计奖
						金：<span class="red">0</span> - <span class="red">0</span>元（奖金中不包括发起人提成） --></li>
				<li>用户名：
					<c:if test="${sessionScope.member.memberName != null && sessionScope.member.memberName != ''}">
						<span>${sessionScope.member.memberName}</span>
					</c:if></li>
				<!-- <li>目前您的账户余额是 ¥ <span class="red">0.00 </span> <a href="#" class="blue">[ 充值 ]</a> </li> -->
				<li><input type="checkbox" id="checkboxProtocol" checked>
						我已阅读了<span><a href="/common/agreement.jhtml" class="blue">《用户服务协议》</a></span>并同意其中条款</li>
						
				<input type="button" name = "mergerjoin" class="btn1" value="确认投注">
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>

