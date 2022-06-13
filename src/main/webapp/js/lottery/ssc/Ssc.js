/**
 * <p>Desc:时时彩类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/10 Version 1.0
 */
function Ssc() {
	
	var WXZHX = 1;	//	五星直选
	var WXTX = 2;	//	五星通选
	var S4XZHX = 3;	//	四星直选
	var SXZHX = 4;	//	三星直选
	var SXHZ = 5;	//	三星和值
	var Z3BH = 6;	//	组三包号(组三)
	var Z3ZHX = 7;	//	组三直选
	var Z6BH = 8;	//	组六包号(组六)
	var EXZHX = 9;	//	二星直选
	var EXHZ = 10;	//	二星和值
	var EXZX = 11;	//	二星组选
	var YXZHX = 12;	//	一星直选
	var DXDS = 13;	//	大小单双
	var RX1 = 14;	//	任选一
	var RX2 = 15;	//	任选二
	
	var combAlg = new CombAlgorithm();
	
	var SX_ZXHZ = [1,3,6,10,15,21,28,36,45,55,63,69,73,75,75,73,69,63,55,45,36,28,21,15,10,6,3,1];//三星直选和值
	
	var EXZX_HZ_NUM = [1,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1];	// 二星直选和值,0-18
	
	this.calcBetNum = function(player, betCode) {
		var betNum = 0;
		switch ( player ) {
		case WXZHX://格式：1,2|1|1,2|3,4|5
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case WXTX:
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case S4XZHX://格式：1,2|1|1,2|3,4
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case SXZHX://格式：1,2|1|1,2
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case SXHZ:
			var betCodes = betCode.split(",");
			for ( var i = 0; i < betCodes.length; i++ ) {
				betNum += SX_ZXHZ[parseInt(betCodes[i])];
			}
			break;
		case Z3BH:
			var betCodes = betCode.split(",");
			betNum = combAlg.calcCombNum(betCodes.length, 2)*2;
			break;
		case Z3ZHX://格式：1,2|3
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case Z6BH:
			var betCodes = betCode.split(",");
			betNum = combAlg.calcCombNum(betCodes.length, 3);
			break;
		case EXZHX:
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case EXHZ:
			var betCodes = betCode.split(",");
			for ( var i = 0; i < betCodes.length; i++ ) {
				betNum += EXZX_HZ_NUM[parseInt(betCodes[i])];
			}
			break;
		case EXZX:
			var betCodes = betCode.split(",");
			betNum = combAlg.calcCombNum(betCodes.length, 2);
			break;
		case YXZHX:
			var betCodes = betCode.split(",");
			betNum = betCodes.length;
			break;
		case DXDS:
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case RX1:// 格式：1,2|-|3|-|4|-
			var calcArray = new Array();
			var betCodes = betCode.split("|");
			for ( var i = 0; i < betCodes.length; i++ ) {
				if ( betCodes[i] != '-' ) {
					calcArray.push(betCodes[i].length);
				}
			}
			if ( calcArray.length == 0 ) {
				betNum = 0;
			} else {
				var list = combAlg.findComb(calcArray, calcArray.length, 1);
				betNum = 0;
				for ( var i = 0; i < list.length; i++ ) {
					var subNum = 1;
					for ( var j = 0; j < list[i].length; j++ ) {
						subNum *= list[i][j];
					}
					betNum += subNum;
				}
			}
			break;
		case RX2:// 格式：1,2|-|3|-|4|-
			var calcArray = new Array();
			var betCodes = betCode.split("|");
			for ( var i = 0; i < betCodes.length; i++ ) {
				if ( betCodes[i] != '-' ) {
					calcArray.push(betCodes[i].length);
				}
			}
			if ( calcArray.length < 2 ) {
				betNum = 0;
			} else {
				var list = combAlg.findComb(calcArray, calcArray.length, 2);
				betNum = 0;
				for ( var i = 0; i < list.length; i++ ) {
					var subNum = 1;
					for ( var j = 0; j < list[i].length; j++ ) {
						subNum *= list[i][j];
					}
					betNum += subNum;
				}
			}
			break;
		}
		return betNum;
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
	
	/**
	 * 玩法中文名称
	 */
	this.getPlayName = function(player) {
		var name = "";
		switch( player ) {
		case "5xzhx":
			name = "五星直选";
			break;
		case "5xtx":
			name = "五星通选";
			break;
		case "4xzhx":
			name = "四星直选";
			break;
		case "3xzhx":
			name = "三星直选";
			break;
		case "3xhz":
			name = "三星和值";
			break;
		case "3xz3bh":
			name = "组三包号";
			break;
		case "3xz3zhx":
			name = "组三直选";
			break;
		case "3xz6bh":
			name = "组六包号";
			break;
		case "2xzhx":
			name = "二星直选";
			break;
		case "2xhz":
			name = "二星和值";
			break;
		case "2xzx":
			name = "二星组选";
			break;
		case "1xzhx":
			name = "一星直选";
			break;
		case "dxds":
			name = "大小单双";
			break;
		case "r1x":
			name = "任选一";
			break;
		case "r2x":
			name = "任选二";
			break;
		}
		return name;
	}
	
	/**
	 * 玩法中文名称
	 */
	this.getPlayBonus = function(player) {
		var name = "";
		switch( player ) {
		case "5xzhx":
			name = "116000";
			break;
		case "5xtx":
			name = "30,20000";
			break;
		case "4xzhx":
			name = "10000";
			break;
		case "3xzhx":
			name = "1160";
			break;
		case "3xhz":
			name = "1160";
			break;
		case "3xz3bh":
			name = "385";
			break;
		case "3xz3zhx":
			name = "385";
			break;
		case "3xz6bh":
			name = "190";
			break;
		case "2xzhx":
			name = "116";
			break;
		case "2xhz":
			name = "116";
			break;
		case "2xzx":
			name = "58";
			break;
		case "1xzhx":
			name = "11";
			break;
		case "dxds":
			name = "4";
			break;
		case "r1x":
			name = "11";
			break;
		case "r2x":
			name = "116";
			break;
		}
		return name;
	}
}