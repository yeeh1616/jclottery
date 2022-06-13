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
								<div class="con_5_r_t">投注详情</div>
								<div class="con_5_r_f">
								<input type="hidden" value="${IsShowContent}" name="IsShowContent"/>
									<c:if test="${IsShowContent == 'show' && lo.betType == 3 && lo.singleFlag == 0 && (mo.licenseId != 9 && mo.licenseId != 10)}">
										<c:forEach var="szcListItem" items="${szcList}" varStatus="varStatus">
											<p>${szcListItem}</p>
										</c:forEach>
									</c:if>
									<c:choose>
											<c:when test="${mo.uploadType == 1}">
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
											</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
									<c:if test="${IsShowContent == 'show' && lo.betType == 3 && lo.singleFlag != 0 && mo.uploadType ne 1 }">
										<input type="hidden" name="betCode" value="${lo.betCode}"/>
										<input class="btn2" type="button" name="downLoad" value="保存投注详情到文本"/>
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
	'buttonImg' : '/js/lottery/upload/images/upload.gif',
	'width':101,
	'height':31,
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
</script>
</body>
</html>
