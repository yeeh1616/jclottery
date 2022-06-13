<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="sidebar fl">
	<h2><span><img src="/images/icon_m.png" width="16" height="12" />彩种列表</span></h2>
    <ul>
      <li class="zicaidan1"><h1><span  class="zzc"></span>足彩</h1>
      	<ul class="zicaidan_l">
			<li><a href="/pass/index.jhtml?licenseId=5&succFlag=1" <c:if test="${licenseId==5}">class="side_cur"</c:if>>胜负彩</a></li>
            <li><a href="/pass/index.jhtml?licenseId=6&succFlag=1" <c:if test="${licenseId==6}">class="side_cur"</c:if>>任选九</a></li>
            <li><a href="/pass/index.jhtml?licenseId=7&succFlag=1" <c:if test="${licenseId==7}">class="side_cur"</c:if>>半全场</a></li>
            <li><a href="/pass/index.jhtml?licenseId=8&succFlag=1" <c:if test="${licenseId==8}">class="side_cur"</c:if>>进球彩</a></li>
        </ul>
        </li>
        <li class="zicaidan1"><h1><span  class="jjc"></span>竞技</h1>
      	   <ul class="zicaidan_l">
            <li><a href="/pass/index.jhtml?licenseId=9&succFlag=1" <c:if test="${licenseId==9}">class="side_cur"</c:if>>竞彩足球</a></li>
            <li><a href="/pass/index.jhtml?licenseId=10&succFlag=1" <c:if test="${licenseId==10}">class="side_cur"</c:if>>竞彩篮球</a></li>
            <li><a href="/pass/index.jhtml?licenseId=21&succFlag=1" <c:if test="${licenseId==21}">class="side_cur"</c:if>>北京单场</a></li>
            <li><a href="/pass/index.jhtml?licenseId=22&succFlag=1" <c:if test="${licenseId==22}">class="side_cur"</c:if>>胜负过关</a></li>
           </ul>
      </li>
      <li class="zicaidan1 zicaidan_n"><h1><span  class="ssc"></span>数字彩</h1>
      		<ul class="zicaidan_l">
			<li><a href="/pass/index.jhtml?licenseId=4&succFlag=1" <c:if test="${licenseId==4}">class="side_cur"</c:if>>大乐透</a></li>
			<li><a href="/pass/index.jhtml?licenseId=3&succFlag=1" <c:if test="${licenseId==3}">class="side_cur"</c:if>>七星彩</a></li>
        	<li><a href="/pass/index.jhtml?licenseId=1&succFlag=1" <c:if test="${licenseId==1}">class="side_cur"</c:if>>排列三</a></li>
        	<li><a href="/pass/index.jhtml?licenseId=2&succFlag=1" <c:if test="${licenseId==2}">class="side_cur"</c:if>>排列五</a></li>
        	<li><a href="/pass/index.jhtml?licenseId=11&succFlag=1" <c:if test="${licenseId==11}">class="side_cur"</c:if>>双色球</a></li>
        	<li><a href="/pass/index.jhtml?licenseId=12&succFlag=1" <c:if test="${licenseId==12}">class="side_cur"</c:if>>3D</a></li>
        	<li><a href="/pass/index.jhtml?licenseId=13&succFlag=1" <c:if test="${licenseId==13}">class="side_cur"</c:if>>七乐彩</a></li>
        	</ul>
        </li>
    </ul>
	</div>
