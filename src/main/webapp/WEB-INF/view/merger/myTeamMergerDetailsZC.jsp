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
				<div class="con_t">
						<div class="con_t_l">
								<h3><span>${lo.username }</span>的${lo.licenseName}  方案详情</h3>
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
								<p><span class="blue">发起人：<a href="/merger/pindex.jhtml?uuid=${mo.userid }" target="_blank">${lo.username }</a>
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
												<tbody>
												<tr>
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
														    	<td>${mo.brokerage * 100}%</td><!-- 提成 -->
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
				<div class="con_5">
					<div class="con_5_l gy"><p>投注内容</p></div>
					
					<input type="hidden" class="text" value="${mo.id}" name="orderId"/>
					<input type="hidden" class="text" value="${mo.showLevel}" name="showLevel"/>
					<input type="hidden" class="text" value="${mo.totalNum - mo.buyNum}" name="restNum"/>
					<input type="hidden" class="text" value="${mo.totalNum}" name="totalNum"/>
					<input type="hidden" class="text" value="${mo.partTitile}" name="partTitile"/>
					<input type="hidden" class="text" value="${mo.singlePrice}" name="price"  id="singlePrice"/>
					<input type="hidden" class="text" value="${mo.licenseName}" name="licenseName"/>
					<input type="hidden" class="text" value="${mo.issue}" name="issue"/>
					<input type="hidden" class="text" value="${mo.userid}" id="userid"/>
					
					<div class="con_5_r">
								<div class="con_5_r_t">投注详情</div>
								<div class="con_5_r_f2">
								<input type="hidden" value="${IsShowContent}" name="IsShowContent"/>
									<c:if test="${IsShowContent == 'show' && lo.betType == 3 && lo.singleFlag == 0 && (mo.licenseId != 9 && mo.licenseId != 10)}">
										<table width="845" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff" class="zc_bge">
										<tbody>
										<c:choose>
											<c:when test="${lo.licenseId == '7'}">
												<tr>
													<td class="zc_bge1" rowspan="2">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>(半)<br/>${zcListItem.hostTeam}</td>
													<td>(全)<br/>${zcListItem.hostTeam}</td>
													</c:forEach>
												</tr>
												<tr class="zc_bge3">
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>${zcListItem.guestTeam}<br/>(半)</td>
													<td>${zcListItem.guestTeam}<br/>(全)</td>
													</c:forEach>
												</tr>
											</c:when>
											<c:when test="${lo.licenseId == '8'}">
												<tr>
													<td class="zc_bge1" rowspan="1">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>(主)<br/>${zcListItem.hostTeam}</td>
													<td>(客)<br/>${zcListItem.guestTeam}</td>
													</c:forEach>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td class="zc_bge1" rowspan="2">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td><br/>${zcListItem.hostTeam}</td>
													</c:forEach>
												</tr>
											<tr class="zc_bge3">
												<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
												<td>${zcListItem.guestTeam}<br/></td>
												</c:forEach>
											</tr>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${mo.uploadType == 1}">
												<tr>
													<td></td>
													<td colspan="14" style="padding:5px;">
														<c:choose>
															<c:when test="${sessionScope.member.id == mo.userid}">
																 <div>
														            <font color=red>请及时上传方案</font><span id="fileuplodid" style="display: none;" width="101" height="31"></span>
														            <span id="fileQueue" ></span>
														         </div> 
															</c:when>
															<c:otherwise>
																方案未上传
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="betCodeList" items="${betCodeLists}" varStatus="varStatus">
													<tr>
														<td>投注项</td>
														<c:forEach var="item" items="${betCodeList}" varStatus="varStatus">
														<td class="zc_bge2">${item}</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										
										</tbody></table>
									</c:if>
									<c:if test="${IsShowContent == 'show' && lo.betType == 3 && lo.singleFlag != 0 && lo.betCode !='' }">
										<input type="hidden" name="betCode" value="${lo.betCode}"/>
										<input class="btn2" type="button" name="downLoad" value="保存投注详情到文本"/>
									</c:if>
									
									<c:if test="${mo.uploadType == 1}">
										<table width="845" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff" class="zc_bge">
										<tbody>
										<c:choose>
											<c:when test="${lo.licenseId == '7'}">
												<tr>
													<td class="zc_bge1" rowspan="2">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>(半)<br/>${zcListItem.hostTeam}</td>
													<td>(全)<br/>${zcListItem.hostTeam}</td>
													</c:forEach>
												</tr>
												<tr class="zc_bge3">
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>${zcListItem.guestTeam}<br/>(半)</td>
													<td>${zcListItem.guestTeam}<br/>(全)</td>
													</c:forEach>
												</tr>
											</c:when>
											<c:when test="${lo.licenseId == '8'}">
												<tr>
													<td class="zc_bge1" rowspan="1">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td>(主)<br/>${zcListItem.hostTeam}</td>
													<td>(客)<br/>${zcListItem.guestTeam}</td>
													</c:forEach>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td class="zc_bge1" rowspan="2">对阵</td>
													<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
													<td><br/>${zcListItem.hostTeam}</td>
													</c:forEach>
												</tr>
											<tr class="zc_bge3">
												<c:forEach var="zcListItem" items="${zcList}" varStatus="varStatus">
												<td>${zcListItem.guestTeam}<br/></td>
												</c:forEach>
											</tr>
											</c:otherwise>
										</c:choose>
												<tr>
													<td></td>
													<td colspan="14">
														<c:choose>
															<c:when test="${sessionScope.member.id == mo.userid}">
																 <div>
														            <font color=red>*若方案为单式号码，请及时上传方案</font><span id="fileuplodid" style="display: none;" width="101" height="31"></span>
														            <span id="fileQueue" ></span>*<font color=red>如方案为复式，请及时选择号码<a href="javascript:void 0" id="fsscBtnId" style="width:98px;height:35px;display: inline-block;color: #fff !important;
text-align: center;margin-top: 8px;border-radius: 3px;font-size: 16px;line-height:35px;
font-weight: bold;
margin-right:2px;background:#2E94C8;">选择号码</a></font>
														            <a name ="copygtips" href=" javascript:void(0)" value="0" class="w_djt"></a>
														         </div> 
															</c:when>
															<c:otherwise>
																方案未上传
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
										</tbody></table>
									</c:if>
								</div>
						</div>
						<div style="clear:both;"></div>
				</div>
				
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
													<td >${list.joinUsername}</td><!-- 用户名 -->
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
				<!-- <div class="con_7">
					<div class="con_7_l gy">其他信息</div>
					<div class="con_7_r">
						<div class="con_7_r_l">方案宣言：</div>
						<div class="con_7_r_r"><input type="text"/></div>
						<div class="clear"></div>
						<p>认购对象：<span>所有人均可认购</span></p>
					</div>
				</div> -->
		</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
<script type="text/javascript" src="/js/merger/myPurchaseRecords.js"></script>
<script type="text/javascript" src="/js/merger/showSchemeProcessBar.js"></script>
<script type="text/javascript" src="/js/merger/ZeroClipboard.js"></script>  
<script type="text/javascript" src="/js/merger/mergerOrderDetailsHeight.js"></script>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
<script type="text/javascript">
$("#fileuplodid").uploadify({
	'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
	'script':'/lottery/frsSingleFstUpload.do',//后台处理的请求
	'cancelImg' :'/js/lottery/upload/images/cancel.png',//取消按钮图片
	'folder': '',
	'fileDataName' : 'file',
	'buttonImg' : '/cytxhome/images/sc_button.jpg',
	'width':121,
	'height':51,
	'multi': false,// 设置单文件上传或多文件上传
	'queueID' : "fileQueue",
	'displayData': 'speed',
	'method' : 'POST',
	'scriptData' : {"orderId":$('#mergerOrderId').val(),"licenseId":$('#licenseId').val()},
	'auto' : true,
	'fileDesc' : '*.txt',//上传文件类型说明
	'fileExt' : '*.txt',
	'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
	onError: function (event, queueID ,fileObj, errorObj) {
		alert("文件上传失败");
		return false;
	},
	onComplete: function (event, queueID ,fileObj, response, data) {
		eval( "var bet = " + response + ";" );
		if ( bet.errCode == 1 ) {
			alert("文件上传成功!");
			location.reload();
		} else {
			layer.alert(bet.message,0);
		}
	}
});
$('a[name=copygtips]').on('mouseover', function(){
	tipsLayer = layer.tips("310,3,10,10,0,0,1,310,3,10,10,0,0,1<br>310,#,10,10,#,#,1,#,3,10,10,0,0,1", this, {
        guide: 1,
        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
        maxWidth:620
        //closeBtn:[0, true]
    });
}).on('mouseout',function(){
	layer.close(tipsLayer);
});
$("#fsscBtnId").click(function (){
	var title ='请选择号码';
	var url = "/lottery/index.jhtml?licenseId=${lo.licenseId}&p=fssc&orderId=${mo.id}";
	$.layer({
	    type: 2,
	    maxmin: true,
	    shadeClose: true,
	    title: title,
	    fix : false,
	    shade: [0.1,'#000'],
	    offset: ['20px',''],
	    area: ['986px', ($(window).height() - 90) +'px'],
	    iframe: {src:url},
	    end: function(index){
	    	location.reload();
	    	layer.close(index);
	    }
	}); 
});
</script>
</body>
</html>
