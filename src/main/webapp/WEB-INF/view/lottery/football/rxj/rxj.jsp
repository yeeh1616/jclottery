<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld"
	prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="足彩-任选九" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp"%>
<link type="text/css" rel="stylesheet" href="/css/buy.css" />
</head>
<body class="laozu_bg">
	<jsp:include page="../../../include/header.jsp"></jsp:include>
	<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
	<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
	<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
	<script type="text/javascript" src="/js/lottery/football/Football.js"></script>
	<script type="text/javascript" src="/js/merger/Merger.js"></script>
	<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/5/${game.issue }.js"></script>
	<script type="text/javascript" src="/js/lottery/football/rxj/pageControl.js"></script>
	<script type="text/javascript" src="/js/lottery/football/pubPageControl.js"></script>
	<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
	<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>

	<div class="">
		<div class="common_w" id="betPanalId">
			<div class="jz_top">
				<div class="jz_tz fl">
					<div class="ren9-logo"></div>
				</div>
				<jsp:include page="../header.jsp" />
				<div class="small_fb"></div>
			</div>
			<div class="sais_t"></div>
			<div class="sais_c">
				<jsp:include page="./header.jsp"></jsp:include>
				<div class="pttz">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="table pttztb" id='zcSchAreaId'>
					</table>
				</div>
			</div>
			<jsp:include page="../licensefooter.jsp" />
		</div>
		<jsp:include page="../surepage.jsp"></jsp:include>
		<jsp:include page="../../lotteryForm.jsp"></jsp:include>
	</div>
	<jsp:include page="../../../include/footer.jsp"></jsp:include>
</body>
</html>