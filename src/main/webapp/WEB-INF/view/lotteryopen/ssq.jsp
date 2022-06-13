<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="彩票开奖-大乐透开奖" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://101.200.213.247:9380/global/open/11/open.js"></script>
<script>
	var license_type_id = '11';
</script>
</head>
<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<script type="text/javascript" src="/js/lotteryopen/math.js"></script>
		<div class="common_w">
			<div class="hall-top">
				<div class="sitepath fl">
					您当前的位置：
					<a href="/">彩票首页</a> > 开奖信息
				</div>
			</div>
			<div class="sfc_top">
				<div class="sfc_c_c">
					<span class="sfc_b">双色球</span><span class="kjq">第<select
							id="select1"></select>期开奖</span><span id="date0_"></span>
					<a href="/lottery/index.jhtml?licenseId=4"><input type="button" class="liji" value="立即购买" /></a>
				</div>
			</div>
			<div class="jiangjin_">

				<div class="jiangjin_l">
					<div class="sfc_c_l fl">
						<div class="jiangjin_i ssq-logo"></div>
					</div>
					<div class="fl">
						<div class="z_money">
							<p>
								本期销量：
								<span id="money0_"></span>
							</p>
							<p>
								奖池滚存：
								<span id="pool0_"></span>
							</p>
						</div>
						<div class="open_zs ret" id="code0_">
						</div>
					</div>

					<div class="clear"></div>
					<table width="95%" border="0" cellpadding="0" cellspacing="0"
						class="jingjin_b" id="payDesc_"></table>
				</div>
				<jsp:include page="../include/tianjia.jsp"></jsp:include>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear" style="height: 10px"></div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>