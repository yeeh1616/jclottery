/**
 * <p>Desc:大乐透过滤</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2016/4/25 Version 1.0
 */
function DltFilter() {
	
	var CONF_BF_AC = 1; // 前区AC值，0-9。
	var CONF_BF_FIRST_JO = 2;	// 前区首位号码的奇偶值  奇数 偶数 不限
	var CONF_BF_LAST_JO = 3;	// 前区末位号码的奇偶值  奇数 偶数 不限
	var CONF_BF_ADD_VAL = 4;	// 前区和值范围
	var CONF_BF_JO_PRO = 5;		// 前区奇偶比0:5 1:4 2:3 3:2 4:1 5:0
	var CONF_BF_DX_PRO = 6;		// 前区大小比0:5 1:4 2:3 3:2 4:1 5:0(约定16以上为大)
	var CONF_BF_ZH_PRO = 7;		// 前区质合比0:5 1:4 2:3 3:2 4:1 5:0
	var CONF_BF_LH = 8;			// 前区连号 无连号 1连号 2连号 3连号 4连号 5连号
	var CONF_BF_LNNO = 9;		// 每注中尾数不相同的投注号码 ： 2 3 4 5
	
	
	var CONF_AF_FIRST_JO = 21;	// 后区首位号码的奇偶值  奇数 偶数 不限
	var CONF_AF_LAST_JO = 22;	// 后区末位号码的奇偶值  奇数 偶数 不限
	var CONF_AF_ADD_VAL = 23;	// 后区和值范围
	var CONF_AF_JO_PRO = 24;		// 后边区奇偶比0:2 1:1 2:0
	var CONF_AF_DX_PRO = 25;		// 后区大小比 0:2 1:1 2:0
	var CONF_AF_ZH_PRO = 26;		// 后区质合比 0:2 1:1 2:0
	var CONF_AF_LH = 27;			// 后区连号  无连号 1连号 2连号
	
	var comb = new CombAlgorithm();
	
	this.soureNum = 0; // 原始注数
	
	/**
	 * 过滤方法
	 * @param betCode,投注号码，先转换单式号码数组
	 * @param expressions,Expression对象,过滤条件数组,格式：1<base1<2
	 */
	this.shrink = function(betCode, expressions){
		var beforeList = this.toBfDsCode(betCode);
		var afterList = this.toAfDsCode(betCode);
		this.soureNum = beforeList.length * afterList.length;
		for ( var i = 0; i < expressions.length; i++ ) {
			switch ( expressions[i].type ) {
			case CONF_BF_AC:
				beforeList = this.ac(beforeList, expressions[i].expr);
				break;
			case CONF_BF_FIRST_JO:
				beforeList = this.even(beforeList, expressions[i].expr, true);
				break;
			case CONF_BF_LAST_JO:
				beforeList = this.even(beforeList, expressions[i].expr, false);
				break;
			case CONF_BF_ADD_VAL:
				beforeList = this.addVal(beforeList, expressions[i].expr);
				break;
			case CONF_BF_JO_PRO:
				beforeList = this.evenPro(beforeList, expressions[i].expr);
				break;
			case CONF_BF_DX_PRO:
				beforeList = this.sizePro(beforeList, expressions[i].expr, 17);
				break;
			case CONF_BF_ZH_PRO:
				beforeList = this.prizePro(beforeList, expressions[i].expr);
				break;
			case CONF_BF_LH:
				beforeList = this.lh(beforeList, expressions[i].expr);
				break;
			case CONF_BF_LNNO:
				beforeList = this.w(beforeList, expressions[i].expr);
				break;
				
			case CONF_AF_FIRST_JO:
				afterList = this.even(afterList, expressions[i].expr, true);
				break;
			case CONF_AF_LAST_JO:
				afterList = this.even(afterList, expressions[i].expr, false);
				break;
			case CONF_AF_ADD_VAL:
				afterList = this.addVal(afterList, expressions[i].expr);
				break;
			case CONF_AF_JO_PRO:
				afterList = this.evenPro(afterList, expressions[i].expr);
				break;
			case CONF_AF_DX_PRO:
				afterList = this.sizePro(afterList, expressions[i].expr, 6);
				break;
			case CONF_AF_ZH_PRO:
				afterList = this.prizePro(afterList, expressions[i].expr);
				break;
			case CONF_AF_LH:
				afterList = this.lh(afterList, expressions[i].expr);
				break;
			}
		}
		return this.createList(beforeList, afterList);
	}
	
	/**
	 * 一组单式号码
	 */
	this.createList = function(beforeList, afterList) {
		var list = new Array();
		for ( var i = 0 ; i < beforeList.length; i++ ) {
			for ( var j = 0; j < afterList.length; j++ ) {
				list.push(beforeList[i] + "+" + afterList[j]);
			}
		}
		return list;
	}
	
	/**
	 * 前区转换成单式号码，过滤之前调用
	 */
	this.toBfDsCode = function(betCode) {
		var bfAndAf = betCode.split("+");
		var array = comb.findQlcSingComb(bfAndAf[0], 5);
		return array;
	}
	
	/**
	 * 后区转换成单式号码，过滤之前调用
	 */
	this.toAfDsCode = function(betCode) {
		var bfAndAf = betCode.split("+");
		var array = comb.findQlcSingComb(bfAndAf[1], 2);
		return array;
	}
	
	/**
	 * AC过滤，AC值为0-9，逗号分隔
	 * AC值，即每两个号码值间差值的个数（相同差值只计作一个），它在一定程度上反映了号码的离散性。
	 * AC值表统计了指定分析范围内每期开奖号码的AC值及每种AC值出现的期数。
	 * 如:开奖号码:01-06-14-23-25-32-33 共有差值18个(差值8、9、19重复)，所以AC值=18
	 * 
	 * C值：AC值其实就是算术复杂性，是指一组号码组合中任意两个数字的不同正数差值的总数减去“选出数-1”的值。如“M选N”玩法中，N就是“选出数”。 
	 * 我们以“超级大乐透”前区35选5为例说明AC值的计算方法。如某期开出04、07、11、19、23，“选出数”为5，将这5个号码相减:[07-04=3]、
	 * [11-04=7]、[19-04=15]、[23-04=19]、[11-07=4]、[19-07=12]……如此类推，一共得出10个差值，当差值相同时只取一组，
	 * 在这组数字中有7个不同差值。根据AC值的方程式，AC值为7-(5-1)=3。AC值是判断所选号码是否符合理论，如选择一组号码，通过AC值分析这组号码是否有开出的可能。
	 * 所以，AC值在不同的“M选N”玩法中有不同的理论范围。经过大量的研究，发现35选5AC值理论值范围在0到7之间，但实际的AC值应选定在2到6之间。
	 * 如选取一组号码：02、03、04、05、06，这组号码只出现4个不同差值，它的AC值为4-(5-1)＝0，AC小于2，不合理论值的这组号码可以大胆撇除。
	 */
	this.ac = function(list, expression) {
		var retList = new Array();
		var exp = expression.split(",");
		for ( var i = 0; i < list.length; i++ ) {
			var calcA = comb.findQlcSingComb(list[i], 2);
			var acA = new Array(); // 存储AC值
			for ( var j = 0; j < calcA.length; j++ ) {
				var sp = calcA[j].split(",");
				sp.sort();
				var ac = parseInt(sp[1]) - parseInt(sp[0]);
				var ex = false;
				for ( var k = 0; k < acA.length; k++ ) {
					if ( acA[k] == ac ) {
						ex = true;
						break;
					}
				}
				if ( !ex ) {
					acA.push(ac);
				}
			}
			var acLen = acA.length - 4;
			var E = false;
			for ( var j = 0; j < exp.length; j++ ) {
				if ( parseInt(exp[j]) ==  acLen ) {
					E = true;
					break;
				}
			}
			if ( E ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 奇偶性判断
	 * @param expression,1-奇数，2-偶数，3-不限
	 */
	this.even = function(list, expression, first) {
		var retList = new Array();
		for ( var i = 0; i < list.length; i++ ) {
			var p = list[i].split(",");
			var num = parseInt(p[0]);
			if ( !first ) {
				num = parseInt(p[p.length-1]);
			}
			if ( expression == "1" ) {
				if ( this.isOddEven(num) ) {
					retList.push(list[i]);
				}
			} else if ( expression == "2" ) {
				if ( !this.isOddEven(num) ) {
					retList.push(list[i]);
				}
			} else {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 号码奇偶性
	 * return true-奇
	 */
	this.isOddEven = function(num) {
		return num%2 == 1;
	}
	
	/**
	 * 和值范围
	 * @param expression,格式：2<v<3
	 */
	this.addVal = function(list, expression) {
		var retList = new Array();
		
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var counter = 0;
			var codes = list[i].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				counter += parseInt(codes[j],10);
			}
			if ( parseInt(exp[0]) <= counter && parseInt(exp[2]) >= counter ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 奇偶比
	 * @param expression,格式：2<v<3
	 */
	this.evenPro = function(list, expression) {
		var retList = new Array();
		var exp = expression.split(":");
		for ( var i = 0; i < list.length; i++ ) {
			var even = 0;	// 奇数
			var odd = 0;	// 偶数
			var codes = list[i].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				if ( this.isOddEven(parseInt(codes[j])) ) {
					even++;
				} else {
					odd++;
				}
			}
			if ( parseInt(exp[0]) == even && parseInt(exp[1]) == odd ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 大小比
	 * @param expression,格式：2<v<3
	 */
	this.sizePro = function(list, expression, reference) {
		var retList = new Array();
		var exp = expression.split(":");
		for ( var i = 0; i < list.length; i++ ) {
			var even = 0;	// 大数
			var odd = 0;	// 小数
			var codes = list[i].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				if ( parseInt(codes[j]) > reference ) {
					even++;
				} else {
					odd++;
				}
			}
			if ( parseInt(exp[0]) == even && parseInt(exp[1]) == odd ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 质合比
	 * @param expression,格式：2<v<3
	 */
	this.prizePro = function(list, expression) {
		var retList = new Array();
		var exp = expression.split(":");
		for ( var i = 0; i < list.length; i++ ) {
			var even = 0;	// 质数
			var odd = 0;	// 合数
			var codes = list[i].split(",");
			for ( var j = 0; j < codes.length; j++ ) {
				if ( codes[j] == "02" || codes[j] == "03" || codes[j] == "05" || codes[j] == "07"
					|| codes[j] == "11" || codes[j] == "13" || codes[j] == "17" || codes[j] == "19" 
					|| codes[j] == "23" || codes[j] == "29" || codes[j] == "31") {
					even++;
				} else if (codes[j] != "01") {
					odd++;
				}
			}
			if ( parseInt(exp[0]) == even && parseInt(exp[1]) == odd ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 连号数
	 */
	this.lh = function(list, expression) {
		var retList = new Array();
		var exp = expression.split(",");
		for ( var i = 0; i < list.length; i++ ) {
			var acA = list[i].split(",");
			acA.sort();
			var acLen = 0;
			for ( var j = 1; j < acA.length; j++ ) {
				if ( ( parseInt(acA[j]) - parseInt(acA[j-1]) ) == 1 ) {
					acLen++;
				}
			}
			var E = false;
			for ( var j = 0; j < exp.length; j++ ) {
				if ( parseInt(exp[j]) ==  acLen ) {
					E = true;
					break;
				}
			}
			if ( E ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 每注中尾数不相同的投注号码
	 */
	this.w = function(list, expression) {
		var retList = new Array();
		var exp = expression.split(",");
		for ( var i = 0; i < list.length; i++ ) {
			var acA = list[i].split(",");
			acA.sort();
			var A = new Array();
			for ( var j = 1; j < acA.length; j++ ) {
				var ex = false;
				for ( var k = 0; k < A.length; k++ ) {
					if ( acA[j].substring(1) == A[k] ) {
						ex = true;
						break;
					}
				}
				if ( !ex ) {
					A.push(acA[j].substring(1));
				}
			}
			var E = false;
			for ( var j = 0; j < exp.length; j++ ) {
				if ( parseInt(exp[j]) ==  A.length ) {
					E = true;
					break;
				}
			}
			if ( E ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
}

function Expression(type, expr) {
	this.type = type;
	this.expr = expr;
}