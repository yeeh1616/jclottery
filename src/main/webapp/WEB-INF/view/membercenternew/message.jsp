<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-站内信" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script>
	function viewContent(obj){
		var messageId = $(obj).attr('messageId');
		$.ajax({
	    type: "post",
	    url: "/memberCenterNew/setMessageRead.do",
	    data: "messageId=" + messageId,
	    async: false,
	    dataType: "json",
	    error: function(xMLHttpRequest, textStatus, errorThrown){
	    	popupConfirm("温馨提示","系统错误！请重试！");
		  },
	    success: function (data){
		   	if($(obj).next().css("display")=="none"){
					$(obj).next().show();
				}else{
					location.href = location.href;
					$(obj).next().hide();
				}
	    }
		});
	}
</script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="common_w">
<div class="hall-top">
  <div class="sitepath fl"> 您当前的位置：<a href="/memberCenterNew/index.jhtml">用户中心</a> > 站内信 </div>
</div>
<!--用户中心-->
<div class="user_plant">
	<c:set var="PageId" value="12" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="user_r">
    <!--安全等级begin-->
    <div class="gr-safedj">
      <div class="gr-safe-l">投注管理 </div>
    </div>
    <!--安全等级end--> 
<div class="gr-lbody">     
    <!--具体信息begin-->
<div class="w_gcjl">
	<div class="w_gcjl_l">
	<ul>
		<li><a href="javascript:void 0" class="active">站内信</a></li>
	</ul>
	<span>显示最近一周记录</span>
	<div class="clear"></div>
</div>
<div class="w_gcjl_choose">
	<form id="reportForm" name="reportForm" action="/memberCenterNew/message.jhtml" method="post">
       	   我要筛选
	<span>起始日期
        <input type="text" name="beginTime" id="beginTime" value="${param.beginTime}"
		onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})"/>
			至   
		<input type="text" name="endTime" id="endTime" value="${param.endTime}"
		onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})"/>
	</span>
    <input type="submit" class="w_gcjl_find" name="button" id="button" value="查询"/>
    </form>
</div>
    <div class="w_gcjl_bg">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" class="w_gcjl_gc">
    	 <tr>
		    <!--<td width="42" height="30" align="center">选择</td>-->
		    <td width="20%" height="30" align="center">消息类型</td>
		    <td width="20%" align="center">状态</td>
		    <td width="40%" align="center">消息标题 </td>
		    <td width="20%" align="center">接收时间</td>
		  </tr>
		  <c:forEach var="list" items="${pagination.list}" varStatus="varStatus">				
			<c:choose>
				<c:when test="${varStatus.count%2==0}">
					<tr bgcolor="#f4fbff" style="cursor:pointer;" messageId=${list.id} onclick="viewContent(this);">
				</c:when>
				<c:otherwise>
					<tr bgcolor="#FFFFFF" style="cursor:pointer;" messageId=${list.id} onclick="viewContent(this);">
				</c:otherwise>
			</c:choose>
	    <!--<td width="42" height="30" align="center" bgcolor="#FFFFFF">
	    	<input type="checkbox" name="checkbox" id="checkbox" />
	    </td>-->
	    <td  height="30" align="center" bgcolor="#FFFFFF">${list.typeName2}</td>
	    <td  align="center" bgcolor="#FFFFFF">${list.stateName2}</td>
	    <td  align="center" bgcolor="#FFFFFF">${list.title} </td>
	    <td  align="center" bgcolor="#FFFFFF">${list.sentTime}</td>
	  </tr>
	  <tr style="display:none;">
			<td colspan="10" height="20" ><span style="padding:0 10px 0 30px">${list.content}</span></td>
		  </tr>
	 </c:forEach>
      </table>
    </div>
    <div class="pagetotal">
		<div class="ptotal">
        	<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
		</div>
    </div>
  </div>    
    <!--具体信息end--> 
    
  </div>
</div>
  <div class="clear"></div></div></div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
