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
						胜负/让分胜负单式标准格式介绍
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
						3、逗号、空格、横杠均为半角格式下。
					</p>
					<h2>
						标准格式如下：
					</h2>
					<strong>（3代表主胜，0代表客胜） </strong>
					<br />
					<p>
						<strong>不带场次</strong>
						<br />
						3,3,0,0,3,0
						<br />
						3-3-0-0-3-0
						<br />
						330303
						<br />
						3 3 0 0 3 0
					</p>
				</div>
			</div>
		</div>
		
		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">

					<h1>
						大小分单式标准格式介绍
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
						3、逗号、空格、横杠均为半角格式下。
					</p>
					<h2>
						标准格式如下：
					</h2>
					<strong>（0代表大分，1代表小分） </strong>
					<br />
					<p>
						<strong>不带场次</strong>
						<br />
						1,1,0,0,1,0
						<br />
						1-1-0-0-1-0
						<br />
						110101
						<br />
						1 1 0 0 1 0
					</p>
				</div>
			</div>
		</div>


		<div class="wrap">
			<div class="guoguan_right" style="float: inherit; margin: 15px;">
				<div class="box02">
					<h1>
						胜分差单式标准格式介绍
					</h1>

					<h2>
						一、标准格式要求
					</h2>
					<p>
						1、只接受后缀名为“.txt”的记事本文本文档。
						<br />
						2、一行一注。
						<br />
						3、逗号、空格、横杠均为半角格式下。
					</p>
					<h2>
						二、标准格式
					</h2>
					<p>
						<strong>（01代表客胜1-5，02代表客胜6-10，03代表客胜11-15，04代表客胜16-20，
						05代表客胜21-25，06代表客胜26+，11代表主胜1-5，12代表主胜6-10，13代表主胜11-15，14代表主胜16-20，
						15代表主胜21-25，16代表主胜26+）<br /> 不带场次 </strong>
						<br />
						11,01,12
						<br />
						11-01-12
						<br />
						110112
						<br />
						11 01 12
						
					</p>
				</div>
			</div>
		</div>
		
   </div>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>