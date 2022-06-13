<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<c:set var="pageName" value="账户中心-彩民取款" scope="page"></c:set>
		<%@include file="../include/titlePage.jsp"%>
		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/js/common/base.js"></script>
	</head>

	<body>
		<input type="hidden" value="${mws[0].accountState}" id="yhkState"/>
		<script>
			var yhkState = $('#yhkState').val();//银行卡状态
		</script>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<script type="text/javascript" src="/js/membercenternew/getMoneyOptions.js"></script>
		<div class="common_w">
			<div class="hall-top">
				<div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > <a href="/memberCenterNew/safeIndex.jhtml">安全中心</a> > 取款设置</div>
			</div>
			<!--用户中心-->
			<div class="user_plant">
				<%@include file="menu.jsp"%>
				<div class="user_r">
					<!--安全等级begin-->
					<div class="gr-safedj">
						<div class="gr-safe-l">取款设置</div>
						<div class="gr-safe-r"><a href="/memberCenterNew/safeIndex.jhtml">&lt;&lt; 返回安全中心</a></div>
						<div class="clear"></div>
					</div>
					<!--安全等级end-->
					
					<div class="gr-lbody">
						<!--具体信息begin-->
						<div class="safe-xti">
							<div class="safets fl">温馨提示：</div>
							<div class="tihma fl">
								<p>1.银行卡开户人姓名必须与绑定的真实姓名一样，否则无法提款; 2.绑定的银行卡只用于提款.</p>
							</div>
						</div>
						<ul id="no">
						<li id="no_1">
						<!--银行卡-->
						<div id="yhk" class="qk_title yhk_bg">
							<h1>
								<!--<i class="u_yh"></i>-->
								<i>银行卡</i>
								<c:if test="${!empty mwObj}"> 
									<a>当前默认账户</a>
								</c:if>
							</h1>
							<!-- 已绑定银行卡信息 -->
							<c:if test="${!empty mwObj}">
							<div id="ybdyhk" class="card-box">
								<div class="card-box-name">
									<span class="bank-name" title="${mwObj.accountName}">${mwObj.accountName}</span>
									<span class="bank-num4">尾号：${mwObj.accountCardHide}</span>
									<span class="card-type card-type-CC"></span>
								</div>
								<div class="u_xinx">
									<div class="cName">
										<span>姓&nbsp;&nbsp;名：</span>${mb.certiNameHide}
									</div>
									<div>
										<span>支行名称：</span>${mwObj.reserved1} 
									</div>
									<div class="cNumber">
										<span>身份证号：</span>${mb.certiNumberHide}
									</div>
								</div>
							</div>
							</c:if>
							<!-- 填写绑定信息 -->
							<div id="bdyhk" class="card-box" rel-href="#" style="display:none">
								<div class="card-box-name">
									<span class="bank-name" title="${mwObj.accountName}">填写银行信息</span>
								</div>
								<div class="u_xinx">
									<div>
										<span>开户银行：</span><span><input id="khyh" type="text" class="qu_input" value="${mwObj.accountName}">
										</span>
									</div>
									<div>
										<span>支行名称：</span><span><input id="zhmc" type="text" class="qu_input" value="${mwObj.reserved1}">
										</span>
									</div>
									<div>
										<span>银行卡号</span><span><input id="yhkh" type="text" class="qu_input" value="${mwObj.accountCard}">
										</span>
									</div>
								</div>
							</div>
							
							<!--添加银行卡 -->
							<c:if test="${empty mwObj}">
							<div id="tjyhk" class="add-card J-add-card" onclick="demo1();">
								<a seed="zht_click_ZBAGAC_TJYH" target="_blank"><i class="iconfont">+</i>添加银行卡</a>
							</div>
							</c:if>
							<span class="w_srts" id="yhkErr">&nbsp; </span>
							<div class="del_zh">
							<c:choose>
							<c:when test="${!empty mwObj}">
								<a id="xg_yhk" onclick="demoYHK();">修改银行卡>></a>
								<a id="bc_yhk" style="display:none">
									<span style="cursor: pointer;" onclick="updateYHK();"> 保存修改>> </span> ||
									<span style="cursor: pointer;" onclick="cancelYHK();"> 放弃修改>> </span>
								</a>
							</c:when>
							<c:otherwise>
								<a id="tj_yhk" style="display:none" onclick="submitInfoYHK();">添加银行卡>></a>
							</c:otherwise>
							</c:choose>
							</div>
							<div class="clear"></div>
						</div>
						<!--银行卡 end-->
						</li>
						</ul>
						<!--具体信息end-->
					</div>
				</div>
				<div class=" clear"></div>
				<!--用户中心 end-->
			</div>
		</div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript">
window.onload = clickTop();
</script>
</body>
</html>
