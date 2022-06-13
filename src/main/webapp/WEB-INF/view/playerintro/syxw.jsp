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
               <a href="/playerintro/jqc.jhtml">进球彩</a>
               <a href="/playerintro/jczq.jhtml">竞彩足球</a>
               <a href="/playerintro/jclq.jhtml">竞彩篮球</a>
               <a href="/playerintro/xysc.jhtml">幸运赛车</a>
               <a href="/playerintro/syxw.jhtml" class="hover">十一选五</a>
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
                  <h3>十一选五游戏规则</h3>
                 </div>
                 <div class="r_text">
                 <h2>第一章 总则</h2>
<div class="r_text">第一条 根据《彩票管理条例》（国务院令第554号）等有关规定，制定本游戏规则。</div>
<div class="r_text">第二条 "11选5"电脑体育彩票由国家体育总局体育彩票管理中心组织发行，经财政部批准的省级体育彩票管理中心在所辖区域内承销，采用计算机网络系统发行销售。</div>
<div class="r_text">第三条 "11选5"电脑体育彩票实行自愿购买，凡购买该彩票者即视为同意并遵守本规则。</div>
<div class="r_text">第四条 不得向未成年人销售彩票或兑付奖金。</div>
<h2>第二章 投注</h2>
<div class="r_text">第五条 购买"11选5"电脑体育彩票时，从01至11的号码中任选1个或多个（最多8个）号码所组成的一注彩票的投注为单式投注。其中：</div>
<div class="r_text">从11个号码中任选1个号码的投注为"任选一"；</div>
<div class="r_text">选2个号码的投注分为"任选二"、"选前二"；</div>
<div class="r_text">选3个号码的投注分为"任选三"、"选前三"；</div>
<div class="r_text">选4个号码的投注为"任选四"；</div>
<div class="r_text">选5个号码的投注为"任选五"；</div>
<div class="r_text">选6个号码的投注为"任选六"；</div>
<div class="r_text">选7个号码的投注为"任选七"；</div>
<div class="r_text">选8个号码的投注为"任选八"。</div>
<div class="r_text">第六条 "选前二"、"选前三"投注方式分为直选投注和组选投注。</div>
<div class="r_text">直选投注：所选2个或3个号码与当期顺序摇出的5个号码中的前2个或3个号码一一对应进行的投注。</div>
<div class="r_text">组选投注：所选2个或3个号码与当期顺序摇出的5个号码中的前2个或3个号码不按先后，均作为一注投注号码进行的投注。</div>
<div class="r_text">第七条 除单式投注外、购买者还可进行复式投注、胆拖投注、多倍投注。</div>
<div class="r_text">复式投注是指所选号码个数超过单式投注的号码个数，按该单式投注方式组成多注彩票的投注。</div>
<div class="r_text">胆拖投注是指先选取少于单式投注号码个数的号码作为胆码（即每注彩票均包含的号码），再选取除胆码以外的号码作为拖码，胆码与拖码个数之和须多于单式投注号码个数，由胆码与拖码按该单式投注方式组成多注彩票的投注。</div>
<div class="r_text">多倍投注是指对选定结果不超过99倍的投注。</div>
<div class="r_text">第八条 单张彩票最大投注金额不超过20000元。</div>
<div class="r_text">第九条 购买者可在当地省体育彩票管理中心设置的投注站进行投注。投注号码可由投注机随机产生，也可通过投注单将购买者选定的号码输入投注机确定。投注号码经系统确认后打印出的兑奖凭证即为"11选5"电脑体育彩票，交购买者保存。</div>
<div class="r_text">第十条 "11选5"电脑体育彩票每期全部投注号码的可投注数量实行动态控制，如投注号码受限，则不能投注。</div>
<div class="r_text">第十一条 若因销售终端故障、通讯线路故障和投注站信用额度受限等原因造成投注不成功，应退还投注者投注金额。</div>
<div class="r_text">第十二条 "11选5"电脑体育彩票每注2元人民币。彩票不记名、不挂失、不返还本金、不流通使用。</div>
<h2>第三章 设奖</h2>
<div class="r_text">第十三条 "11选5"电脑体育彩票按每期销售总额的59%、13%、28%计提奖金、发行费和公益金。</div>
<div class="r_text">第十四条 "11选5"电脑体育彩票按不同单式投注方式设奖，均为固定奖。奖金规定如下：</div>
<div class="r_text">任选二中2，单注固定奖金6元；</div>
<div class="r_text">选前二组选，单注固定奖金65元；</div>
<div class="r_text">选前二直选，单注固定奖金130元；</div>
<div class="r_text">任选三中3，单注固定奖金19元；</div>
<div class="r_text">选前三组选，单注固定奖金195元；</div>
<div class="r_text">选前三直选，单注固定奖金1170元；</div>
<div class="r_text">任选四中4，单注固定奖金78元；</div>
<div class="r_text">任选五中5，单注固定奖金540元；</div>
<div class="r_text">任选六中5，单注固定奖金90元；</div>
<div class="r_text">任选七中5，单注固定奖金26元；</div>
<div class="r_text">任选八中5，单注固定奖金9元。</div>
<div class="r_text">第十五条 "11选5"电脑体育彩票设置奖池，奖池由当期计提奖金与实际中出奖金的差额累计而成。若当期计提奖金大于当期实际中出奖金时，余额滚入奖池；若当期计提奖金小于当期实际中出奖金时，差额用奖池补足；若奖池资金不足时，用调节基金补足，调节基金不足时，从发行经费中垫支。</div>
<div class="r_text">第十六条 调节基金包括弃奖收入和逾期未退票的票款。调节基金专项用于支付各种不可预见情况下的奖金支出风险以及设立特别奖。</div>
<h2>第四章 开奖</h2>
<div class="r_text">第十七条 "11选5"电脑体育彩票10分钟一期，9分钟销售，1分钟开奖，一天78期。</div>
<div class="r_text">第十八条 "11选5"电脑体育彩票每期开奖结果通过随机数码生成器，从01-11共11个号码中按顺序自动生成5个不同号码作为当期中奖号码。</div>
<h2>第五章 中奖</h2>
<div class="r_text">第二十条 所购彩票与当期开奖结果对照，符合以下情况即为中奖。</div>
<div class="r_text">任选一中1：投注的1个号码与当期顺序摇出的5个号码中的第1个号码相同，则中奖。</div>
<div class="r_text">任选二中2：投注的2个号码与当期摇出的5个号码中的任2个号码相同，则中奖。</div>
<div class="r_text">选前二组选：投注的2个号码与当期顺序摇出的5个号码中的前2个号码相同，则中奖。</div>
<div class="r_text">选前二直选：投注的2个号码与当期顺序摇出的5个号码中的前2个号码相同且顺序一致，则中奖。</div>
<div class="r_text">任选三中3：投注的3个号码与当期摇出的5个号码中的任3个号码相同，则中奖。</div>
<div class="r_text">选前三组选：投注的3个号码与当期顺序摇出的5个号码中的前3个号码相同，则中奖。</div>
<div class="r_text">选前三直选：投注的3个号码与当期顺序摇出的5个号码中的前3个号码相同且顺序一致，则中奖。</div>
<div class="r_text">任选四中4：投注的4个号码与当期摇出的5个号码中的任4个号码相同，则中奖。</div>
<div class="r_text">任选五中5：投注的5个号码与当期摇出的5个号码相同，则中奖。</div>
<div class="r_text">任选六中5：投注的6个号码中任5个号码与当期摇出的5个号码相同，则中奖。</div>
<div class="r_text">任选七中5：投注的7个号码中任5个号码与当期摇出的5个号码相同，则中奖。</div>
<div class="r_text">任选八中5：投注的8个号码中任5个号码与当期摇出的5个号码相同，则中奖。</div>
<h2>第六章 兑奖</h2>
<div class="r_text">第二十一条 "11选5"电脑体育彩票兑奖当期有效。每期自开奖之日起28天为兑奖期，逾期未兑视为弃奖，弃奖奖金纳入调节基金。</div>
<div class="r_text">第二十二条 中奖彩票为兑奖唯一凭证，中奖彩票因玷污、损坏等原因不能正确识别的，不能兑奖。</div>
<div class="r_text">第二十三条 兑奖机构有权查验中奖者的中奖彩票及有效身份证件，兑奖者应予配合。</div>
<div class="r_text">第二十四条 凡伪造、涂改中奖彩票，冒领奖金者，送交司法机关追究法律责任。</div>
<h2>第七章 附则</h2>
<div class="r_text">第二十五条 本游戏规则解释权属国家体育总局体育彩票管理中心。</div>
<div class="r_text">第二十六条 本游戏规则自发布之日起执行。</div>
<div class="r_text">
    <br />
</div>
     </div>
</div>
<div class="clear" style="height:10px"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>