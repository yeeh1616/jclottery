<%@ page language="java" pageEncoding="UTF-8"%>

<div class="biao_foot">
              <div class="bi_1 fl">
                  <p class="gg">共选择<b id="teamNumId">0</b>队，<b id="betNumId">0</b>注
             </div>
             <div class="fuzhi fl" style="position:relative;">
                <p class="text2_2" >
                          <span class="fl fo_2">投注倍数:<i><img src="/images/jj.png" id="subMBtnId"  style="margin-left:4px; float:left;"/><input type="text" value="1" id="multipleId"/><img id="addMBtnId" src="/images/jj-02.png"/></i></span>
                          <span class="fl fo_3">金额<b id="betMoneyId">0</b>元</span>
                      <span class="fl fo_3 fo_31">理论最高奖金<b id="highestBonusId">0</b>元</span>
                      
                </p>
             </div>
             <p class="fr tijiao" id="lotteryFormBtnId"><button>提交</button></p>
        </div>
<jsp:include page="../lotteryForm.jsp"></jsp:include>
