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
<c:set var="pageName" value="竞彩篮球玩法介绍" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<style type="text/css">
 h2{font-size: 16px;margin-top: 14px;margin-bottom:10px;}
.rule_table{ border-top:1px solid #bad0dd;border-left:1px solid #bad0dd;margin:0 auto;margin-bottom:20px;}
.rule_table td{border-bottom:1px solid #bad0dd;border-right:1px solid #bad0dd;height:23px;text-align:center;color:#51321d;width:10%;}
.rule_table1 td{height:27px;background:#effafe;font-weight:bold;}
</style>
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
               <a href="/playerintro/jclq.jhtml" class="hover">竞彩篮球</a>
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
                  <h3>竞彩篮球游戏玩法规则</h3>
                 </div>
                 <div class="r_text">
    <span style="color:#000">目前，竞彩篮球游戏推出4种游戏玩法，分别为“胜负”、“让分胜负”、“大小分”和“胜分差”，竞猜的比赛由国家体育总局体育彩票管理中心选定并向社会公布。</span>
</div>
<div class="r_text">
    <h2>一、竞彩篮球胜负游戏：</h2>
      　　竞彩篮球胜负玩法：以国家体育总局体育彩票管理中心选定的国际重要篮球比赛为竞猜对象，由购票人对指定的比赛场次在全场（含加时赛）的比赛结果进行投注。每一场比赛设置2种比赛结果选项：<br>
      　　（一）“胜”：表示主队胜，客队负；<br>
      　　（二）“负”：表示主队负，客队胜。<br>
    <h2>二、竞彩篮球让分胜负游戏： </h2>
      　　竞彩篮球让分胜负玩法：以国家体育总局体育彩票管理中心选定的国际重要篮球比赛为竞猜对象，由购票人对指定的比赛场次在全场（含加时赛）的比赛结果进行投注。每一场比赛设置2种比赛结果选项：<br>
      　　（一）“胜”：表示主队胜，客队负；<br>
      　　（二）“负”：表示主队负，客队胜。<br>
      　　对每个选定的比赛场次，国家体育总局体育彩票管理中心根据实际比赛情况采用让分方式确定胜负关系。具体让分球队及让分数量和竞猜赛程一同公布。<br>
      　　 例如：<br>
      　　 主队让1.5分。<br>
      　　 1、“胜”主队得分减去客队得分大于1.5时，主队胜，客队负；<br>
      　　 2、“负” 主队得分减去客队得分小于1.5时，主队负，客队胜。<br>
      　　 客队让3.5分。<br>
      　　 1、“胜” 客队得分减去主队得分小于3.5时，主队胜，客队负；<br>
      　　 2、“负” 客队得分减去主队得分大于3.5时，主队负，客队胜。<br>
      　　 在进行单场投注时，各比赛场次的让分数量始终保持不变；在进行过关投注时，各比赛场次的让分数量在销售过程中根据投注额和其他相关因素调整，并通过销售系统和其他指定方式予以公布。购票人在完成有效投注时刻所获得的某场比赛对应的让分数量即为该有效投注判断是否中奖的依据。
	  </div>
	  <div class="r_text">
    <h2>三、竞彩篮球胜分差游戏：</h2>
      　　竞彩篮球胜负差玩法：以国家体育总局体育彩票管理中心选定的国际重要篮球比赛为竞猜对象，由购票人对指定的比赛场次在全场（含加时赛）的主队和客队的得分差距结果进行投注。每一场比赛设置12种得分差距结果选项：<br>
      　　（一）“主26+”：表示主队胜客队26分或26分以上；<br>
      　　（二）“主21-25”：表示主队胜客队21分至25分；<br>
      　　（三）“主16-20”：表示主队胜客队16分至20分；<br>
      　　（四）“主11-15”：表示主队胜客队11分至15分；<br>
      　　（五）“主6-10”：表示主队胜客队6分至10分；<br>
      　　（六）“主1-5”：表示主队胜客队1分至5分；<br>
      　　（七）“客1-5”：表示客队胜主队1分至5分；<br>
      　　（八）“客6-10”：表示客队胜主队6分至10分；<br>
      　　（九）“客11-15”：表示客队胜主队11分至15分；<br>
      　　（十）“客16-20”：表示客队胜主队16分至20分；<br>
      　　（十一）“客21-25”：表示客队胜主队21分至25分；<br>
      　　（十二）“客26+”：表示客队胜主队26分或26分以上；<br>
	  </div>
	  <div class="r_text">
       <h2>四、竞彩篮球大小分游戏：</h2>
      　　竞彩篮球大小分玩法：以国家体育总局体育彩票管理中心选定的国际重要篮球比赛为竞猜对象，由购票人对指定的比赛场次在全场（含加时赛）的主队和客队得分总数大于或小于预设总分数进行投注。每一场比赛设置2种选项：<br>
      　　（一）“大”：表示主队和客队得分总数大于预设总分数；<br>
      　　（二）“小”：表示主队和客队得分总数小于预设总分数。<br>
      　　对每个选定的比赛场次，国家体育总局体育彩票管理中心根据实际比赛情况给出主队和客队得分的预设总分数。具体的预设总分数和竞猜赛程一同公布。<br>
      　　例如：<br>
      　　A队和B队比赛的预设总分数为168.5分。<br>
      　　1、“大”主队和客队得分总数大于168.5分；<br>
      　　2、“小”主队和客队得分总数小于168.5分。<br>
      　　在进行单场投注时，各比赛场次的预设总分数始终保持不变；在进行过关投注时，各比赛场次的预设总分数在销售过程中根据投注额和其他相关因素调整，并通过销售系统和其他指定方式予以公布。购票人在完成有效投注时刻所获得的某场比赛对应的预设总分数即为该有效投注判断是否中奖的依据。<br>
</div>
<div class="r_text">
    <h2>二、 投注方式：</h2>
    　　第一条：投注方式包括单式投注和复式投注。其中，对所选比赛场次的比赛结果均选择1种投注结果为单式投注。对于某个或某几个比赛场次选择2种或2种以上的投注结果为复式投注。<br>
    　　第二条：购票人选择1场比赛进行投注的为“单场投注”；选择2场或2场以上比赛进行串联投注的为“过关投注”。在过关投注中，所选比赛的结果全部竞猜正确 才能中奖。所选比赛场次的过关投注方式由国家体育总局体育彩票管理中心选定，根据不同比赛场次情况，提供下表中全部或部分过关投注方式。<br>
    <br>
</div>
<table class="rule_table" align="center" cellpadding="0" cellspacing="0" border="0" width="70%">
		<tr class="rule_table1">
				<td ></td>
				<td>过关投注</td>
				<td>两关</td>
				<td>三关</td>
				<td>四关</td>
				<td>五关</td>
				<td>六关</td>
		</tr>
		<tr>
				<td>1</td>
				<td>2串1</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>2</td>
				<td>3串1</td>
				<td>&nbsp;</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>3</td>
				<td>3串3</td>
				<td>3</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>4</td>
				<td>3串4</td>
				<td>3</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>5</td>
				<td>4串1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>6</td>
				<td>4串4</td>
				<td>&nbsp;</td>
				<td>4</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>7</td>
				<td>4串5</td>
				<td>&nbsp;</td>
				<td>4</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>8</td>
				<td>4串6</td>
				<td>6</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>9</td>
				<td>4串11</td>
				<td>6</td>
				<td>4</td>
				<td>1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>10</td>
				<td>5串1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>1</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>11</td>
				<td>5串1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>5</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>12</td>
				<td>5串6</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>5</td>
				<td>1</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>13</td>
				<td>5串10</td>
				<td>10</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>14</td>
				<td>5串16</td>
				<td>&nbsp;</td>
				<td>10</td>
				<td>5</td>
				<td>1</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>15</td>
				<td>5串20</td>
				<td>10</td>
				<td>10</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>16</td>
				<td>5串26</td>
				<td>10</td>
				<td>10</td>
				<td>5</td>
				<td>1</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>17</td>
				<td>6串1</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>1</td>
		</tr>
		<tr>
				<td>18</td>
				<td>6串6</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>6</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>19</td>
				<td>6串7</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>6</td>
				<td>1</td>
		</tr>
		<tr>
				<td>20</td>
				<td>6串15</td>
				<td>15</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>21</td>
				<td>6串20</td>
				<td>&nbsp;</td>
				<td>20</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>22</td>
				<td>6串22</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>15</td>
				<td>6</td>
				<td>1</td>
		</tr>
		<tr>
				<td>23</td>
				<td>6串35</td>
				<td>15</td>
				<td>20</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>24</td>
				<td>6串42</td>
				<td>&nbsp;</td>
				<td>20</td>
				<td>15</td>
				<td>6</td>
				<td>1</td>
		</tr>
		<tr>
				<td>25</td>
				<td>6串50</td>
				<td>15</td>
				<td>20</td>
				<td>15</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td>26</td>
				<td>6串57</td>
				<td>15</td>
				<td>20</td>
				<td>15</td>
				<td>6</td>
				<td>1</td>
		</tr>
</table>

<div class="r_text">
    　　第三条：“竞彩篮球游戏”每注2元，不返还本金。根据投注额、突发事件等因素，销售系统可能会拒绝某些大额投注，暂停或提前截止针对某场比赛的某些特定过关组合、特定结果选项的投注，暂停或提前截止针对某场比赛的所有投注。未满18周岁的未成年人不得投注！<br>
</div>
<div class="r_text">
<h2>三、 奖金计算：</h2>
    　　第一条：竞彩篮球游戏的奖金为销售额的69%，其中的68%为返奖奖金，1%为调节基金。根据游戏规则，本游戏设置浮动奖金和固定奖金。单注彩票保底奖金：如中奖者的单注奖金不足2元，将补足至2元，补足部分从调节基金中支出。<br>
    　　第二条：彩民的投注结果与开奖结果一致的即为中奖。每注彩票只有一次中奖机会，不兼中兼得。<br>
    　　第三条：浮动奖金：单场投注的奖金为浮动奖金，计算公式为：该场比赛的单场投注总投注金额÷该场比赛的单场投注中奖彩票总投注金额×68％×2元（1注）。浮动奖金的单注彩票最高限额为500万元。<br>
    　　第四条：固定奖金：过关投注的奖金为固定奖金。销售开始前，每个有效的过关投注组合均设置1个固定奖金；在销售过程中，该固定奖金会根据销售等情况进行实 时的调整；彩民的中奖金额以完成投注时刻对应的固定奖金金额为准，不受投注完成后固定奖金调整的影响。计算公式为：[所选场次的过关赔率连乘]×2元×倍 数。<br>
    　　第五条：固定奖金的单注彩票最高限额：<br>
    　　　　　　选择2-3场过关投注的，单注最高奖金限额20万元；<br>
    　　　　　　选择4-5场过关投注的，单注最高奖金限额50万元；<br>
    　　　　　　选择6场及6场以上过关投注的，单注最高奖金限额100万元。<br>
      　　第六条：根据法律规定，彩票的奖金收入属偶然所得，如单注彩票的中奖金额超过10000元（含10000元）人民币，中奖者需要按照相关规定缴纳中奖金额的20%的个人所得税。<br>
</div>
<div class="r_text">
    <h2>四、 特殊情况及处理办法：</h2>
        　　在销售过程中，如遇以下情形发生，则特别规定如下：<br>
          　　（一）在某个比赛场次开始销售前，其比赛时间提前或推迟或取消比赛，则相应更改该比赛场次的开始、截止销售时间或取消该比赛场次竞猜。
</div>
<div class="r_text">
    　　（二）在某个比赛场次开始销售后，若其比赛时间提前，则相应提前该比赛场次的截止销售时间。
</div>
<div class="r_text">
    　　（三）在某个比赛场次开始销售后，若其比赛时间提前，且比赛开始时仍在进行销售，则认定该比赛场次对于在比赛开始时刻前发生的投注为有效场次，所涉及投注可正常参与兑奖；认定该比赛场次对于在比赛开始时刻后发生的投注则为无效场次。
</div>
<div class="r_text">
    　　（四）在某个比赛场次开始销售后，若其比赛时间推迟且未超过原定时间36小时，则相应推迟该比赛场次的截止销售时间。
</div>
<div class="r_text">
    　　（五）在某个比赛场次开始销售后，若其比赛时间推迟且超过原定时间36小时或无法获知具体推迟时间或取消比赛，则认定该比赛场次为无效场次。
</div>
<div class="r_text">
    　　（六）若某个比赛场次，在比赛进行至35分钟及以上（全场时长40分钟制比赛）或进行至43分钟及以上（全场时长48分钟制比赛）时因故中断，且当值裁判或比赛主办方裁决比赛正式完成，则认定该比赛场次为有效场次，所涉及投注可正常参与兑奖。
</div>
<div class="r_text">
    　　（七）若某个比赛场次在比赛进行中因故中断，且不符合前述（六）中描述的条件，如果自中断时刻起36小时内继续完成了比赛，则认定该比赛场次为有效场次，所涉及投注可正常参与兑奖。
</div>
<div class="r_text">
    　　（八）若某个比赛场次在比赛进行中因故中断，且不符合前述（六）中描述的条件，如果自中断时刻起36小时内未继续完成比赛或无法获知具体补赛时间或取消补赛，则认定该比赛场次为无效场次。
</div>
<div class="r_text">
    　　（九）在某个比赛场次开始销售后，如果比赛主办方决定更换比赛场地，若是从一中立比赛场地更换至另一中立比赛场地，则认定该比赛场次为有效场次，所涉及投注可正常参与兑奖；若不符合前述更换条件，则认定该比赛场次为无效场次。
</div>
<div class="r_text">
    　　（十）在某个比赛场次开始销售后，若参赛双方中有一方与原定参赛队伍不同，则认定该比赛场次为无效场次。
</div>
<div class="r_text">
    　　（十一）在某个比赛场次开始销售后，若比赛主办方决定在无观众、无转播的封闭条件下进行比赛，则认定该比赛场次为无效场次。
</div>
<div class="r_text">
    　　（十二）对上述无效场次的认定由国家体育总局体育彩票管理中心最终解释。
</div>
<div class="r_text">
    　　（十三）当某场比赛被认定为无效场次，则该比赛场次的所有单场投注按退票处理，于28天内在指定地点办理退票手续；在过关投注中对该比赛场次的所有选择均视为无效，涉及该比赛场次的过关投注组合之固定奖金按在原投注时刻去除该比赛场次后的投注组合对应的固定奖金计算
</div>
<div class="r_text">
    　　（十四）在某个比赛场次销售过程中，国家体育总局体育彩票管理中心可根据投注额、突发事件等因素，拒绝某些大额投注、暂停或提前截止针对该场比赛的某些特定过关组合特定结果选项的投注、暂停或提前截止针对该场比赛的所有投注。<br>
          无效比赛的处理：由于比赛取消、延期等原因，导致某场比赛被认定为无效场次，则该场比赛的所有单场投注按退票处理，即退还单场投注金额2元（单注）。彩民 在过关投注中对该场比赛的所有选择均视为无效，固定奖金按在原投注时刻去除该场比赛后的投注组合对应的固定奖金计算，举例说明：若原方案3串1过关，其中 一场被认定无效后，计算奖金时按照2串1进行计算。
</div>
<div class="r_text">
		<h2>无效比赛的处理：</h2>
由于比赛取消、延期等原因，导致某场比赛被认定为无效场次，则该场比赛的所有单场投注按退票处理，即退还单场投注金额2元（单注）。彩民 在过关投注中对该场比赛的所有选择均视为无效，固定奖金按在原投注时刻去除该场比赛后的投注组合对应的固定奖金计算，举例说明：若原方案3串1过关，其中 一场被认定无效后，计算奖金时按照2串1进行计算。</div>
     </div>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>