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
<c:set var="pageName" value="${licenseName}" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp"%>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/buy.css" />
</head>
<body>
	<jsp:include page="../../../include/header.jsp"></jsp:include>
	<script type="text/javascript" src="/js/merger/Merger.js"></script>
	<script type="text/javascript" src="/js/lottery/football/xfhc.js"></script>

	<div class="">
      <div class="common_w">
<!-- 这里的顶部和其他的老足彩 的顶部不一样请注意-->      
    <div class="jz_top">
          <div class="jz_tz fl">
			<div class="ren9-logo"></div>
		</div>
		<jsp:include page="../header.jsp" />
          <div class="small_fb"></div>
        </div>
    <div class="sais_t"> </div>
    <div class="sais_c">
    	<jsp:include page="./header.jsp"></jsp:include>
         <div class="w_ggfs">
         	
<div class="w_hm">
<div class="w_gmxs">
          </div>
    <table border="0" cellpadding="0" cellspacing="0" class="w_hm_b" width="100%" id="mergerPanelId11">
  <tr>
    <td width="13%" height="43" class="left_p">方案预设总额</td>
    <td width="87%" align="left">
    <div class="w_fencheng fl"><input class="w_rgtx" type="text" value="1" id="yjTotalBuyNumId" style="width: 30px;"/>&nbsp;&nbsp;注，
    <input type="text" class="w_rgtx" value="1" id="yjTotalBuyMulId" style="width: 30px;"/>&nbsp;&nbsp;倍。 <span>上传方案金额浮动不超过40%。如方案10000元，可以上传6000-14000元的方案.</span></div>
      <div class="clear"></div></td>
  </tr>
  <tr>
    <td width="13%" height="94" class="left_p">方案描述</td>
    <td width="87%"><div class="wenbeny">
        <input type="text" value="大奖就在眼前不要错过哦！" id="partDetailId"/>
      </div>
      <span class="w_ms fl">(描述最多200字)</span>
      <div class="clear"></div></td>
  </tr>
  <tr>
    <td height="43" class="left_p">已被分成</td>
    <td><div class="w_fencheng fl"><span class="w_red" id="totalHemaiNumId">2 </span>份，每份<span class="w_red"> 1</span> 元 <span>（认购金额至少为总金额的1%，且为整数）</span></div></td>
  </tr>
  <tr>
    <td height="45" class="left_p">我要认购</td>
    <td><div class="w_fencheng fl">
        <input type="text" value="0" class="w_rgtx" id="offerBuyId" />
        份，所占比例<span class="w_red" id="offerBMId"> 0 </span>% <span>（认购金额只能是整数）</span></div></td>
  </tr>
  <tr>
    <td height="98" class="left_p">是否保底</td>
    <td><div class="w_fencheng fl">
        <ul>
          <li>
            <input type="radio" name="baodiType" checked="checked" value="1"/>
            无保底</li>
          <li>
            <input type="radio" name="baodiType" value="2"/>
            全额保底，所占比例<span class="w_red" id="baoFullPerId">0</span> %，需支付<span class="w_red" id="baoFullMoneyId">0</span>元 保底说明<a name ="insTips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18" /></a></li>
         
<li>
            <input type="radio" name="baodiType" value="3"/>
            部分保底
            <input type="text" value="1" class="w_rgtx" id="partBaoInputId" />
            份，所占比例<span class="w_red" id="baoPartPerId"> 0</span> %，需支付 ¥<span class="w_red" id="baoPartMoneyId"> 0</span> 元 </li>
        </ul>
      </div></td>
  </tr>
  <tr>
    <td height="46" class="left_p">我要提成</td>
    <td><div class="wenbeny">税后奖金的
        <select id="brokerageId">
          	  <option value="0.00">无</option>
              <option value="0.01">1%</option>
              <option value="0.02">2%</option>
              <option value="0.03">3%</option>
              <option value="0.04">4%</option>
              <option value="0.05">5%</option>
              <option value="0.06">6%</option>
              <option value="0.07">7%</option>
              <option value="0.08">8%</option>
              <option value="0.09">9%</option>
              <option value="0.10">10%</option>
        </select>
        提成说明<a name ="brokerTips" href=" javascript:void(0)" value="0" class="w_djt"><img src="/images/goucai/wenhao1.png" width="18" height="18" /></a></div></td>
  </tr>
  <tr>
    <td height="45" class="left_p">保密类型</td>
    <td><div class="w_gkan">
        <ul>
          <li>
            <input type="radio" checked="checked" name="showLevel" value="1" show="公开"/>
            公开</li>
          <li>
            <input type="radio" name="showLevel" value="4" show="截至后公开"/>
            截至后公开</li>
          <li>
            <input type="radio" name="showLevel" value="2" show="仅对跟单者公开"/>
            仅对跟单者公开</li>
          <li>
            <input type="radio" name="showLevel" value="3" show="永久保密"/>
            永久保密</li>
          <div class="clear"></div>
        </ul>
      </div></td>
  </tr>
  <tr>
    <td height="41" class="left_p">支付信息</td>
    <td><div class="w_fencheng fl">此次交易您需支付 ¥<span class="w_red" id="totalHmMoneyId">0</span>元</div></td>
  </tr>
</table>
  </div>
<div class="tz_bottom">
<!--<div class="dqye">当前账户余额：<span class="red" id="showBalDivId">0.00元</span></div>-->
<div class="tijiao_rr fr"> <a style="cursor: pointer;" id="sureBetBtnId" class="quer">确认提交</a></div>
<div class="tz_tk"><input name="" type="checkbox" id="agreeChkId" value="" checked="checked" />我已阅读并同意<a href="/common/agreement.jhtml" target="_blank"><span>《彩店与彩民交易协议》</span></a></div>
</div>
         </div> 
        </div>
		<!--悬浮栏开始-->
		<!--悬浮栏结束-->
	</div>
<!--footer-->
</div>
	<jsp:include page="../../../include/footer.jsp"></jsp:include>
	<jsp:include page="../../lotteryForm.jsp"></jsp:include>
	<script type="text/javascript" src="/js/common/tips.js"></script>
	<script type="text/javascript"
		src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
	<script type="text/javascript"
		src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
</body>
</html>