<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld"
	prefix="customertags"%>
<div class="cloose_t">
	<div class="wcloose_top">
		<div class="fs_bor" style="bottom: 161px;left: 450px;"></div>
		<div class="fs_sj" style="bottom: 165px;left: 452px;"></div>
		<div class="wcloose_top_l fl">
			您选择了<span class="tw_red" id="betNumId">0</span>注,<span class="tw_red"
				id="betMoneyId">0</span>元
		</div>
		<div class="wcloose_top_r fr">
			<a id="addToBetListBtnId" class="w_tianjiabtn"></a>
			<a id="clearAllSelBtnId" class="w_qingkbtn">清空全部</a>
			<a id="saveBtnId" class="w_qingkbtn">保存<img src="/images/new.gif" width="18" height="18"></a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="wcloose_cont">
		<div class="wcloose_contl fl">
			<ul id="betListAreaId"></ul>
		</div>
		<div class="wcloose_contr fr">
			<input type="text" id="radomSelBetNum" class="wcloose_text" value="1" />
			<a id="radomSelsId" class="w_jixuan">机选</a><a id="clearBetListBtnId"
				class="w_shanchu">删除全部</a>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="qr_h">
	<div class="wcloose_bottom">
		<li>
			<p>倍投：</p>
			<div class="wcloose_toub">
				<a style="cursor: pointer;" id="subMBtnId" class="w_jiaf">-</a> <input type="text" value="1"
					id="multipleId" /> <a style="cursor: pointer;" id="addMBtnId">+</a>
			</div>
			<p>倍</p></li>
		<li>注数：<span class="tw_red" id="totalBetNumId"> 0</span>注</li>
		<li>金额：<span class="tw_red" id="totalBetMoneyId"> 0</span>元</li>
		<li><div class="tijiao_rr fr">
			<c:choose>
                <c:when test="${game.state=='2'}">
					<a href="javascript:void 0" id="lotteryFormBtnId" class="quer">确认提交</a>
				</c:when>
				<c:otherwise>
                    <p style="color:#cf1313">当前期中心未开售</p>
                </c:otherwise>
			</c:choose>
			</div></li>
		<div class="clear"></div>
	</div>
</div>