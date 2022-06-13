<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民修改密码" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/membercenternew/userCenter.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 用户中心 </div>
</div>
<!--用户中心-->
<div class="user_plant">
 <%@include file="menu.jsp" %>
  <div class="user_r">
    <div class="user_top">
      <div class="top_l">
        <div class="ifo" style="z-index:2;">
        <div class="fl">
        <img class="user_yhtx" src="/cytxhome/images/mor_touxiang.png" width="60" height="60" /> </div>
		<div class="fl m-l15">
          <div class="ifo_txt"><span>您好！</span><strong>${mb.memberName}</strong> 
            <span class="m-l15 text999"><!-- 本次登录：2015-06-19 11:35 -->本次登录：${mb.loginTiem}</span> </div>
		  <c:choose>
          <c:when test="${!mb.infoFull}">
          <p class="mt10">您还完善您的个人信息，请尽快完善您的个人信息<a href="/memberCenterNew/personDatumSucc.jhtml" class="m-l15">立即完善</a></p>
          </c:when>
		  <c:when test="${mb.infoFull}">
		  <p class="mt10">您已完善您的个人信息</p>
		  </c:when>
		  </c:choose>          
          
         </div>
          <div class="clear"></div>
        </div>
        <div class="ifo" style="border:none">
                          <p class="rh-p2">
                            <strong class="c333">账户可用余额:</strong>
                            <strong id="moneyLnk" class="rh-money">
                             <fmt:formatNumber value="${mones[3]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>    
                             </strong> 元
                          </p> 
                          <c:if test="${domain.reserved10 == '1'}">
                          <p class="user_tj">累计消费：<span class="red" id="totalBuyId">0</span> 元</p>
						  <p class="user_tj">累计中奖：<span class="red" id="totalBnId">0</span> 元</p>
						  <p class="user_tj">盈亏：<span class="red" id="profitId">0</span> 元</p>
						  <script type="text/javascript">
							$(function(){
								$.ajax({
								    type: "post",
								    url: "/common/getMemStat.json",
								    async: false,
								    dataType: "json",
								    error: function(xMLHttpRequest, textStatus, errorThrown){
									},
								    success: function (data){
										$("#totalBuyId").html(formatCurrency(data.buyTotal));
										$("#totalBnId").html(formatCurrency(data.bonusTotal));
										if ( data.profit > 0 ) {
											$("#profitId").removeClass("green").addClass("red");
											$("#profitId").html(formatCurrency(data.profit));
										} else {
											$("#profitId").removeClass("red").addClass("green");
											$("#profitId").html(formatCurrency(data.debt));
										}
										//$("#debtId").html(formatCurrency(data.debt));
								    }
								});
							});
							</script>
						  </c:if>
						  <!--<p class="user_tj">亏损：<span class="green" id="debtId">0</span> 元</p>-->
						  <div class="clear"></div>
                          <div class="mt30">
                               <span>安全等级：</span>
                               <div class="cen-secom hm_c">
  <c:choose>
   <c:when test="${mb.safety <= 20}">
   <div class="lv1"></div><div class=""></div><div class=""></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 20 && mb.safety <= 40}">
   <div class="lv2"></div><div class="lv2"></div><div class=""></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 40 && mb.safety <= 60}">
   <div class="lv3"></div><div class="lv3"></div><div class="lv3"></div><div class=""></div><div class=""></div>
   </c:when>
   <c:when test="${mb.safety > 60 && mb.safety <= 80}">
   <div class="lv4"></div><div class="lv4"></div><div class="lv4"></div><div class="lv4"></div><div class=""></div>
   </c:when>
   <c:when test="${80 < mb.safety}">
   <div class="lv5"></div><div class="lv5"></div><div class="lv5"></div><div class="lv5"></div><div class="lv5"></div>
   </c:when>   
   </c:choose>
  </div><span style="display: inline-block; margin-left:5px"><a href="/memberCenterNew/safeIndex.jhtml">
                                  <span class="usergrade org">${mb.safety}分</span></a></span><div class="clear"></div>
                          </div>
                          <div class="gn">
				  <div class="user_cz"><a href="/memberCenterNew/putMoneyOutLine.jhtml" >充值</a></div>
				  <div class="user_tx"><a href="/memberCenterNew/getMoney.jhtml">取款</a></div>
        <div class="clear"></div>
                   </div>
                          </div>                          
      </div>
      <div class="top_r">
        <div class="i-assets-content">
            <div class="i-assets-header fn-clear">
              <h3 class="fn-left">取款账户</h3>
            </div>
            <div class="i-assets-body">
              <ul>
                <li class="fn-clear first"> <span class="fn-left u_yhkzh"><i></i><span>银行卡账户:</span>
                <c:choose>
                <c:when test="${!empty mws[0]}"><a class="hred_n" href="/memberCenterNew/getMoneyOptions.jhtml">已添加</a></span> <a href="/memberCenterNew/getMoneyDetails.jhtml?id=${mws[0].id}" class="fn-left fn-hide">详情</a> </li></c:when>
                <c:otherwise><a class="fn-left fn-hide" href="/memberCenterNew/getMoneyOptions.jhtml">未添加</a></span> <a href="/memberCenterNew/getMoneyOptions.jhtml" class="fn-left fn-hide">添加</a> </li></c:otherwise>
                </c:choose>
                <%-- <li class="fn-clear"><span class="fn-left u_wxzh"><i></i><span>微信账户:</span>
                <c:choose>
                <c:when test="${!empty mws[1]}"><a class="hred_n" href="/memberCenterNew/getMoneyOptions.jhtml">已添加</a></span><a href="/memberCenterNew/getMoneyDetails.jhtml?id=${mws[1].id}" class="fn-left fn-hide">详情</a></li></c:when>
                <c:otherwise><a class="fn-left fn-hide" href="/memberCenterNew/getMoneyOptions.jhtml">未添加</a></span><a href="/memberCenterNew/getMoneyOptions.jhtml" class="fn-left fn-hide">添加</a></li></c:otherwise>
                </c:choose>
                <li class="fn-clear"><span class="fn-left u_zfbzh"><i></i><span>支付宝账户:</span>
                <c:choose>
                <c:when test="${!empty mws[2]}"><a class="hred_n" href="/memberCenterNew/getMoneyOptions.jhtml">已添加</a></span><a href="/memberCenterNew/getMoneyDetails.jhtml?id=${mws[2].id}" class="fn-left fn-hide">详情</a></li></c:when>
                <c:otherwise><a class="fn-left fn-hide" href="/memberCenterNew/getMoneyOptions.jhtml">未添加</a></span><a href="/memberCenterNew/getMoneyOptions.jhtml" class="fn-left fn-hide">添加</a></li></c:otherwise>
                </c:choose> --%>
              </ul>
            </div>
            <div class="i-assets-foot">
              <p>提款金额: <a href="#" class="red"><fmt:formatNumber value="${mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></a> 元</p>
              <p>欠款金额: <a href="#" class="red"><fmt:formatNumber value="${debt}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></a> 元</p>
              <p  style="color:#eb6100"><a href="/memberCenterNew/capital.jhtml"> >>账户详情</a></p>
            </div>
          </div>
      </div>
      <div class="clear"></div>
    </div>
    
  <!--七天购彩几记录-->
  <div class="user_c_p">
    <p class="r-lv-t userzj"><strong><i class="f_r f12" style="font-weight:normal;"></i>最近投注记录</strong></p>
  </div>
  <div class="w_gcjl user_home_t">
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
        <tr>
          <th width="5%">序号</th>
          <c:choose>
					<c:when test="${sessionScope.member.memberFrom == '5'}">
						 <th width="5%" align="center" class="tztop">选择</th>
						 <th width="5%" align="center" class="tztop">订单号</th>
					</c:when>
					<c:otherwise>
						 <th width="10%" align="center" class="tztop">订单号</th>
					</c:otherwise>
				</c:choose>
          <th width="22%">彩种彩期</th>
          <th width="6%">倍数</th>
          <th width="10%">金额</th>
          <th width="10%">奖金</th>
          <th width="10%">状态</th>
          <th width="19%">认购时间</th>
          <th width="8%">操作</th>
        </tr>
        <c:set var="totalPrice" value="0" scope="page"></c:set><!--总购彩-->
		<c:set var="totalBonus" value="0" scope="page"></c:set><!--总奖金-->
		<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">	
				<!--数据汇总-->
				<c:set var="totalPrice" value="${totalPrice + list.betPrice}" scope="page"></c:set>
				<c:set var="totalBonus" value="${totalBonus + list.finiBonus}" scope="page"></c:set>
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
					<td>
						${varStatus.count}
					</td>
					<c:if test="${sessionScope.member.memberFrom == '5' }">
						<td>
							<c:choose>
								<c:when test="${list.betState == '0'}">
									<input type="checkbox" name="orderId" value="${list.id}" checked onclick="return false;"/>
								</c:when>
								<c:otherwise>
									--
								</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<td>
						${list.id}
					</td>
					<td>
						${list.licenseName}
					</td>
					<td>
						${list.multiple}
					</td>
					<td class="red">
					  <fmt:formatNumber value="${list.betPrice}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td class="red">
						<c:choose>
								<c:when test="${list.betState == 13 }">
									<font color=red><fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></font>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${list.betState == 9 || list.betState == 10}">
											<font color=red>待确认</font>
										</c:when>
										<c:otherwise>
											0.00
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
					</td>
					<td>
						<c:choose>
								<c:when test="${list.betState == 13||list.betState == 9|| list.betState == 10}">
								<font color=red>${list.stateName3}</font>
								</c:when>
								<c:otherwise>
								${list.stateName3}
								</c:otherwise>
						</c:choose>
					</td>
					<td>
						${list.orderDate}
					</td>
					<td>
						<a href="/memberCenterNew/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
					</td>
				</tr>
			</c:forEach>
        <tr>
          <td colspan="4">本页汇总:</td>
          <td class="red"><fmt:formatNumber value="${totalPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
          <td class="red"><fmt:formatNumber value="${totalBonus}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
          <td colspan="20"></td>
        </tr>
 		</table>
    </div>
  </div>
  <!--七天购彩几记录 end-->
    
    
  <!--最近中奖记录-->
  <div class="user_c_p">
      <p class="r-lv-t userzj"><strong><i class="f_r f12" style="font-weight:normal;"></i>最近中奖记录</strong></p>
  </div>
  <div class="w_gcjl user_home_t">
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
        <tr>
          <th width="5%">序号</th>
          <th width="10%">订单号</th>
          <th width="16%">彩种彩期</th>
          <th width="9%">倍数</th>
          <th width="10%">金额</th>
          <th width="10%">奖金</th>
          <th width="10%">状态</th>
          <th width="20%">认购时间</th>
          <th width="10%">操作</th>
        </tr>
        <c:set var="totalPrice" value="0" scope="page"></c:set><!--总购彩-->
		<c:set var="totalBonus" value="0" scope="page"></c:set><!--总奖金-->
		<c:forEach var="list" items="${pagination2.list}" varStatus="varStatus">				
				<c:set var="totalPrice" value="${totalPrice + list.betPrice}" scope="page"></c:set>
				<c:set var="totalBonus" value="${totalBonus + list.finiBonus}" scope="page"></c:set>
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr bgcolor="#f4fbff">
					</c:when>
					<c:otherwise>
						<tr bgcolor="#FFFFFF">
					</c:otherwise>
				</c:choose>
					<td>
						${varStatus.count}
					</td>
					<td>
						${list.id}
					</td>
					<td>
						${list.licenseName}
					</td>
					<td>
						${list.multiple}
					</td>
					<td class="red">
						<fmt:formatNumber value="${list.betPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber>
					</td>
					<td class="red">
						<c:choose>
								<c:when test="${list.betState > 11}">
									<font color=red><fmt:formatNumber value="${list.finiBonus}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber></font>
								</c:when>
								<c:otherwise>
									待确认
								</c:otherwise>
							</c:choose>
					</td>
					<td>
						${list.stateName2}
					</td>
					<td>
						${list.orderDate}
					</td>
					<td>
						<a href="/memberCenterNew/orderDetail.jhtml?orderId=${list.id}&LicenseId=${list.licenseId}">详情</a>
					</td>
				</tr>
			</c:forEach>
        <tr>
          <td colspan="4">本页汇总:</td>
          <td class="red"><fmt:formatNumber value="${totalPrice}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
          <td class="red"><fmt:formatNumber value="${totalBonus}" pattern="#,###.##"  minFractionDigits="2"></fmt:formatNumber></td>
          <td colspan="3"></td>
        </tr>
      </table>
    </div>
  </div>
  <!--最近中奖记录end-->
    
    
  </div>
  <div class=" clear"></div>
  <!--用户中心 end--> 
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>
