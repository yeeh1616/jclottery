/**
 * <p>Desc:足彩类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/7 Version 1.0
 */
function Football() {
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 计算注数
	 * @param betArray,二维数组
	 */
	this.calcBetNum = function(betArray) {
		var betNum = 1;
		for ( var i = 0; i < betArray.length; i++ ) {
			betNum *= betArray[i].length;
		}
		return betNum;
	}
	
	/**
	 * 任9计算
	 */
	this.calcR9BetNum = function(betArray) {
		var combArray = combAlg.findComb(betArray, betArray.length, 9);
		var betNum = 0;
		for ( var i = 0; i < combArray.length; i++ ) {
			betNum += this.calcBetNum(combArray[i]);
		}
		return betNum;
	}
	
	/**
	 * 任9胆拖计算
	 */
	this.calcR9DtBetNum = function(danArray, tuoArray) {
		var combArray = combAlg.findComb(tuoArray, tuoArray.length, 9 - danArray.length);
		var betNum = 0;
		for ( var i = 0; i < combArray.length; i++ ) {
			var subBetNum = 1;
			for ( var j = 0; j < combArray[i].length; j++ ) {
				subBetNum *= combArray[i][j].length;
			}
			for ( var j = 0; j < danArray.length; j++ ) {
				subBetNum *= danArray[j].length;
			}
			betNum += subBetNum;
		}
		return betNum;
	}
	
	/**
	 * 生成随机数
	 * 参数
	 *		max,随机数的最大值
	 * 返回 随机数
	 */
	this.random = function( max ) {
		return Math.floor(Math.random()*max);
	}
	
	/**
	 * 生成随机数
	 * 参数
	 *		num,随机数个数
	 *		max,随机数的最大值
	 * 返回 数组
	 */
	this.randomArray = function( num, max ) {
		var buf = new Array();	
		while ( buf.length < num ) {
			var rand = Math.floor(Math.random()*max) + "";
			if ( rand == 0 )
				continue;
			if ( rand.length == 1 ) {
				rand = "0" + rand;
			}
			var repeat = false;
			for ( var i = 0; i < buf.length; i++ ) {
				if ( rand == buf[i] ) {
					repeat = true;
					break;
				}
			}
			if ( repeat ) {
				continue;
			}
			buf.push(rand);
			
		}
		buf.sort();
		
		return buf;
	}
}