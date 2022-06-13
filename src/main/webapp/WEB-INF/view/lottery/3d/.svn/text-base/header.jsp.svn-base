<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/data/lottery/pls/data.js"></script>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/pl3/Pl3.js"></script>
<script type="text/javascript" src="/data/lottery/f3d/data.js"></script>
<script type="text/javascript" src="/js/lottery/pl3/common.js"></script>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>

<jsp:include page="../common/numbercomm.jsp"></jsp:include>
<input type="hidden" id="playNameId" value="${playName }"/>
<div class="dlt-l-o">
        <div class="dlt-l-o-t">
          <div class="dlt-l-o-tt">
            <div class="dlt-l-o-tt-l"> <img width="70" height="62" src="/images/smalllottery/${param.licenseId}.png"></img> </div>
            <div class="dlt-l-o-tt-c">
              <div class="dlt-l-o-tt-ct">
                <div class="dlt-l-o-tt-ctl">
                  <li>3D 第<a style="cursor:pointer" id="currIssueId">${game.issue }</a>期</li>
                  <li><span>每天 晚20点50分开奖</span></li>
                  <li>截止时间：<span>${game.stopTime } </span></li>
                </div>
                <div class="dlt-l-o-tt-ctr">
                  <li><span>2元可得1000元</span></li>
                  <li><img src="/images/d_03.jpg" /></li>
                  <li>剩余时间：<span id="stopTipId"><b id="stopHId">${stopTime[0] }</b>小时<b id="stopMId">${stopTime[1] }</b>分<b id="stopSId">${stopTime[2] }</b>秒</span></li>
                </div>
                <div class="clear"></div>
              </div>
              <div class="dlt-l-o-tt-cb">
                <ul>
                  <li <c:if test="${pl3PlayName == 'zx' }">class="link"</c:if> ><a href="/lottery/index.jhtml?licenseId=12&p=zxpt">直选</a></li>
                  <li <c:if test="${pl3PlayName == 'z3' }">class="link"</c:if>><a href="/lottery/index.jhtml?licenseId=12&p=z3fs">组三</a></li>
                  <li <c:if test="${pl3PlayName == 'z6' }">class="link"</c:if>><a href="/lottery/index.jhtml?licenseId=12&p=z6pt">组六</a></li>
                </ul>
              </div>
            </div>
            <div class="dlt-l-o-tt-r"> <a href="/playerintro/index.jhtml" target="_blank">玩法介绍</a><br />
            	<a href="/chart/ps_index.jhtml" target="_blank">走势图</a>
               </div>
          </div>
        </div>
      </div>