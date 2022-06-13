<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-站内信" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<script>
	function viewContent(obj){
		var messageId = $(obj).attr('messageId');
		$.ajax({
	    type: "post",
	    url: "/memberCenter/setMessageRead.do",
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
					$(obj).next().hide();
				}
	    }
		});
	}
</script>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId" style="width:998px;">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">账户中心</a> > 站内信 </div>
  </div>
</div>
<div class="memberbox">
  <c:set var="PageId" value="12" scope="page"></c:set>
  <%@include file="menu.jsp" %>
  <div class="tzgl">
    <div class="usertab">
          	<ul>
            	<li class="ck">站内信</li>
                <li class="showeek">显示最近一周记录</li>
            </ul>
    </div>
    <div class="shaixuan">
    	<form id="reportForm" name="reportForm" action="/memberCenter/message.jhtml" method="post">
    		<!--我要筛选
             <select name="state" id="state">
               <option value="">状态选择</option>
								<c:forEach var="obj" items="${memberMessageState}">
									<option value="${obj.key}" <c:if test="${obj.key eq param.state }">selected</c:if>>${obj.value}</option>
								</c:forEach>
							</select>-->
       　　起始日期
       <input type="text" name="beginTime" id="beginTime"
													value="${param.beginTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,maxDate:$('#endTime').val()})" style="width:80px"/>
			至   
			<input type="text" name="endTime" id="endTime"
													value="${param.endTime}"
													onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,minDate:$('#beginTime').val()})" style="width:80px"/>
    　
    <input name="button" type="submit" class="inputyellow" id="button" value="查询" style="width:62px" />
  </form>
    </div>
  
    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#becfd7">
			<tr>
		    <!--<td width="42" height="30" align="center" class="tztop">选择</td>-->
		    <td width="20%" height="30" align="center" class="tztop">消息类型</td>
		    <td width="20%" align="center" class="tztop">状态</td>
		    <td width="40%" align="center" class="tztop">消息标题 </td>
		    <td width="20%" align="center" class="tztop">接收时间</td>
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
  <tr>
    <td height="38" colspan="10" align="center" bgcolor="#e2eaef">
    	<div class="page">
  　　<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}"
										count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
    </div></td>
    </tr>
</table>  
      
        
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
</html>
