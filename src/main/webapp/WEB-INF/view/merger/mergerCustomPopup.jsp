<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="/js/merger/mergerCustomPopup.js"></script>
<style type="text/css">
.show_mergerCustomDiv {
    background-color: #fff;
    border: 1px solid #cccccc;
    height: 137px;
    margin-left:8px;
    margin-top: 8px;
    width: 653px;
}
body {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 12px;
	font-family: "宋体";
	color:#565656;
	background-color:#f7f7f7;
}
div, html, body, ul, li, ol, dl, dd, dt, p, h1, h2, h3, h4, h5, h6, form, fieldset, legend, img, span {
	margin:0;
	padding:0;
}
img {
	border:0;
}
ul, li {
	list-style:none;
}
input {
	padding-top:0;
	padding-bottom:0;
	cursor:pointer;
}
select, input, img {

}
a {
	text-decoration:none;
	cursor:pointer;
	color:#565656;
}
a:hover {
	color:#cf3032 !important;
	text-decoration:none;
}
.clear {
	clear:both;
}
.fl {
	float:left;
}
.fr {
	float:right;
}
.common_w{width:980px;margin:0 auto;}
/**/

.follow_list {
position: absolute;
z-index: 9999991;
background: #fff;
height: 457px;
width: 782px;
border: 3px solid #a4a4a4;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
-webkit-box-shadow: 0 0 10px rgba(0,0,0,0.4);
-moz-box-shadow: 0 0 10px rgba(0,0,0,0.4);
box-shadow: 0 0 10px rgba(0,0,0,0.4);
font-family: "Microsoft yahei", Arial;
left: 50%;
margin-left: -384px;
top: 20px;
}
.follow_list h2 {
color: #2b2b2b;
padding: 8px 0 3px 18px;
height:30px;
line-height:30px;
}
.follow_list h2 span{width: 62px;
min-width: 62px;
margin-right: 18px;
text-align: center;
white-space: nowrap;
float: left;
height: 21px;
display: inline-block;
font: 700 16px/21px '微软雅黑';
}
.follow_list .dengji img{margin-top:3px;margin-left:2px;}
.f_cont_l a{width:100px;height:80px;background:url(images/peiliewu.png) no-repeat center center;display:block;}
.f_cont_r{width:680px;}
.f_cont_r li{width:164px;height:31px;text-align:center;line-height:31px;margin-right:5px;float:left;margin-bottom:10px;}
.f_cont_r_top .shen{background:#ededed;border-bottom:1p solid #e5e5e5;color:#717172;}
.f_cont_r_top .qian{background:#f6f6f6;color:#717172;}
.f_cont_r_top .qian a{width:115px;height:27px;background:#ff882c;line-height:27px;text-align:center;color:#fff !important;display:block;border-radius:3px;margin-left:28px;}
.f_cont_r_top .red{color:#e64949;}
.f_cont_r_top .blue{color:#1e50a2;}
.f_cont_r_ct{margin-top:10px;padding-left:10px;}
.f_cont_r_ct li{width:138px;height:31px;background:#f3f3f3;border:1px solid #e5e5e5;line-height:;31px;text-align:center;color:#717172;}
.f_cont_r_ct .current{width:138px;height:31px;background:#BC0F0F;border:1px solid #e5e5e5;line-height:;31px;text-align:center;color:#FFFFFF !important;}
.f_cont_r_ct .current a{color:#FFFFFF;}
.f_cont_gendan{width:633px;background:#fff7eb;padding:10px;color:#cd9964;}
.f_cont_gendan h3 img{ vertical-align:-2px;margin-right:5px;}
.f_cont_gendan p{color:#cd9964;line-height:20px;}
.f_text{width:65px;height:20px;border:1px solid #7c7c7c;text-align:center;}
.f_cont_rengou p{height:40px;line-height:40px;}
.f_cont_rengou span{width:94px;display:inline-block;text-align:right;font-weight:bold;}
.f_cont_jin{width:655px;height:51px;background:#f6f6f6;line-height:51px;margin-left:7px;}
.f_cont_jin_l{margin-left:25px;font-weight:bold;font-sixe:14px;font-family: "宋体";color:#2b2b2b;}
.f_cont_jin_l span{color:#e24949;margin-left:5px;margin-right:5px;}
.f_cont_jin_r a{width:90px;height:30px;background:#bc0f0f;text-align:center;color:#fff !important;line-height:30px;display:block;border-radius:3px;margin-right:30px;margin-top:10px;}
.f_cont_ff{text-align:right;margin-right:50px;margin-top:10px;}
.f_cont_ff input{ vertical-align:-3px;}
.f_cont_ff a{color:#1e50a2;}
</style>
<div class="f_cont">
    <div class="f_cont_r fl">
      <div class="f_cont_r_ct">
        <ul>
          <li class="current" style="cursor:pointer;">按固定金额定制跟单</li>
          <li style="cursor:pointer;">按百分比定制跟单</li>
          <div class="clear"></div>
        </ul>
      </div>
      <div class="f_cont_zht">
      <div class="f_cont_r_c show_mergerCustomDiv">
        <div class="f_cont_gendan">
          <h3><img src="/images/tanhao.png" width="16" height="16" />跟单提示：</h3>
          <p>1.系统根据每次认购金额自动认购发起人发起合买的相应份数，若认购金额小于每份金额则无法认购该方案。例：每次认购金额10元，合买方案每份3元，则自动认购3份，退款1元。以此类推。</p>
          <p>2.每个彩种只能定制一次。</p>
        </div>
        <div class="f_cont_rengou">
          <p><span>每次认购金额：</span>
            <input type="text" class="f_text" value="10" name='money' onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            元 至少认购1元，发起人在本彩种的平均每份金额为 1.00元</p>
        </div>
      </div>
      <div class="f_cont_r_c"  style="display: none;">
        <div class="f_cont_gendan">
          <h3><img src="/images/tanhao.png" width="16" height="16" />跟单提示：</h3>
          <p>1.最低认购比例为1%。进行自动认购时，您的帐户余额不能低于每次认购金额。</p>
          <p>2.每次认购金额 = 方案金额 × 认购比例，并会根据方案每份金额进行适当调整（详细）。</p>
        </div>
        <div class="f_cont_rengou">
          <p><span>每次认购比例：</span>
            <input type="text" class="f_text" value="10" name="percentage" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            % 至少认购1%，发起人在本彩种的平均方案金额的1%约为 5.93元</p>
          <div class="clear"></div>
        </div>
      </div>
      </div>
      <div class="f_cont_jin">
          <div class="f_cont_jin_r fr">
	          <input type="hidden" value="${mo.userid}" name="useridOfPopup"/>
	       	  <input type="hidden" value="${mo.licenseId}" name="licenseIdOfPopup"/>
	       	  <input type="hidden" value="${appointed}" name="appointed"/>
	          <a name="customBtn">立即定制</a>
          </div>
          <div class="clear"></div>
        </div>
        <div class="f_cont_ff">
          <input type="checkbox" name="checkboxProtocol" checked="checked"/>
          我已经阅读并同意<a href="/common/agreement.jhtml">《用户服务协议》</a></div>
    </div>
  </div>