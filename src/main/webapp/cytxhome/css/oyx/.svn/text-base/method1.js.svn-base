if( typeof $$ == 'undefined' ) $$ = function(id){ return document.getElementById(id) };
if( typeof _I=='undefined' )_I = function(t,c){ t.innerHTML=c }; 
var SIO = false;
var opts = {}
opts.randomURL = true;
var data_tunnel = $$('mark_odds'); 
SIO = new IO.Script(opts, data_tunnel);
  
function show_zhuliu(){
  	for(i=1;i<=64;i++){
		if($$("mark_"+i).value>20){
			$$("ids_"+i).style.display="none";
			$$("mark_"+i).checked=false;
		}else{
			$$("ids_"+i).style.display="";
			$$("mark_"+i).checked=true;
		}
	}
}
function show_select(){
	for(i=1;i<=64;i++){
		if($$("mark_"+i).checked==true){
			$$("ids_"+i).style.display="";
		}else{
			$$("ids_"+i).style.display="none";
		}
	}
}
function show_fanxuan(){
	for(i=1;i<=64;i++){
		if($$("mark_"+i).checked==true){
			$$("mark_"+i).checked=false;
		}else{
			$$("mark_"+i).checked=true;
		}
	}
}
function show_all(){
	for(i=1;i<=64;i++){
		$$("mark_"+i).checked=true;
		$$("ids_"+i).style.display="";
	}
}
function show(mid,markid){
	SIO.load('fb_his_interface.php?action=tip_odds&mid='+mid+'&markid='+markid);
	var evt = window.event || arguments.callee.caller.arguments[0]; // 获取event对象
	var src = evt.srcElement || evt.target;  // 获取触发事件的源对象
	var textDiv=document.getElementById("show");
	textDiv.style.left=evt.clientX + "px";
	if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft )){
		textDiv.style.top=document.documentElement.scrollTop + evt.clientY + "px"; 
	}else if(document.body && (document.body.scrollTop || document.body.scrollLeft )){
		textDiv.style.top=document.body.scrollTop + evt.clientY + "px"; 
	}
	textDiv.style.display='';
}
function Hidden(){
	document.getElementById("show").style.display="none";
}
//浮层 add by liyj on 2013-06-13
$(document).ready(function(){
  $('#data_content').waypoint(function(event, direction) {
    if (direction === 'down') {
      $('#floatingdiv').css({'position':'fixed','top':0});
    } else {
      $('#floatingdiv').css({'position':'static','top':150});
    }
  });
});