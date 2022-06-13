<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="mbleft">
    	<h1 style="cursor:pointer" <c:if test="${sessionScope.member.memberFrom != '5' }">onclick="location.href='/memberCenter/index.jhtml'"</c:if>>我的账户</h1>
        <ul>
        	<li><a style="cursor:pointer" class="ic01">投注管理</a></li>
            <li><a href="/memberCenter/purchasList.jhtml" <c:if test="${pageScope.PageId==1}">class="ck"</c:if>>购彩记录</a></li>
            <li><a href="/memberCenter/chaseList.jhtml" <c:if test="${pageScope.PageId==13}">class="ck"</c:if>>追号记录</a></li>
            <li><a href="/memberCenter/mergerJoinList.jhtml" <c:if test="${pageScope.PageId==14}">class="ck"</c:if>>合买记录</a></li>
            <!-- <li><a href="#">定制跟单</a></li>
            <li><a href="/merger/merger.jhtml" <c:if test="${pageScope.PageId==14}">class="ck"</c:if>>合买记录</a></li>
            
            <!--<li><a href="#" class="ck">追号记录</a></li>
            <li><a href="#">合买记录</a></li>
            <li><a href="#">定制跟单</a></li>-->
            <li><a href="/memberCenter/prizeList.jhtml" <c:if test="${pageScope.PageId==2}">class="ck"</c:if>>中奖记录</a></li>
            <li><a href="/memberCenterCustom/custom.jhtml?type=1" <c:if test="${pageScope.PageId==15}">class="ck"</c:if>>定制跟单</a></li>
        </ul>
      <c:if test="${sessionScope.member.memberFrom != '5' }">  
      <ul>
       	  <li><a style="cursor:pointer" class="ic02">资金管理</a></li>
       	  <li><a href="/memberCenter/putMoney.jhtml" <c:if test="${pageScope.PageId==3}">class="ck"</c:if>>充值</a></li>
          <li><a href="/memberCenter/getMoney.jhtml" <c:if test="${pageScope.PageId==4}">class="ck"</c:if>>取款</a></li>
          <li><a href="/memberCenter/accountDetail.jhtml" <c:if test="${pageScope.PageId==5}">class="ck"</c:if>>账户明细</a></li>
          <li><a href="/memberCenter/debitList.jhtml" <c:if test="${pageScope.PageId==55}">class="ck"</c:if>>我的欠款单</a></li>
      </ul>
      <ul>
   	    <li><a style="cursor:pointer" class="ic03">账户管理</a></li>
            <li><a href="/memberCenter/safeIndex.jhtml" <c:if test="${pageScope.PageId==6}">class="ck"</c:if>>安全首页</a></li>
            <li><a href="/memberCenter/personDatum.jhtml" <c:if test="${pageScope.PageId==7}">class="ck"</c:if>>个人信息</a></li>
            <li><a href="/memberCenter/changePass.jhtml" <c:if test="${pageScope.PageId==8}">class="ck"</c:if>>修改密码</a></li>
            <li><a href="/memberCenter/passProtect.jhtml" <c:if test="${pageScope.PageId==9}">class="ck"</c:if>>密码保护</a></li>
            <li><a href="/memberCenter/authenticat.jhtml" <c:if test="${pageScope.PageId==10}">class="ck"</c:if>>实名认证</a></li>
            <!--<li><a href="/memberCenter/drawinfo.jhtml" <c:if test="${pageScope.PageId==11}">class="ck"</c:if>>取款账户信息</a></li>-->
            <li><a href="/memberCenter/message.jhtml" <c:if test="${pageScope.PageId==12}">class="ck"</c:if>>站内信</a></li>
       </ul>
       </c:if>
    </div>