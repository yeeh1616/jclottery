<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-中奖记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/ckxqym.css" rel="stylesheet" type="text/css" />
<link href="/css/style3.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="banxin">
		<div class="con">
				<jsp:include page="./mergerDetailsCommon.jsp"></jsp:include>
				<div class="con_5">
					<div class="con_5_l gy"><p>投注内容</p></div>
					
						<input type="hidden" class="text" value="${mo.id}" name="orderId"/>
						<input type="hidden" class="text" value="${mo.showLevel}" name="showLevel"/>
						<input type="hidden" class="text" value="${mo.totalNum - mo.buyNum}" name="restNum"/>
						<input type="hidden" class="text" value="${mo.totalNum}" name="totalNum"/>
						<input type="hidden" class="text" value="${mo.partTitile}" name="partTitile"/>
						<input type="hidden" class="text" value="${mo.singlePrice}" name="price" id="singlePrice"/>
						<input type="hidden" class="text" value="${mo.licenseName}" name="licenseName"/>
						<input type="hidden" class="text" value="${mo.issue}" name="issue"/>
						<input type="hidden" class="text" value="${mo.userid}" id="userid"/>
					
					<div class="con_5_r">
						<div class="con_5_r_t">投注详情<span>选择场次：${numberOfGames}场  玩法类型：${playType}（${fn:replace(lo.passType, 'c', '串') }）</span></div>
						<div class="con_5_r_f" >
						<input type="hidden" value="${IsShowContent}" name="IsShowContent"/>
								<table width="845" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff" class="jc_bge">
								<tbody>
									
									<c:choose>
										<c:when test="${mo.uploadType == 1}">
											<c:choose>
												<c:when test="${sessionScope.member.id == mo.userid}">
														<c:if test="${lo.playType != '6'}">
											            <font color=red>请上传方案</font>
											            <c:if test="${lo.licenseId == 9}">
											            或者<input type="button" value="复式投注" id="fsscBtnId"/>
											            </c:if>
											            <input type="hidden" id="aheadTimeId" value="0"/>
											            <input type="hidden" id="ndateValId" value="${ndate }"/>
											            <input type="hidden" id="playTypeId" value="${order.playType }"/>
												         <div class="w_ggfs">
												            <div class="w_ggfs_c n_btop"><span class="w_peim ">1</span>选择场次</div>
												            <div id="dsSchDivId"></div>
												             
												            <div class="w_ggfs_c"><span class="w_peim">2</span>选择过关方式</div> 
												            <div class="w_ggfsc_fxc" id="dsPassTId">
												           		 <ul>
												            		<li><input type="radio" name="dsPtName" value="2"/><a href="javascript:void 0">2串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="3"/><a href="javascript:void 0">3串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="4"/><a href="javascript:void 0">4串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="5"/><a href="javascript:void 0">5串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="6"/><a href="javascript:void 0">6串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="7"/><a href="javascript:void 0">7串1</a></li>
												                    <li><input type="radio" name="dsPtName" value="8"/><a href="javascript:void 0">8串1</a></li>
												                	<div class="clear"></div>
												            	</ul>
												            </div>
												
												            <div class="w_ggfs_c"><span class="w_peim">3</span>上传文件</div> 
																<div class="w_ggfsc_fx">
																<div class="sc_btn">
																 <span id="fileuplodid" style="display: none;" width="121" height="51"></span>
																		            <span id="fileQueue" ></span>
																<div class="ckgs">
																<c:if test="${lo.licenseId == 9}">
																<a href="/playerintro/ds.jhtml" target="_blank">查看上传格式</a>
																</c:if>
																<c:if test="${lo.licenseId == 10}">
																<a href="/playerintro/lqds.jhtml" target="_blank">查看上传格式</a>
																</c:if>
																</div>
																</div>
												         </div> 
												        </div>
											            </c:if>
											            <c:if test="${lo.playType == '6'}">
											           请选择<input type="button" value="复式投注" id="fsscBtnId"/>
											            </c:if>
												</c:when>
												<c:otherwise>
													方案未上传
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
										
											<tr class="jc_bge1">
												<td class="jc_bge3">场次</td>
												<c:choose>
													<c:when test="${lo.licenseId == 10}"><!-- 篮球 -->
														<td>客队</td>
														<td>主队</td>
													</c:when>
													<c:otherwise>
														<td>主队</td>
														<td>客队</td>
													</c:otherwise>
												</c:choose>
												<td>半场比分</td>
												<td>全场比分</td>
												<td>投注项 </td>
												<td>设胆</td>
											</tr>
											<c:if test="${IsShowContent == 'show' }">
											<c:forEach var="list" items="${jcList}" varStatus="varStatus">
												<tr class="jc_bge2">
													<td height="42">${list.schdule}</td>
													<c:choose>
													<c:when test="${lo.licenseId == 10}"><!-- 篮球 -->
													<td>${list.guestTeam}</td>
													<td>${list.hostTeam}</td>
													</c:when>
													<c:otherwise>
														<td>${list.hostTeam}</td>
													<td>${list.guestTeam}</td>
													</c:otherwise>
												</c:choose>
													<td>${list.halfScore}</td>
													<td>${list.allScore}</td>
													<td> <span>${list.showBetItemForJC}</span></td>
													<td>${list.isDan}</td>
												</tr>
											</c:forEach>
											
												<tr class="jc_bge2">
													<td colspan=7><a oid="${lo.id }" lid="${lo.licenseId }" id="lookticketId" href="javascript:void 0" style="width:98px;height:35px;display: inline-block;color: #fff !important;
text-align: center;margin-top: 8px;border-radius: 3px;font-size: 16px;line-height:35px;
font-weight: bold;
margin-right:2px;background:#2E94C8;margin-bottom:8px;">出票详情</a></td>
												</tr>
											</c:if>
										</c:otherwise>
									</c:choose>
									
							   </tbody></table>
							
						</div>
					</div>
					<div style="clear:both;"></div>
				</div>
    			<jsp:include page="./mergerDetailsCommonFooter.jsp"></jsp:include>
		</div>
</div>
<input type="hidden" id="dplayId" value="${lo.playType }"/>
<input type="hidden" id="licenseId" value="${lo.licenseId }"/>
<input type="hidden" id="playTypeId" value="${lo.playType }"/>
<input type="hidden" id="orderId" value="${mo.id }"/>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
<script type="text/javascript" src="/js/merger/myPurchaseRecords.js"></script>
<script type="text/javascript" src="/js/merger/showSchemeProcessBar.js"></script>
<script type="text/javascript" src="/js/merger/ZeroClipboard.js"></script> 
<script type="text/javascript" src="/js/merger/mergerOrderDetailsHeight.js"></script>

<c:if test="${mo.uploadType == 1}">
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<c:if test="${lo.licenseId == 9}">
<script type="text/javascript" src="http://101.200.213.247:9380/global/schudle/9/schedules.js?time=new Date().getTime()"></script>
</c:if>
<c:if test="${lo.licenseId == 10}">
<script type="text/javascript" src="http://101.200.213.247:9380/global/schudle/10/schedules.js?time=new Date().getTime()"></script>
</c:if>
<script type="text/javascript" src="/js/lottery/guess/GuessFootballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/guess/common.js"></script>
<script type="text/javascript" src="/js/merger/mergerDetailJc.js"></script>
</c:if>
</body>
</html>
