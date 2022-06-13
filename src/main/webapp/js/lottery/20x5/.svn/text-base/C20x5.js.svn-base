/**
 * <p>Desc:20选5类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/10 Version 1.0
 */
function C20x5() {
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 计算注数
	 * @param betArray,一维数组
	 */
	this.calcBetNum = function(betArray) {
		return combAlg.calcCombNum(betArray.length, 5);
	}
	
	/**
	 * 计算胆拖注数
	 * @param betArray,一维数组
	 */
	this.calcDanTuoBetNum = function(betDanArray, betTuoArray) {
		return combAlg.calcCombNum(betTuoArray.length, 5-betDanArray.length);
	}
	
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