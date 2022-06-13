<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="pageName" value="新闻资讯详情页" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/inde.css" rel="stylesheet" type="text/css" />

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript" src="../../../js/home/newindex.js"></script>
<!--彩票资讯开始-->
<script>
    $(function () {
        var $tabs = $("div.tab");
        $.each($tabs, function (k, it) {
            var $li = $(this).find("li");
            var $con = $(this).find("div.tabCon div");
            $.each($li, function (i, item) {
                var _self = $(this);             
                
                _self.on("mouseover", function () {
                    var _con = $con.eq(_self.index());                    
                    _self.siblings().removeClass();
                    _self.addClass("cur");

                   _con.siblings().removeClass();
                    _con.addClass("cur");
                    
                })
            });
        })
        
    });
</script>
<div class="layout">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 彩票资讯 </div>
  </div>
<div class="layoutl">
<div class="rptbyl">
<h1>${info.title}</h1>
<h2>${info.createTime}&nbsp;&nbsp;来源：本站&nbsp;&nbsp;责编：小编</h2>
</div>
<p class="tui_pic_no1_5">${info.content}</p>
</div>
<div class="layoutr"> 
<div class="reporttitle"><div class="reporkstz">快捷投注</div></div>
<div class="quicktz">

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=9&p=spf">
<div class="logojz"></div>
<p>竞彩足球</p>
</a>
</div>

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=10&p=sf">
<div class="logojl"></div>
<p>竞彩篮球</p>
</a>
</div>

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=5">
<div class="logosfc"></div>
<p>胜负彩</p>
</a>
</div>

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=6">
<div class="logorxj"></div>
<p>任选九</p>
</a>
</div>

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=4">
<div class="logodlt"></div>
<p>大乐透</p>
</a>
</div>

<div class="tzawards">
<a href="/lottery/index.jhtml?licenseId=1&p=zxpt">
<div class="logopls"></div>
<p>排列三</p>
</a>
</div>

</div>
	<!--中奖信息-->
    <jsp:include page="newIndexParts/winInfo.jsp"></jsp:include>
    <!--中奖信息 end-->
        <!--AD-->
    <div class="ad"><img src="../../../cytxhome/images/activity.png" width="228" height="107" /></div>
    <!--AD end--> 

</div>
<div class="clear"></div>
</div>
<!--彩票资讯结束-->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>