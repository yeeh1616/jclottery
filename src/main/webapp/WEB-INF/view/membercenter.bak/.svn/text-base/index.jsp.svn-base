<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-彩民账户中心" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 首页 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="0" scope="page"></c:set>
  <%@include file="menu.jsp" %>
   <div class="tzgl">
    	<div class="safe_userinfo">
       	  <div class="safe_ubox" style="height:90px">
          		
          	<div class="huiyuan">
            	<div class="uinfo"><b>${sessionScope.member.memberName}</b>  欢迎您！　　 一杯茶，一注彩票，充满希望的今天与未来</div>
               <c:if test="${sessionScope.member.memberFrom != '5' }">
                <div class="uinfo2">
                <span class="eml" alt="身份证" title="身份证">
                	<c:choose>
										<c:when test="${customertags:isEmpty(veriMessage[0])== 'false' }">
											已绑定
										</c:when>
										<c:otherwise>
											<a href="/memberCenter/authenticat.jhtml">未绑定</a>
										</c:otherwise>
									</c:choose>
                </span>
                <span class="yhc"  alt="银行卡" title="银行卡">
                	<c:choose>
										<c:when test="${customertags:isEmpty(veriMessage[1])== 'false' }">
											已绑定
										</c:when>
										<c:otherwise>
											<a href="/memberCenter/bankCard.jhtml">未绑定</a>
										</c:otherwise>
									</c:choose>
                </span>
                <span class="sj"  alt="手机" title="手机">
                	<c:choose>
										<c:when test="${customertags:isEmpty(veriMessage[2])== 'false' }">
											已绑定
										</c:when>
										<c:otherwise>
											<a href="/memberCenter/personDatum.jhtml">未绑定</a>
										</c:otherwise>
									</c:choose>
                </span>
                <!--<span class="aqzs">安全指数：<strong>86</strong>分</span>  <span class="lastip"><a href="#">提升</a> |
                <span style="padding:0 10px 0 10px">&nbsp;</span>  上次登录：2014-04-16 13:29:18</span>--> 
                </div>
               </c:if>
            </div>
          </div>
          <div class="clear"></div>
        </div>
    <div class="uindex">
        		<div class="uind_left">
        		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        		    <tr>
        		      <td width="195" height="220" background="/images/uindex.jpg">
                      <div class="jinede">账户余额<br />
                        <b>
                        	<fmt:formatNumber value="${mones[3]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
                        	 &nbsp;元</b></div>
                        	 <c:if test="${sessionScope.member.memberFrom != '5' }">
		                        <div class="chongzhi">
		                          <input name="button" type="submit" class="addbtn2" id="button" value="充值" style="cursor:pointer" onclick="location.href='/memberCenter/putMoney.jhtml'"/>
		
		                          <input name="button2" type="submit" class="addbtn2" id="button2" value="取款" style="cursor:pointer" onclick="location.href='/memberCenter/getMoney.jhtml'"/>
		                        </div>
		                       </c:if>
                      </td>
        		      <td width="195" valign="top" background="/images/uindex-02.jpg"><div class="jineden">红包余额 <img src="/images/wh.gif" width="14" height="14" /><br />
                        <b>
                        	<fmt:formatNumber value="${mones[1]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
                        	 &nbsp;元</b></div></td>
      		      </tr>
        		    <tr>
        		      <td height="220" valign="top" background="/images/uindex-05.jpg"><div class="jineden">现金余额<br />
                        <b>
                        	<fmt:formatNumber value="${mones[0]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
                        	 &nbsp;元</b></div></td>
        		      <td valign="top" background="/images/uindex-04.jpg"><div class="jineden">冻结余额<br />
                      <b>
                      	<fmt:formatNumber value="${mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>
                      	 &nbsp;元</b></div></td>
      		      </tr>
      		    </table>
	  	</div>
      <div class="uind_right">
                	<h1>投注竞彩，返奖率69%，好运马上降临！</h1>
                    <div class="udlt" style="background-image:url(/images/jcdlt.jpg)">
                    <!-- <input type="button" class="addbtn2" value="参与合买" />-->
                     <input type="button" class="addbtn2" value="我要购彩" style="cursor:pointer" onclick="location.href='/lottery/index.jhtml?licenseId=9&p=spf'"/>
          </div>
                    <h1>超级大乐透，3元成为千万富翁！</h1>
                	<div class="udlt" style="background-image:url(/images/jcdlt-02.jpg)">
                      <!-- <input type="button" class="addbtn2" value="参与合买" />-->
                     <input type="button" class="addbtn2" value="我要购彩" style="cursor:pointer" onclick="location.href='#'"/>
                    
                    </div>
                </div>
                
    </div>
        
        </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
