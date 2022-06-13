/**
 * <p>Desc:11选5类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/10 Version 1.0
 */
function C11x5() {
	var Q1 = 1;		// 前一
	var R2DS = 2;	// 任二单式
	var R2FS = 3;	// 任二普通复式
	var R2DT = 4;	// 任二胆拖
	var Q2ZX = 5;	// 前二直选
	var Q2ZX_DS = 6;//前二组选普通单式
	var Q2ZX_FS = 7;//前二组选普通复式
	var Q2ZX_DT = 8;//前二组选胆拖
	var R3DS = 9;	// 任三普通单式
	var R3FS = 10;	// 任三普通复式
	var R3DT = 11;  // 任三胆拖
	var Q3ZX = 12;	// 前三直选
	var Q3ZX_DS = 13;//前三组选普通单式
	var Q3ZX_FS = 14;//前三组选普通复式
	var Q3ZX_DT = 15;//前三组选胆拖
	var R4DS = 16;	// 任四普通单式
	var R4FS = 17;	// 任四普通复式
	var R4DT = 18;	// 任四胆拖
	var R5DS = 19;	// 任五普通单式
	var R5FS = 20;	// 任五普通复式
	var R5DT = 21;	// 任五胆拖
	var R6DS = 22;	// 任六普通单式
	var R6FS = 23;	// 任六普通复式
	var R6DT = 24;	// 任六胆拖
	var R7DS = 25;	// 任七普通单式
	var R7FS = 26;	// 任七普通复式
	var R7DT = 27;	// 任七胆拖
	var R8DS = 28;	// 任八普通单式
	var R8FS = 29;	// 任八普通复式
	var R8DT = 30;	// 任八胆拖
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 计算注数
	 * @param player, 玩法
	 * @param betCode, 投注号码
	 * 玩法格式定义：
	 * 1）前一：01,02,03,04
	 * 2）任二普通单式：01,02
	 * 3）任二普通复式：01,02,03,04
	 * 4）任二胆拖：(01)02,03,04
	 * 5）前二直选：01,02|03,04;01|02
	 * 6）前二组选普通单式：01,02
	 * 7）前二组选普通复式：01,02,03
	 * 8）前二组选胆拖：(01)02,03
	 * 9）任三普通单式：01,03,04
	 * 10）任三普通复式：01,03,04,06
	 * 11）任三胆拖：(01,02)03,04
	 * 12）前三直选：01,02|03,04|01,03
	 * 13）前三组选普通单式：01,02,03
	 * 14）前三组选普通复式：01,02,03,05,07
	 * 15）前三组选胆拖：(01,03)04,05
	 * 16）任四普通单式：01,02,04,05
	 * 17）任四普通复式：01,02,04,05,09,11
	 * 18）任四胆拖：(01,02)03,04,07
	 * 19）任五普通单式：01,02,03,04,05
	 * 20）任五普通复式：01,02,03,04,05,07
	 * 21）任五胆拖：(01,02)03,04,07,09
	 * 22）任六普通单式：01,02,03,04,05,06
	 * 23）任六普通复式：01,02,03,04,05,06,07
	 * 24）任六胆拖：(01,02)03,04,07,09,10,11
	 * 25）任七普通单式：01,02,03,04,05,06,07
	 * 26）任七普通复式：01,02,03,04,05,06,07,08
	 * 27）任七胆拖：(01,02)03,04,05,06,07,09
	 * 28）任八普通单式：01,02,03,04,05,06,07,08
	 * 29）任八普通复式：01,02,03,04,05,06,07,08,09
	 * 30）任八胆拖：(01,02)03,04,05,06,07,08,09,10
	 */
	this.calcBetNum = function(player, betCode) {
		var betNum = 0;
		switch ( player ) {
		case Q1:
			betNum = betCode.split(",").length;
			break;
		case R2DS:
			betNum = 1;
			break;
		case R2FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 2);
			break;
		case R2DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 2 - dd[0].split(",").length);
			break;
		case Q2ZX:
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case Q2ZX_DS:
			betNum = 1;
			break;
		case Q2ZX_FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 2);
			break;
		case Q2ZX_DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 2 - dd[0].split(",").length);
			break;
		case R3DS:
			betNum = 1;
			break;
		case R3FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 3);
			break;
		case R3DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 3 - dd[0].split(",").length);
			break;
		case Q3ZX:
			var dd = betCode.split("|");
			betNum = 1;
			for ( var i = 0; i < dd.length; i++ ) {
				betNum *= dd[i].split(",").length;
			}
			break;
		case Q3ZX_DS:
			betNum =1;
			break;
		case Q3ZX_FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 3);
			break;
		case Q3ZX_DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 3 - dd[0].split(",").length);
			break;
		case R4DS:
			betNum = 1;
			break;
		case R4FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 4);
			break;
		case R4DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 4 - dd[0].split(",").length);
			break;
		case R5DS:
			betNum = 1;
			break;
		case R5FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 5);
			break;
		case R5DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 5 - dd[0].split(",").length);
			break;
		case R6DS:
			betNum = 1;
			break;
		case R6FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 6);
			break;
		case R6DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 6 - dd[0].split(",").length);
			break;
		case R7DS:
			betNum = 1;
			break;
		case R7FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 7);
			break;
		case R7DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 7 - dd[0].split(",").length);
			break;
		case R8DS:
			betNum = 1;
			break;
		case R8FS:
			betNum = combAlg.calcCombNum(betCode.split(",").length, 8);
			break;
		case R8DT:
			var dd = betCode.split(")");
			betNum = combAlg.calcCombNum(dd[1].split(",").length, 8 - dd[0].split(",").length);
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
		case "r5pt":
			name = "任五普通投注";
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
		case "r5pt":
			name = "540";
			break;
		case "r5dt":
			name = "540";
			break;
		case "r6pt":
			name = "90";
			break;
		case "r6dt":
			name = "90";
			break;
		case "r7pt":
			name = "26";
			break;
		case "r7dt":
			name = "26";
			break;
		case "r8pt":
			name = "9";
			break;
		case "r8dt":
			name = "9";
			break;
		case "r4pt":
			name = "78";
			break;
		case "r4dt":
			name = "78";
			break;
		case "q1pt":
			name = "13";
			break;
		case "x2q2zhx":
			name = "130";
			break;
		case "x2r2pt":
			name = "6";
			break;
		case "x2r2dt":
			name = "6";
			break;
		case "x2q2zxpt":
			name = "65";
			break;
		case "x2q2zxdt":
			name = "65";
			break;
		case "x3q3zhx":
			name = "1170";
			break;
		case "x3r3pt":
			name = "19";
			break;
		case "x3r3dt":
			name = "19";
			break;
		case "x3q3zxpt":
			name = "65";
			break;
		case "x3q3zxdt":
			name = "195";
			break;
		}
		return name;
	}
}