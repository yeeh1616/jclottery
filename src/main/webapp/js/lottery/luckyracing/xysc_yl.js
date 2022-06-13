$(function(){

	// 表格排序
	var table = $("#tdata"),
		thead = table.find("thead"),
		tbody = table.find("tbody"),
		f_table = $("#float-table"),
		f_thead;
	if (tbody.length == 0) {
		return;
	}
	f_table.append(table.find("colgroup")[0].cloneNode(true)).append(thead[0].cloneNode(true)).show();
	f_thead = f_table.find("thead");
	tbody = tbody[0];
	var rows;
	try {
		rows = Array.prototype.slice.call(tbody.rows, 0)
	} catch (e) {
		rows = [];
		for (var i = 0, _rows = tbody.rows; i < _rows.length; ++ i) {
			rows.push(_rows[i]);
		}
	}
	var range = [];
	for (var i = 0; i < rows.length; ++ i) {
		range.push(i);
	}
	function init(i) {
		$(this).click(sort).css("cursor", "pointer").attr("title", "排序").attr("data-i", i);
	}
	var ths = thead.find("th:lt(10)").each(init).add(f_thead.find("th:lt(10)").each(init));
	var txt = "innerHTML",
		div = document.createElement("div");
	if ("textContent" in div) {
		txt = "textContent";
	} else if ("innerText" in div) {
		txt = "innerText";
	}
	div = null;
	function sort() {
		var th = $(this),
			i = + th.attr("data-i"),
			order = (th.attr("data-o") || (i == 0 ? "desc" : "asc")) == "desc" ? "asc" : "desc";
		ths.removeAttr("data-o").find("i").remove();
		ths.filter("[data-i=" + i + "]").attr("data-o", order).
				append('<i class="' + (order == "asc" ? "up" : "down") + '"></i>');
		var temp = range.slice(0);
		temp.sort(function(a, b){
			var c = rows[a].cells[i][txt],
				d = rows[b].cells[i][txt];
			if (i == 0) {
				var r = c > d ? 1 : (c < d ? -1 : 0);
				return order == "asc" ? r : - r;
			} else {
				if (i == 3) {
					c = + c.replace(/%/, "");
					d = + d.replace(/%/, "");
				} else {
					c = + c;
					d = + d;
				}
				return order == "asc" ? c - d : d - c;
			}
		});
		for (var i = 0; i < temp.length; ++ i) {
			tbody.appendChild(rows[temp[i]]);
		}
	}
	// 标注 欲出几率 前三位
	(function(){
		var i = 8;
		var temp = range.slice(0);
		temp.sort(function(a, b){
			var c = + rows[a].cells[i][txt],
				d = + rows[b].cells[i][txt];
			return d - c;
		});
		for (var j = 0; j < temp.length && j < 3; ++ j) {
			var cell = rows[temp[j]].cells[i];
			cell.style.color = "#fff";
			cell.style.backgroundColor = "#f60";
		}
	})();
	
	// 浮动表头
	var pw = $(window);
	if($("#tdata").length>0){
		var fixedBox = $("#loadTheadWrap");
		$("#float-table").html();
		pw.bind('scroll',function(){
			if(pw.scrollTop() >= $("#tdata").offset().top){
				if(!-[1,]&&!window.XMLHttpRequest){			  
					$("#loadTheadWrap").css({"display":"block","position":"absolute","top":pw.scrollTop()+'px'});
				}else{
					$("#loadTheadWrap").css({"display":"block","top":pw.scrollTop()+'px'});
				}
			}else{
				$("#loadTheadWrap").hide();
			}
		});
	}
})