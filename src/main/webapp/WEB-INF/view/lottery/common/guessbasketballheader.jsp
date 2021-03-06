<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- common JS -->
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<!-- DATA JS -->
<script type="text/javascript" src="/data/lottery/guess/guessBasketballSchedules.js?time=new Date().getTime()"></script>

<!-- GuessFootball JS -->
<script type="text/javascript" src="/js/lottery/guess/GuessBasketballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>
<!-- 合买 -->
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/guess/pubPageControl.js"></script>

<input type="hidden" id="ndateValId" value="${ndate }"/>

<div class="content">
	<div class="touZhuQueRen">
    	<div class="header2">
        	<div class="hdnav">
				<div class="hdico"><img src="/images/smalllottery/${param.licenseId}.png" width="70" height="62" /></div>
			    <div class="midnav">
			      	<div class="jingcai"><img src="/images/jclc.gif" width="207" height="21" />
			          <span><font color="#615049">官方销售时间 :</font>周一至五09:00~24:00  周六/日09:00~01:00 </span>
			          </div>
			      <div class="menu">
			          	  <a href="/lottery/index.jhtml?licenseId=10&p=sf" <c:if test="${p == 'sf' }">class="hover"</c:if>>胜负</a>
			              <a href="/lottery/index.jhtml?licenseId=10&p=rfsf" <c:if test="${p == 'rfsf' }">class="hover"</c:if>>让分胜负</a>
			              <a href="/lottery/index.jhtml?licenseId=10&p=sfc" <c:if test="${p == 'sfc' }">class="hover"</c:if>>胜分差</a>
			              <a href="/lottery/index.jhtml?licenseId=10&p=dxf" <c:if test="${p == 'dxf' }">class="hover"</c:if>>大小分</a>
			              <a href="/lottery/index.jhtml?licenseId=10&p=hhgg" <c:if test="${p == 'hhgg' }">class="hover"</c:if>>混合过关</a>
			          </div>
			    </div>
			    <div class="mrlink"><a href="/playerintro/jclq.jhtml" target="_blank">玩法介绍</a><br />
			    <a style="cursor:pointer">联赛资料</a></div>
			</div>
        	<div class="ss_top" style="background:#e8edf0">
            	<h1 class="ck" style="cursor:pointer;">过关投注</h1><h1 style="cursor:pointer;">单关投注</h1>
            	<c:if test="${p != 'hhgg' }">
            		<h1 style="cursor:pointer;">单式上传</h1>
            	</c:if>
            	<h1 style="cursor:pointer;" onclick="location.href='/merger/index.jhtml?licenseId=${licenseId}'">参与合买</h1>
            	<!--<h1 style="cursor:pointer;">单式上传</h1><h1 style="cursor:pointer;">参与合买</h1>
				
				<h3>
            	    <label style="vertical-align:middle">  <input type="checkbox" name="checkbox18" id="checkbox18"　 /></label>
            	    五大联赛</h3><h3><select name="">
						  <option>更多选择</option>
						</select></h3>
           	  <div class="ssquery">赛事回查 <select name="">
                      <option>2014－01－01</option>
                    </select></div>-->
            </div>
        </div>
	</div>
</div>
