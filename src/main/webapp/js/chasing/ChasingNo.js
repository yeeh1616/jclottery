/**
 * <p>Desc:追号类</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p>
 * Added by Luochang at 2014/8/6 Version 1.0
 */
function ChasingNo() {
	
	/**
	 * 生成追号期次(高频)
	 * @param day, 格式：yyyyMMdd，例：20140826
	 * @param startIssue,其实期号，例：1
	 * @param endIssue,截止期号（最大期号），84
	 * @param bit,位数，一般两位，如：2014082601，也有三位：20140826001
	 */
	this.createChasingIssue = function(day, startIssue, endIssue, bit) {
		var list = new Array();
		for ( var i = startIssue; i <= endIssue; i++ ) {
			if ( bit == 2 ) {
				if ( i < 10 ) {
					list.push(day + "0" + i);
				} else {
					list.push(day + "" + i);
				}
			} else if ( bit == 3 ) {
				if ( i < 10 ) {
					list.push(day + "00" + i);
				} else if ( i < 100 ) {
					list.push(day + "0" + i);
				} else {
					list.push(day + "" + i);
				}
			}
		}
		return list;
	}
	
	/**
	 * 生成高级追号计划表
	 * @param issueNum, 总共追期数
	 * @param startMult, 起始倍数
	 * @param profitMode, 盈利模式 1-全程盈利，2-设置前几期与后几期盈利
	 * @param totalRate, 全程盈利率，在设置profitMode=1时有效
	 * @param startProfitIssueNum, 前几期，在设置profitMode=2时有效
	 * @param startProfitRate，前几期盈利率，在设置profitMode=2时有效
	 * @param afterProfitRate,后几期盈利率，在设置profitMode=2时有效
	 * @param planProfit,计划理论盈利率不低于（元）, 值为0时不做判断
	 * @param betMoney,单倍投注金额
	 * @param theoryBonus, 单倍玩法的理论奖金，存在奖金范围的情况下使用","分割
	 * 
	 * @return SeniorChasing对象列表
	 */
	this.createSeniorCsPlan = function(issueNum, startMult, profitMode, totalRate, 
			startProfitIssueNum, startProfitRate, afterProfitRate, planProfit, betMoney, theoryBonus) {
		var list = new Array();
		var num = 0;	// 剩余期数
		var totalMoney = 0;	// 累计投入资金
		var minBonus = 0, maxBonus = 0;	// 单倍最小奖金与最大奖金
		if ( theoryBonus.indexOf(',') == -1 ) {
			maxBonus = parseFloat(theoryBonus);
		} else {
			maxBonus = parseFloat(theoryBonus.split(",")[1]);
			minBonus = parseFloat(theoryBonus.split(",")[0]);
		}
		while ( num < issueNum ) {
			var sc = new SeniorChasing();
			var mul = startMult;
			var minRate = 0, maxRate = 0;
			/* 先计算初始倍数盈利率，与设置的全程盈利率做比较 */
			maxRate = parseFloat((maxBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
			if ( profitMode == 1 ) {	// 全程盈利模式
				if ( maxRate < totalRate ) {
					// 已盈利率为标准重新计算倍数
					mul = parseInt((totalMoney * ( totalRate + 1 )) / (maxBonus - betMoney * (totalRate + 1))) + 1;
					maxRate = parseFloat((maxBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
				}
				
			} else if ( profitMode == 2 ) {	// 前几期和后几期不同盈利率模式
				if ( num < startProfitIssueNum ) {
					if ( maxRate < startProfitRate ) {
						// 已盈利率为标准重新计算倍数
						mul = parseInt((totalMoney * ( startProfitRate + 1 )) / (maxBonus - betMoney * (startProfitRate + 1))) + 1;
						maxRate = parseFloat((maxBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
					}
				} else {
					if ( maxRate < afterProfitRate ) {
						// 已盈利率为标准重新计算倍数
						mul = parseInt((totalMoney * ( afterProfitRate + 1 )) / (maxBonus - betMoney * (afterProfitRate + 1))) + 1;
						maxRate = parseFloat((maxBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
					}
				}
			}
			if ( planProfit > 0 ) {	// 计划理论盈利
				// 判断理论奖金是否大于计划盈利资金
				if ( planProfit > maxBonus * mul ) {
					// 重新计算倍数
					mul = parseInt(planProfit / maxBonus) + 1;
					maxRate = parseFloat((maxBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
				}
			}
			if ( minBonus > 0 ) {
				// 最小理论奖金
				minRate = parseFloat((minBonus * mul - (totalMoney + betMoney * mul)) / (totalMoney + betMoney * mul));
			}
			totalMoney = totalMoney + betMoney * mul;
			sc.currBetMoney = betMoney * mul;
			sc.currTotolMoney = totalMoney;
			sc.multiple = mul;
			if ( theoryBonus.indexOf(',') == -1 ) {
				sc.profitRate = new Number(maxRate*100).toFixed(2) + "%";
				sc.theoryBonus = maxBonus * mul;
			} else {
				sc.profitRate = new Number(minRate*100).toFixed(2) + "%" + "~" + new Number(maxRate*100).toFixed(2) + "%";
				sc.theoryBonus = minBonus * mul + "~" + maxBonus * mul;
			}
			
			num++;
			list.push(sc);
		}
		
		return list;
	}
}

/**
 * 高级追号结构
 */
function SeniorChasing(multiple, currBetMoney, currTotolMoney, theoryBonus, profitRate) {
	this.multiple = multiple;				// 倍数
	this.currBetMoney = currBetMoney;		// 当前投入
	this.currTotolMoney = currTotolMoney;	// 累计投入
	this.theoryBonus = theoryBonus;			// 理论奖金
	this.profitRate = profitRate;			// 盈利率
}