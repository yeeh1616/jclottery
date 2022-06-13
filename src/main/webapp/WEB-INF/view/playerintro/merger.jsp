<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld"
	prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:set var="pageName" value="合买帮助" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link type="text/css" rel="stylesheet" href="/cytxhome/css/hemai.css"/>
</head>
<body>
<jsp:include page="../include/cytxlevel2header.jsp"></jsp:include>
<div class="hm_t common_w">

</div>
<div class="hm_c common_w">
<h1>什么是合买？ </h1>
<p>指由两个或两个以上的个人共同出资购买彩票，包括1个方案发起人和众多的合买参与人。</p>
<p>本平台合买方案默认规定每份彩票1元，参与者根据自身的意愿认购至少一份以上的彩票，合买方案进度达到100%，方案成功。</p>
<p>这种利用募集资金的合买方式能用小资金共同购买大额彩票，降低个人全购高金额彩票的风险。</p>
<h1>如何发起合买？</h1>
<p>1、登录凤凰微彩平台，选择您要发起合买的彩种和玩法；</p>
<p>2、选填您要投注的方案内容，点击“发起合买”，进入合买方案页面； </p>
<p>3、填写发起方案的相关信息，包括“方案描述、认购份数、是否保底、提成比例、保密类型”等，确认无误；发起人最低认购1份。</p>
<p>4、用户确认发起方案信息，点击"确认投注"，方案发起成功。</p>
<h1>如何参与合买？</h1>
<p>1、进入合买中心，在合买列表选择热门方案，可直接输入认购份数进行认购；</p>
<p>2、也在合买列表点击“详情”，进入方案详情页查看后，输入认购份数点击“确认投注”。</p>
<h1>什么是方案保底？</h1>
<p>方案发起人承诺在合买截止时，如果方案还没有满员，发起人再投入先前承诺的资金以最大限度满足方案成交。</p>
<p>具体可分为三种情况：</p>
<p>1、如果保底资金正好等于未满员所缺资金，方案发起成功，无需返还；</p>
<p>2、如果保底资金大于未满员所缺资金，方案发起成功；系统将返还多余的保底金额到发起人的支付账户；</p>
<p>3、如果保底资金小于未满员所缺资金，合买方案流单，保底资金将全部返还到发起人的支付账户。 </p>
<p>比如：一个100元的合买方案，保底40，彩票销售截止时，</p>
<p>如果参与合买总金额为60，因为保底40，所以60+40=100，正好合买成功；</p>
<p>如果参与合买总金额为80，离方案满员差20（100-80=20），所以必须动用保底40元中的20元，方案成功，保底剩下20元退回发起人账户；</p>
<p>如果参与合买总金额≤40，则参与金额加上保底40都不满100元，所以合买失败。</p>
<h1>什么叫方案提成？ </h1>
<p>合买提成比例由发起人自定义设置，所有彩种的合买均可设置0-10%的提成比例；</p>
<p>提成金额计算公式：提成金额=（税后奖金-方案本金）×提成比例</p>
<p>合买方案在盈利的情况下，发起人有中奖提成；</p>
<p>合买方案不盈利，发起人无中奖提成。</p>
<p>示例：</p>
<p>方案金额：1000元；税后奖金：2000元；</p>
<p>提成比例：5%；提成金额：(2000-1000)*5%=50元</p>
<p>提成条件判断：2000-50>1000元</p>
<p>实际提成：50元</p>
<h1>什么是方案保密？</h1>
<p>网站为了满足用户多样化需求，尊重用户的劳动成果，保障用户的隐私权，提供了方案保密的功能选择。</p>
<p>用户自购方案，为永久保密方案，只有发起人自己可以查看方案内容。</p>
<p>用户发起合买方案时，可以有以下几种选择：</p>
<p>1. 完全公开：指方案一旦上传，任何会员都能查看合买详情，即方案不保密；</p>
<p>2. 截止后公开：指方案只有在官方截止后，其他会员才能查看合买详情；</p>
<p>3. 仅对跟单者公开：指方案上传后，只有参与了该方案合买的会员才能查看合买详情；</p>
<p>4. 永久保密：指方案在官方截止后，任何会员都不能查看合买详情。</p>
<h1>方案的保密类型，发起之后可以修改吗？</h1>
<p>方案保密状态只有在方案发起时能够设置，方案一经发起就不能进行修改。</p>
<h1>合买中奖如何分配？</h1>
<p>合买中奖后，若方案不盈利(即税后奖金小于方案本金)，税后奖金将按参与份额比例分配到该方案的各参与会员账户中；</p>
<p>若方案盈利(即税后奖金大于方案本金)，则发起人先提成税后奖金减去方案本金后金额的x％作为方案制作佣金，余下奖金将按参与份额比例分配到该方案的各参与用户账户中。彩票平台不收取任何佣金或者手续费。</p>
<h1>教你方案尽快满员？</h1>
<p>1、尽早发起合买方案，合买发起的时间越早，留给跟单者的时间越长，越容易满员。</p>
<p>2、在你发起合买方案的时候，别忘了添加方案描述，宣传合买、引导彩民跟单。方案描述是你展示实力和做单技巧、对合买方案信心指数的重要表现，是吸引更多人关注，让更多彩民跟单的关键所在。 </p>
<p>3、提高自购份额：跟单者从方案发起人自购份额的多少可以看到发起人对该方案的信心指数。发起人自购1%和自购80%，信心指数明显不一样;</p>
<p>4、有保底：所谓保底，就是方案发起人为保证合买方案成功出票而设置的保障，有保底，更容易使方案成功满员，提高彩民跟单的信心指数。</p>
<p>5、凤凰微彩彩票平台在首页以及各彩种合买列表显示位置会推荐一些合买名人，合买名人的方案会较容易满员。</p>
<p>6、合买方案发起后，用户可以去彩票QQ群、百度帖吧等地方，拉人气参与跟单合买！ </p>
<h1>发起人发错合买方案如何处理？</h1>
<p>发起人在发现合买方案错误之后，可以及时联系在线客服或者致电给网站客服。如果方案进度未到50%，可以将发起人的用户名、彩种、玩法、方案编号并提供身份证明给客服人员，工作人员收到后可以及时的为用户做撤单处理。</p>
<p>进度超过50%（含）、已出票或出票中的方案，是无法做撤单处理的。</p>
<h1>满员的方案为何会被撤单？</h1>
<p>1、如果体彩中心临时更换足彩对阵，网站将对已上传的方案的满员合买方案做撤单处理。</p>
<p>2、由于不可抗力（如机房停电、断网），无法提交数据到彩票中心，导致出票失败，网站将对已上传方案内容的满员方案做撤单处理。</p>
<h1>什么是方案流单？</h1>
<p>方案流单指合买方案在该期截止后，方案进度＋发起人保底未能促使方案满员，则该方案自动流单，即未能合买成功。</p>
<h1>方案流单后怎么办？</h1>
<p>方案流单后，系统自动将合买发起人的保底资金和认购金额、各合买跟单人的认购金额返还至用户的帐户中。 </p>
</div>

<jsp:include page="../include/cytxfooter.jsp"></jsp:include>
</body>
</html>