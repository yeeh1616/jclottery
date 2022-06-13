<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--悬浮栏开始-->
    <div class="common_w" id="touzhulan" style="position: fixed; box-shadow: 0px 0px 4px #ccc;-moz-box-shadow: 0px 0px 4px #ccc;
-webkit-box-shadow: 0px 0px 4px #ccc;">
          <div class="tijiao">
        <div  class="tijiao_l fl"> <a id="shedan">已选<span id="schudleSelId">0</span>场<i class="t_xiala fr"></i></a></div>
        <!--选择场次-->
    <div class="w_xxiang">
          <div class="w_xxiang_l">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="xx_duiz">
              <tr>
            <th width="134px">对阵</th>
            <th width="286px">选项</th>
            <th width="30px">胆</th>
            <th><a href="javascript:void 0" id="removeAllSelId">全删</a></th>
          </tr>
            </table>
      </div>
          <div class="w_xxiang_c">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="xx_duiz_c" id="betSelAreaId">
             
            </table>
      </div>
        </div>
    <div class="tijiao_c fl" id="passAreaId">
          <div class="tijiao_cL fl">过关方式：</div>
          <div class="tijiao_cc fl"> 
          	<a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="1c1"/>
                                    单关</a>
          	<a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="2c1"/>
            2串1</a>
            <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="3c1"/>
            3串1</a> 
            <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="4c1"/>
            4串1</a> <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="5c1"/>
            5串1</a> <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="6c1"/>
            6串1</a> <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="7c1"/>
            7串1</a> <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="8c1"/>
            8串1</a>
           
        <div class="clear"></div>
      </div>
          <div class="tijiao_cr fl"><a id="showMethod" >更多方式<i class="t_xiala2 fr"></i></a></div>
          <!--更多投注方式------------------------>
          <div class="w_Contrast" >
        <div class="w_Contrast_top"> <span class="fl">过关方式对照表</span><a class="close2 fr">隐藏</a>
              <div class="clear"></div>
            </div>
        <div class="w_Contrast_c">
              <ul>
            <li style="display:none">
                  <input type="checkbox" value="2c3"/>
                  <a href="javascript:void 0">2串3</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="3c4"/>
                  <a href="javascript:void 0">3串4</a></li>
            <li style="display:none">
                  <input type="checkbox" value="3c7"/>
                  <a href="javascript:void 0">3串7</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="4c5"/>
                  <a href="javascript:void 0">4串5</a></li>
            <li style="display:none">
                  <input type="checkbox" value="4c11"/>
                  <a href="javascript:void 0">4串11</a></li>
            <li style="display:none">
                  <input type="checkbox" value="4c15"/>
                  <a href="javascript:void 0">4串15</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="5c6"/>
                  <a href="javascript:void 0">5串6</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c16"/>
                  <a href="javascript:void 0">5串16</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c26"/>
                  <a href="javascript:void 0">5串26</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c31"/>
                  <a href="javascript:void 0">5串31</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="6c7"/>
                  <a href="javascript:void 0">6串7</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c22"/>
                  <a href="javascript:void 0">6串22</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c42"/>
                  <a href="javascript:void 0">6串42</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c57"/>
                  <a href="javascript:void 0">6串57</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c63"/>
                  <a href="javascript:void 0">6串63</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="9c1"/>
                  <a href="javascript:void 0">9串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="10c1"/>
                  <a href="javascript:void 0">10串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="11c1"/>
                  <a href="javascript:void 0">11串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="12c1"/>
                  <a href="javascript:void 0">12串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="13c1"/>
                  <a href="javascript:void 0">13串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="14c1"/>
                  <a href="javascript:void 0">14串1</a></li>
            <li style="display:none">
                  <input type="checkbox" value="15c1"/>
                  <a href="javascript:void 0">15串1</a></li>
            <div class="clear"></div>
           
          </ul>
            </div>
        <div class="fs_bor"></div>
        <div class="fs_sj"></div>
      </div>
        </div>
    <div class="tijiao_r fl">
          <div class="tijiao_rl fl">
        <div class="beishu">倍数：</div>
        <span fr><a href="javascript:void 0" class="jian" id="subMBtnId">-</a>
            <input type="text"class="t_text" value="1" id="multipleId">
            <a href="javascript:void 0" class="jia" id="addMBtnId">+</a></span>
        <div class="clear"></div>
      </div>
          <div class="jiangjin_b fl">
        <p>奖金：<span id="lowestBonusId">0</span>～<span id="highestBonusId">0</span></p>
        <p>金额：<span id="betMoneyId">0</span>元</p>
      </div>
          <div class="tijiao_rc fl">  
          <c:if test="${ p == 'spf' }">
          <a href="javascript:void 0" id="filterBtnId">在线过滤</a> 
          </c:if>
          </div>
          <div class="tijiao_rr fr"> <a href="javascript:void 0" class="quer" id="lotteryFormBtnId">确认提交</a><!--<a href="#" class="sqhm">发起合买</a>--></div>
          <div class="clear"></div>
        </div>
    <div class="clear"></div>
  </div>
    </div>
<!--悬浮栏结束-->
<jsp:include page="../lotteryForm.jsp"></jsp:include>
