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
<c:set var="pageName" value="进球彩玩法介绍" scope="page"></c:set>
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
               <a href="/playerintro/jqc.jhtml" class="hover">进球彩</a>
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
                  <h3>4场进球游戏规则</h3>
                 </div>
                 <div class="r_text">
                 <h2>
    第一章 总则
</h2>
<div class="r_text">
    第一条 根据财政部《彩票发行与销售管理暂行规定》和《中国足球彩票发行与销售管理办法》(以下简称《管理办法》)，制定本游戏规则。
</div>
<div class="r_text">
    第二条 中国足球彩票4场进球游戏(简称“4场进球游戏”)由国家体育总局体育彩票管理中心(以下简称“中体彩中心”)统一发行，在全国范围内联网销售。
</div>
<div class="r_text">
    第三条 “4场进球游戏”实行自愿购买，凡购买该彩票者即被视为同意并遵守本规则。
</div>
<h2>
    第二章 游戏方法
</h2>
<div class="r_text">
    第四条 “4场进球游戏”是以中体彩中心选定的4场足球比赛为竞猜对象，购买“4场进球游戏”时，由购买者对4场比赛8支球队在全场90分钟(含伤情补时)的进球数量(0、1、2、3+)进行投注，对于所选竞猜场次的比赛成绩均只选择1种预测结果的投注为单式投注，选择2种(含)以上预测结果的投注为复式投注。
</div>
<div class="r_text">
    购买者可对其选定的结果进行多倍投注，投注倍数范围为2-99倍。 
</div>
<div class="r_text">
     第五条 购买者可在各省、自治区、直辖市体育彩票管理中心设置的投注站进行投注。投注号码可由投注机随机产生，也可通过投注单将购买者选定的号码输入投注机确定。投注号码经系统确认后打印出的兑奖凭证即为“4场进球游戏”足球彩票，交购买者保存。  第六条 “4场进球游戏”每注2元人民币。彩票不记名、不挂失，不返还本金，不流通使用。  
</div>
<h2>
    第三章 设奖
</h2>
<div class="r_text">
    第七条 “4场进球游戏”只设1个浮动奖级，即一等奖。 
</div>
<div class="r_text">
     第八条 奖金分配：一等奖为当期奖金额的100%，及奖池和调节基金转入部分。  第九条 单注彩票中奖奖金最高限额500万元。  
</div>
<h2>
    第四章 奖金管理
</h2>
<div class="r_text">
    第十条 “4场进球游戏”返奖奖金为销售总额的65%。其中，当期奖金为销售总额的64%，调节基金为销售总额的1%。  
</div>
<div class="r_text">
    第十一条 “4场进球游戏”设置奖池，奖池由上期未中出的浮动奖奖金和超出一等奖单注封顶限额部分的奖金组成。奖池与当期奖金中用于一等奖的部分及调节基金转入部分合并为一等奖奖金。单注奖金以元为单位取整，不足1元补足至1元，补足部分从调节基金支付，调节基金不足从发行费列支。 
</div>
<div class="r_text">
     第十二条 调节基金包括按销售总额1%提取部分、浮动奖奖金取整后的余额、弃奖收入和逾期未退票的票款。调节基金专项用于支付各种不可预见情况下的奖金支出风险、调节浮动奖奖金，以及设立特别奖。  
</div>
<h2>
    第五章 中奖
</h2>
<div class="r_text">
    第十三条 购票人对4场比赛8支球队进球数的投注结果与实际比赛结果全部相同，即中一等奖。如出现《管理办法》第十三条规定的特别情形，则以《管理办法》确定的结果作为开奖结果，并以中体彩中心的公告为准。  
</div>
<h2>
    第六章 开奖及公告
</h2>
<div class="r_text">
    第十四条 每期计奖后，当期销售总额、中奖情况以及奖池资金余额等信息，将通过新闻媒体向社会公布，并将开奖结果通知各销售终端。  
</div>
<h2>
    第七章 兑奖
</h2>
<div class="r_text">
    第十五条 “4场进球游戏”兑奖当期有效。每期自计奖次日起60天为兑奖期，逾期未兑，视为弃奖。 
</div>
<div class="r_text">
     第十六条 兑奖机构有权查验中奖者的中奖彩票及有效身份证件，兑奖者应予配合。 
</div>
<div class="r_text">
     第十七条 凡伪造、涂改中奖彩票，冒领奖金者，送交司法机关追究法律责任。
</div>
<h2>
    第八章 附则
</h2>
<div class="r_text">
    第十八条 本游戏规则由国家体育总局体育彩票管理中心负责解释。
</div>
<div class="r_text">
      第十九条 本游戏规则执行中，有关重大事项的通告将在彩票机构指定的报刊上登载，并在足球彩票销售终端予以公布，销售者不再承担直接通知购票人的责任，购票人需自行知晓。 
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