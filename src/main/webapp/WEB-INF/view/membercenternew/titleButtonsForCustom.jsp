<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="w_gcjl_l">
	<ul>
		<li><a href="/memberCenterCustomNew/custom.jhtml?type=1" <c:if test="${btnNum==1}">class="active"</c:if>>我定制的跟单</a></li>
		<li><a href="/memberCenterCustomNew/custom.jhtml?type=2" <c:if test="${btnNum==2}">class="active"</c:if>>我被定制的记录</a></li>
		<li><a href="/memberCenterCustomNew/custom.jhtml?type=3" <c:if test="${btnNum==3}">class="active"</c:if>>我指定的跟单人</a></li>
		<li><a href="/memberCenterCustomNew/custom.jhtml?type=4" <c:if test="${btnNum==4}">class="active"</c:if>>我被指定的记录</a></li>
		<li><a href="/memberCenterCustomNew/custom.jhtml?type=5" <c:if test="${btnNum==5}">class="active"</c:if>>跟单记录</a></li>
	</ul>
	<span>显示最近一周记录</span>
	<div class="clear"></div>
</div>

<c:if test="${btnNum != 3 and btnNum !=4 and btnNum != 5}">
<input type="hidden" id="type" value="${btnNum}"/>
<div class="w_gcjl_choose">
		<span>我要筛选
	    	<select name="licenseId" id="licenseId">
				<option value="">全部彩种</option>
				<c:forEach var="obj" items="${ltype}">
				<option value="${obj.licenseId}" <c:if test="${obj.licenseId eq param.licenseId }">selected</c:if>>${obj.licenseString}</option>
				</c:forEach>
			</select>
	    </span>
</div>
</c:if>