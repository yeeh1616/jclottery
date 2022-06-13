/**
 * <p>Desc:大乐透类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/7 Version 1.0
 */
function Dlt() {
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 计算注数
	 * @param beforeBetArray,前区
	 * @param afterBetArray,后区
	 */
	this.calcBetNum = function(beforeBetArray, afterBetArray) {
		var beforeNum = combAlg.calcCombNum(beforeBetArray.length, 5);
		var afterNum = combAlg.calcCombNum(afterBetArray.length, 2);
		return beforeNum * afterNum;
	}
	
	/**
	 * 计算胆拖注数
	 * @param beforeBetDanArray,前区胆码数组
	 * @param beforeTuoArray,后区拖吗数组
	 * @param afterBetDanArray,后区胆码数组
	 * @param afterTuoArray,后区拖码
	 */
	this.calcDanTuoBetNum = function(beforeBetDanArray, beforeTuoArray, afterBetDanArray, afterTuoArray) {
		var beforeNum = combAlg.calcCombNum(beforeTuoArray.length, 5 - beforeBetDanArray.length);
		var afterNum = combAlg.calcCombNum(afterTuoArray.length, 2 - afterBetDanArray.length);
		return beforeNum * afterNum;
	}
	
	/**
	 * 生成随机数
	 * 参数
	 *		num,随机数个数
	 *		max,随机数的最大值
	 * 返回 数组
	 */
	this.random = function( num, max ) {
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