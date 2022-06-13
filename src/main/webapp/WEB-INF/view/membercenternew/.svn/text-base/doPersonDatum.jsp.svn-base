<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<c:set var="pageName" value="账户中心-彩民基本信息修改" scope="page"></c:set>
		<%@include file="../include/titlePage.jsp"%>
		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<div class="common_w">
			<div class="hall-top">
				<div class="sitepath fl">
					您当前的位置：
					<a href="/memberCenterNew/index.jhtml">用户中心</a> >
					<a href="/memberCenterNew/safeIndex.jhtml">安全中心</a> > 个人信息
				</div>
			</div>
			<!--用户中心-->
			<div class="user_plant">
				<%@include file="menu.jsp"%>
				<div class="user_r">
					<!--安全等级begin-->
					<div class="gr-safedj">
						<div class="gr-safe-l">
							个人信息
						</div>
						<div class="gr-safe-r">
							<a href="/memberCenterNew/safeIndex.jhtml">&lt;&lt; 返回安全中心</a>
						</div>
						<div class="clear"></div>
					</div>
					<!--安全等级end-->
					<div class="gr-lbody">
						<!--具体信息begin-->
						<div class="safe-xti safebor">
							<div class="safe_succ fl"></div>
							<div class="safe_tex fl">
								您好，个人信息修改成功！
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
								<div class="clear"></div>
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									性别：
								</div>
								<div class="r_zs">
									<c:choose>
										<c:when test="${mb.gender == 1}">男</c:when>
										<c:when test="${mb.gender == 2}">女</c:when>
										<c:otherwise>保密</c:otherwise>
									</c:choose>
								</div>
								<div class="clear"></div>
							</div>

							<div class="gr-jtmal">
								<div class="gr-jname">
									居住地区：
								</div>
								<div class="r_zs">
									${mb.province}&nbsp;${mb.city}
								</div>
								<div class="clear"></div>
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									QQ号码：
								</div>
								<div class="r_zs">
									${mb.qq}
								</div>
								<div class="clear"></div>
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									昵称：
								</div>
								<div class="r_zs">
									${mb.nickName}
								</div>
								<div class="clear"></div>
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									手机号码：
								</div>
								<div class="r_zs">
									${mb.phone}
								</div>
								<div class="clear"></div>
							</div>
							<div class="gr-jtmal">
								<div class="gr-jname">
									安全邮箱：
								</div>
								<div class="r_zs">
									${mb.email}
								</div>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
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
