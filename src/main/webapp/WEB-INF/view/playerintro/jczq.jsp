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
<c:set var="pageName" value="竞彩足球玩法介绍" scope="page"></c:set>
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
               <a href="/playerintro/jczq.jhtml" class="hover">竞彩足球</a>
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
                  <h3>竞彩竞猜游戏玩法规则</h3>
                 </div>
                 <div class="r_text">
    <strong>一、竞彩玩法简介</strong><br />
    <br />
    <strong>1</strong><strong>、竞彩足球胜平负游戏</strong><strong><br />
    </strong><br />
        　　足球比赛由两支队伍在专用足球场地竞赛，每队11名队员，法定比赛时间为90分钟，有时裁判会根据比赛时队员受伤后救治所耽误的时间在90分钟后补时，多为几分钟，称为伤 停补时时间，竞彩足球彩票竞猜的比赛结果为90分钟加上伤停补时的时间里的结果；<br />
    <br />
        　　足球比赛的结果有3种，主队胜，主队负以及双方打平。主队胜则主队得3分，主队负则主队不得分，主队与客队打平则主队得1分。<br />
    <br />
        　　足球彩票竞猜胜平负时用3、1、0分别代表主队胜、主客战平和主队负。 <br />
          彩民选定1场比赛，对主队在全场90分钟（含伤停补时）的 “胜”、“平”、“负”结果进行投注。 
</div>
<div class="r_text">
    例如：曼联（主队）VS利物浦（客队） 
</div>
<div class="r_text">
    　　　曼联 3:0 利物浦 胜（开奖结果） 选择“胜”中奖 
</div>
<div class="r_text">
    　　　曼联 1:1 利物浦 平（开奖结果） 选择“平”中奖 
</div>
<div class="r_text">
    　　　曼联 0:2 利物浦 负（开奖结果） 选择“负”中奖 
</div>
<div class="r_text">
    当两支球队实力悬殊较大时，采取让球的方式确定双方的胜平负关系。让球的数量确定后将维持不变。 
</div>
<div class="r_text">
    让球分为主队让球和客队让球，分别为：主队让1球，表示为“主队（-1）”；客队让2球，表示为“主队（+2）”。 
</div>
<div class="r_text">
    <strong>(</strong><strong>一) 主队让一球 </strong>
</div>
<div class="r_text">
    　　1、“3”主队比分减去客队比分大于1时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”主队比分减去客队比分等于1时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”主队比分减去客队比分小于1时，主队负，客队胜。 
</div>
<div class="r_text">
    <strong>(</strong><strong>二) 客队让一球 </strong>
</div>
<div class="r_text">
    　　1、“3”客队比分减去主队比分小于1时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”客队比分减去主队比分等于1时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”客队比分减去主队比分大于1时，主队负，客队胜。 
</div>
<div class="r_text">
    <strong>(</strong><strong>三) 主队让两球 </strong>
</div>
<div class="r_text">
    　　1、“3”主队比分减去客队比分大于2时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”主队比分减去客队比分等于2时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”主队比分减去客队比分小于2时，主队负，客队胜。 
</div>
<div class="r_text">
    <strong>(</strong><strong>四) 客队让两球 </strong>
</div>
<div class="r_text">
    　　1、“3”客队比分减去主队比分小于2时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”客队比分减去主队比分等于2时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”客队比分减去主队比分大于2时，主队负，客队胜。 
</div>
<div class="r_text">
    <strong>(</strong><strong>五) 主队让三球 </strong>
</div>
<div class="r_text">
    　　1、“3”主队比分减去客队比分大于3时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”主队比分减去客队比分等于3时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”主队比分减去客队比分小于3时，主队负，客队胜。 
</div>
<div class="r_text">
    <strong>(</strong><strong>六) 客队让三球 </strong>
</div>
<div class="r_text">
    　　1、“3”客队比分减去主队比分小于3时，主队胜，客队负； 
</div>
<div class="r_text">
    　　2、“1”客队比分减去主队比分等于3时，主队与客队平； 
</div>
<div class="r_text">
    　　3、“0”客队比分减去主队比分大于3时，主队负，客队胜。 
</div>
<div class="r_text">
    具体让球数量根据实际比赛的情况酌情而定。 
</div>
<div class="r_text">
    例如：国米（-1）VS尤文 
</div>
<div class="r_text">
    　　　国米 3:0 尤文 胜（开奖结果） 选择“平”中奖 
</div>
<div class="r_text">
    　　　国米 2:1 尤文 平（开奖结果） 选择“平”中奖 
</div>
<div class="r_text">
    　　　国米 0:0 尤文 负（开奖结果） 选择“负”中奖 
</div>
<div class="r_text">
    <strong>2</strong><strong>、竞彩足球比分游戏 </strong>
</div>
<div class="r_text">
    　　共有31个投注选项 
</div>
<div class="r_text">
    　　主队胜：1:0 2:0 3:0 4:0 2:1 3:1 3:2 4:1 4:2  5:0 5:1 5:2胜其他 
</div>
<div class="r_text">
    　　主队平：0:0 1:1 2:2 3:3 平其他 
</div>
<div class="r_text">
    　　主队负：0:1 0:2 0:3 0:4 1:2 1:3 1:4 2:3  2:4 0:5 1:5 2:5 负其他 
</div>
<div class="r_text">
    　　主队比分在前，客队比分在后。 
</div>
<div class="r_text">
    　　彩民选定1场比赛，对该场比赛在全场90分钟（含伤停补时）的具体比分结果进行投注。如果彩民能竞猜正确，则中奖。 
</div>
<div class="r_text">
    　　例：利物浦2：0米德尔斯堡  正确结果：2：0
</div>
<div class="r_text">
    　　投注方式：单式投注、复式投注、倍投、过关投注(仅限3关以下)。 
</div>
<div class="r_text">
    <strong>3</strong><strong>、竞彩足球总进球数游戏 </strong>
</div>
<div class="r_text">
    　　共有8个投注选项： 
</div>
<div class="r_text">
    　　0 双方进球数之和为0，即没有进球 
</div>
<div class="r_text">
    　　1 双方进球数之和为1
</div>
<div class="r_text">
    　　2 双方进球数之和为2
</div>
<div class="r_text">
    　　3 双方进球数之和为3
</div>
<div class="r_text">
    　　4 双方进球数之和为4
</div>
<div class="r_text">
    　　5 双方进球数之和为5
</div>
<div class="r_text">
    　　6 双方进球数之和为6
</div>
<div class="r_text">
    　　7+ 双方进球数之和为7球或7球以上 
</div>
<div class="r_text">
    　　彩民选定1场比赛，对该场比赛在全场90分钟（含伤停补时）比赛双方的进球总数结果进行投注。如果彩民能竞猜正确，则中奖。 
</div>
<div class="r_text">
    　　例：利物浦2：0米德尔斯堡  总进球数为2
</div>
<div class="r_text">
    　　投注方式：单式投注、复式投注、倍投、过关投注。 
</div>
<div class="r_text">
    <strong>4</strong><strong>、竞彩足球半全场胜平负游戏 </strong><br />
            　　共有9个投注选项 
</div>
<div class="r_text">
    　　3-3 主队上半场胜+主队全场胜 
</div>
<div class="r_text">
    　　3-1 主队上半场胜+主队全场平 
</div>
<div class="r_text">
    　　3-0 主队上半场胜+主队全场负 
</div>
<div class="r_text">
    　　1-3 主队上半场平+主队全场胜 
</div>
<div class="r_text">
    　　1-1 主队上半场平+主队全场平 
</div>
<div class="r_text">
    　　1-0 主队上半场平+主队全场负 
</div>
<div class="r_text">
    　　0-3 主队上半场负+主队全场胜 
</div>
<div class="r_text">
    　　0-1 主队上半场负+主队全场平 
</div>
<div class="r_text">
    　　0-0 主队上半场负+主队全场负 
</div>
<div class="r_text">
    彩民选定1场比赛，对主队在上半场45分钟（含伤停补时）和全场90分钟（含伤停补时）的“胜”、“平”、“负”结果分别进行投注。如果彩民能竞猜正确，则中奖。 
</div>
<div class="r_text">
    　　例：利物浦上半场0:0全场2:0  米德尔斯堡，正确结果1-3<br />
            　　投注方式：单式投注、复式投注、倍投、过关投注。 
</div>
<div class="r_text">
    <strong>二、投注方式 </strong>
</div>
<div class="r_text">
    　　彩民选择1种投注结果的为单式投注；选择2种或2种以上投注结果的为复式投注。 <br />
            　　彩民选择1场比赛进行投注的为单场投注；选择2场或2场以上比赛进行串联投注的为过关投注。在过关投注中，所选比赛的结果全部竞猜正确才能中奖。 <br />
            　　胜平负和总进球数游戏均有5种过关方式：2×1，3×1，4×1，5×1和6×1。 <br />
            　　比分和半全场胜平负游戏有2种过关方式：2×1和3×1。 
</div>
<div class="r_text">
    <strong>三、奖金计算 </strong>
</div>
<div class="r_text">
    　　彩民的投注结果与开奖结果一致的即为中奖。 <br />
            　　开奖结果以实际比赛结果为依据，不受其后任何更改的影响。 <br />
            　　彩民可在中国体育彩票竞彩标准店内，或通过中国竞彩网查询赛事信息、开奖结果、浮动奖金额、固定奖金。 <br />
            　　竞彩足球游戏的奖金为销售额的69%，其中的68%为返奖奖金，1%为调节基金。根据游戏规则，本游戏设置浮动奖金和固定奖金。 <br />
            　　单注彩票保底奖金：如中奖者的单注奖金不足2元，将补足至2元，补足部分从调节基金中支出。 
</div>
<div class="r_text">
    <strong>1</strong><strong>、浮动奖金 </strong>
</div>
<div class="r_text">
    　　浮动奖金：单场投注的奖金为浮动奖金。 <br />
            　　单注中奖奖金=所选比赛场次的浮动奖金额。浮动奖金额=该场比赛的单场投注总投注金额÷该场比赛的单场投注中奖彩票总投注金额×68％×2元（1注）。 <br />
            　　浮动奖金的单注彩票最高限额：500万元 
</div>
<div class="r_text">
    　　例如：“曼联VS利物浦”的胜平负游戏 
</div>
<div class="r_text">
    　　共50人进行了单场投注，每人购买1注，竞猜结果及对应的浮动奖金额、单注奖金如下所示： 
</div>
<div class="r_text">
    　　曼联“胜” 投注25注 总投注金额100元 选择胜投注金额50元 单注奖金2.72元 
</div>
<div class="r_text">
    　　曼联“平” 投注20注 总投注金额100元 选择胜投注金额40元 单注奖金3.4元 
</div>
<div class="r_text">
    　　曼联“平” 投注5注 总投注金额100元 选择胜投注金额10元 单注奖金13.6元 
</div>
<div class="r_text">
    <strong>2</strong><strong>、固定奖金 </strong>
</div>
<div class="r_text">
    　　固定奖金：过关投注的奖金为固定奖金。 <br />
            　　单注中奖奖金即为固定奖金（单注） <br />
            　　销售开始前，每个有效的过关投注组合均设置1个固定奖金；在销售过程中，该固定奖金会根据销售等情况进行实时的调整；彩民的中奖金额以完成投注时刻对应的固定奖金金额为准，不受投注完成后固定奖金调整的影响。 
</div>
<div class="r_text">
    　　例如：“国米（-1）VS尤文+曼联VS利物浦”的胜平负游戏 
</div>
<div class="r_text">
    　　某彩民购买1注“2×1”过关组合，完成投注时刻，所有竞猜选项所对应的固定奖金、中奖金额如下所示： 
</div>
<div class="r_text">
    　　胜+胜=7.2元  胜+平=8.64元   胜+负=9.6元 
</div>
<div class="r_text">
    　　平+胜=6元   平+平=7.2元    平+负=8元 
</div>
<div class="r_text">
    　　负+胜=4.8元  负+平=5.76元   负+胜=6.4元 
</div>
<div class="r_text">
    　　如果该彩民的竞猜选项是“胜+负”并且竞猜正确，则其最后的中奖金额为9.6元。 
</div>
<div class="r_text">
    <strong>3</strong><strong>、固定奖金的单注彩票最高限额： </strong>
</div>
<div class="r_text">
    　　（1）选择2-3场过关投注的，单注最高奖金限额20万元； <br />
            　　（2）选择4-5场过关投注的，单注最高奖金限额50万元； <br />
            　　（3）选择6场过关投注的，单注最高奖金限额100万元。 
</div>
<div class="r_text">
    <strong>四、特殊情况的处理办法 </strong>
</div>
<div class="r_text">
    <strong>　　1</strong><strong>、无效比赛的处理 </strong>
</div>
<div class="r_text">
    　　由于比赛取消、延期等原因，导致某场比赛被认定为无效场次，则该场比赛的所有单场投注按退票处理，从比赛被认定无效的公告发布后的当日起计算。 <br />
    <br />
            　　2、彩民在过关投注中对该场比赛的所有选择均视为无效，固定奖金按在原投注时刻去除该场比赛后的投注组合对应的固定奖金计算；各关奖金数额可参考投注时打印的“奖金计算明细清单”。 
</div>
<div class="r_text">
    　　例如：“国米（-1）VS尤文+曼联VS利物浦+巴萨VS皇马”的胜平负游戏 
</div>
<div class="r_text">
    　　购买1注“巴萨VS皇马”的单场投注；购买1注“3×1”过关组合。完成投注时刻“国米（-1）VS尤文+曼联VS利物浦”的“2×1”过关组合及“3×1”过关组合所对应的固定奖金如下所示： 
</div>
<div class="r_text">
    　　过关组合“3×1”:国米“胜”+曼联“负”+巴萨“胜”=12元 
</div>
<div class="r_text">
    　　过关组合“2×1”:国米“胜”+曼联“负”=4.8元 
</div>
<div class="r_text">
    　　假如“巴萨VS皇马”被认定无效： 
</div>
<div class="r_text">
    （1）退还单场投注金额2元。 
</div>      （2）“3×1”过关组合应被认定为“2×1”过关组合，如彩民竞猜正确，最后中奖金额为4.8元。 <br />
        
<div class="r_text">
    <br />
</div>
     </div>
</div>
<div class="clear" style="height:10px"></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>