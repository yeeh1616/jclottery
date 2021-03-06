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
<c:set var="pageName" value="七乐彩玩法介绍" scope="page"></c:set>
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
               <a href="/playerintro/ssq.jhtml">双色球</a>
               <a href="/playerintro/f3d.jhtml">福彩3d</a>
               <a href="/playerintro/qlc.jhtml" class="hover">七乐彩</a>
               <a href="/playerintro/jxssc.jhtml">江西时时彩</a>
           </div>
     
     </div>
     <div class="ben_right fr">
                 <div class="ben_right_t_1">
                  <h3>七乐彩游戏规则</h3>
                 </div>
                 <div class="r_text">
                 <h2>
    第一章 总 则 
</h2>
<div class="r_text">
第一条  根据《彩票管理条例》、《彩票管理条例实施细则》、《彩票发行销售管理办法》（财综[2012]102号）等有关规定，制定本规则。
</div>
<div class="r_text">
第二条  中国福利彩票双色球游戏（以下简称双色球）由中国福利彩票发行管理中心（以下称中福彩中心）发行和组织销售，由各省、自治区、直辖市福利彩票销售机构（以下称各省福彩机构）在所辖区域内销售。
</div>
<div class="r_text">
第三条  双色球采用计算机网络系统发行，在各省福彩机构设置的销售网点销售，定期开奖。
</div>
<div class="r_text">
第四条  双色球实行自愿购买，凡购买者均被视为同意并遵守本规则。
</div>
<div class="r_text">
第五条  不得向未成年人销售彩票或兑付奖金。
</div>
<h2>
    第二章 游戏方法
</h2>
<div class="r_text">
第六条  双色球投注区分为红色球号码区和蓝色球号码区，红色球号码区由1-33共三十三个号码组成，蓝色球号码区由1-16共十六个号码组成。投注时选择6个红色球号码和1个蓝色球号码组成一注进行单式投注，每注金额人民币2元。
</div>
<div class="r_text">
第七条  购买者可在各省福彩机构设置的销售网点投注。投注号码经投注机打印出对奖凭证，交购买者保存，此对奖凭证即为双色球彩票。
</div>
<div class="r_text">
第八条  购买者可选择机选号码投注、自选号码投注。机选号码投注是指由投注机随机产生投注号码进行投注，自选号码投注是指将购买者选定的号码输入投注机进行投注。
</div>
<div class="r_text">
第九条  购买者可选择复式投注。复式投注是指所选号码个数超过单式投注的号码个数，所选号码可组合为每一种单式投注方式的多注彩票的投注。具体规定如下：
</div>
<div class="r_text">
（一）红色球号码复式：是指从红色球号码中选择7个号码以上（含7个号码），从蓝色球号码中选择1个号码，组合为多注单式投注号码的投注；
</div>
<div class="r_text">
（二）蓝色球号码复式：是指从红色球号码中选择6个号码,从蓝色球号码中选择2个号码以上（含2个号码），组合为多注单式投注号码的投注；
</div>
<div class="r_text">
（三）全复式：是指从红色球号码中选择7个号码以上（含7个号码），从蓝色球号码中选择2个号码以上（含2个号码），组合为多注单式投注号码的投注。
</div>
<div class="r_text">
第十条  购买者可对其选定的投注号码进行多倍投注，投注倍数范围为2-99倍。单张彩票的投注金额最高不得超过20000元。
</div>
<div class="r_text">
第十一条  双色球按期销售，每周销售三期，期号以开奖日界定，按日历年度编排。
</div>
<div class="r_text">
第十二条  若因销售终端故障、通讯线路故障和投注站信用额度受限等原因造成投注不成功，应退还购买者投注金额。
</div>
<h2>
    第三章 设 奖 
</h2>
<div class="r_text">
第十三条  双色球按当期销售额的50%、15%和35%分别计提彩票奖金、彩票发行费和彩票公益金。彩票奖金分为当期奖金和调节基金，其中，49%为当期奖金，1%为调节基金。
</div>
<div class="r_text">
第十四条  双色球采取全国统一奖池计奖。
</div>
<div class="r_text">
第十五条  双色球奖级设置分为高奖级和低奖级，一等奖和二等奖为高奖级，三至六等奖为低奖级。当期奖金减去当期低奖级奖金为当期高奖级奖金。各奖级和奖金规定如下：
</div>
<div class="r_text">
一等奖：当奖池资金低于1亿元时，奖金总额为当期高奖级奖金的75%与奖池中累积的资金之和，单注奖金按注均分，单注最高限额封顶500万元。当奖池资金高于1亿元（含）时，奖金总额包括两部分，一部分为当期高奖级奖金的55%与奖池中累积的资金之和，单注奖金按注均分，单注最高限额封顶500万元；另一部分为当期高奖级奖金的20%，单注奖金按注均分，单注最高限额封顶500万元。
</div>
<div class="r_text">
二等奖：奖金总额为当期高奖级奖金的25%，单注奖金按注均分，单注最高限额封顶500万元。
</div>
<div class="r_text">
三等奖：单注奖金固定为3000元。
</div>
<div class="r_text">
五等奖：单注奖金固定为10元。
</div>
<div class="r_text">
六等奖：单注奖金固定为5元。
</div>
<div class="r_text">
第十六条  双色球设置奖池，奖池资金由未中出的高奖级奖金和超出单注奖金封顶限额部分的奖金组成，奖池资金用于支付一等奖奖金。
</div>
<div class="r_text">
第十七条  调节基金包括按销售总额的1%提取部分、逾期未退票的票款、浮动奖奖金按元取整后的余额。调节基金用于支付不可预见的奖金支出风险，以及设立特别奖。动用调节基金设立特别奖，应报财政部审核批准。
</div>
<div class="r_text">
第十八条  当一等奖的单注奖金低于二等奖的单注奖金时，将一等奖和二等奖的奖金总额相加，由一等奖和二等奖的中奖者按注均分；当二等奖的单注奖金低于三等奖单注奖金的两倍时，由调节基金将二等奖的单注奖金补足为三等奖单注奖金的两倍。
</div>
<div class="r_text">
第十九条  双色球的当期奖金和奖池资金不足以兑付当期中奖奖金时，由调节基金补足，调节基金不足时，用彩票兑奖周转金垫支。在出现彩票兑奖周转金垫支的情况下，当调节基金有资金滚入时优先偿还垫支的彩票兑奖周转金。
</div>
<h2>
第四章  开奖
</h2>
<div class="r_text">
第二十条  双色球由中福彩中心统一开奖，每周二、四、日开奖。
</div>
<div class="r_text">
第二十一条  双色球每期开奖时，在公证人员封存销售数据资料之后，并在其监督下通过摇奖器确定开奖号码。摇奖时先摇出6个红色球号码，再摇出1个蓝色球号码。
</div>
<div class="r_text">
第二十二条  每期开奖后，中福彩中心和各省福彩机构应向社会公布开奖号码、当期销售总额、各奖级中奖情况及奖池资金余额等信息，并将开奖结果通知销售网点。
</div>
<div class="r_text">
第二十三条  双色球根据购买者所选单式投注号码（复式投注按其包含的每一注单式投注计）与当期开奖号码的相符情况，确定相应的中奖资格。具体规定如下：
</div>
<div class="r_text">
一等奖：投注号码与当期开奖号码全部相同（顺序不限，下同），即中奖；
</div>
<div class="r_text">
二等奖：投注号码与当期开奖号码中的6个红色球号码相同，即中奖；
</div>
<div class="r_text">
三等奖：投注号码与当期开奖号码中的任意5个红色球号码和1个蓝色球号码相同，即中奖；
</div>
<div class="r_text">
四等奖：投注号码与当期开奖号码中的任意5个红色球号码相同，或与任意4个红色球号码和1个蓝色球号码相同，即中奖；
</div>
<div class="r_text">
五等奖：投注号码与当期开奖号码中的任意4个红色球号码相同，或与任意3个红色球号码和1个蓝色球号码相同，即中奖；
</div>
<div class="r_text">
六等奖：投注号码与当期开奖号码中的1个蓝色球号码相同，即中奖。
</div>
<div class="r_text">
第二十四条  高奖级中奖者按各奖级的中奖注数均分该奖级奖金，并以元为单位取整计算；低奖级中奖者按各奖级的单注固定奖金获得相应奖金。
</div>
<div class="r_text">
第二十五条  当期每注投注号码只有一次中奖机会，不能兼中兼得，特别设奖除外。
</div>

<h2>
    第七章 兑奖 
</h2>
<div class="r_text">
第二十六条  双色球兑奖当期有效。中奖者应当自开奖之日起60个自然日内，持中奖彩票到指定的地点兑奖。逾期未兑奖视为弃奖，弃奖奖金纳入彩票公益金。
</div>
<div class="r_text">
第二十七条  中奖彩票为中奖唯一凭证，中奖彩票因玷污、损坏等原因不能正确识别的，不能兑奖。
</div>
<div class="r_text">
第二十八条  兑奖机构可以查验中奖者的中奖彩票及有效身份证件，中奖者兑奖时应予配合。
</div>
<h2>
    第八章 附 则
</h2>
<div class="r_text">
第二十九条  本规则自批准之日起执行。
</div>
<div class="r_text">
    <br />
</div>

     </div>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>