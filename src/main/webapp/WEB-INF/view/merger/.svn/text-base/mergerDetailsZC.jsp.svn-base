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
				<jsp:include page="./mergerDetailsCommonFooter.jsp"></jsp:include>
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
