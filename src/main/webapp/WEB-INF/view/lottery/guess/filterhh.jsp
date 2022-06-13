<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="竞彩在线过滤" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link type="text/css" rel="stylesheet" href="/cytxhome/filter/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/filter/css/jjyh.css"/>
</head>
<body>
<div style="display:none">
<jsp:include page="../../include/header.jsp"></jsp:include>
</div>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<c:if test="${licenseId == 9}">
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/9/schedules.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/guess/GuessFootballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
</c:if>
<c:if test="${licenseId == 10}">
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/10/schedules.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/guess/GuessBasketballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
</c:if>

<script type="text/javascript" src="/js/lottery/guess/guessfootball/SpfFilter.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/guess/common.js"></script>

<!-- 过滤界面begin -->
<div class=" w_jjyh" id="betPanalId">
  <div class="prompt">
    <div class="promptl fl"><a href="#" class="zxgl_logo fl"></a><span>${playName }</span>
      <div class="clear"></div>
    </div>
    <div class="promptc fl">本方案的截止时间为：<span id="stopTimeId">--</span></div>
    <div class="promptr fr"><a href="javascript:void 0" class="zxgl_help"></a><a href="javascript:void 0">帮助中心</a><a href="javascript:void 0" class="zxgl_back"></a><a href="javascript:void 0">返回首页</a></div>
    <div class="clear"></div>
  </div>
  <div class="zx_content">
    <div class="zx_content_l fl">
      <div class="zx_title">投注内容选择（全选 清除）</div>
      <div class="zx_against_l">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="58" height="32px">场次</th>
            <th width="79">主队 </th>
            <th width="79">客队</th>
            <th width="197">选项</th>
          </tr>
        </table>
      </div>
      <div class="zx_against_c">
        <table border="0" cellpadding="0" cellspacing="0" class="zx_againstc" id="schAreaId">
        </table>
      </div>
      <div class="jj_explain">选择说明：<a href="#" class="first_c">首选</a><a href="javascript:void 0" class="first_s">次选</a><a href="javascript:void 0" class="first_l">末选</a><a href="/lottery/index.jhtml?licenseId=9&p=rqspf" class="first_r">重新选择场次</a></div>
      <div class="jj_choose"><strong>您选择了 <font id="schSId">0</font> 场比赛，</strong>共<span class="c_blue" id="betNumSId">0</span>注，<span class="c_red" id="betMoneySId">0</span>元
      <strong style="margin-left:30px;">过关方式：</strong><select id="passTypeSId"></select>
      </div>
      <div class="jj_add" id="bonusCalId">
        <p>（2串1）预计奖金和：5.95 --- 67</p>
        <p>（2串1）预计奖金积：8.85 --- 1116</p>
      </div>
    </div>
    <div class="zx_content_c fl">
      <div class="zx_title">条件选择</div>
      <div class="zx_content_cc"> 
        <a href="javascript:void 0" name="confArea" class="zx_listbtn">常规过滤</a>
        <ul class="zx_listbtnf">
          <li><a href="javascript:void 0" conf="104" type="1"><i class="gldx"></i>断点数</a></li>
          <li><a href="javascript:void 0" conf="105" type="1"><i class="gldx"></i>连号数</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_listbtn">赔率过滤</a>
        <ul class="zx_listbtnf" >
          <li><a href="javascript:void 0" conf="203" type="2"><i class="gldx"></i>赔率和</a></li>
          <li><a href="javascript:void 0" conf="204" type="2"><i class="gldx"></i>赔率积</a></li>
          <li><a href="javascript:void 0" conf="205" type="2"><i class="gldx"></i>奖金范围</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_listbtn">匹配过滤</a>
        <ul class="zx_listbtnf" >
          <li><a href="javascript:void 0" conf="306" type="6">冷门过滤</a></li>
          <li><a href="javascript:void 0" conf="307" type="6">命中过滤</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_listbtn">选择注数</a>
        <ul class="zx_listbtnf" >
          <li><a href="javascript:void 0" conf="700" type="4"><i class="gldx"></i>奖金选取</a></li>
          <li><a href="javascript:void 0" conf="701" type="5"><i class="gldx"></i>随机选取</a></li>
        </ul>
        </div>
    </div>
    <div class="zx_content_r fl">
      <div class="zx_title">
        <div class="zx_titleL fl w_bright" style="cursor:pointer;" id="removeAllConfId">全删</div>
        <div class="zx_titlec fl "></div>
        <div class="zx_titler fr">容错</div>
        <div class="clear"></div>
      </div>
      <div class="zx_content_rc">
        <table border="0" cellpadding="0" cellspacing="0" class="zx_content_rcb" id="confAreaId">
        </table>
      </div>
      
      <div class="zx_content_rk"></div>
      <div class="zx_content_ks" id="totalFltBtnId">
          <div class="zx_fs_sj" style="bottom:1px;left:172px;"></div>
          <div class="zx_fs_bor" style="bottom:45px;left:170px;"></div>
          <a href="javascript:void 0" >开始过滤</a>
      </div>
      <div class="zx_content_before"> </div>
      
      <!-- 过滤结果begin -->
      <div class="zx_content_after">
        <div class="zx_content_result">
          <table border="0" cellpadding="0" cellspacing="0" class="zx_content_resultb">
            <tr>
              <th width="120">过滤结果 </th>
                <th width="64">序号</th>
                <th width="86">过滤号码</th>
                <th width="80">奖金</th>
                <th width="60">操作</th>
            </tr>
          </table>
        </div>
       <span class="zxgl_before">
        <div class="resultlast_l fl" id="filterResultInfoId">
          <p>滤前<span>0</span>注 共<span>0</span>元</p>
          <p>滤后<span>0</span>注 共<span>0</span>元</p>
          <p>滤掉<span>0</span>注 省<span class="zxgl_red">0</span>元</p>
          <p>压缩：<span>未处理</span></p>
        </div>
        <div class="zx_content_resultlast fr">
          <table border="0" cellpadding="0" cellspacing="0" class="zx_content_resultb" id="filterResultId">
          </table>
        </div></span>
        <div class="both"></div>
        <p class="zxgl_zhus"><span>投注
          <input type="text" id="multipleId" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
          倍</span>投资金额：<strong class="zxgl_red" id="betMoneyId">0</strong> 元</p>
        <!-- <a href="javascript:void 0">方案详情</a> <a href="javascript:void 0">导出方案</a> -->
        <a href="javascript:void 0" id="lotteryFormBtnId">提交投注</a> <!-- <a href="javascript:void 0">优化投注</a>-->
        <a href="javascript:void 0" id="lotteryBonusBtnId">奖金优化</a>
        <div class="clear"></div>
      </div>
      <!-- 过滤结果end -->
      
    </div>
    <div class="clear"></div>
  </div>
</div>
<jsp:include page="./surepage.jsp"></jsp:include>
<!-- 过滤界面end -->
<div style="">
<jsp:include page="../../include/footer.jsp"></jsp:include>
</div>
<form id="lotteryBuyFormId" action="/lottery/bet.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value="${licenseId }"/>
	<input type="hidden" id="playId" name="playType" value="${playId }"/>
	<input type="hidden" id="passTypeId" name="passType" value="${passType}"/>
	<input type="hidden" name="singleFlag" value="1"/>
	<input type="hidden" id="betCodeId" name="betCode" value="${betCode }"/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="1"/>
	<input type="hidden" name="schInfo" value=""/>
	<input type="hidden" name="reserved8" value=""/>
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
</form>
<!-- 合买表单 -->
<form id="mergerBuyFormId" action="/merger/merge.jhtml" method="post" target="_blank">
	<input type="hidden" name="licenseId" value="${licenseId}"/>
	<input type="hidden" name="playType" value="${playId }"/>
	<input type="hidden" name="passType" value="${passType}"/>
	<input type="hidden" name="singleFlag" value="1"/>
	<input type="hidden" name="betCode" value="${betCode }"/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="betState" value=""/>
	<input type="hidden" name="issue" value='1'/>
	<input type="hidden" name="betFrom" value="1"/>
	<input type="hidden" name="betType" value="3"/>
	<input type="hidden" name="schInfo" value=""/>
	<input type="hidden" name="zjFlag" value=""/>
	<input type="hidden" name="orderOdds" value=""/>
	
	<!-- 竞彩理论奖金 -->
	<input type="hidden" name="theoryBonus" value="0"/>
	<!-- 方案是否复制 -->
	<input type="hidden" name="reserved15" value="1"/>
	<!-- 复制方案佣金比例 -->
	<input type="hidden" name="reserved16" value="0.1"/>
	
	<!-- 合买设置的信息begin -->
	<!--合买标题-->
	<input type="hidden" name="partTitile" value=""/>
	<!--方案描述-->
	<input type="hidden" name="partDetail" value=""/>
	<!--总份数-->
	<input type="hidden" name="totalNum" value=""/>
	<!--发起人购买份数-->
	<input type="hidden" name="launchNum" value=""/>
	<!--保密级别-->
	<input type="hidden" name="showLevel" value=""/>
	<!--佣金（提成比例）-->
	<input type="hidden" name="brokerage" value=""/>
	<!--保底份数-->
	<input type="hidden" name="insNum" value=""/>
	<!--合买设置的信息end-->
	
	<!-- 足彩暂存号码 -->
	<input type="hidden" name="reserved5" value=""/>
	<!-- 存放竞彩之外的其他彩种当前期的截止时间 -->
	<input type="hidden" name="reserved8" value="${issueStopTime }"/>
</form>
<script type="text/javascript" src="/js/lottery/guess/guessfootball/filterhh.js"></script>

<!-- 冷门过滤  begin -->
<div class="zx_layer" id="coldFDivId" style="display:none">
  <div class="zx_layer_top">
    <h3 class="fl" id="coldTitleId">集合过滤</h3>   
    <div class="clear"></div>
  </div>
  <div class="zx_layer_cont">
    <div class="zx_layer_contL fl">
      <table border="0" cellpadding="0" cellspacing="0" class="zx_layer_xq_n" >
        <tr>
          <th width="50">场次</th>
          <th width="58">主队</th>
          <th width="58">客队</th>
          <th class="zx_bd" width="181" ><a href="javascript:void 0" class="empty" id="coldRmvAllBtnId">清空</a></th>
        </tr>
        </table>
         <div class="left_scroll">
	         <table border="0" cellpadding="0" cellspacing="0" class="zx_layer_xq">
	        <tbody id="coldSchId">
        </tbody>
        </table>
        </div>
    </div>
    <div class="zx_layer_contr fl">
      <div class="zx_choose_t">
        <p>
          <select id="coldStartVId">
          </select>
          ≤ 场次范围 ≤
          <select id="coldEndVId">
          </select>
        </p>
      </div>
      <div class="choose_em"> 
        <a href="javascript:void 0" class="fl" id="coldAddCondId">添加</a> 
        <a href="javascript:void 0" class="choose_blue fr" id="coldRmvAllCondId">删除</a>
        <div class="clear"></div>
      </div>
      <div class="choose_cont">
        <ul id="confUlId">
        </ul>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="yes_btn_n" style="cursor:pointer;">确定</div>
</div>
<!-- 冷门过滤  end -->
</body>
</html>