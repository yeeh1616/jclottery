<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-资金管理" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 资金管理</div>
</div>
<!--用户中心-->
<div class="user_plant">
<%@include file="menu.jsp" %>
<div class="user_r">
<div class="gr-lbody">
<div class="zj_title">账户信息</div>
<div class="zj_plant">
<h1>账户可用余额:</h1>
<div class="zj_xx">
<em class="zj_q"><fmt:formatNumber value="${mones[3]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></em><span class="zj_mc">元</span><div class="user_tx" style="float:right"><a href="/memberCenterNew/getMoney.jhtml">取款</a></div>
<div class="user_cz" style="float:right; margin-right:10px; margin-left: 11px;"><a href="/memberCenterNew/putMoneyOutLine.jhtml">充值</a></div>
<div class="ui-title-action"><a href="/memberCenterNew/putMoneyList.jhtml">充值记录</a><span class="global-separator-pd">|</span><a href="/memberCenterNew/getMoneyList.jhtml">取款记录</a></div>
<div class="clear"></div>
<div class="mt30">
                                安全等级：
                                <a href="/memberCenterNew/safeIndex.jhtml">
                                  <span class="usergrade org">${mb.safety}分</span></a>
	                                   <span class="aq-p">
                                    <span class="hand" onmousemove="javascript:$('#smtipId1').css('display','');" onmouseout="javascript:$('#smtipId1').css('display','none');"><i class="smrz"></i>
                                               <a href="/memberCenterNew/authenticat.jhtml">实名认证</a>
									</span>
                                           <div id="smtipId1" class="djzj-tc" style="display: none;">
                                                <i class="jts-tit"></i>
                                                <div class="tc-yy">
                                                    领奖和提款的唯一凭证
                                                </div>
                                            </div>
                                        </span>
                                       <span class="aq-p">
	                                <!-- 未实名 -->
	                                        <a class="aq-p" id="tk_auth" onmousemove="javascript:$('#tktipid1').css('display','');" onmouseout="javascript:$('#tktipid1').css('display','none');" href="/memberCenterNew/getMoneyOptions.jhtml">
	                                        		<i class="bank" onmousemove="javascript:$('#tktipid1').css('display','');" onmouseout="javascript:$('#tktipid1').css('display','none');"></i>银行卡绑定</a>
								                <div id="tktipid1" class="djzj-tc" style="display: none">
                                                <i class="jts-tit"></i>
                                                <div class="tc-yy">
                                                  设置前请先进行实名认证
                                                </div>
                                            </div>
	                                    </span>
                          </div>
</div>
</div>

<div class="zj_title" style="margin-top: 20px;">管理信息</div>
<div class="ui-block">
        <ul class="list-inline">
            <li class="block-item">
                <h3 class=""><span>账户总资产</span></h3>
                <div class="main">
                    <p class="block-item-content">账户总资产:
        <span class="fz16"><fmt:formatNumber value="${mones[0]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></span>  元</p>
                    <p><a href="/memberCenterNew/putMoneyOutLine.jhtml" class="blue-link" target="_blank">充值</a><span class="global-separator-pd">|</span><a href="/memberCenterNew/getMoney.jhtml" class="blue-link" target="_blank">取款</a>
                    </p>
                </div>
            </li>
            
            <li class="block-item">
                <h3 class=""><span>可提款金额</span></h3>
                <div class="main">
                    <p class="block-item-content">可提款金额：
        <span class="fz16"><fmt:formatNumber value="${mones[4]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></span>  元</p>
                    <p><a href="javascript:void 0">&nbsp;</a></p>
                </div>
            </li>
            
            <li class="block-item">
                <h3 class=""><span>红包金额</span></h3>
                <div class="main">
                    <p class="block-item-content">红包金额：
        <span class="fz16"><fmt:formatNumber value="${mones[1]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></span>  元</p>
                    <p><a href="javascript:void 0">&nbsp;</a></p>
                </div>
            </li>
            
            <li class="block-item">
                <h3 class=""><span>冻结金额</span></h3>
                <div class="main">
                    <p class="block-item-content">冻结金额：
        <span class="fz16"><fmt:formatNumber value="${mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></span>  元</p>
                    <p><a href="/memberCenterNew/getMoneyList.jhtml" class="blue-link" target="_blank">查看</a>
                    </p>
                </div>
            </li>
            
            <li class="block-item">
                <h3 class=""><span>我的欠款</span></h3>
                <div class="main">
                    <p class="block-item-content">欠款金额：
        <span class="fz16"><fmt:formatNumber value="${debit}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></span>  元</p>
                    <p><a href="/memberCenterNew/debitList.jhtml" class="blue-link" target="_blank">查看</a>
                    </p>
                </div>
            </li>
            
            <li class="block-item">
                <h3 class=""><span>账户明细</span></h3>
                <div class="main">
                    <p class="block-item-content">详细的资金流向</p>
                    <p><a href="/memberCenterNew/purchasList.jhtml" class="blue-link" target="_blank">查看</a>
                    </p>
                </div>
            </li>
        </ul>
    </div>
   
</div>
</div>
  <div class=" clear"></div>
<!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
