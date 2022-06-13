<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/hao.css" rel="stylesheet" type="text/css" />
<c:set var="pageName" value="竞彩足球世界杯冠亚军" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp" %>
</head>
<body>
<jsp:include page="../../../include/header.jsp"></jsp:include>
<script type="text/javascript" src="/data/lottery/guess/worldcupgyj.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/guess/guessfootball/worldcup/pageControl.js"></script>
<div id="betPanalId">
<input type="hidden" id="playTpId" value="9"/>
<div class="cent">
<div class="tab_pic">
        <div class="tab_top">
                  <ul class="fl">
                         <li style="margin-left:4px;cursor:pointer;" onclick="location.href='/lottery/index.jhtml?licenseId=9&p=worldcup'">世界杯冠军</li>
                         <li style="cursor:pointer;" class="hover">世界杯冠亚军</li>
                  </ul>   
                   
        </div><div class="clear"></div>
        <!--<div class="tab_top_2">
         <span class="fl tp_1">停售时间：<b>2014-05-12&nbsp;&nbsp;03:12</b></span>
         <span class="fl tp_2">停售时间：<b>2014-05-12&nbsp;&nbsp;03:12</b></span>
        <span class="fr tp_3"><input type="checkbox" /><label>按分组查看投注选项</label></span>
        </div>-->
        <div class="biaogequ">
             <div class="biao_left fl">
                      <ul>
                           <li style="width:74px;">编号</li>
                           <li style="width:246px;">球队组合</li>
                           <li style="width:174px; border-right:1px #AAC0CC solid;">1元固定赔率</li>
                      </ul><div class="clear"></div>
                     <table border="1">
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>01</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>02</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>03</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>04</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>05</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>06</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>07</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>08</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>09</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>10</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>11</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>12</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>13</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>14</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>15</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>16</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>17</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>18</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>19</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>20</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/bx.png" /></b><b style=" margin-top:3px;">巴西</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>21</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>22</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>23</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>24</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>25</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                        </table>
             </div>
             <div class="biao_left fr">
                      <ul>
                          <li style="width:74px;">编号</li>
                           <li style="width:246px;">球队组合</li>
                           <li style="width:174px; border-right:1px #AAC0CC solid;">1元固定赔率</li>
                      </ul><div class="clear"></div>
                     <table border="1">
                        <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>26</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>27</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>28</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>29</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>30</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>31</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>32</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/dg.png" /></b><b style=" margin-top:3px;">德国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>33</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>34</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/xby.png" /></b><b style=" margin-top:3px;">西班牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>35</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>36</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>37</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>38</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>39</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>40</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>41</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/agt.png" /></b><b style=" margin-top:3px;">阿根廷</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>42</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>43</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/hl.png" /></b><b style=" margin-top:3px;">荷兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>44</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/ydl.png" /></b><b style=" margin-top:3px;">意大利</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>45</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/pty.png" /></b><b style=" margin-top:3px;">葡萄牙</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>46</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>47</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/fg.png" /></b><b style=" margin-top:3px;">法国</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/ygl.png" /></b><b style=" margin-top:3px;">英格兰</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>48</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/glby.png" /></b><b style=" margin-top:3px;">哥伦比亚</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>49</b></td>
                            <td width="246" class="guo">
                            	 <b><img src="../../../../../images/wlg.png" /></b><b style=" margin-top:3px;">乌拉圭</b>
                            	 <b style="padding:0 5px 0 5px">-</b>
                            	 <b><img src="../../../../../images/zl.png" /></b><b style=" margin-top:3px;">智利</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                          <tr>
                            <td width="74" style="background:#C49F7E; font-size:16px; color:#fff;" class="azu"><b>50</b></td>
                            <td width="246" class="guo">
                            	 <b>--其他--</b>
                            </td>
                            <td width="174" style="background:#E4C037;" class="shuzi"><b>2.65</b></td>
                          </tr>
                        </table>
             </div>
                   <div class="clear"></div>
			<jsp:include page="../../common/worldcupfooter.jsp"></jsp:include>         
        
</div></div>

</div>
	
</div>

<jsp:include page="../../common/sure.jsp"></jsp:include>

<jsp:include page="../../../include/footer.jsp"></jsp:include>

</body>
</html>