/*底部固定*/
$(function(){
	//确认购买设胆弹出层
	$("#shedan").click(function(){
		var s=$(this).attr("class");
		if(s=='sel'){
			$(this).removeClass("sel");
			$(".w_xxiang").hide();
		}else{
			$(this).addClass("sel");
			$(".w_xxiang").show();
		}
	});
	$(".close").click(function(){
		$("#shedan").removeClass("sel");
		$(".w_xxiang").hide();
	});	
	//显示过关方式层
		$("#showMethod").click(function(){
		var s=$(this).attr("class");
		if(s=='sel2'){
			$(this).removeClass("sel2");
			$(".w_Contrast").hide();
		}else{
			$(this).addClass("sel2");
			$(".w_Contrast").show();
		}
	});
	$(".close2").click(function(){
		$("#showMethod").removeClass("sel2");
		$(".w_Contrast").hide();
	});	
});
/*展开*/
$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open_d');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), true);
});
/*展开*/
$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link2');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open_c');

		if (!e.data.multiple) {
			$el.find('.day_list').not($next).slideUp().parent().removeClass('open_new');
		};
	}	

	var accordion = new Accordion($('.sx_list'), true);
});
