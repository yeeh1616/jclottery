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
<c:set var="pageName" value="任选九玩法介绍" scope="page"></c:set>
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
               <a href="/playerintro/rxj.jhtml" class="hover">胜负彩任选九场</a>
               <a href="/playerintro/bqc.jhtml">半全场</a>
               <a href="/playerintro/jqc.jhtml">进球彩</a>
               <a href="/playerintro/jczq.jhtml">竞彩足球</a>
               <a href="/playerintro/jclq.jhtml">竞彩篮球</a>
               <a href="/playerintro/xysc.jhtml">幸运赛车</a>
               <a href="/playerintro/syxw.jhtml">十一选五</a>
           </div>
           <ul>
                   <li>全国统一福彩</li>
           </ul>
           <div class="ben_a">
               <a href="/playerintro/ssq.jhtml">双色球</a>
               <a href="/playerintro/f3d.jhtml">福彩3d</a>
               <a href="/playerintro/qlc.jhtml">七乐彩</a>
               <a href="/playerintro/jxssc.jhtml">江西时时彩</a>
           </div>
     
     </div>
     <div class="ben_right fr">
                 <div class="ben_right_t_1">
                  <h3>任选九场游戏规则</a></h3>
                 </div>
                 <div class="r_text">
                 <h2>
    第一章 总则 
</h2>
<div class="r_text">
    第一条 根据财政部《彩票发行与销售管理暂行规定》和《中国足球彩票发行与销售管理办法》，制定本游戏规则。
</div>
<div class="r_text">
    第二条 中国足球彩票胜负游戏附加玩法“任选9场”（以下简称“胜负任选9场”）由国家体育总局体育彩票管理中心统一发行，在全国范围内进行联网销售。
</div>
<div class="r_text">
    第三条 “胜负任选9场”实行自愿购买，凡购买该彩票者即被视为同意并遵守本规则。
</div>
<h2>
    第二章 游戏方法
</h2>
<div class="r_text">
    第四条 “胜负任选9场”是以中国足球彩票胜负玩法所选择的足球比赛场次为竞猜对象，购买“胜负任选9场”时，由购买者从中国足球彩票胜负玩法选择的所有竞猜场次中的任意9场竞猜场次中每场比赛在全场90分钟（含伤情补时）比赛的胜平负的结果进行投注，对于所选竞猜场次的比赛成绩均只选择1种预测结果为单式投注，对于某一竞猜场次的比赛成绩选择2种（含）以上的预测结果为复式投注。
</div>
<div class="r_text">
    购买者可对其选定的结果进行多倍投注，投注倍数范围为2-99倍。
</div>
<div class="r_text">
    第五条 购买者可在各省、自治区、直辖市体育彩票管理中心设置的投注站进行投注。投注号码可由投注机随机产生，也可通过投注单将购买者选定的号码输入投注机确定。投注号码经系统确认后打印出的兑奖凭证即为“胜负任选9场”足球彩票，交购买者保存。
</div>
<div class="r_text">
    第六条 “胜负任选9场”每注2元人民币。彩票不记名、不挂失，不返还本金，不流通使用。
</div>
<h2>
    第三章 设奖
</h2>
<div class="r_text">
    第七条 “胜负任选9场”只设1个浮动奖级，即一等奖。
</div>
<div class="r_text">
    第八条 奖金分配：
</div>
<div class="r_text">
    一等奖为当期奖金额的100%，及奖池和调节基金转入部分。
</div>
<div class="r_text">
    如出现《管理办法》第十二条规定的特别情形，则以《管理办法》确定的结果作为开奖结果，并以总局彩票中心的公告为准
</div>
<div class="r_text">
    第九条 单注彩票中奖奖金最高限额500万元。
</div>
<h2>
    第四章 奖金管理
</h2>
<div class="r_text">
    第十条 “胜负任选9场”返奖奖金为销售总额的65％。其中，当期奖金为销售总额的64%，调节基金为销售总额的1%。
</div>
<div class="r_text">
    第十一条 “胜负任选9场”设置奖池，奖池由上期未中出的浮动奖奖金和超出一等奖单注封顶限额部分的奖金组成。奖池与当期奖金中用于一等奖的部分及调节基金转入部分合并为一等奖奖金。
</div>
<div class="r_text">
    单注奖金以元为单位取整，不足1元补足至1元，补足部分从调节基金支付，调节基金不足从发行费列支。
</div>
<div class="r_text">
    第十二条 调节基金包括按销售总额1%提取部分、浮动奖奖金取整后的余额、弃奖收入和逾期未退票的票款。调节基金专项用于支付各种不可预见情况下的奖金支出风险、调节浮动奖奖金，以及设立特别奖。
</div>
<h2>
    第五章 中奖
</h2>
<div class="r_text">
    第十三条 所购彩票选择的结果与中国足球彩票胜负玩法所选择的任意9场竞猜场次中每场比赛的胜平负结果一致即中一等奖。
</div>
<h2>
    第六章 开奖及公告
</h2>
<div class="r_text">
    第十四条 “胜负任选9场”与中国足球彩票胜负玩法同期销售与计奖。
</div>
<div class="r_text">
    第十五条 每期计奖后，当期销售总额、中奖情况以及奖池资金余额等信息，将通过新闻媒体向社会公布，并将开奖结果通知各销售终端。
</div>
<h2>
    第七章 兑奖
</h2>
<div class="r_text">
    第十六条 “胜负任选9场”兑奖当期有效。每期自计奖次日起60天为兑奖期，逾期未兑，视为弃奖。
</div>
<div class="r_text">
    第十七条 兑奖机构有权查验中奖者的中奖彩票及有效身份证件，兑奖者应予配合。
</div>
<div class="r_text">
    第十八条 凡伪造、涂改中奖彩票，冒领奖金者，送交司法机关追究法律责任。
</div>
<h2>
    第八章 附则
</h2>
<div class="r_text">
    第十九条 本游戏规则由国家体育总局体育彩票管理中心负责解释。
</div>
<div class="r_text">
    第二十条 本游戏规则自下发之日起执行。
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