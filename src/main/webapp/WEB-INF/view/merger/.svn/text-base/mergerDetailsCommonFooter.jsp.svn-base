<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!-- 中奖情况beging -->
<div class="zhong_q" style="height:87px;">
   	<div class="zhong_ql" style="height:87px;">中奖情况</div>
       <div class="zhong_qr">
       <p class="q_red">${fn:replace(lo.stateName,'未生成','未满员') }</p>
       <!--<p>共<span class="q_red">3</span>场, 过关方式： <span class="q_red">2串1</span>, 中<span class="q_red">250</span>注</p>-->
       <c:if test="${lo.betState == '10' || lo.betState == '12' || lo.betState == '13'}">
       <p>方案中奖金额：<span class="q_red">￥${hrb.bonusAftTax }</span>(税后)<br/>
       	发起人提成：<span class="q_red">￥${hrb.brok }</span>,
       	每元派送<span class="q_red">￥${hrb.perBonus }</span></p>
       </c:if>
       </div>
   </div>
			<!-- 中奖情况end -->
			<div class="con_6">
		<div class="con_6_l gy"><p>认购记录</p></div>
		<div class="con_6_r">
				<div class="con_6_r_t">
						<a style="cursor: pointer;"><input type="button" value="参与总人数${pagination.totalCount}人" class="btn2"/></a>
						<a style="cursor: pointer;"><input type="button" value="我的认购记录" name="purchaseRecords" class="btn3 current"/></a>
				</div>
				<div class="con_6_r_f">
						<table width="818" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff" class="bge_n">
								<tbody><tr>
										<td width="63" height="32" class="bge11">序号</td>
										<td width="154" class="bge11">用户名</td>
										<td width="106" class="bge11">认购金额 </td>
										<td width="96" class="bge11">认购比例 </td>
										<td width="117" class="bge11">派奖金额 </td>
										<td width="218" class="bge11">认购时间 </td>
										<td width="101" class="bge11">操作</td>
								</tr>
								<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
								<c:choose>
									<c:when test="${varStatus.count%2==0}">
										<tr bgcolor="#f4fbff">
									</c:when>
									<c:otherwise>
										<tr bgcolor="#FFFFFF">
									</c:otherwise>
								</c:choose>
									<td height="30" class=" biaoge4">${varStatus.count}</td><!-- 序号 -->
									<td >${fn:substring(list.joinUsername,0,2)}**</td><!-- 用户名 -->
									<td >${list.joinPrice}</td><!-- 认购金额 -->
									<td><fmt:formatNumber type="number" value="${(list.joinNum/mo.totalNum)*100}" maxFractionDigits="0"/>%</td><!-- 认购比例 -->
									<td><fmt:formatNumber value="${list.bonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></td><!-- 派奖金额 -->
									<td>${list.joinDate}</td><!-- 认购时间 -->
									<td>--</td><!-- 操作 -->
								</tr>
								</c:forEach>
								
						</tbody></table>
				</div>
				<div class="con_6_r_ff">
				<form id="reportForm" name="reportForm" action="/merger/mergerOrderDetails.jhtml" method="post">
					<input type="hidden" id="mergerOrderId" name="mergerOrderId" value="${mo.id}" />
					<input type="hidden" id="licenseId" value="${lo.licenseId}" />
				</form>
				<p>已认购 <span>${mo.buyNum}</span> 份，共<span>${mo.singlePrice * mo.buyNum}</span>元
				<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
				</p></div>
		</div>
		<div style="clear:both;"></div>
</div>

