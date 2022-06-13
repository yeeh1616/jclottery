<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
<c:set var="pageName" value="排列五玩法介绍" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="ben_pic">
     <div class="fl ben_left_1">
           <h3><b>彩种分类</b></h3>
           <ul>
                   <li>全国统一体彩</li>
           </ul>
           <div class="ben_a">
               <a href="/playerintro/index.jhtml" style="margin-top:4px;">排列三</a>
               <a href="/playerintro/pw.jhtml">排列五</a>
               <a href="/playerintro/qx.jhtml">七星彩</a>
               <a href="/playerintro/dlt.jhtml">大乐透</a>
               <a href="/playerintro/sfc.jhtml">胜负彩</a>
               <a href="/playerintro/rxj.jhtml">胜负彩任选九场</a>
               <a href="/playerintro/bqc.jhtml">半全场</a>
               <a href="/playerintro/jqc.jhtml">进球彩</a>
               <a href="/playerintro/jczq.jhtml">竞彩足球</a>
               <a href="/playerintro/jclq.jhtml">竞彩篮球</a>
               <a href="/playerintro/xysc.jhtml">幸运赛车</a>
           </div>
           <ul>
                   <li>全国统一福彩</li>
           </ul>
           <div class="ben_a">
               <a href="/playerintro/ssq.jhtml" class="hover">双色球</a>
               <a href="/playerintro/f3d.jhtml">福彩3d</a>
               <a href="/playerintro/qlc.jhtml">七乐彩</a>
               <a href="/playerintro/jxssc.jhtml">江西时时彩</a>
           </div>
     
     </div>
     <div class="ben_right fr">
                 <div class="ben_right_t_1">
                  <h3>七乐彩游戏规则</h3>
                 </div>
                 <div class="r_text">
    <h2>第一章　总 则</h2>
</div>
<div class="r_text">
    本规则依据《彩票发行与销售管理暂行规定》（财综[2002]13号）等制度制定。
</div>
<div class="r_text">
    全国联合销售30选7电脑福利彩票（以下称“七乐彩”）由中国福利彩票发行管理中心（以下称“中福彩中心”）统一组织发行，由各省、自治区、直辖市福利彩票发行中心（以下称“省中心”）在本行政区域内联合销售。
</div>
<div class="r_text">
    七乐彩采用计算机网络系统销售，采取参加联合销售的各省中心合并奖池，统一计奖，统一开奖。
</div>
<div class="r_text">
    七乐彩实行自愿购买，凡购买者均被视为同意并遵守本规则。
</div>
<div class="r_text">
    不得向未成年人销售彩票或兑付奖金。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第二章　投注</h2>
</div>
<div class="r_text">
    七乐彩采用组合式玩法，从01—30共30个号码中选择7个号码组合为一注投注号码。每注金额人民币2元。
</div>
<div class="r_text">
    七乐彩每周销售三期，期号以开奖日界定，按日历年度编排。
</div>
<div class="r_text">
    七乐彩投注方法分为自选号码投注和机选号码投注，投注方式分为单式投注、复式投注、胆拖投注和多倍投注。
</div>
<div class="r_text">
    自选号码投注是指由投注者自行选定投注号码的投注；机选号码投注是指由投注机为投注者随机产生投注号码的投注。
</div>
<div class="r_text">
    单式投注是从30个号码中选择7个号码，组合为一注投注号码的投注；复式投注是从30个号码中选择8－16个号码，将每7个号码的组合方式都作为一
注投注号码的多注投注；胆拖投注是在30个号码中选择1至6个号码作为每注都有的胆码，再补充其它不同的号码，进行每7个号码为一组的多注投注；多倍投注
是指同样的投注号码进行多注投注。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第三章　设　奖</h2>
</div>
<div class="r_text">
    七乐彩设奖奖金为销售总额的50%，其中当期奖金为销售总额的49%，调节基金为销售总额的1%。
</div>
<div class="r_text">
    七乐彩当期奖金设七个奖等，一至三等奖为高奖等，四至七等奖为低奖等。高奖等采用浮动设奖，低奖等采用固定设奖。当期奖金减去当期低奖等奖金为当期高奖等奖金，具体设奖如下：
</div>
<div class="r_text">
    一等奖：奖金总额为当期高奖等奖金的70%；
</div>
<div class="r_text">
    二等奖：奖金总额为当期高奖等奖金的10%；
</div>
<div class="r_text">
    三等奖：奖金总额为当期高奖等奖金的20%；
</div>
<div class="r_text">
    四等奖：单注奖金额固定为200元；
</div>
<div class="r_text">
    五等奖：单注奖金额固定为50元；
</div>
<div class="r_text">
    六等奖：单注奖金额固定为10元；
</div>
<div class="r_text">
    七等奖：单注奖金额固定为5元。
</div>
<div class="r_text">
    七乐彩单注奖金的最高限额为500万元。
</div>
<div class="r_text">
    七乐彩设立奖池，奖池由未中出的高奖等奖金和超出单注奖金封顶限额部分的奖金组成。奖池与当期奖金中用于一等奖的部分合并颁发一等奖奖金。
</div>
<div class="r_text">
    调节基金包括按销售总额1%提取部分、弃奖奖金、浮动奖奖金按元取整后的余额。调节基金用于设置特别奖、调节浮动奖奖金、支付各种不可预见情况下的奖金支出风险。
</div>
<div class="r_text">
    若当期高奖等单注奖额低于其次奖等单注奖额的二倍，应保证高奖等的单注奖额为其次奖等单注奖额的二倍，资金来源由调节基金补足，调节基金不足时由发行经费垫支。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第四章　开　奖</h2>
</div>
<div class="r_text">
    七乐彩由中福彩中心统一开奖，每周一、三、五开奖。摇奖过程在公证人员监督下进行，通过公众媒体发布开奖公告。
</div>
<div class="r_text">
    各省中心将当期投注的全部数据刻入不可改写的光盘，中福彩中心对各省中心的数据进行汇总。开奖后，以光盘记录的当期数据作为开奖检索的依据。
</div>
<div class="r_text">
    七乐彩通过摇奖器确定开奖号码。摇奖时先摇出7个号码作为基本号码，再摇出1个号码作为特别号码。
</div>
<div class="r_text">
    开奖公告在各地主要媒体公布，并在各投注站点张贴。
</div>
<div class="r_text">
    七乐彩的开奖结果以中福彩中心公布的开奖公告为准。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第五章　中　奖</h2>
</div>
<div class="r_text">
    七乐彩以投注者所选投注号码与当期开奖号码相同个数的多少确定中奖等级，具体中奖设定如下：
</div>
<div class="r_text">
    一等奖：投注号码与当期开奖号码中7个基本号码完全相同（顺序不限，下同）；
</div>
<div class="r_text">
    二等奖：投注号码与当期开奖号码中任意6个基本号码及特别号码相同；
</div>
<div class="r_text">
    三等奖：投注号码与当期开奖号码中任意6个基本号码相同；
</div>
<div class="r_text">
    四等奖：投注号码与当期开奖号码中任意5个基本号码及特别号码相同；
</div>
<div class="r_text">
    五等奖：投注号码与当期开奖号码中任意5个基本号码相同；
</div>
<div class="r_text">
    六等奖：投注号码与当期开奖号码中任意4个基本号码及特别号码相同；
</div>
<div class="r_text">
    七等奖：投注号码与开奖号码中任意4个基本号码相同。
</div>
<div class="r_text">
    高奖等中奖者按各奖等的中奖注数均分该奖等奖金，并以元为单位取整计算；低奖等中奖者按各奖等的单注固定奖额获得奖金。
</div>
<div class="r_text">
    当期每注投注号码只有一次中奖机会，不能兼中兼得（另行设奖按设奖规定执行）。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第六章　兑　奖</h2>
</div>
<div class="r_text">
    七乐彩兑奖当期有效。每期开奖次日起，兑奖期限为30天，逾期未兑奖者视为弃奖，弃奖奖金进入调节基金。
</div>
<div class="r_text">
    中奖人兑奖时须提交完整的兑奖彩票。中奖彩票因受损导致无法辨认真伪的，不予兑奖。
</div>
<div class="r_text">
    各省具体兑奖规定按各省中心的兑奖规定执行。
</div>
<div class="r_text">
    单注彩票中奖金额超过一万元者，须缴纳个人所得税，所得税由兑奖机构代扣代缴。
</div>
<div class="r_text">
    &nbsp;
</div>
<div class="r_text">
    <h2>第七章　附　则</h2>
</div>
<div class="r_text">
    本规则自批准之日起施行。
</div>
<div class="r_text">
    七乐彩采用组合式玩法，从01—30共30个号码中选择7个号码组合为一注投注号码。每注金额人民币2元。
</div>
<div class="r_text">
    在本站中，七乐彩支持的玩法有：七乐彩单式投注，七乐彩复式投注，七乐彩胆拖投注、七乐彩方案粘贴。
</div>
<div class="r_text">
    <h2>七乐彩单式投注： </h2>七乐彩单式投注如下图从七位数字的0-9数字中各选择一个数字，组合为一注投注号码的投注，即为单式投注。
</div>
<div class="r_text">
    <br/>
</div>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>