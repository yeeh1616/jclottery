<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>店铺介绍</title>
<link rel="stylesheet" type="text/css" href="/css/layout_daletouxiangqing.css"/>
<c:set var="pageName" value="彩站介绍" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>

<!--introdunction-->
<div class="common_w">
  <div class="hall-top">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 店铺介绍 </div>
  </div>
  <div class="introp">
    <div class="mpl">
      <div class="mpltop"> <img src="/images/introduce/gongxian.jpg" /> </div>
      <div class="mplbot">
        <div class="mplbotr">彩站官方资质认证</div>
      </div>
    </div>
    <!-- 名片左侧 end-->
    <div class="mpr">
    <div class="dian_m">
    <img src="/images/twodimensionCode/${store.storeId}codepic2.jpg" width="107" height="107" />
    <div class="er_txt">扫描店铺二维码</div>
    </div>
      <div class="textxia">
        <ul>
          <li><i>彩店名称：</i><span>${store.storeName}</span></li>
          <li><i>店主姓名：</i><span>${store.bossName}</span></li>
          <li><i>店内座机：</i><span>${store.storeMobile}</span></li>
          <li><i>店主手机：</i><span>${store.storePhone}</span></li>
          <li><i>店内QQ：</i><span>${store.storeQq}</span></li>
          <li><i>店内微信：</i><span>（未添加）</span></li>
          <li style="width:400px;">彩站地址：<span>${store.address}</span></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- 名片左侧 end-->
  <div class="introo">
    <div class="introtitle">彩站介绍</div>
  </div>
  <div class="textintro">
    <div class="introbt">${store.storeName}欢迎您</div>
    <div class="introxt">
      ${storeintroContent}
    </div>
    <!--<img src="/images/introduce/pho1.jpg"> <img src="/images/introduce/pho2.jpg">-->
  </div>
  <div class="introo">
    <div class="introtitle">彩站地图</div>
  </div>
  <div class="textintro">
  <div id="container" align="center" style="width: 900px; height:572px;display:inlin-block;margin-left: 40px;
top:15px; margin-bottom:15px;"></div>
  </div>
</div>
<!--introdunction end-->

<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<script type="text/javascript">
  var city = '${store.city}';
  var map = new BMap.Map("container");
  var myIcon = new BMap.Icon("/images/smap.jpg",new BMap.Size(30,35),{
						anchor: new BMap.Size(30,32),
						infoWindowAnchor: new BMap.Size(15, 0)
					});
  function getMap(city,adress,phone,xc,slwn){
      // 创建地址解析器实例
      var myGeo = new BMap.Geocoder();
      // 将地址解析结果显示在地图上，并调整地图视野
      myGeo.getPoint(adress, function(point){
       if (point) {
          var marker = new BMap.Marker(point);
          marker.setIcon(myIcon);
          map.addOverlay(marker);
          map.centerAndZoom(point, 14);
 
          var opts = {
	            width : 50,     // 信息窗口宽度
	            height: 90     // 信息窗口高度
	        }
	        map.centerAndZoom(point, 12);
	        //var marker = new BMap.Marker(point);
	        //map.addOverlay(marker);
	
	        var infoWindow = new BMap.InfoWindow("<b>" + slwn + "</b><br>" + adress + "<br>" + phone+ "<br>" + xc,opts);  // 创建信息窗口对象
	        //var infoWindow = new BMap.InfoWindow();
	        map.openInfoWindow(infoWindow,point);
	        marker.addEventListener("click", function(){
	           this.openInfoWindow(infoWindow);
	        });
       }
      }, city);

  }
  getMap('${store.city}','${store.address}','联系电话：${store.storePhone}','','${store.storeName}');
</script>
</html>