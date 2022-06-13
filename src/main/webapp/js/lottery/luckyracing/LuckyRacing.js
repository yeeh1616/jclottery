/**
 * <p>Desc:幸运赛车类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/3/10 Version 1.0
 */
function LuckyRacing() {
	var Q1DS = 1;		// 前一（冠军）单式，格式：01;02;03
	var Q1FS = 2;		// 前一复式，格式：05,06
	var Q2DS = 3;		// 前二（冠亚军）单式，格式：01|02;02|03
	var Q2FS = 4;		// 前二复式，格式：01,02|03,04
	var Q2BH = 5;		// 前二包号，相当于排三的直选组合复式，格式：01,02,03
	var Q2BHDT = 6;		// 前二胆拖包号，格式：(01)02,03
	var Q3DS = 7;		// 前三单式，格式：01|02|03;02|04|01
	var Q3FS = 8;		// 前三复式，格式：01,02,03|03,04|07,09,10
	var Q3BH = 9;		// 前三包号，相当于排三的直选组合复式,格式：01,02,03
	var Q3BHDT = 10;	// 前三胆拖包号,(01)02,03,04
	var WZDCDS = 11;	// 位置，单车选号单式，猜中当期某辆车进入前三名即为中奖,根据奖金对照表派奖,单注浮动奖金最高可获 36 元，格式：05;06;07
	var WZDCFS = 12;	// 位置，单车选号复式，格式：05,06,07
	var WZSCDS = 13;	// 位置，双车选号单式，预测12辆赛车中获得前三名赛车中的任意2辆赛车号码(不排序),单注浮动奖金最高可获 1012,格式：04,05;07,11
	var WZSCFS = 14;	// 位置，双车选号复式，格式：04,05,09
	var WZSCDT = 15;	// 位置，双车选号胆拖，格式：(01)02,03
	var YSQ1DS = 16;	// 颜色(6种颜色)前一单式，预测12辆赛车中获得第一名的赛车颜色,单注最高奖金限额为 10 元 ，红色（01,02）:A，蓝色（03,04）:B，绿色（05,06）:C，黄色（07,08）:D，银色（09,10）:E，紫色（11,12）:F
	var YSQ1FS = 17;	// 颜色前一复式，格式：A,B
	var YSQ2DS = 18;	// 颜色前二单式，预测12辆赛车中按顺序获得前两名的赛车颜色,单注最高奖金限额为 470 元 ，格式：A|B
	var YSQ2FS = 19;	// 颜色前二复式，格式：A,B|C,D
	var YSQ2BH = 20;	// 颜色前二包号，相当于排三的直选组合复式，格式：B,D
	var YSQ2BHDT = 21;	// 颜色前二包号胆拖，格式：(A)B,D
	var YSQ3DS = 22;	// 颜色前三单式，预测12辆赛车中按顺序获得前三名的赛车颜色,单注最高奖金限额为 3852 元，格式：A|B|C;E|D|F
	var YSQ3FS = 23;	// 颜色前三复式，格式：A,B|C|D,E
	var YSQ3BH = 24;	// 颜色前三包号，相当于排三的直选组合复式，格式：B,D,E
	var YSQ3BHDT = 25;	// 颜色前三包号胆拖，格式：(A)B,D,E
	var G2GDS = 26;	 	// 过两关单式，猜中连续两场比赛中获得第一名，根据奖金对照表派奖，单注最高奖金限额为10000元。 01|02;03|04
	var G2GFS = 27;	 	// 过两关复式，01,02|04
	var G2GBH = 28;	 	// 过两关包号，格式：01,02
	var G2GBHDT	= 29;	// 过两关胆拖包号，格式：(01)02,03
	var G3GDS = 30;	 	// 过三关单式,猜中连续三场比赛中获得第一名，根据奖金对照表派奖，单注最高奖金限额为500000元。 格式：01|01|03
	var G3GFS = 31;	 	// 过三关复式，01,02|04|01
	var G3GBH = 32;	 	// 过三关包号，01,02|04|09,11
	var G3GBHDT	= 33;	// 过三关胆拖包号，格式：(01,08)02,03
	var DXJODS = 34;	// 大小奇偶单式，对冠军进行大小奇偶投注,根据奖金对照表派奖,单注浮动奖金最高可获 8 元，小奇(01,03,05):A，小偶(02,04,06):B，大奇(07,09,11):A，大偶(08,10,12)
	var DXJOFS = 35;	// 大小奇偶单式，格式：A,B
	var Z2DS = 36;		// 组二单式，猜中当前期比赛冠亚军即为中奖,根据奖金对照表派奖,单注浮动奖金最高可获 5000 元 ，格式：05,06
	var Z2FS = 37;		// 组二复式，格式：05,06,09
	var Z2DT = 38;		// 组二胆拖，格式：(01)02,03
	var Z3DS = 39;		// 组三单式，：猜中当前期比赛冠亚季军即为中奖,根据奖金对照表派奖,单注浮动奖金最高可获 27774 元，格式：01,02,03
	var Z3FS = 40;		// 组三复式，格式：05,06,09,11,12
	var Z3DT = 41;		// 组三胆拖，格式：(01)02,03,07,09
	
	var combAlg = new CombAlgorithm();
	
	/**
	 * 计算注数
	 */
	this.calcBetNum = function(player, complex) {
		var betNum = 0;
		switch ( player ) {
		case Q1DS:
			betNum = 1;
			break;
		case Q1FS:
			betNum = complex.split(",").length;
			break;
		case Q2DS:
			betNum = 1;
			break;
		case Q2FS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case Q2BH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 2) * 2;
			break;
		case Q2BHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 2 - dans.length) * 2;
			break;
		case Q3DS:
			betNum = 1;
			break;
		case Q3FS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case Q3BH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 3) * 6;
			break;
		case Q3BHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 3 - dans.length) * 6;
			break; 
		case WZDCDS:
			betNum = 1;
			break;
		case WZDCFS:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 1);
			break;
		case WZSCDS:
			betNum = 1;
			break;
		case WZSCFS:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 2);
			break;
		case WZSCDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 2 - dans.length);
			break;
		case YSQ1DS:
			betNum = 1;
			break;
		case YSQ1FS:
			betNum = complex.split(",").length;;
			break;
		case YSQ2DS:
			betNum = 1;
			break;
		case YSQ2FS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case YSQ2BH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 2) * 2;
			break;
		case YSQ2BHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 2 - dans.length) * 2;
			break;
		case YSQ3DS:
			betNum = 1;
			break;
		case YSQ3FS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case YSQ3BH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 3) * 6;
			break;
		case YSQ3BHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 3 - dans.length) * 6;
			break;
		case G2GDS:
			betNum = 1;
			break;
		case G2GFS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case G2GBH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 2) * 2;
			break;
		case G2GBHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 2 - dans.length) * 2;
			break;
		case G3GDS:
			betNum = 1;
			break;
		case G3GFS:
			var codes = complex.split("|");
			betNum = 1;
			for ( var i = 0; i < codes.length; i++ ) {
				betNum *= codes[i].split(",").length;
			}
			break;
		case G3GBH:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 3) * 6;
			break;
		case G3GBHDT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 3 - dans.length) * 6;
			break;
		case DXJODS:
			betNum = 1;
			break;
		case DXJOFS:
			betNum = complex.split(",").length;
			break;
		case Z2DS:
			betNum = 1;
			break;
		case Z2FS:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 2);
			break;
		case Z2DT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 2 - dans.length);
			break;
		case Z3DS:
			betNum = 1;
			break;
		case Z3FS:
			var codes = complex.split(",");
			betNum = combAlg.calcCombNum(codes.length, 3);
			break;
		case Z3DT:
			var dans = complex.substring(complex.indexOf('(')+1, complex.indexOf(')')).split(",");
			var tuos = complex.substring(complex.indexOf(')')+1).split(",");
			betNum = combAlg.calcCombNum(tuos.length, 3 - dans.length);
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
		case "q1":
			name = "前一";
			break;
		case "q2zx":
			name = "前二直选";
			break;
		case "q2fs":
			name = "前二复式";
			break;
		case "q2dt":
			name = "前二胆拖";
			break;
		case "q3zx":
			name = "前三直选";
			break;
		case "q3fs":
			name = "前三复式";
			break;
		case "q3dt":
			name = "前三胆拖";
			break;
		case "wzdc":
			name = "位置单车";
			break;
		case "wzsc":
			name = "位置双车";
			break;
		case "wzdt":
			name = "位置胆拖";
			break;
		case "dxjo":
			name = "大小奇偶";
			break;
		}
		return name;
	}
	
	this.getPlayBonus = function(player) {
		var name = "";
		switch( player ) {
		case "q1":
			name = "13";
			break;
		case "q2zx":
			name = "65";
			break;
		case "q2fs":
			name = "130";
			break;
		case "q2dt":
			name = "65";
			break;
		case "q3zx":
			name = "1300";
			break;
		case "q3fs":
			name = "1300";
			break;
		case "q3dt":
			name = "1300";
			break;
		case "wzdc":
			name = "25";
			break;
		case "wzsc":
			name = "50";
			break;
		case "wzdt":
			name = "25";
			break;
		case "dxjo":
			name = "11";
			break;
		}
		return name;
	}
}