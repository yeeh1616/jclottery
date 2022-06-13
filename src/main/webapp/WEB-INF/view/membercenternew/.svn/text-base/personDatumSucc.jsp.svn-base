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
		<c:set var="pageName" value="账户中心-个人信息" scope="page"></c:set>
		<%@include file="../include/titlePage.jsp"%>
		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
		<link href="/css/linkageAddress.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/js/common/base.js"></script>
		<script type="text/javascript" src="/js/membercenternew/personDatumSucc.js"></script>
		<script type="text/javascript" src="/js/membercenternew/linkageAddress.js"></script>
		<style type="text/css">
.inforMessage {
	text-align: left;
	font-size: 14px;
	color: #FF0000;
	height: 20px;
	padding-left: 15px;
	padding-bottom: 5px;
}
</style>
	</head>

	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<div class="common_w">
			<div class="hall-top">
				<div class="sitepath fl">
					您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/safeIndex.jhtml">安全中心</a> > 个人信息
				</div>
			</div>
			<!--用户中心-->
			<div class="user_plant">
				<%@include file="menu.jsp"%>
				<div class="user_r">
					<!--安全等级begin-->
					<div class="gr-safedj">
						<div class="gr-safe-l">个人信息</div>
						<div class="gr-safe-r"><a href="/memberCenterNew/safeIndex.jhtml">&lt;&lt; 返回安全中心</a></div>
						<div class="clear"></div>
					</div>
					<!--安全等级end-->
					<div class="gr-lbody">
						<!--具体信息begin-->
						<div class="safe-xti">
							<div class="safets fl">
								温馨提示：
							</div>
							<div class="tihma fl">
								<p>
									1.个人信息提交后允许更改; 2.您的信息将被严格保密，不会用于任何第三方用途。
								</p>
							</div>
						</div>
						<div class="gr-jtma safe-tw">
							<div class="gr-jtmal">
								<div class="gr-jname">
									用户名：
								</div>
								<div class="r_zs">
									${mb.memberName}
								</div>
								<div class="gr-yt"></div>
							</div>
							<div class="clear"></div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									性别：
								</div>
								<div class="r_zs">
									<input type="radio" name="gender" value="1"
										<c:if test="${mb.gender == 1}">checked="checked"</c:if> />
									男
									<input type="radio" name="gender" value="2"
										<c:if test="${mb.gender == 2}">checked="checked"</c:if> />
									女
									<input type="radio" name="gender" value="0"
										<c:if test="${mb.gender != 1 && mb.gender != 2}">checked="checked"</c:if> />
									保密
								</div>
								<div class="gr-yt"></div>
							</div>
							<div class="clear"></div>

							<div class="gr-jtmal">
								<div class="gr-jname">
									居住地区：
								</div>
								<div class="r_zs">
									<c:choose>
										<c:when test="${customertags:isEmpty(mb.province)== 'false' }">
											<c:set var="province" value="${mb.province}" scope="page"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="province" value="—省份—" scope="page"></c:set>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${customertags:isEmpty(mb.city)== 'false' }">
											<c:set var="city" value="${mb.city}" scope="page"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="city" value="—城市—" scope="page"></c:set>
										</c:otherwise>
									</c:choose>
									<input type="text" name="province" id="province"
										class="user_wbk linkageProvince" value="${pageScope.province}"
										readonly="readonly" />
									<input type="text" name="city" id="city"
										class="user_wbk linkageCity" value="${pageScope.city}"
										readonly="readonly" />
								</div>
								<div class="gr-yt jzdq"></div>
								<div class="inforMessage" id="addressErr"></div>
							</div>
							<div class="clear"></div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									昵称：
								</div>
								<div class="r_zs">
									<input id="nickName" name="nickName" class="user_wbtwo"
										type="text" value="${mb.nickName}" />
								</div>
								<div class="gr-yt jzdq"></div>
								<div class="inforMessage" id="nickNameErr"></div>
							</div>
							<div class="clear"></div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									QQ号码：
								</div>
								<div class="r_zs">
									<input id="qq" name="qq" class="user_wbtwo" type="text"
										value="${mb.qq}" />
								</div>
								<div class="gr-yt jzdq"></div>
								<div class="inforMessage" id="qqErr"></div>
							</div>
							<div class="clear"></div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									手机号码：
								</div>
								<div class="r_zs">
									<input id="phone" name="phone" class="user_wbtwo" type="text"
										value="${mb.phone}" />
								</div>
								<div class="gr-yt"></div>
								<div class="inforMessage" id="phoneErr"></div>
							</div>

							<div class="clear"></div>
							<div class="safe-ts">
								中大奖后，方便彩站及时通知您。
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									安全邮箱：
								</div>
								<div class="r_zs">
									<input id="email" name="email" class="user_wbtwo" type="text"
										value="${mb.email}" />
								</div>
								<div class="gr-yt jzdq"></div>
								<div class="inforMessage" id="emailErr"></div>
							</div>
							<div class="clear"></div>
							<div class="clear"></div>
							<div class="safe-ts">
								忘记登录密码时，可通过邮箱找回您的密码。
							</div>
							<div class="safe-an">
								<a id="personDatumSubmit">提交</a></a>
							</div>
						</div>
						<!--具体信息end-->

					</div>
				</div>
				<div class=" clear"></div>
				<!--用户中心 end-->
			</div>
		</div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
		</body>
</html>
