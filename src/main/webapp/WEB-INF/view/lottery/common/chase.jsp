<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/js/chasing/chase.js"></script>
<div class="chasenumber" style="display:none" id="chaseSetPanelId">
        	<div class="chasenumber_top">连续追号
            <select id="chasingIssueOptId">
            <option value="10">10期</option>
            <option value="30">30期</option>
            <option value="50">50期</option>
            </select><a target="_blank" href="/playerintro/chase.jhtml">查看追号规则</a>
            </div>
            <div class="chasenumber_xqz">
            <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%">
  <tr>
    <th width="10%">序号</th>
    <th width="19%">追号期数</th>
    <th width="20%">倍投<input type="text" class="chasenumber_text" value="1" id="totalSetMultId"/>倍</th>
    <th width="25%">金额</th>
    <th width="26%">预计开奖时间</th>
  </tr>
  </table>
  <div class="chasenumber_xq">
  <table border="0" cellpadding="0" cellspacing="0" class="chasenumber_xqh" width="100%" id="chasingIssListId">
  <c:forEach var="item" items="${gameSaledList}" varStatus="status">
	  <tr issue="${item.issue }">
	    <td width="10%">${status.count}</td>
	    <td width="20%" class="chasenumber_qhf">
	    	<input type="checkbox" class="chasenumber_checkbox"/>${item.issue }
	    </td>
	    <td width="20%">倍投<input type="text" class="chasenumber_text" name="issMultiple" disabled/>倍</td>
	    <td width="25%"><span class="red" name="issSpan">0</span>元</td>
	    <td width="25%">${fn:substring(item.stopTime,0,10)}</td>
	  </tr>
  </c:forEach>
</table></div>
            </div>
            <div class="chasenumber_bottom">
            设置终止条件：<input type="checkbox" class="chasenumber_checkbox" id="stopSetId"/>中奖累计
            <input type="text" class="chasenumber_text"  style="width:65px" id="stopBonusId" disabled/>元后停止追号
            总共：<span class="tw_red" id="totalCIssueId">0</span>期
            金额：<span class="tw_red" id="totalCBetMoneyId">0</span>元
            </div>
        </div>