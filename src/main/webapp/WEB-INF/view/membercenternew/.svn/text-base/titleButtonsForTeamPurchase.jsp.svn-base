<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="w_gcjl_l">
	<ul>
		<li><a href="/memberCenterNew/myTeamPurchas.jhtml" <c:if test="${btnNum==1}">class="active"</c:if>>购彩记录</a></li>
		<li><a href="/memberCenterNew/myTeamChaseMember.jhtml" <c:if test="${btnNum==2}">class="active"</c:if>>追号记录</a></li>
		<li><a href="/memberCenterNew/myTeamMergerJoin.jhtml" <c:if test="${btnNum==3}">class="active"</c:if>>合买记录</a></li>
		<li><a href="/memberCenterNew/myTeamPrizeList.jhtml" <c:if test="${btnNum==4}">class="active"</c:if>>中奖记录</a></li>
	</ul>
	<div class="clear"></div>
</div>

<div class="w_gcjl_choose">
	    <form id="reportForm" name="reportForm" action="/memberCenterNew/<c:if test="${btnNum==1}">myTeamPurchas.jhtml</c:if><c:if test="${btnNum==2}">myTeamChaseMember.jhtml</c:if><c:if test="${btnNum==3}">myTeamMergerJoin.jhtml</c:if><c:if test="${btnNum==4}">myTeamPrizeList.jhtml</c:if>" 
	    	method="post">
			<span>彩民<input type="text" name="username" id="username" value="${param.username}"/></span>
		    <!--<span>状态
		    	<select name="betState" id="betState" style = "width: 70px;">
					<option value="">-全部-</option>
					<c:forEach var="map" items="${stateMap}" varStatus="varStatus">
						<option value="${map.key}"
							<c:if test="${param.betState == map.key && param.betState != 0}">selected="selected"</c:if>>${map.value}
						</option>
					</c:forEach>
				</select>
		    </span>-->
		    <span>采种
		    	<select name="licenseId" id="licenseId" style="width:90px;">
				<option value="">全部彩种</option>
				<c:forEach var="obj" items="${lotteryTypes}">
					<option value="${obj.licenseId}" <c:if test="${obj.licenseId eq param.licenseId }">selected</c:if>>${obj.licenseString}</option>
				</c:forEach>
				</select>
		    </span>
		    <span>起始日期
		      <input type="text" name="beginTime" id="beginTime" value="${param.beginTime}"
							onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
		      	至<input type="text" name="endTime" id="endTime" value="${param.endTime}"
							onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
		    </span>
		    <input name="button" type="submit" class="w_gcjl_find" id="button" value="查询" style="width:62px" />
	    </form>
	</div>

