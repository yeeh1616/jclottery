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
		<c:set var="pageName" value="投注成功" scope="page"></c:set>
		<%@include file="../include/titlePage.jsp"%>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>

		<div class="memberbox">
			<div class="tzgl" style="width: 100%">
				<div class="uindex">

					<div class="scleft">

						<div class="bd_scuess">
							<div class="sctxt">
								提交成功
							</div>
							<div class="scntic">
								<h1>
									<c:choose>
										<c:when
											test="${sessionScope.member.memberFrom == '5' && sessionScope.member.level == '1' }">
											<b style="color: red">您是营业厅用户，请到‘购彩记录’中确认您的方案。</b>
											<br>
										</c:when>
										<c:otherwise>
											<tr bgcolor="#FFFFFF">
												方案订单提交成功，请注意查看出票状态并尽快预约取票。
												<br>
										</c:otherwise>
									</c:choose>
								</h1>
								<div class="bdxinxi">
									本次投注：
									<strong style="font-size: 16px; vertical-align: -2px;">
										${order.betPrice }</strong> 元
									<br />

									<strong><font color=red id="errMsgId"> <c:if
												test="${order.reserved10 != null }">
              	店铺目前处于锁定管理状态，请立即联系店主后完成您的投注。
              </c:if> </font> </strong>
									<!--账户余额：<strong> 10.00</strong> 元<br />
              红包余额：  <strong>10.00</strong> 元<br />-->
									<br />
									<!--<a href="#">返回继续购买</a> |-->
									<a
										href="/memberCenterNew/orderDetail.jhtml?orderId=${order.id }&LicenseId=${order.licenseId}">查看方案详情</a>
									|
									<a href="/memberCenterNew/purchasList.jhtml">我的购彩记录</a>
								</div>
							</div>
						</div>



						<div class="wxts">
							<h1>
								温馨提示：
							</h1>
							1：
							凤凰微彩只负责平台的技术支持，通过平台交易的主体是彩民与彩站，彩民购彩成功后请务必及时到实体店取票，因为彩民不取票而发生的任何纠纷与平台无关
							<br />
							2： 平台提供的数据(例:竞彩赔率，让球，让分，预设总分等)仅为参考，最终数据按实体店为彩民出票后的票面数据为准
						</div>

					</div>

				</div>

			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>

		<jsp:include page="../include/footer.jsp"></jsp:include>

		<c:if test="${order.reserved10 != null }">
			<script type="text/javascript">
	//alert($("#errMsgId").html());
	popupConfirm("温馨提示", $("#errMsgId").html());
</script>
		</c:if>
	</body>
</html>