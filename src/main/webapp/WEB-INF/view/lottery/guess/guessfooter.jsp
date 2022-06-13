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
           <c:if test="${fn:indexOf(p,'dg') > -1}">
            <a href="javascript:void 0" >
            <input type="checkbox" checked disabled value="2000c1" id="dgFalgId"/>
            	单关</a>
            </c:if>
            <c:if test="${fn:indexOf(p,'hhgg') > -1 && licenseId == 9}">
            <a href="javascript:void 0" style="display:none" id="dgFalgId">
            <input type="checkbox"  value="1c1" />
            	单关</a>
            </c:if>
            <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="2c1"/>
            2串1</a> <a href="javascript:void 0" style="display:none">
            <input type="checkbox" value="3c1"/>
            3串1</a> <a href="javascript:void 0" style="display:none">
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
                  <input type="checkbox" value="3c3"/>
                  <a href="javascript:void 0">3串3</a></li>
            <li style="display:none">
                  <input type="checkbox" value="3c4"/>
                  <a href="javascript:void 0">3串4</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="4c4"/>
                  <a href="javascript:void 0">4串4</a></li>
            <li style="display:none">
                  <input type="checkbox" value="4c5"/>
                  <a href="javascript:void 0">4串5</a></li>
            <li style="display:none">
                  <input type="checkbox" value="4c6"/>
                  <a href="javascript:void 0">4串6</a></li>
            <li style="display:none">
                  <input type="checkbox" value="4c11"/>
                  <a href="javascript:void 0">4串11</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="5c5"/>
                  <a href="javascript:void 0">5串5</a></li>
            <li style="display:none">
            <li style="display:none">
                  <input type="checkbox" value="5c6"/>
                  <a href="javascript:void 0">5串6</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c10"/>
                  <a href="javascript:void 0">5串10</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c16"/>
                  <a href="javascript:void 0">5串16</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c20"/>
                  <a href="javascript:void 0">5串20</a></li>
            <li style="display:none">
                  <input type="checkbox" value="5c26"/>
                  <a href="javascript:void 0">5串26</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="6c6"/>
                  <a href="javascript:void 0">6串6</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c7"/>
                  <a href="javascript:void 0">6串7</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c15"/>
                  <a href="javascript:void 0">6串15</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c20"/>
                  <a href="javascript:void 0">6串20</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c22"/>
                  <a href="javascript:void 0">6串22</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c35"/>
                  <a href="javascript:void 0">6串35</a></li>
            <li style="display:none">
            <input type="checkbox" value="6c42"/>
            <a href="javascript:void 0">6串42</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c50"/>
                  <a href="javascript:void 0">6串50</a></li>
            <li style="display:none">
                  <input type="checkbox" value="6c57"/>
                  <a href="javascript:void 0">6串57</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="7c7"/>
                  <a href="javascript:void 0">7串7</a></li>
            <li style="display:none">
                  <input type="checkbox" value="7c8"/>
                  <a href="javascript:void 0">7串8</a></li>
            <li style="display:none">
                  <input type="checkbox" value="7c21"/>
                  <a href="javascript:void 0">7串21</a></li>
            <li style="display:none">
                  <input type="checkbox" value="7c35"/>
                  <a href="javascript:void 0">7串35</a></li>
            <li style="display:none">
                  <input type="checkbox" value="7c120"/>
                  <a href="javascript:void 0">7串120</a></li>
            <div class="clear"></div>
            <li style="display:none">
                  <input type="checkbox" value="8c8"/>
                  <a href="javascript:void 0">8串8</a></li>
            <li style="display:none">
                  <input type="checkbox" value="8c9"/>
                  <a href="javascript:void 0">8串9</a></li>
            <li style="display:none">
                  <input type="checkbox" value="8c28"/>
                  <a href="javascript:void 0">8串28</a></li>
            <li style="display:none">
                  <input type="checkbox" value="8c56"/>
                  <a href="javascript:void 0">8串56</a></li>
            <li style="display:none">
                  <input type="checkbox" value="8c70"/>
                  <a href="javascript:void 0">8串70</a></li>
            <li style="display:none">
                  <input type="checkbox" value="8c247"/>
                  <a href="javascript:void 0">8串247</a></li>
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
      	  <c:if test="${fn:indexOf(p,'fssc') == -1 }">
          <div class="tijiao_rc fl"> <a href="javascript:void 0" id="bonusBtnId">奖金优化</a> 
          <a href="javascript:void 0" id="filterBtnId">在线过滤</a> 
          </div>
          <div class="tijiao_rr fr"> <a href="javascript:void 0" class="quer" id="lotteryFormBtnId">确认提交</a><!--<a href="#" class="sqhm">发起合买</a>--></div>
          <div class="clear"></div>
          </c:if>
          <c:if test="${fn:indexOf(p,'fssc') > -1 }">
          <div class="tijiao_rc fl"> <a href="javascript:void 0" id="fsscBonusBtnId">奖金优化</a> </div>
          <div class="tijiao_rr fr"> <a href="javascript:void 0" class="quer" id="fsscBtnId">确认提交</a></div>
          <div class="clear"></div>
          </c:if>
        </div>
    <div class="clear"></div>
  </div>
    </div>
<!--悬浮栏结束-->
<jsp:include page="../lotteryForm.jsp"></jsp:include>
