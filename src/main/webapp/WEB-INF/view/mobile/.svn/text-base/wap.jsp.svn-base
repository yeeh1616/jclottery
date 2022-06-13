<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="/mobile/css/idangerous.swiper.css">
	<link rel="stylesheet" type="text/css" href="/mobile/css/base.css">
	
	<link rel="stylesheet" type="text/css" href="/mobile/css/jquery.mobile-1.4.5.min.css">
	<script src="/mobile/js/jquery.js"></script>
	<script src="/mobile/js/jquery.mobile-1.4.5.min.js"></script>
	<script src="/mobile/js/idangerous.swiper.min.js"></script> 
</head>
<body>
<div data-role="page" id="down_load" >
  <div data-role="header" data-position="fixed" data-tap-toggle="false" data-id="top" >
    <h1>凤凰彩票客户端</h1>
    <div class="head-left"></div>
  </div>
   <div data-role="content" class="ui-content down" style=" padding:0">
   
   <div class="d_logo"><img src="/mobile/images/d_logo.png"></div>
   <div class="phone"><img src="/mobile/images/phone_img.png"></div>
   <div class="down_b">
   <div class=""><a href="/soft/fhwc2.0.apk" target="_blank" data-transition="slide" data-ajax="false"><img src="/mobile/images/android.png"></a></div>
   <div><a href="https://itunes.apple.com/cn/app/feng-huang-wei-cai/id1084631341?l=zh&ls=1&mt=8" target="_blank" data-transition="slide" data-ajax="false"><img src="/mobile/images/iphone.png"></a></div>
   <div><a href="http://${homeUrl}" data-transition="slide" data-ajax="false"><img src="/mobile/images/wap.png"></a></div>
   </div>
   </div>
</div>  
</div>
<!--banner图 end-->
</body>
<script>
	$(document).ready(function () {
			var browser={  
		  versions:function(){   
		         var u = navigator.userAgent, app = navigator.appVersion;   
		         return {//移动终端浏览器版本信息   
		              trident: u.indexOf('Trident') > -1, //IE内核  
		              presto: u.indexOf('Presto') > -1, //opera内核  
		              webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
		              gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
		              mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
		              ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
		              android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
		              iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
		              iPad: u.indexOf('iPad') > -1, //是否iPad    
		              webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
		          };  
		       }(),  
		       language:(navigator.browserLanguage || navigator.language).toLowerCase()  
		}   
		
		if(browser.versions.mobile || browser.versions.ios || browser.versions.android ||   
			browser.versions.iPhone || browser.versions.iPad){        
		      alert("如果您的‘扫一扫软件’不支持下载，请点击右上角按钮，【在手机浏览器中打开】进行下载");
		} 
	});
	</script>
</html>