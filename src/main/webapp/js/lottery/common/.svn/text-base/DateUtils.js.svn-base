
function DateUtils() {
	this.weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
	this.weekDay2 = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
	
	this.getWeekDay = function(dateStr) {
		 //var dateStr = "2008-08-08 08:08:08";
	     var myDate = new Date(Date.parse(dateStr.replace(/-/g, "/")));
	     return this.weekDay[myDate.getDay()];
	}
	
	this.getWeekDay2 = function(dateStr) {
	     var myDate = new Date(Date.parse(dateStr.replace(/-/g, "/")));
	     return this.weekDay2[myDate.getDay()];
	}
	
	/**
	 * 竞彩截止时间格式化
	 */
	this.formatGuessDate = function(dateStr, ahead) {
		if ( dateStr.length == 16 ) {
			dateStr = dateStr + ":00";
		}
		if ( parseInt(ahead, 10) > 60 ) {
			return dateStr;
		}
		var ss = dateStr.split(" ");
		var yearMonDay = ss[0].split("-");
		var hourMonSs = ss[1].split(":");
		var retObj = "";
		if ( parseInt(hourMonSs[1], 10) >= parseInt(ahead ,10) ) {
			var m = parseInt(hourMonSs[1], 10) - parseInt(ahead, 10);
			if ( m  < 10 ) {
				m = "0" + m;
			}
			retObj = ss[0] + " " + hourMonSs[0] + ":" + m + ":" + hourMonSs[2];
		} else {
			if ( parseInt(hourMonSs[0], 10) == 0 ) {
				var year = yearMonDay[0];
				var month = yearMonDay[1];
				var day = yearMonDay[2];
				if ( parseInt(day, 10) == 1 ) {
					// 最后一天
					if ( parseInt(month, 10) == 1 ) {
						year =  parseInt(year) - 1;
						month = 12;
						day = 31;
						var m = 60+parseInt(hourMonSs[1], 10) - parseInt(ahead, 10);
						if ( m  < 10 ) {
							m = "0" + m;
						}
						retObj = year + "-" + month + "-" +day+ " " + "23:" + m + ":" + hourMonSs[2];
					} else {
						month = parseInt(month, 10) - 1;
						day = this.getMonthDays(year, month);
						var m = 60+parseInt(hourMonSs[1], 10) - parseInt(ahead, 10);
						if ( m  < 10 ) {
							m = "0" + m;
						}
						if ( month  < 10 ) {
							month = "0" + month;
						}
						retObj = year + "-" + month + "-" +day+ " " + "23:" + m + ":" + hourMonSs[2];
					}
				} else {
					day = parseInt(day, 10) - 1;
					var m = 60+parseInt(hourMonSs[1], 10) - parseInt(ahead, 10);
					if ( m  < 10 ) {
						m = "0" + m;
					}
					if ( day  < 10 ) {
						day = "0" + day;
					}
					retObj = year + "-" + month + "-" +day+ " " + 23 + ":" + m + ":" + hourMonSs[2];
	
				}
			} else {
				var hour = hourMonSs[0];
				hour = parseInt(hour, 10) - 1;
				var m = 60+parseInt(hourMonSs[1], 10) - parseInt(ahead, 10);
				if ( m  < 10 ) {
					m = "0" + m;
				}
				if ( hour  < 10 ) {
					hour = "0" + hour;
				}
				retObj = ss[0]+ " " + hour + ":" + m + ":" + hourMonSs[2];

			}
		}
		return retObj;
	}
	
	this.isPinYear = function(year)//判断是否闰平年
	{
		yeas = parseInt(year,10);
	    return(0 == year%4 && (year%100 !=0 || year%400 == 0));
	}
	
	this.getMonthDays = function(year, month) {
		var days = 31;
		if ( parseInt(month, 10) == 2 ) {
			if ( this.isPinYear(year) ) {
				days = 29;
			} else {
				days = 28;
			}
		} else if ( parseInt(month, 10) == 4 || parseInt(month, 10) == 6 || parseInt(month, 10) == 9 || parseInt(month ,10) == 11 ) {
			days = 30;
		}
		return days;
	}
}