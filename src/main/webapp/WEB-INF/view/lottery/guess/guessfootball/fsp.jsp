<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/singleupload.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/cytxhome/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/columns_blue2.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/other.css"/>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/buy.css"/>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/lottery/guess/guessfootball/fsp.js"></script>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
</head>
<body>
<input type="hidden" id="licenseId" value="${licenseId}"/>
<div class="common_w" id="betPanalId">  
	<div class="sais_t"> </div>
    <div class="sais_c">
         <div class="w_ggfs">
         		<div class="w_ggfs_t">请先选择玩法:<input type="radio" name="playTypeName" value="1" checked/>胜平负<input type="radio" name="playTypeName" value="2"/>让球平胜负<input type="radio" name="playTypeName" value="4"/>半全场<input type="radio" name="playTypeName" value="5"/>比分<input type="radio" name="playTypeName" value="3"/>总进球</div> 
				<div class="w_ggfs_c"><span class="w_peim">1</span>选择文件</div> 
				<div class="w_ggfsc_fx">
				<div class="sc_btn">
				 <span id="fileuplodid" style="display: none;" width="121" height="51"></span>
						            <span id="fileQueue" ></span>
				</div>   
				</div>
				           <div class="w_ggfs_c"><span class="w_peim">2</span>处理结果</div> 
				            <div class="w_ggfsc_fxc">
				            	<p id="resultId">
				            	</p>
				            </div> 
         </div> 
        </div>
<div class="clear"></div> 
</div>
</body>
</html>
