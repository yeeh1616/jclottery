/**
 * <p>Desc:排列组合算法</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/6 Version 1.0
 */
function CombAlgorithm() {
	
	/**
	 *	查找组合
	 *	参数
	 *		ops,二维数组
	 *		n,选择n场比赛
	 *		k,k种组合
	 *	return 3维数组，存储二维数组的组合
	 */
	this.findComb = function(ops, n, k) {
		var buffer = new Array();	
		var result = new Array();	
		var top = -1, tmp = 1;		
		var counter = 0;
		do {
			buffer[++top] = tmp++;
		} while (top < k - 1);
		if (top == k - 1) {
			var tp = new Array();
			for (var i = 0; i < buffer.length; i++ ) {			
				tp.push(ops[buffer[i] - 1]);
			}		
			result.push(tp);
		}
		do {
			if (top == k - 1) {
				do {
					tmp = buffer[top--];
				} while (tmp > n - (k - (top + 1)) && top > -1);
			}
			if (tmp <= n - (k - (top + 1))) { 
				do {
					buffer[++top] = ++tmp;
				} while (top < k - 1); 
			}
			if (top == k - 1) {
				var tp = new Array();
				for (var i = 0; i < buffer.length; i++ ) {
					tp.push(ops[buffer[i] - 1]);
				}			
				result.push(tp);
			}
		} while (top > -1); 
		return result;
	}
	
	/**
	 * 计算组合数
	 */
	this.calcCombNum = function( n, k ) {
		if ( n < k ) {
			return 0;
		}
		if ( k > n / 2 ) {
			k = n - k;
		}
		var counter = 1,mod = 1;
		for ( var i = 0; i < k; i++ ) {
			counter *= n--;
			mod *= (i + 1);
		}
		return counter / mod;
	}
	
	/**
	 *	查找组合，只对排列使用./递归生成 
	 *	参数
	 *		result,返回值，为数组对象
	 *		ops,二维数组
	 */
	this.findNmComb = function(ops) {
		var result = new Array();
		if ( ops.length == 0 ) {
			return result;
		}
		for ( var i = 0; i < ops[0].length; i++ ) {
			var _tArr = new Array();
			_tArr.push(ops[0][i]);
			this.findSubNmComb( result, _tArr, ops, ops.length-1 );
		}
		return result;
	}
	
	this.findSubNmComb = function(result, tArr, ops, n) {
		if ( n == 0 ) {
			//for ( var i = 0; i < tArr.length; i++) {
				result.push(tArr);
			//}
		} else {
			for ( var i = 0; i < ops[ops.length-n].length; i++ ) {
				var _tArr = new Array();
				for ( var j = 0; j < tArr.length; j++) {
					_tArr.push(tArr[j]);
				}
				_tArr.push(ops[ops.length-n][i]);
				this.findSubNmComb( result, _tArr, ops, n-1 );
			}
		}
	}
	
	/**
	 * 七乐彩及22选5转换成单式，格式：01,02,03,04,05,06,07,08
	 * @param betString
	 * @param len
	 * @return
	 */
	this.findQlcSingComb = function( betString, len ) {
		var list = new Array();
		if ( betString.indexOf("(") > -1 ) {
			var danDesc = betString.substring(betString.indexOf("(") + 1, betString.indexOf(")"));
			var tuos = betString.substring(betString.indexOf(")")+1).split(",");
			var tuoList = this.findComb(tuos, tuos.length, len - danDesc.split(",").length);
			for ( var i = 0; i < tuoList.length; i++ ) {
				var danDe = danDesc + ",";
				for ( var j = 0; j < tuoList[i].length; j++ ) {
					danDe += tuoList[i][j] + ",";
				}
				list.push(danDe.substring(0, danDe.length - 1));
			} 
		} else {
			var spCode = betString.split(",");
			var lst = this.findComb(spCode, spCode.length, len);
			for ( var i = 0; i < lst.length; i++ ) {
				var beforeDesc = "";
				for ( var j = 0; j < lst[i].length; j++ ) {
					beforeDesc += lst[i][j] + ",";
				}
				list.push(beforeDesc = beforeDesc.substring(0, beforeDesc.length - 1));
			}
		}
		return list;
	}
}