<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
		<div class="qycodlb">
        	<div class="qycodlba">
            	<span class="hes">您选择了<span class="qycodlbll" id="betNumId">0</span>注，共 ￥<span class="red" id="betMoneyId">0</span>元</span>　
                <span class="huis">如中奖，奖金<span class="qycodlbll">0</span>元</span><a href="javascript:void 0" style="padding-right: 27px;height: 28px;line-height: 28px;
border: 1px #7ca4b9 solid;background: #c3ebff;display: inline-block;margin-left: 28px;}" onclick="popupDiv('handworkInput');" id="handInputBtnId">手工录入</a>
            </div>
            <a href="javascript:void 0" class="qycodlbBut2" id="addToBetListBtnId">添加到投注列表</a><a href="javascript:void 0" class="qycodlbBut3" id="clearAllSelBtnId">清空上方选号</a>
        </div>
        <div class="qycodlc">
        	<ul class="qycodlcul" id="betListAreaId">
            </ul>
            <ul class="qycodlcul2">
            	<li id="redInLiId"><input id="radomSelDsId" value="5" name="" type="text"  class="qycodldliha" /></li>
            	<li id="radomSelDsBtnId"><a href="javascript:void 0" class="qycodlcul2a">机 选</a></li>
            	<li id="clearSelListBtnId"><a href="javascript:void 0" class="qycodlcul2b">删除所选</a></li>
            	<li id="clearBetListBtnId"><a href="javascript:void 0" class="qycodlcul2b">删除全部</a></li>
            </ul>
        </div>
        <div class="qycodlcul3"><span style="padding-right:30px">倍投：<input name="" type="text"  class="qycodldlih" value="1" id="multipleId"/> </span>单倍注数：<span class="reda" id="totalBetNumId">0</span>金额：￥ <span class="redb" id="totalBetMoneyId">0</span>元</div>
        <div class="qycodld">
        	<span class="qycodlda">追号设置</span>
            <span class="qycodldbxa"><input name="buyChasName" type="radio" value="1" checked class="qycodldbinp" />代购</span>
            <span class="qycodldbx"><input name="buyChasName" type="radio" value="2" class="qycodldbinp" />常规追号</span>
            <span class="qycodldbx"><input name="buyChasName" type="radio" value="3" class="qycodldbinp" />高级追号</span>
            <span class="qycodldbx"><input name="buyChasName" type="radio" value="4" class="qycodldbinp">合买</span>
            <span class="qycodldb"><input name="" type="checkbox" value="" class="qycodldbinp" id="stopBonusId" checked/>中奖后停止追号</span>
            <span class="qycodldc">当前<a id="currentIssueId2">${fp.currentIssue}</a>期　|　离投注截止还有<span class="redb"><a id="stopMId2">${stopTime[1] }</a> 分<a id="stopSId2"> ${stopTime[1] }</a> 秒</span></span>
        </div>
        <div class="qycodldd" style="display:none" id="chsPanelId">
        	<div class="qycodlde">选择期号</div><input id="todayFmtId" value="${todayFmt }" type="hidden">
        	<input id="tomorrowFmtId" value="${tomorrowFmt }" type="hidden">
            <div class="qycodldf">
            	<div class="qycodldg" style="display:" id="ptChsSetPanelId">
                	<span class="qycodldi"><span class="qycodldia">选择期号：</span><a href="javascript:void 0" value="1" class="qycodldh" name="dayOptionName">今天</a><a href="javascript:void 0" value="2" class="qycodldh1" name="dayOptionName">明天</a></span>
                	<span class="qycodldj"><span class="qycodldia">快速选择：</span><a href="javascript:void 0" class="qycodldj1" name="issueNumOptionName" value="5">5 期</a><a name="issueNumOptionName" value="10" href="javascript:void 0" class="qycodldj1">10 期</a>
                	<a href="javascript:void 0" class="qycodldj1" name="issueNumOptionName" value="15">15 期</a><a href="javascript:void 0" class="qycodldj1" name="issueNumOptionName" value="20">20 期</a></span>
                </div>
                <!--点击自定义倍投计划开始-->
            	<!--<div class="qycodldg" style="display:none" id="seChsSetPanelId1">
                	<span class="qycodldi"><input name="" type="radio" value="">共5期，计划盈利率50% </span>
                	<span class="qycodldj"><input name="" type="radio" value="">共10期，前5期计划盈利50%，之后盈利20%</span>
                    <span style="float:right"><input type="submit" name="button" id="button" value="自定义倍投计划" class="qycodldliid" /></span>
                </div>-->
                <div class="qycodldg" style="display:none" id="seChsSetPanelId">
                	<div class="qycodldlig">条件设置：从 <select id="seChsStartIssueId"></select> 开始，连续追 <input name="" type="text" id="seChsIssueNumId"  class="qycodldlih" value="10"/> 期(最多可追117期)， 倍数 <input name="" type="text" id="seStartMultId"  class="qycodldlih" value="1" /> 倍。</div>
                    <div class="qycodldlii">
                    	<div>预期盈利：</div>
                    	<div class="qycodldliia"><input name="rateTypeName" checked type="radio" value="1"> 全程盈利率 <input name="" type="text"  class="qycodldlih" value="50" id="totalRateId"/> %</div>
                        <div class="qycodldliib"><input name="rateTypeName" type="radio" value="2"> 前 <input name="" type="text" value="5"  class="qycodldlih" id="startProfitIssueNumId" disabled/> 期盈利率 <input name="" type="text"  class="qycodldlih" value="50" id="startProfitRateId" disabled/> %，之后盈利率 <input name="" type="text" id="afterProfitRateId" disabled class="qycodldlih" value="20"/> %</div>
                        <div class="qycodldliic"><input name="" type="checkbox" value="" id="isPlanProfitId"/> 计划理论盈利不低于 <input name="" type="text" id="planProfitId" value="100" class="qycodldlih" disabled/> 元 </div>
                        <div class="qycodldliie"><span class="red">（点击右侧按钮应用您设置的追号计划）</span><a href="#"></a> <input type="button" name="button" id="seniorCsPlanId"  value="生成倍投计划" class="qycodldliid" /></div>
                    </div>
                </div>
                <!--点击自定义倍投计划结束-->
                <div class="qycodldk">
                    <ol>
                        <li class="qycodldlia">序</li>
                        <li class="qycodldlib">追号期数<input name="" type="text" id="setChasingId"/> 期</li>
                        <li class="qycodldlic"><input name="" type="text" id="setMultId"/> 倍</li>
                        <li class="qycodldlid">当期投入</li>
                        <li class="qycodldlie">累计投入</li>
                        <li class="qycodldlif">当期奖金区间</li>
                    </ol>
                    <div class="qycodldkall" id="chasingIssListId">
                    </div>
            	</div>
            </div>
        </div>
        <!--3追号设置结束-->
        <div class="qycodldd" style="display:none" id="merPanelId">
        	<jsp:include page="../common/mergercomm.jsp"></jsp:include>
        </div>
        <div class="qycodldd">
        	<div class="qycodlf">确认购买</div>
            <div class="qycodldf">
            	<div class="qycodlfa">
                	<div>本次投注为 <span class="redb" id="totalChsIssueId">0</span> 期，金额为 <span class="redb" id="totalChsMoneyId">0</span> 元</div>
                	<!--<div>您的账户余额为 <span class="redb">1.00</span> 元</div>-->
                    <a href="javascript:void 0" class="qycodlfb" id="lotteryFormBtnId">立即购买</a>
                    <input id="agreeChkId" name="" type="checkbox" checked value="" class="qyinputch" /> 我已阅读并同意<a href="/common/agreement.jhtml" class="xiey" target="_blank">《彩店与彩民交易协议》</a>
                </div>
            </div>
        </div>
        <!--4确认购买结束-->
        <input type="hidden" id="maxIssueId" value="${fp.totalDayPeriod }"/>
        <jsp:include page="../lotteryForm.jsp"></jsp:include>
        
        <!--  奖金说明 -->
        <c:if test="${licenseId > 100 && licenseId < 200}">
        <div class="eleven_choose">
	<div class="eleven_choose_t">
    	<span class="fl">11选5奖金计算说明</span>
        <div style="clear:both;"></div>
    </div>
    <div class="eleven_choose_c">
    	<table border="0" cellpadding="0" cellspacing="0" class="eleven_choose_from">
  <tbody><tr>
    <th width="11%">玩法</th>
    <th width="15%">开奖号码示例</th>
    <th width="20%">投注号码示例</th>
    <th width="30%">中奖规则</th>
    <th width="9%" class="eleven_last">单注奖金</th>
  </tr>
  <tr>
    <td>任选二</td>
    <td rowspan="12" class="kjh_w">01 02 03 04 05</td>
    <td class="left_l">01 02</td>
    <td>选2个号码，猜中开奖号码<span class="red">任意2个数字</span></td>
    <td class="eleven_last"><span class="red">6</span>元</td>
  </tr>
  <tr>
    <td>任选三</td>
    <td class="left_l">01 02 03</td>
    <td>选3个号码，猜中开奖号码<span class="red">任意3个数字</span></td>
    <td class="eleven_last"><span class="red">19</span>元</td>
  </tr>
  <tr>
    <td>任选四</td>
    <td class="left_l">01 02 03 04 </td>
    <td>选4个号码，猜中开奖号码<span class="red">任意4个数字</span></td>
    <td class="eleven_last"><span class="red">78</span>元</td>
  </tr>
  <tr>
    <td>任选五</td>
    <td class="left_l">01 02 03 04 05</td>
    <td>选5个号码，猜中开奖号码<span class="red">全部5个数字</span></td>
    <td class="eleven_last"><span class="red">540</span>元</td>
  </tr>
  <tr>
    <td>任选六</td>
    <td class="left_l">01 02 03 04 05 06</td>
    <td>选6个号码，猜中开奖号码<span class="red">全部5个数字</span></td>
    <td class="eleven_last"><span class="red">90</span>元</td>
  </tr>
  <tr>
    <td>任选七</td>
    <td class="left_l">01 02 03 04 05 06 07</td>
    <td>选7个号码，猜中开奖号码<span class="red">全部5个数字</span></td>
    <td class="eleven_last"><span class="red">26</span>元</td>
  </tr>
  <tr>
    <td>任选八</td>
    <td class="left_l">01 02 03 04 05 06 07 08</td>
    <td>选8个号码，猜中开奖号码<span class="red">全部5个数字</span></td>
    <td class="eleven_last"><span class="red">9</span>元</td>
  </tr>
  <tr>
    <td>前一</td>
    <td class="left_l">01</td>
    <td>选1个号，猜中开奖的第1个号</td>
    <td class="eleven_last"><span class="red">13</span>元</td>
  </tr>
  <tr>
    <td>前二直选</td>
    <td class="left_l">01 02</td>
    <td>选2个号与开奖的前2个号相同且顺序一致</td>
    <td class="eleven_last"><span class="red">130</span>元</td>
  </tr>
  <tr>
    <td>前二组选</td>
    <td class="left_l">01 02 </td>
    <td>选2个号与开奖的前2个号相同</td>
    <td class="eleven_last"><span class="red">65</span>元</td>
  </tr>
  <tr>
    <td>前三直选</td>
    <td class="left_l">01 02 03</td>
    <td>选3个号与开奖的前3个号相同且顺序一致</td>
    <td class="eleven_last"><span class="red">1170</span>元</td>
  </tr>
  <tr>
    <td>前三组选</td>
    <td class="left_l">01 02 03</td>
    <td>选3个号与开奖的前3个号相同</td>
    <td class="eleven_last"><span class="red">195</span>元</td>
  </tr>
</tbody></table>

    </div>
</div>
</c:if>

<c:if test="${licenseId > 500 && licenseId < 600}">
<div class="eleven_choose">
	<div class="eleven_choose_t">
    	<span class="fl">快乐十分奖金计算说明</span>
        <div style="clear:both;"></div>
    </div>
    <div class="eleven_choose_c">
    	<table border="0" cellpadding="0" cellspacing="0" class="eleven_choose_from">
  <tbody><tr>
    <th width="8%">玩法</th>
    <th width="22%">开奖号码示例</th>
    <th width="13%">投注号码示例</th>
    <th width="35%">中奖规则</th>
    <th width="8%" class="eleven_last">单注奖金</th>
  </tr>
  <tr>
    <td>选一数投</td>
    <td rowspan="12" class="kjh_w">01 02 03 04 05 06 07 08</td>
    <td class="left_l">01</td>
    <td>任选1个号，猜中开奖的第1个号</td>
    <td class="eleven_last"><span class="red">25</span>元</td>
  </tr>
  <tr>
    <td>选一红投</td>
    <td class="left_l">19</td>
    <td>两个红色号码中任选1个号码，猜中开奖的第1个号</td>
    <td class="eleven_last"><span class="red">5</span>元</td>
  </tr>
  <tr>
    <td>选二任选</td>
    <td class="left_l">03 07</td>
    <td>选2个号码，猜中开奖号码<span class="red">任意2个数字</span></td>
    <td class="eleven_last"><span class="red">8</span>元</td>
  </tr>
  <tr>
    <td>选三任选</td>
    <td class="left_l">01 03 07</td>
    <td>选3个号码，猜中开奖号码<span class="red">任意3个数字</span></td>
    <td class="eleven_last"><span class="red">24</span>元</td>
  </tr> 
  <tr>
    <td>选四任选</td>
    <td class="left_l">01 03 05 07</td>
    <td>选4个号码，猜中开奖号码<span class="red">任意4个数字</span></td>
    <td class="eleven_last"><span class="red">80</span>元</td>
  </tr>
  <tr>
    <td>选五任选</td>
    <td class="left_l">01 03 05 07 08</td>
    <td>选5个号码，猜中开奖号码<span class="red">任意5个数字</span></td>
    <td class="eleven_last"><span class="red">320</span>元</td>
  </tr> 
  <tr>
    <td>选二连组</td>
    <td class="left_l">03 02</td>
    <td>选2个号与开奖号码中连续2个号相同</td>
    <td class="eleven_last"><span class="red">31</span>元</td>
  </tr>    
  <tr>
    <td>选二连直</td>
    <td class="left_l">02 03</td>
    <td>选2个号与开奖号码中连续2个号相同且顺序一致</td>
    <td class="eleven_last"><span class="red">62</span>元</td>
  </tr>
  <tr>
    <td>选三前组</td>
    <td class="left_l">01 02 03</td>
    <td>选3个号与开奖号码中前3个号相同</td>
    <td class="eleven_last"><span class="red">1300</span>元</td>
  </tr>
  <tr>
    <td>选三前直</td>
    <td class="left_l">01 02 03</td>
    <td>选3个号与开奖号码中前3个号相同且顺序一致</td>
    <td class="eleven_last"><span class="red">8000</span>元</td>
  </tr>
</tbody></table>
    </div>
</div>
        
</c:if>

<jsp:include page="../handworkInput.jsp"></jsp:include>