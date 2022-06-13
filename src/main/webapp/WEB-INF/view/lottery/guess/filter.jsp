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
<c:if test="${licenseId == 21}">
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/21/bjdc.mobile.js"></script>
<script type="text/javascript" src="/js/lottery/bjSingleSchedule/SingleSchedule.js"></script>
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
            <th width="98"><select>
                <option>竞彩赔率</option>
                <option></option>
                <option></option>
              </select></th>
            <th width="28">胜</th>
            <th width="28">平</th>
            <th width="28">负</th>
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
          <li><a href="javascript:void 0" conf="100" type="1"><i class="gldx"></i>胜场次</a></li>
          <li><a href="javascript:void 0" conf="101" type="1"><i class="gldx"></i>平场次</a></li>
          <li><a href="javascript:void 0" conf="102" type="1"><i class="gldx"></i>负场次</a></li>
          <li><a href="javascript:void 0" conf="103" type="1"><i class="gldx"></i>积分和</a></li>
          <li><a href="javascript:void 0" conf="104" type="1"><i class="gldx"></i>断点数</a></li>
          <li><a href="javascript:void 0" conf="105" type="1"><i class="gldx"></i>连号数</a></li>
          <li><a href="javascript:void 0" conf="106" type="1"><i class="gldx"></i>主场连胜</a></li>
          <li><a href="javascript:void 0" conf="107" type="1"><i class="gldx"></i>主场连平</a></li>
          <li><a href="javascript:void 0" conf="108" type="1"><i class="gldx"></i>主场连负</a></li>
          <li><a href="javascript:void 0" conf="109" type="1"><i class="gldx"></i>胜平连号</a></li>
          <li><a href="javascript:void 0" conf="110" type="1"><i class="gldx"></i>胜负连号</a></li>
          <li><a href="javascript:void 0" conf="111" type="1"><i class="gldx"></i>平负连号</a></li>
          <li><a href="javascript:void 0" conf="112" type="1"><i class="gldx"></i>邻号间距和</a></li>
          <li><a href="javascript:void 0" conf="113" type="1"><i class="gldx"></i>邻号乘积和</a></li>
          <li><a href="javascript:void 0" conf="114" type="1"><i class="gldx"></i>号码位积和</a></li>
          <li><a href="javascript:void 0" conf="115" type="1"><i class="gldx"></i>反向位积和</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n">赔率过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="200" type="1"><i class="gldx"></i>第一赔率</a></li>
          <li><a href="javascript:void 0" conf="201" type="1"><i class="gldx"></i>第二赔率</a></li>
          <li><a href="javascript:void 0" conf="202" type="1"><i class="gldx"></i>第三赔率</a></li>
          <li><a href="javascript:void 0" conf="203" type="2"><i class="gldx"></i>赔率和</a></li>
          <li><a href="javascript:void 0" conf="204" type="2"><i class="gldx"></i>赔率积</a></li>
          <li><a href="javascript:void 0" conf="205" type="2"><i class="gldx"></i>奖金范围</a></li>
          <!-- <li><a href="javascript:void 0" conf="206"><i class="gldx"></i>区间排名</a></li>
          <li><a href="javascript:void 0" conf="207"><i class="gldx"></i>概率积</a></li>
          <li><a href="javascript:void 0" conf="208"><i class="gldx"></i>值博率</a></li>
          <li><a href="javascript:void 0" conf="209"><i class="gldx"></i>概率和</a></li> -->
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n">匹配过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <!--<li><a href="javascript:void 0" conf="300"><i class="gldx"></i>分组场次</a></li>
          <li><a href="javascript:void 0" conf="301"><i class="gldx"></i>连续场次</a></li>
          <li><a href="javascript:void 0" conf="302"><i class="gldx"></i>号码和值</a></li>
          <li><a href="javascript:void 0" conf="303"><i class="gldx"></i>310间隔</a></li>
          <li><a href="javascript:void 0" conf="304"><i class="gldx"></i>断点过滤</a></li>
          <li><a href="javascript:void 0" conf="305"><i class="gldx"></i>单注组合</a></li>-->
          <li><a href="javascript:void 0" conf="306" type="6">冷门过滤</a></li>
          <li><a href="javascript:void 0" conf="307" type="6">命中过滤</a></li>
          <!--<li><a href="javascript:void 0" conf="308"><i class="gldx"></i>特征串</a></li>
          <li><a href="javascript:void 0" conf="309"><i class="gldx"></i>定位过滤</a></li>
          <li><a href="javascript:void 0" conf="310"><i class="gldx"></i>数字特征</a></li>-->
        </ul>
        <!--<a href="javascript:void 0" name="confArea" class="zx_btn_n">码型过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="400"><i class="gldx"></i>赔率码型</a></li>
          <li><a href="javascript:void 0" conf="401"><i class="gldx"></i>赔率连续</a></li>
          <li><a href="javascript:void 0" conf="402"><i class="gldx"></i>赔率过滤</a></li>
          <li><a href="javascript:void 0" conf="403"><i class="gldx"></i>分组赔率</a></li>
          <li><a href="javascript:void 0" conf="404"><i class="gldx"></i>连续过滤</a></li>
          <li><a href="javascript:void 0" conf="405"><i class="gldx"></i>码型过滤</a></li>
          <li><a href="javascript:void 0" conf="406"><i class="gldx"></i>号码遗传</a></li>
          <li><a href="javascript:void 0" conf="407"><i class="gldx"></i>胆拖组合</a></li>
          <li><a href="javascript:void 0" conf="408"><i class="gldx"></i>常规组合</a></li>
          <li><a href="javascript:void 0" conf="409"><i class="gldx"></i>相同指标</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n">集合过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="600"><i class="gldx"></i>交集保留</a></li>
          <li><a href="javascript:void 0" conf="601"><i class="gldx"></i>交易滤除</a></li>
        </ul>-->
        <a href="javascript:void 0" name="confArea" class="zx_btn_n">选择注数</a>
        <ul class="zx_listbtnf" style="display:none;">
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
        <!-- <a href="javascript:void 0">方案详情</a>  -->
        <a href="javascript:void 0" id="lotteryFormBtnId">提确认交</a> <!-- <a href="javascript:void 0">优化投注</a>-->
        <c:if test="${licenseId == 9}">
        <a href="javascript:void 0" id="lotteryBonusBtnId">奖金优化</a>
        </c:if>
        <a href="javascript:void 0" id="exportBtnId">导出方案</a>
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
<c:if test="${licenseId == 9}">
<script type="text/javascript" src="/js/lottery/guess/guessfootball/filter.js"></script>
</c:if>
<c:if test="${licenseId == 21}">
<script type="text/javascript" src="/js/lottery/bjSingleSchedule/filter.js"></script>
</c:if>

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
          <th width="10%">场次</th>
          <th width="12%">主队</th>
          <th width="12%">客队</th>
          <th colspan="3" width="23%"><select>
              <option>竞彩赔率</option>
            </select></th>
          <th width="7%">胜</th>
          <th width="7%">平</th>
          <th width="7%">负</th>
          <th width="12%"class="zx_bd" ><a href="javascript:void 0" class="empty" id="coldRmvAllBtnId">清空</a></th>
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
<script type="text/javascript">
$(document).ready(function () {
	$("#exportBtnId").click(function(){
		if ( $("#filterResultId").find("tr").length > 0 ) {
			var data = "";
			$("#filterResultId").find("tr").each(function(index){
				data += $(this).find("td").eq(1).html() + "\n";
			});
			data = data.substring(0, data.length-1);
			$("#exportFilterDataForm").remove();
			var $form = $("<form action='/common/downfile.jhtml' method='post'></form>")
					.appendTo("body");
			var $filepath = $(
					"<input type='hidden' id='fileName' name='fileName' value='/北京单场过滤结果.txt' />")
					.appendTo($form);
			var $filterContent = $(
					"<input type='hidden' id='filterContent' name='content' value='' />")
					.appendTo($form);
			
			$filterContent.val(data);
			$form.submit();
		}
	});
});
</script>
</body>
</html>