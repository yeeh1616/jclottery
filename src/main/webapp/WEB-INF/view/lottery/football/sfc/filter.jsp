<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="在线过滤" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp" %>
<link type="text/css" rel="stylesheet" href="/cytxhome/filter/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/filter/css/jjyh.css"/>
</head>
<body>
<jsp:include page="../../../include/header.jsp"></jsp:include>

<!-- 过滤界面begin -->
<div class=" w_jjyh" id="betPanalId">
  <div class="prompt">
    <div class="promptl fl"><a href="javascript:void 0" class="zxgl_logo fl"></a><span>足彩 14场胜平负</span>
      <div class="clear"></div>
    </div>
    <div class="promptc fl">第${game.issue}期 截止时间：<span id="stopTimeId">${game.stopTime}</span></div>
    <div class="promptr fr"><a href="javascript:void 0" class="zxgl_help"></a><a href="javascript:void 0">帮助中心</a><a href="/" class="zxgl_back"></a><a href="/">返回首页</a></div>
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
                <option>平均赔率</option>
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
      <div class="jj_explain">快速选择：<a href="javascript:void 0" class="first_s" id="qsAllBtnId">全排</a>
      <a href="javascript:void 0" class="first_s" id="qsRdBtnId">随机</a>
      <a href="javascript:void 0" class="first_s" id="qsClBtnId">清除</a></div>
      <div class="jj_choose">共<span class="c_blue" id="betNumSId">0</span>注，<span class="c_red" id="betMoneySId">0</span>元
      
      </div>
      <div class="jj_add" id="bonusCalId">
       
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
         
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n" >匹配过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="306" type="6">冷门过滤</a></li>
          <li><a href="javascript:void 0" conf="307" type="6">命中过滤</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n">选择注数</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="700" type="4"><i class="gldx"></i>奖金选取</a></li>
          <li><a href="javascript:void 0" conf="701" type="5"><i class="gldx"></i>随机选取</a></li>
        </ul>
        <a href="javascript:void 0" name="confArea" class="zx_btn_n" style="display:none;">码型过滤</a>
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
        <a href="javascript:void 0" name="confArea" class="zx_btn_n" style="display:none;">集合过滤</a>
        <ul class="zx_listbtnf" style="display:none;">
          <li><a href="javascript:void 0" conf="600"><i class="gldx"></i>交集保留</a></li>
          <li><a href="javascript:void 0" conf="601"><i class="gldx"></i>交易滤除</a></li>
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
              <th width="144">过滤结果 </th>
              <th width="64">序号</th>
              <th width="86">过滤号码</th>
              <th width="120">&nbsp;</th>
            </tr>
          </table>
        </div>
       <span class="zxgl_before">
        <div class="resultlast_l fl" id="filterResultInfoId">
          <p>过滤前<span>0</span>注 共<span>0</span>元</p>
          <p>过滤后<span>0</span>注 共<span>0</span>元</p>
          <p>过滤掉<span>0</span>注 省<span class="zxgl_red">0</span>元</p>
          <p>压缩：<span>未处理</span></p>
        </div>
        <div class="zx_content_resultlast fr" style="width:274px;">
          <table border="0" cellpadding="0" cellspacing="0" class="zx_content_resultb" id="filterResultId">
          </table>
        </div></span>
        <div class="both"></div>
        <p class="zxgl_zhus"><span>投注
          <input type="text" id="multipleId" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
          倍</span>注数：<strong class="zxgl_red" id="totalBetNumId">0</strong>，金额：<strong class="zxgl_red" id="totalBetMoneyId">0</strong> 元</p>
        <a href="javascript:void 0" id="lotteryFormBtnId">确认提交</a>
        <a href="javascript:void 0" id="expBtnId">导出文件</a>  
        <div class="clear"></div>
      </div>
      <!-- 过滤结果end -->
      
    </div>
    <div class="clear"></div>
  </div>
</div>
<!-- 过滤界面end -->

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
<jsp:include page="../surepage.jsp"></jsp:include>
<jsp:include page="../../lotteryForm.jsp"></jsp:include>
<jsp:include page="../../../include/footer.jsp"></jsp:include>

<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="http://${domain.collectionHost}/global/schudle/5/${game.issue }.js"></script>
<script type="text/javascript" src="/js/lottery/football/Filter.js"></script>
<script type="text/javascript" src="/js/lottery/football/sfc/filter.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js"></script>
<script type="text/javascript" src="/js/lottery/football/Football.js"></script>
<script type="text/javascript" src="/js/lottery/football/pubPageControl.js"></script>
</body>
</html>