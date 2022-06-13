<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 确认投注页面 -->
<div class="common_w" id="surePanalId" style="display:none">
  <div class="open_plant">
  <h1>确认投注内容</h1>
<!--投注信息-->
  <div class="tz_titile">
  <span>投注信息</span>
  </div>
    <div class="tz_ssc" id="surePageBetInfo"></div>
<div class="clear"></div>
<!--投注信息 end-->
<!--方案信息-->
  <div class="tz_titile">
  <span>方案信息</span>
  </div>
  <div class="tz_zhangs">
  <table width="100%" cellspacing="0" cellpadding="0" border="0" class="zz_tz">
    <tr>
    <th width="30%">注 数</th>
    <th width="30%">倍 数</th>
    <th width="40%">方案金额</th>
  </tr>
    <tr id="orderInfo_td"></tr>
</table>
  </div>
<!--方案信息 end-->
<div class="fan_bottom">
<!-- <div class="bcfa"><a href="#">保存方案</a></div> -->
<div class="fr"><a style="cursor:pointer;" id="backToChange">返回修改方案&gt;&gt;</a></div>
</div>

<jsp:include page="../../common/merger.jsp"></jsp:include>

<div class="tz_bottom">
<div class="dqye">当前账户余额：<span class="red" id="showBalDivId">0.00元</span></div>
<div class="tijiao_rr fr"> <a id="sureBetBtnId" class="quer">确认并预约取票</a></div>
<div class="tz_tk"><input id="agreeChkId" name="" type="checkbox" value="agreeId" checked="">我已阅读并同意<a href="/common/agreement.jhtml" target="_blank"><span>《彩店与彩民交易协议》</span></a></div>
</div> 
  </div>
</div>