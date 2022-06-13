<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="w_gcjl_l">
	<ul>
		<li><a href="/memberCenterNew/purchasList.jhtml" <c:if test="${btnNum==1}">class="active"</c:if>>购彩记录</a></li>
		<li><a href="/memberCenterNew/chaseList.jhtml" <c:if test="${btnNum==2}">class="active"</c:if>>追号记录</a></li>
		<li><a href="/memberCenterNew/mergerJoinList.jhtml" <c:if test="${btnNum==3}">class="active"</c:if>>合买记录</a></li>
		<li><a href="/memberCenterNew/prizeList.jhtml" <c:if test="${btnNum==4}">class="active"</c:if>>中奖记录</a></li>
	</ul>
	<span>显示最近一周记录</span>
	<div class="clear"></div>
</div>
<div class="w_gcjl_choose">
	<form id="reportForm" name="reportForm"
		action="/memberCenterNew/<c:if test="${btnNum==1}">purchasList.jhtml</c:if><c:if test="${btnNum==2}">chaseList.jhtml</c:if><c:if test="${btnNum==3}">mergerJoinList.jhtml</c:if><c:if test="${btnNum==4}">prizeList.jhtml</c:if>" method="post">
		<span>我要筛选
	    	<select name="licenseId" id="licenseId">
				<option value="">全部彩种</option>
				<c:forEach var="obj" items="${lotteryTypes}">
					<option value="${obj.licenseId}" <c:if test="${obj.licenseId eq param.licenseId }">selected</c:if>>${obj.licenseString}</option>
				</c:forEach>
			</select>
	    </span><span>起始日期
	      <input type="text" name="beginTime" id="beginTime"
													value="${param.beginTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
	      至
	      <input type="text" name="endTime" id="endTime"
													value="${param.endTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
	      </span>
	      <!-- <a href="#" name="button" id="button" class="w_gcjl_find">查询</a> -->
	      <input name="button" type="submit" class="w_gcjl_find" id="button" value="查询" style="width:62px" />
    </form>
</div>