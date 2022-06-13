/**
 * <p>Desc:过滤器（竞彩在线过滤类）</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/4/10 Version 1.0
 */

/**
 * @param guess,Guess对象
 */
function Filter(guess) {
	
	this.guess = guess;
	
	/**
	 * 命中过滤
	 * @param list,等待过滤的列表，Optimization对象
	 * @param hitCode,命中号码, 格式：20140410001:3:0|20140410002:3:0`1`2,1到2个命中
	 */
	this.hitFilte = function(list, hitCode) {
		var retList = new Array();
		var hits = hitCode.split("`");
		var hcs = hits[0].split("|");
		for ( var i = 0; i < list.length; i++ ) {
			var counter = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				for ( var k = 0; k < hcs.length; k++ ) {
					if ( codes[j] == hcs[k] ) {
						counter++;
					}
				}
			}
			if ( parseInt(hits[1]) <= counter && parseInt(hits[2]) >= counter ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 赔率过滤
	 * @param expression,格式：2<1<3,2<第一赔率<3
	 */
	this.oddFilte = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var counter = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				var oddArray = guess.getOdds(codes[j].split(":")[0]);
				var odd = guess.getBetOdds(codes[j].split(":")[0], codes[j].split(":")[1]);
				oddArray.sort();//升序
				if ( oddArray[parseInt(exp[1]) - 1] == odd ) {
					counter++;
				}
			}
			if ( parseInt(exp[1]) <= counter && parseInt(exp[2]) >= counter ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 奖金过滤
	 * @param expression,格式：10<bonus<20
	 */
	this.bonusFilte = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var bonus = 2;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				var odd = guess.getBetOdds(codes[j].split(":")[0], codes[j].split(":")[1]);
				bonus *= parseFloat(odd);
			}
			if ( parseFloat(exp[0]) <= bonus && parseFloat(exp[2]) >= bonus ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	
	/**
	 * 基本过滤
	 * 1、胜场数，2、平场数，3、负场数，4、断点数
	 * @param expression,格式：1<base1<2
	 */
	this.baseFilte = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			switch( exp[1] ) {
			case "1":
				for ( var j = 0; j < codes.length; j++ ) {
					if ( codes[j] == "3" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "2":
				for ( var j = 0; j < codes.length; j++ ) {
					if ( codes[j] == "1" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "3":
				for ( var j = 0; j < codes.length; j++ ) {
					if ( codes[j] == "0" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "4":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] != codes[j+1] ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			}
			
		}
		return retList;
	}
	
	/**
	 * 场次连续过滤
	 * 1、不胜连续个数，2、不平连续个数，3、不负连续个数，4、主场连胜数，
	 * 5、主场连平数，6、主场连负数，7、连号个数
	 * @param expression,格式：1<cont1<2
	 */
	this.contFilte = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			switch( exp[1] ) {
			case "1":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] != "3" && codes[j+1] != "3" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "2":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] != "1" && codes[j+1] != "1" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "3":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] != "0" && codes[j+1] != "0" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "4":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] == "3" && codes[j+1] == "3" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "5":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] == "1" && codes[j+1] == "1" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "6":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] == "0" && codes[j+1] == "0" ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			case "7":
				for ( var j = 0; j < codes.length-1; j++ ) {
					if ( codes[j] == codes[j+1] ) {
						index++;
					}
				}
				if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
					retList.push(list[i]);
				}
				break;
			}
			
		}
		return retList;
	}
	
	/**
	 * 数值比较过滤
	 * 比较对象：1、胜的个数，2、平的个数，3、负的个数，4、奇数个数，5、偶数个数，
	 * 6、一赔个数，7、二赔个数，8、三赔个数，9、断点数
	 * 比较方法：1、大于，2、小于，3、等于，4、大于等于，5、小于等于
	 * @param expression,格式：1<comp1<2
	 */
	this.compFilte = function(list, expression) {
		
	}
	
	/**
	 * 删除法过滤
	 * 对象：1、胜的个数，2、平的个数，3、负的个数，4、奇数个数，5、偶数个数，
	 * 6、一赔个数，7、二赔个数，8、三赔个数，9、断点数
	 * @param expression
	 */
	this.delFilte = function(list, expression) {
		
	}
	
	/**
	 * 运算过滤
	 * 一赔=二赔+三赔
	 * @param expression
	 */
	this.calcFilte = function(list, expression) {
		
	}
}