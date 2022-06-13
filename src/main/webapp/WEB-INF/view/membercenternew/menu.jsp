<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="user_l">
  <ul class="com_l">
    <li><a href="/memberCenterNew/purchasList.jhtml"><i class="tzgl_i"></i>投注管理</a></li>
    <li><a href="/memberCenterNew/capital.jhtml"><i class="zjgl_i"></i>资金管理</a></li>
    <div class="l-svbnav"> <a href="/memberCenterNew/putMoney.jhtml">账户充值</a> <a href="/memberCenterNew/getMoney.jhtml">账户取款</a> <a href="/memberCenterNew/accountDetail.jhtml">账户明细</a> <a href="/memberCenterNew/debitList.jhtml">我的欠款</a> </div>
    <li><a href="/memberCenterNew/safeIndex.jhtml"><i class="aqzx_i"></i>安全中心</a></li>
    <div class="l-svbnav"> <a href="/memberCenterNew/personDatum.jhtml">个人信息</a> <a href="/memberCenterNew/authenticat.jhtml">实名认证</a> <a href="/memberCenterNew/changePass.jhtml">修改密码</a> <a href="/memberCenterNew/getMoneyOptions.jhtml">取款设置</a></div>
  
  	<c:if test="${sessionScope.member.reserved3 == '1'}">
      	<li><a href="/memberCenterNew/myTeam.jhtml"><i class="aqzx_i"></i>我的团队</a></li>
	    <div class="l-svbnav"> 
		    <a href="/memberCenterNew/myTeam.jhtml">彩民信息</a> 
		    <a href="/memberCenterNew/myTeamPurchas.jhtml">购彩信息</a> 
		    <a href="/memberCenterNew/getRechargeLog.jhtml">财务流水</a> 
	    </div>
	</c:if>
  </ul>
  <div class="l-snav2"> <strong>其他服务</strong>
    <ul>
      <li><a href="/wap/index.jhtml?test.cp020.com"><span class="t-tsj"></span>手机购彩</a></li>
      <li><a href="/memberCenterCustomNew/custom.jhtml?type=1"><span class="t-gd"></span>合买定制跟单</a></li>
      <li><a href="/memberCenter/mycopyCust.jhtml"><span class="t-gd"></span>复制定制跟单</a></li>
      <li><a href="/merger/index.jhtml"><span class="t-hm"></span>合买彩票</a></li>
      <li><a href="/memberCenterNew/message.jhtml"><span class="t-znx"></span>站内信</a></li>
      
    </ul>
  </div>
</div>