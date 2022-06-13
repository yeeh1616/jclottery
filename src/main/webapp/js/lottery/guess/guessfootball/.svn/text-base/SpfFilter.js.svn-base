/**
 * <p>Desc:缩水工具</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2015</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/9/10 Version 1.0
 */

function Filter(guess) {
	
	/** 投注类型 begin*/
	this.BET_TYPE_SORT_SING = 1; 	// 全排组合单式
	this.BET_TYPE_SORT_COMPLEX = 2; // 全排组合小复式
	this.BET_TYPE_AREA_QJ = 3;		// 区间范围
	this.BET_TYPE_AREA_BONUS = 4;	// 奖金指数
	this.BET_TYPE_AREA_ZB = 5;		// 值博率
	this.BET_TYPE_SS_BZ = 6;		// 标准缩水
	this.BET_TYPE_SS_JD = 7;		// 加胆缩水
	this.BET_TYPE_DT_PT = 8;		// 普通胆拖
	this.BET_TYPE_DT_FZ = 9;		// 分组胆拖
	this.BET_TYPE_DT_FZDJ = 10;		// 分组叠加
	this.BET_TYPE_ZS_BZ = 11;		// 标准注水
	this.BET_TYPE_ZS_LH = 12;		// 冷号注水
	this.BET_TYPE_ZS_KZ = 13;		// 扩展注水
	this.BET_TYPE_SJ_PT = 14;		// 随机
	/** 投注类型end */
	
	/** 常规条件 begin */
	this.ROUTINE_SCHNUM_3 = 100;	// 胜场次数
	this.ROUTINE_SCHNUM_1 = 101;	// 平场次数
	this.ROUTINE_SCHNUM_0 = 102;	// 负场次数
	this.ROUTINE_INTG_SUM = 103;	// 积分和,14场比赛的3、1、0相加之和
	this.ROUTINE_BREAKPOINT = 104;	// 断点数
	this.ROUTINE_EVEN_NUM = 105;	// 连号数
	this.ROUTINE_CNT_3 = 106;		// 主场连胜
	this.ROUTINE_CNT_1 = 107;		// 主场连平
	this.ROUTINE_CNT_0 = 108;		// 主场连负
	this.ROUTINE_CNT_31 = 109;		// 胜平连号
	this.ROUTINE_CNT_30 = 110;		// 胜负连号
	this.ROUTINE_CNT_10 = 111;		// 平负连号
	this.ROUTINE_NEIGH_SUM = 112;	// 邻号间距和
	this.ROUTINE_NEIGH_MUL = 113;	// 邻号乘积和
	this.ROUTINE_CODE_MUL = 114;	// 号码位积和
	this.ROUTINE_REVERSE_MUL = 115;	// 反向位积和
	/** 常规条件 end */
	
	/** 赔率过滤 begin */
	this.ODD_FIRST_ODD = 200;		// 第一赔率
	this.ODD_SECOND_ODD = 201;		// 第二赔率
	this.ODD_THIRD_ODD = 202;		// 第三赔率
	this.ODD_SUM = 203;				// 赔率和
	this.ODD_MUL = 204;				// 赔率积
	this.ODD_BONUS = 205;			// 奖金指数
	this.ODD_AREA_SORT = 206;		// 区间排名
	this.ODD_PROB_MUL = 207;		// 概率积
	this.ODD_PROB_VAL = 208;		// 值博率
	this.ODD_PROB_SUM = 209;		// 概率和
	/** 赔率过滤 end */
	
	/** 匹配过滤 begin */
	this.MATCH_GROUP = 300;			// 分组场次
	this.MATCH_CTN = 301;			// 连续场次
	this.MATCH_HZX = 302;			// 号码和值
	this.MATCH_INTV310 = 303;		// 310间隔
	this.MATCH_BREAKPOINT = 304;	// 断点过滤
	this.MATCH_SING_COMB = 305;		// 单注组合
	this.MATCH_COLD = 306;			// 冷门过滤
	this.MATCH_WIN = 307;			// 命中过滤
	this.MATCH_FEATRUE = 308;		// 特征串
	this.MATCH_LOCATION = 309;		// 定位过滤
	this.MATCH_NUMBER_F = 310;		// 数字特征
	/** 匹配过滤 end */
	
	/** 码型过滤begin */
	this.CODE_ODD = 400;			// 赔率码型
	this.CODE_ODD_CTN = 401;		// 赔率连续
	this.CODE_ODD_F = 402;			// 赔率过滤
	this.CODE_GROUP_ODD = 403;		// 分组赔率
	this.CODE_CNT_F = 404;			// 连续过滤
	this.CODE_C_F = 405;			// 码型过滤
	this.CODE_C_L = 406;			// 号码遗传
	this.CODE_DT_COMB = 407;		// 胆拖组合
	this.CODE_COMM_COMB = 408;		// 常规组合
	this.CODE_COMM_P = 409;			// 相同指标
	/** 码型过滤end */
	
	/** 对比过滤 begin */
	this.COMP_OPEN_F = 500;			// 开奖过滤
	this.COMP_HISTORY = 501;		// 历史排查
	this.COMP_MEDIA = 502;			// 媒体对比
	this.COMP_SUPER_C = 503;		// 超级对比
	this.COMP_SUPER_M = 504;		// 超级媒体
	this.COMP_PM_C = 505;			// 批媒对比
	this.COMP_AVER_WIN = 506;		// 平均命中
	this.COMP_DIST_F = 507;			// 分布过滤
	this.COMP_GROUP_DIST = 508;		// 分组分布
	/** 对比过滤 end */
	
	/** 集合过滤 begin */
	this.SET_JX_RATAIN = 600;		// 交集保留
	this.SET_JX_F = 601;			// 交易滤除
	/** 集合过滤 end */
	
	/** 选择注数 begin */
	this.SELECT_BONUS = 700; 		// 奖金选取，从低到高
	this.SELECT_RADOM = 701;		// 随机选取
	/** 选择注数 end */
	
	/**
	 * 投注方法 流程：投注=》过滤=》代购/合买
	 * @param type，@see 常量定义表
	 * @param betCode，复式投注码
	 * return list，单式号码数组
	 */
	this.bet = function(type, betCode) {
		var list = new Array();
		switch ( type ) {
		}
		return list;
	}
	
	/**
	 * 过滤方法
	 * @param list,单式号码数组
	 * @param expressions,Expression对象,过滤条件数组,格式：1<base1<2
	 */
	this.shrink = function(list, expressions){
		for ( var i = 0; i < expressions.length; i++ ) {
			switch ( expressions[i].type ) {
			case this.ROUTINE_SCHNUM_3:
				list = this.filtSchNum3(list, expressions[i].expr);
				break;
			case this.ROUTINE_SCHNUM_1:
				list = this.filtSchNum1(list, expressions[i].expr);
				break;
			case this.ROUTINE_SCHNUM_0:
				list = this.filtSchNum0(list, expressions[i].expr);
				break;
			case this.ROUTINE_INTG_SUM:
				list = this.filtIntgSum(list, expressions[i].expr);
				break;
			case this.ROUTINE_BREAKPOINT:
				list = this.filtBreakPoint(list, expressions[i].expr);
				break;
			case this.ROUTINE_EVEN_NUM:
				list = this.filtEvenNum(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_3:
				list = this.filtCtnNum3(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_1:
				list = this.filtCtnNum1(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_0:
				list = this.filtCtnNum0(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_31:
				list = this.filtCtnNum31(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_30:
				list = this.filtCtnNum30(list, expressions[i].expr);
				break;
			case this.ROUTINE_CNT_10:
				list = this.filtCtnNum10(list, expressions[i].expr);
				break;
			case this.ROUTINE_NEIGH_SUM:
				list = this.filtNeighSum(list, expressions[i].expr);
				break;
			case this.ROUTINE_NEIGH_MUL:
				list = this.filtNeighMul(list, expressions[i].expr);
				break;
			case this.ODD_FIRST_ODD:
				list = this.oddFilte(list, expressions[i].expr, 1);
				break;
			case this.ODD_SECOND_ODD:
				list = this.oddFilte(list, expressions[i].expr, 2);
				break;
			case this.ODD_THIRD_ODD:
				list = this.oddFilte(list, expressions[i].expr, 3);
				break;
			case this.ODD_SUM:
				list = this.oddCalc(list, expressions[i].expr, 2);
				break;
			case this.ODD_MUL:
				list = this.oddCalc(list, expressions[i].expr, 1);
				break;
			case this.ODD_BONUS:	// 奖金过滤
				list = this.bonusFilte(list, expressions[i].expr);
				break;
			case this.SELECT_BONUS:	// 奖金选取
				list = this.selectBonus(list, expressions[i].expr);
				break;
			case this.SELECT_RADOM:	// 随机选取
				list = this.selectRadom(list, expressions[i].expr);
				break;
			case this.MATCH_COLD:	// 冷门过滤
				list = this.coldFilte(list, expressions[i].expr);
				break;
			case this.MATCH_WIN:	// 命中过滤
				list = this.coldFilte(list, expressions[i].expr);
				break;
			}
		}
		return list;
	}
	
	/* 常规过滤方法 begin */
	/**
	 * 胜场数/平场数/负场数
	 */
	this.filtSchNum = function(list, expression, bet) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				if ( codes[j].split(":")[1] == bet ) {
					index++;
				}
			}
			if ( parseInt(exp[0],10) <= index && parseInt(exp[2],10) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 胜场数 过滤
	 * @param expression,格式：1<base1<2
	 */
	this.filtSchNum3 = function(list, expression) {
		return this.filtSchNum(list, expression, "3");
	}
	/**
	 * 平场数 过滤
	 * @param expression,格式：1<base1<2
	 */
	this.filtSchNum1 = function(list, expression) {
		return this.filtSchNum(list, expression, "1");
	}
	/**
	 * 负场数 过滤
	 * @param expression,格式：1<base1<2
	 */
	this.filtSchNum0 = function(list, expression) {
		return this.filtSchNum(list, expression, "0");
	}
	/**
	 * 积分和过滤
	 */
	this.filtIntgSum = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var sum = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				sum += parseInt(codes[j].split(":")[1],10);
			}
			if ( parseInt(exp[0],10) <= sum && parseInt(exp[2],10) >= sum ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 断点数过滤 一个投注结果中相邻两位3、1、0的变化次数
	 */
	this.filtBreakPoint = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length-1; j++ ) {
				if ( codes[j].split(":")[1] != codes[j+1].split(":")[1] ) {
					index++;
				}
			}
			if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 连号数过滤 
	 */
	this.filtEvenNum = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length-1; j++ ) {
				if ( codes[j].split(":")[1] == codes[j+1].split(":")[1] ) {
					index++;
				}
			}
			if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 主场连续数 过滤
	 */
	this.filtCtnNum = function(list, expression, bet) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length-1; j++ ) {
				if ( codes[j].split(":")[1] == bet && codes[j+1].split(":")[1] == bet ) {
					index++;
				}
			}
			if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 主场连胜数 过滤
	 */
	this.filtCtnNum3 = function(list, expression) {
		return this.filtCtnNum(list, expression, "3");
	}
	/**
	 * 主场连平数 过滤
	 */
	this.filtCtnNum1 = function(list, expression) {
		return this.filtCtnNum(list, expression, "1");
	}
	/**
	 * 主场连胜数 过滤
	 */
	this.filtCtnNum0 = function(list, expression) {
		return this.filtCtnNum(list, expression, "0");
	}
	/**
	 * 胜平连号
	 */
	this.filtCtnNumXX = function(list, expression, bet0, bet1) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length-1; j++ ) {
				if ( (codes[j].split(":")[1] == bet0 && codes[j+1].split(":")[1] == bet1) || (codes[j].split(":")[1] == bet1 && codes[j+1].split(":")[1] == bet0) ) {
					index++;
				}
			}
			if ( parseFloat(exp[0]) <= index && parseFloat(exp[2]) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 胜平连号
	 */
	this.filtCtnNum31 = function(list, expression) {
		return this.filtCtnNumXX(list, expression, "3", "1");
	}
	/**
	 * 胜负连号
	 */
	this.filtCtnNum30 = function(list, expression) {
		return this.filtCtnNumXX(list, expression, "3", "0");
	}
	/**
	 * 平负连号
	 */
	this.filtCtnNum10 = function(list, expression) {
		return this.filtCtnNumXX(list, expression, "1", "0");
	}
	/**
	 * 邻号间距和：相邻两个号码的号码间距之和
	 */
	this.filtNeighSum = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length - 1; j++ ) {
				index += Math.abs(parseInt(codes[j].split(":")[1],10) - parseInt(codes[j+1].split(":")[1],10));
			}
			if ( parseInt(exp[0],10) <= index && parseInt(exp[2],10) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 邻号乘积和：相邻两个号码的乘积之和
	 */
	this.filtNeighMul = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length - 1; j++ ) {
				index += parseInt(codes[j].split(":")[1],10) * parseInt(codes[j+1].split(":")[1],10);
			}
			if ( parseInt(exp[0],10) <= index && parseInt(exp[2],10) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 号码位积和：指14场比赛的3、1、0结果与其序号的乘积之和
	 */
	this.filtWeightMul = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				index += parseInt(codes[i],10) * (j + 1);
			}
			if ( parseInt(exp[0],10) <= index && parseInt(exp[2],10) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 反向位积和：指14场比赛的3、1、0结果与其序号的乘积之和
	 */
	this.filtRevWeightMul = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var index = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				index += parseInt(codes[i],10) * (14 - j);
			}
			if ( parseInt(exp[0],10) <= index && parseInt(exp[2],10) >= index ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/* 常规过滤方法 end */
	
	/**
	 *	数组降序排序函数
	 */
	/* 赔率过滤begin */
	/**
	 * 赔率过滤
	 * @param expression,格式：2<1<3,2<第一赔率<3
	 */
	this.oddFilte = function(list, expression, odex) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var counter = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				var oddArray = guess.getOdds(codes[j].split(":")[0]).split(",");
				var odd = guess.getBetOdds(codes[j].split(":")[0], codes[j].split(":")[1]);
				oddArray.sort(guess.compareASC);//降序
				var idx = odex;
				if ( oddArray.length == 3 ) {
					idx =  idx - 1;
				}
				if ( oddArray[idx] == odd ) {
					counter++;
				}
			}
			if ( parseInt(exp[0]) <= counter && parseInt(exp[2]) >= counter ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/**
	 * 奖金范围
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
	 * 赔率和/积
	 * @param type 1-积，2-和 
	 */
	this.oddCalc = function(list, expression, type) {
		var retList = new Array();
		var exp = expression.split("<");
		for ( var i = 0; i < list.length; i++ ) {
			var base = 0;
			if ( 1 == type ) {
				base = 1;
			}
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				var odd = guess.getBetOdds(codes[j].split(":")[0], codes[j].split(":")[1]);
				if ( 1 == type ) {
					base *= parseFloat(odd);
				} else {
					base += parseFloat(odd);
				}
			}
			if ( parseFloat(exp[0]) <= parseFloat(base) && parseFloat(exp[2]) >= parseFloat(base) ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
	/* 赔率过滤end */
	
	this.compareASC = function (_val1,_val2) {
		if ( parseFloat(_val1.baseBonus) > parseFloat(_val2.baseBonus) ) {
			return 1;
		} else if ( parseFloat(_val1.baseBonus) < parseFloat(_val2.baseBonus) ) {
			return -1;
		} else {
			return 0;
		}
	}
	/**
	 * 奖金选取
	 */
	this.selectBonus = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		list.sort(this.compareASC);
		for ( var i = parseInt(exp[0])-1; i < parseInt(exp[2]); i++ ) {
			retList.push(list[i]);
		}
		return retList;
	}
	
	this.compareRASC = function (_val1,_val2) {
		if ( parseInt(_val1) > parseInt(_val2) ) {
			return 1;
		} else if ( parseInt(_val1) < parseInt(_val2) ) {
			return -1;
		} else {
			return 0;
		}
	}
	
	this.randomSel = function(num, max) {
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
		buf.sort(this.compareRASC);
		return buf;
	}
	/**
	 * 随机选取
	 */
	this.selectRadom = function(list, expression) {
		var retList = new Array();
		var exp = expression.split("<");
		var rodomNum = parseInt(exp[0]);
		if ( rodomNum > list.length ) {
			return retList;
		} 
		if ( rodomNum == list.length ) {
			return list;
		} else {
			var lst = this.randomSel(rodomNum, list.length-1);
			for ( var i = 0; i < rodomNum; i++ ) {
				retList.push(list[lst[i]]);
			}
		}
		return retList;
	}
	/**
	 * 冷门过滤
	 */
	this.coldFilte = function(list, expression) {
		var exp = expression.split(",");
		for ( var o = 0; o < exp.length; o++ ) {
			list = this.coldSubFilte(list, exp[o]);
		}
		return list;
	}
	this.coldSubFilte = function(list, exp) {
		var retList = new Array();
		var map = new Hashtable();
		var cos = exp.split("`")[0].split("|");
		var exps = exp.split("`")[1].split("^");
		for ( var j = 0; j < cos.length; j++ ) {
			map.put(cos[j].split(":")[0], cos[j].split(":")[1]);
		}
		for ( var i = 0; i < list.length; i++ ) {
			var len = 0;
			var codes = list[i].betCode.split("|");
			for ( var j = 0; j < codes.length; j++ ) {
				if ( map.get(codes[j].split(":")[0]).indexOf(codes[j].split(":")[1]) > -1 ) {
					len++;
				}
			}
			if ( parseFloat(exps[0]) <= len && parseFloat(exps[1]) >= len ) {
				retList.push(list[i]);
			}
		}
		return retList;
	}
}

/**
 * 过滤条件封装
 * @return
 */
function Expression(type, expr) {
	this.type = type;
	this.expr = expr;
}