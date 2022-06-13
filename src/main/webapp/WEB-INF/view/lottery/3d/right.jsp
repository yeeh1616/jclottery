<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="dlt-right_1 fr">
  	<div class="dlt-r">
        <div class="dlt-r-o">
          <li><span>
          
          <c:if test="${licenseId == 1}">
		    		<a href="/lotteryopen/ps.jhtml" target="_blank">更多》</a>
		    	</c:if>
		    	<c:if test="${licenseId == 2}">
		    		<a href="/lotteryopen/pw.jhtml" target="_blank">更多》</a>
		    	</c:if>
		    	<c:if test="${licenseId == 3}">
		    		<a href="/lotteryopen/qx.jhtml" target="_blank">更多》</a>
		    	</c:if>
          <c:if test="${licenseId == 4}">
		    		<a href="/lotteryopen/dlt.jhtml" target="_blank">更多》</a>
		    	</c:if>
		    	<c:if test="${licenseId == 10}">
		    		<a href="/lotteryopen/ssq.jhtml" target="_blank">更多》</a>
		    	</c:if>
		    	<c:if test="${licenseId == 11}">
		    		<a href="/lotteryopen/f3d.jhtml" target="_blank">更多》</a>
		    	</c:if>
		    	<c:if test="${licenseId == 12}">
		    		<a href="/lotteryopen/qlc.jhtml" target="_blank">更多》</a>
		    	</c:if>
          </span>${licenseName }<a id="preBonusIssueId">--</a>期开奖</li>
        </div>
        <div style="background:#fff;">
        <div class="dlt_r_o_1">
          <span id="preBonusCodeId"></span>        
       </div>
       
        </div>
    </div>
    <div class="block dlt-r2">
    	<div class="dlt-r2-t"><span>
    	<c:if test="${licenseId == 1}">
    		<a href="/lotteryopen/ps.jhtml"  target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 2}" >
    		<a href="/lotteryopen/pw.jhtml" target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 3}" >
    		<a href="/lotteryopen/qx.jhtml" target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 4}">
    		<a href="/lotteryopen/dlt.jhtml"  target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 10}" >
    		<a href="/lotteryopen/ssq.jhtml" target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 11}" >
    		<a href="/lotteryopen/f3d.jhtml" target="_blank">更多》</a>
    	</c:if>
    	<c:if test="${licenseId == 12}" >
    		<a href="/lotteryopen/qlc.jhtml" target="_blank">更多》</a>
    	</c:if>
    	</span>历史开奖</div>
			<div class="dlt-r2-c">
        	<div class="dlt-r2-ct" style="overflow:hidden;">
            	<ul>
                	<li style="width:126px;">期号</li>
                	<li style="width:136px;">号码</li>
                	<!--<li style="width:34px;">和值</li>
                	<li style="width:32px;">跨度</li>
                    <li style="width:52px;">大小</li>
                    <li style="width:58px;">奇偶</li>-->
                </ul>
                <div class="clear"></div>
            </div>
        	<div class="dlt-r2-cc" style="overflow:hidden; width:280px;">
           	  <table width="268" border="0" cellspacing="0" cellpadding="0" id="bonusCodeAreaId">
              </table>
        </div>
        </div>
    </div>
  </div>