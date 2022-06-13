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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />

		<%@include file="../include/titlePage.jsp"%>
	</head>
	<body>
		<jsp:include page="../include/header.jsp"></jsp:include>
<div class="ben_pic">

		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">

					<h1>
						胜平负单式标准格式介绍
					</h1>

					<h2>
						标准格式要求：
					</h2>
					<p>
						1、只接受后缀名为“.txt”的记事本文本文档。
					</p>
					<p>
						2、一行一注。
					</p>
					<p>
						3、支持逗号、空格、横杠进行分隔，不投的场次用*或者#占位（仅支持*和#）。
					</p>
					<p>
						4、逗号、空格、横杠均为半角格式下。
					</p>
					<p>
						5、支持两种（冒号、箭头）带场次编号的格式。（用500.com在线过滤或过滤软件过滤后的单注，将默认带场次编号。）
					</p>
					<h2>
						标准格式如下：
					</h2>
					<strong>（3代表胜，1代表平，0代表负） </strong>
					<br />
					<p>
						<strong>不带场次</strong>
						<br />
						3,3,1,0,3,1
						<br />
						3-3-1-0-3-1
						<br />
						331303
						<br />
						3 3 1 0 3 1
						<br />
						3,3,1,*,0,3,*,*,1,*,*
						<br />
						331#03##1
					</p>
					<p>
						<strong>带场次</strong>
						<br />
						1001:[3]/1002:[3]/1003:[1]/1004:[0]/1005:[3]/1006:[1]
						<br />
						1001→3,1002→3,1003→1,1004→0,1005→3,1006→1
						<br />
						<span style="color: red">（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）</span>
						<br />
					</p>
					<h2>
						具体实例说明：
					</h2>
					<h2>
						1、普通过关
					</h2>
					<p>
						<strong>例如：选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择6串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						3,3,1,0,3,1
						<br />
						3-3-1-0-3-1
						<br />
						331031
						<br />
						3 3 1 0 3 1
					</p>
					<p>
						格式二、
						<br />
						3,3,1,*,0,3,*,*,1,*,*
						<br />
						<span style="color: red">（说明：*为占位符，6场比赛必须且只能上传6个数字，程序自动过滤*和空格）</span>
						<br />
					</p>
					<p></p>
					格式三、
					<br />
					3,3,1,0,3,1,3,3
					<br />
					<span style="color: red">（说明：前面6个数字对应第1-6场比赛，后面的数字程序将做截断处理）</span>
					<br />
					格式四、
					<br />
					1001:[3]/1002:[3]/ 1003:[1]/ 1004:[0]/ 1005:[3]/ 1006:[1]
					<br />
					1001→3, 1002→3, 1003→1, 1004→0, 1005→3, 1006→1
					<br />
					<span style="color: red">（说明：冒号或箭头前面的数字表示场次编号，后面中括号里面的数字表示投注选项）</span>
					<br />
					<strong>以上文本格式方案对应为：</strong><strong> </strong>
					<br />
					<strong>1001</strong><strong>→3，1002→3，1003→1，1004→0，1005→3，1006→1</strong><strong>
					</strong>
					<h2>
						2、组合过关
					</h2>
					<p>
						<strong>选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						3,1,*,0,*,*
						<br />
						*,*,1,0,*,3
						<br />
						<strong>以上文本格式方案对应为： </strong>
						<br />
						<strong>1001</strong><strong>→3，1002→1，1004→0</strong>
						<br />
						<strong>1003</strong><strong>→</strong><strong>1</strong><strong>，1004→0，1006→3</strong>
						<br />
						<span style="color: red">（说明：
							*为占位符，选择6场比赛必须且只能上传6个字符&lt;含占位符&gt;；选择3串1，310的个数必须且只能是3个，310的位数将对应场次位数）</span>
					</p>
					<p>
						格式二、
						<br />
						3-3-1-0-3-1
						<br />
						331031
						<br />
						3 3 1 0 3 1
						<br />
						<strong>以上文本格式方案为：</strong><strong>对6场比赛做3串1的组合，组合成20注3串1</strong>
						<br />
						<span style="color: red">（说明：不能含有字符*和#）</span>
					</p>
					<h2>
						&nbsp;
					</h2>

				</div>
			</div>
		</div>


		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">
					<h1>
						比分单式标准格式介绍
					</h1>

					<h2>
						一、标准格式要求
					</h2>
					<p>
						1、只接受后缀名为“.txt”的记事本文本文档。
						<br />
						2、一行一注。
						<br />
						3、支持逗号、空格、横杠进行分隔，不投的场次用**或者##占位（仅支持**和##）。
						<br />
						4、逗号、空格、横杠均为半角格式下。
						<br />
						5、支持两种（冒号、箭头）带场次编号的格式。（用500.com在线过滤或过滤软件过滤后的单注，将默认带场次编号。）
					</p>
					<h2>
						二、标准格式
					</h2>
					<p>
						<strong>（31代表3：1，3A代表胜其他，1A代表平其他，0A代表负其他）<br /> 不带场次 </strong>
						<br />
						11,31,30
						<br />
						11-31-30
						<br />
						113130
						<br />
						11 31 30
						<br />
						11,31,30,**,**,**
						<br />
						11##31######30##
						<br />
						<br />
						<strong> 带场次</strong>
						<br />
						1001:[11]/1002:[31]/1003:[30]
						<br />
						1001→11,1002→31,1003→30
						<br />
						<span style="color: red">（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）</span>
					</p>
					<h2>
						三、具体实例说明
					</h2>
					<h2>
						1、普通过关
					</h2>
					<p>
						<strong>例如：选择3场比赛</strong><strong>（场次编号为周一001、周一002、周一003）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						11,31,30
						<br />
						11-31-30
						<br />
						113130
						<br />
						11 31 30
					</p>
					<p>
						格式二、
						<br />
						11,31,30,**,**,**
						<br />
						<span style="color: red">（说明：**为占位符，3场比赛必须且只能上传3组6个数字，程序自动过滤**和空格）</span>
					</p>
					<p>
						格式三、
						<br />
						11,31,30,31,31
						<br />
						<span style="color: red">（说明：前面3组数字对应第1-3场比赛，后面的数字程序将做截断处理）</span>
						<br />
					</p>
					<p>
						格式四
						<br />
						1001:[11]/1002:[31]/1003:[30]
						<br />
						1001→11,1002→31,1003→30
						<br />
						<span style="color: red">（说明：冒号或箭头前面的数字表示场次编号，后面的数字表示投注选项）</span>
						<br />
					</p>
					<p>
						<strong>以上文本格式方案对应为：</strong><strong> </strong>
						<br />
						<strong>1001</strong><strong>→1：1，1002→3：1，1003→3：0 </strong><strong>
						</strong>
					</p>
					<h2>
						2、组合过关
					</h2>
					<p>
						<strong>选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						31,12,**,04,**,**
						<br />
						**,**,31,20,**,32
						<br />
						<strong>以上文本格式方案对应为： </strong>
						<br />
						<strong>1001</strong><strong>→3：1，1002→1：2，1004→0：4</strong>
						<br />
						<strong>1003</strong><strong>→3：</strong><strong>1</strong><strong>，1004→2：0，1006→3：2</strong>
						<br />
						<span style="color: red">（说明：
							**为占位符代替1组数字，上传的数字个数必须是场次数的2倍，一组数字位置对应场次位置）</span>
					</p>
					<p>
						格式二、
						<br />
						11,31,30,12,14,24
						<br />
						11-31-30-12-14-24
						<br />
						113130121424
						<br />
						11 31 30 12 14 24
						<br />
						<strong>以上文本格式方案为：</strong><strong>对6场比赛做3串1的组合，组合成20注3串1</strong>
						<br />
						<span style="color: red">（说明：不能含有字符**和##）</span>
					</p>

				</div>
			</div>
		</div>



		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">
					<h1>
						总进球数单式标准格式介绍
					</h1>

					<h2>
						一、标准格式要求
					</h2>
					<p>
						1、只接受后缀名为“.txt”的记事本文本文档。
						<br />
						2、一行一注。
						<br />
						3、支持逗号、空格、横杠进行分隔，不投的场次用*或者#占位（仅支持*和#）。
						<br />
						4、逗号、空格、横杠均为半角格式下。
						<br />
						5、支持两种（冒号、箭头）带场次编号的格式。（用500.com在线过滤或过滤软件过滤后的单注，将默认带场次编号。）
					</p>
					<h2>
						二、标准格式如下
					</h2>
					<p>
						<strong>（0-7代表进球数0-7个） </strong>
						<br />
						<br />
						<strong>不带场次</strong>
						<br />
						0,1,2,4,5,6
						<br />
						0-1-2-4-5-6
						<br />
						012456
						<br />
						0 1 2 4 5 6
						<br />
						0,1,2,*,4,5,*,*,6
						<br />
						<br />

						<strong>带场次</strong>
						<br />
						1001:[0]/1002:[1]/1003:[2]/1004:[4]/1005:[5]/1006:[6]
						<br />
						1001→0,1002→1,1003→2,1004→4,1005→5,1006→6
						<br />
						<span style="color: red">（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）</span>
					</p>
					<br />
					<h2>
						三、具体实例说明：
					</h2>
					<h2>
						1、普通过关
					</h2>
					<p>
						<strong>例如：选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择6串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						0,1,2,4,5,6
						<br />
						0-1-2-4-5-6
						<br />
						012456
						<br />
						0 1 2 4 5 6
						<br />
					</p>
					<p>
						格式二、
						<br />
						0,1,2,*,4,5,*,*,6,*,*
						<br />
						<span style="color: red">（说明：*为占位符，6场比赛必须且只能上传6个数字，程序自动过滤*和空格）</span>
					</p>
					<p>
						格式三、
						<br />
						0,1,2,4,5,6,3,3
						<br />
						<span style="color: red">（说明：前面6个数字对应第1-6场比赛，后面的数字程序将做截断处理）</span>
					</p>
					<p>
						格式四
						<br />
						1001:[0]/1002:[1]/1003:[2]/1004:[4]/1005:[5]/1006:[6]
						<br />
						1001→0,1002→1,1003→2,1004→4,1005→5,1006→6
						<br />
						<span style="color: red">（说明：冒号或箭头前面的数字表示场次编号，后面的数字表示投注选项）</span>
					</p>

					<strong>以上文本格式方案对应为：</strong><strong> </strong>
					<br />
					<strong>1001</strong><strong>→0，1002→1，1003→2，1004→4，1005→5，1006→6
					</strong><strong> </strong>
					</p>
					<h2>
						2、组合过关
					</h2>
					<p>
						<strong>选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						4,5,*,6,*,*
						<br />
						*,*,3,5,*,7
						<br />
						<strong>以上文本格式方案对应为： </strong>
						<br />
						<strong>1001</strong><strong>→4，1002→5，1004→6</strong>
						<br />
						<strong>1003</strong><strong>→</strong><strong>3</strong><strong>，1004→5，1006→7</strong>
						<br />
						<span style="color: red">（说明：
							*为占位符，选择6场比赛必须且只能上传6个字符&lt;含占位符&gt;；选择3串1，数字的个数必须且只能是3个，数字的位数将对应场次位数）</span>
					</p>
					<p>
						格式二、
						<br />
						0,1,2,4,5,6
						<br />
						0-1-2-4-5-6
						<br />
						012456
						<br />
						0 1 2 4 5 6
						<br />
						<strong>以上文本格式方案为：</strong><strong>对6场比赛做3串1的组合，组合成20注3串1</strong>
						<br />
						<span style="color: red">（说明：不能含有字符*和#）</span>
					</p>

				</div>
			</div>
		</div>


		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">

					<h1>
						半全场单式标准格式介绍
					</h1>

					<h2>
						一、标准格式要求
					</h2>
					<p>
						1、只接受后缀名为“.txt”的记事本文本文档。
						<br />
						2、一行一注。
						<br />
						3、支持逗号、空格、横杠进行分隔，不投的场次用*或者#占位（仅支持*和#）。
						<br />
						4、逗号、空格、横杠均为半角格式下。
						<br />
						5、支持两种（冒号、箭头）带场次编号的格式。（用500.com在线过滤或过滤软件过滤后的单注，将默认带场次编号。）
					</p>
					<h2>
						二、标准格式如下：
					</h2>
					<p>
						<strong>（前面1位代表半场赛果，后面1位代表全场赛果，11代表半平-全平）<br />
							<br /> 不带场次 </strong>
						<br />
						11,31,30,13,33,30
						<br />
						11-31-30-13-33-30
						<br />
						113130133330
						<br />
						11 31 30 13 33 30
						<br />
						11,31,30,**,13,33,**,**,30,**,**
						<br />
						113130##1333####30
						<br />
						<br />
						<strong> 带场次</strong>
						<br />
						1001:[11]/1002:[31]/1003:[30]/1004:[13]/1005:[33]/1006:[30]
						<br />
						1001→11,1002→31,1003→30,1004→13,1005→33,1006→30
						<br />
						<span style="color: red">（说明：1001代表场次编号周一001，2001代表场次编号周二001，依次类推…）</span>
					</p>
					<h2>
						三、具体实例说明：
					</h2>
					<h2>
						1、普通过关
					</h2>
					<p>
						<strong>例如：选择3场比赛</strong><strong>（场次编号为周一001、周一002、周一003）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						11,31,30
						<br />
						11-31-30
						<br />
						113130
						<br />
						11 31 30
						<br />
					</p>
					<p>
						格式二、
						<br />
						11,31,**,13,**,**
						<br />
						<span style="color: red">（说明：**为占位符，3场比赛必须且只能上传3组6个数字，程序自动过滤**和空格）</span>
						<br />
					</p>
					<p>
						格式三、
						<br />
						11,31,30
						<br />
						<span style="color: red">（说明：前面3组数字对应第1-3场比赛，后面的数字程序将做截断处理）</span>
						<br />
					</p>
					<p>
						格式四
						<br />
						1001:[11]/1002:[31]/1003:[30]
						<br />
						1001→11,1002→31,1003→30
						<br />
						<span style="color: red">（说明：冒号或箭头前面的数字表示场次编号，后面的数字表示投注选项）</span>
						<br />
					</p>
					<p>
						<strong>以上文本格式方案对应为：</strong>
						<br />
						<strong>1001</strong><strong>→平-平，1002→胜-平，1003→胜-负</strong>
					</p>

					<h2>
						2、组合过关
					</h2>
					<p>
						<strong>选择6场比赛</strong><strong>（场次编号为周一001、周一002、周一003、周一004、周一005、周一006）</strong><strong>，选择3串1的过关方式，用户可以上传以下几种格式：
						</strong>
						<br />
						格式一、
						<br />
						31,13,**,00,**,**
						<br />
						**,**,31,30,**,10
						<br />
						<strong>以上文本格式方案对应为： </strong>
						<br />
						<strong>1001</strong><strong>→胜-平，1002→负-胜，1004→负-负 </strong>
						<br />
						<strong>1003</strong><strong>→胜-平</strong><strong>，1004→胜-负，1006→平-负
						</strong>
						<br />
						<span style="color: red">（说明：
							**为占位符代替1组数字，上传的数字个数必须是场次数的2倍，一组数字位置对应场次位置）</span>
					</p>
					<p>
						格式二、
						<br />
						11,31,30,13,33,30
						<br />
						11-31-30-13-33-30
						<br />
						113130133330
						<br />
						11 31 30 13 33 30
						<br />
						<strong>以上文本格式方案为：</strong><strong>对6场比赛做3串1的组合，组合成20注3串1</strong>
						<br />
						<span style="color: red">（说明：不能含有字符**和##）</span>
					</p>



				</div>
			</div>
		</div>
   </div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>