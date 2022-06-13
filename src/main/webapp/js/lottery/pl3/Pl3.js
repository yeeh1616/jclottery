/**
 * <p>Desc:排列3类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/7 Version 1.0
 */
function Pl3() {
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 直选和值注数，0-27对应注数
	 */
	var ZXHZ = [1,3,6,10,15,21,28,36,45,55,63,69,73,75,75,73,69,63,55,45,36,28,21,15,10,6,3,1];
	
	/**
	 * 组3和值注数，1-26
	 */
	var Z3HZ = [1,2,1,3,3,3,4,5,4,5,5,4,5,5,4,5,5,4,5,4,3,3,3,1,2,1];
	
	/**
	 * 组6和值注数，3-24
	 */
	var Z6HZ = [1,1,2,3,4,5,7,8,9,10,10,10,10,9,8,7,5,4,3,2,1,1];
	
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
	 * 生成随机数数组
	 * 参数
	 *		num,随机数个数
	 *		max,随机数的最大值
	 * 返回 数组
	 */
	this.randomArray = function( num, max ) {
		var buf = new Array();	
		while ( buf.length < num ) {
			var rand = Math.floor(Math.random()*max);
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
	
	/**
	 * 计算直选普通玩法注数
	 * @param betArray,二维数组
	 */
	this.calcZxptBetNum = function(betArray) {
		var betNum = 1;
		for ( var i = 0; i < betArray.length; i++ ) {
			betNum *= betArray[i].length;
		}
		return betNum;
	}
	
	/**
	 * 计算直选复式组合玩法注数
	 * @param betArray,一维数组，1,2,3,4,5
	 */
	this.calcZxFszh = function(betArray) {
		return combAlg.calcCombNum(betArray.length, 3) * 6;
	}
	
	/**
	 * 计算直选和值玩法注数
	 * @param betArray,一维数组，1,2,3,12
	 */
	this.calcZxHz = function(betArray) {
		var betNum = 0;
		for ( var i = 0; i < betArray.length; i++ ) {
			betNum += ZXHZ[parseInt(betArray[i])];
		}
		return betNum;
	}
	
	/**
	 * 计算直选胆拖玩法注数
	 * @param betDanArray,一维数组，1,2,3,4,5
	 * @param betTuoArray,一维数组，1,2,3,4,5
	 */
	this.calcZxDt = function(betDanArray, betTuoArray) {
		return combAlg.calcCombNum(betTuoArray.length, 3 - betDanArray.length) * 6;
	}
	
	/**
	 * 计算组3单式注数
	 * @param betArray,二维数组，new Array(new Array(1,2,2),new Array(0,0,1))
	 */
	this.calcZ3Ds = function(betArray) {
		return betArray.length;
	}
	
	/**
	 * 计算组3复式注数
	 * @param betArray,一维数组，1,2,3,4,5
	 */
	this.calcZ3Fs = function(betArray) {
		return combAlg.calcCombNum(betArray.length, 2) * 2;
	}
	
	/**
	 * 计算组3和值玩法注数
	 * @param betArray,一维数组，1,2,3,12
	 */
	this.calcZ3Hz = function(betArray) {
		var betNum = 0;
		for ( var i = 0; i < betArray.length; i++ ) {
			betNum += Z3HZ[parseInt(betArray[i])-1];
		}
		return betNum;
	}
	
	/**
	 * 计算组3胆拖玩法注数（组3只允许设置1个胆）
	 * @param betDanArray,一维数组，1,2,3,4,5
	 * @param betTuoArray,一维数组，1
	 */
	this.calcZ3Dt = function(betDanArray, betTuoArray) {
		return combAlg.calcCombNum(betTuoArray.length, 2 - betDanArray.length) * 2;
	}
	
	/**
	 * 计算组6玩法注数
	 * @param betArray,一维数组，1,2,3,12
	 */
	this.calcZ6Fs = function(betArray) {
		return combAlg.calcCombNum(betArray.length, 3);
	}
	
	/**
	 * 计算组6和值玩法注数
	 * @param betArray,一维数组，1,2,3,12
	 */
	this.calcZ6Hz = function(betArray) {
		var betNum = 0;
		for ( var i = 0; i < betArray.length; i++ ) {
			betNum += Z6HZ[parseInt(betArray[i])-3];
		}
		return betNum;
	}
	
	/**
	 * 计算组6胆拖玩法注数
	 * @param betDanArray,一维数组，1,2,3,4,5
	 * @param betTuoArray,一维数组，1
	 */
	this.calcZ6Dt = function(betDanArray, betTuoArray) {
		return combAlg.calcCombNum(betTuoArray.length, 3 - betDanArray.length);
	}
}