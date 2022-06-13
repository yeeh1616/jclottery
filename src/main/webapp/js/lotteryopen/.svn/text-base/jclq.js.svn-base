$(document).ready(function (){
	contentDetail();
});

function contentDetail(){
	//$("#contentDetail_").html("<tr><td colospan=20>aaaaaaaaaaaaa</td></tr>");
	var content = "";
	for ( var i = 0; i < schs.length; i++ ) {
		  var rq_yszf = schs[i].rq;
		  var rq = '';
		  var yszf = '';
		  if(rq_yszf.split(',').length == 2 ){
		  	rq = rq_yszf.split(',')[0];
		  	yszf = rq_yszf.split(',')[1];	
		  }
		  if(i%2 == 0)
				content = content + '<tr>';
			else
				content = content + '<tr class="even">';
			content = content + '<td><div class="c0">'+schs[i].id+'</div></td>';
			content = content + '<td class="" bgcolor="#'+schs[i].bgcolor+'" style="color:#fff"><div class="c1">'+schs[i].league+'</div></td>';
			content = content + '<td><div class="c2">'+(schs[i].gametime=="null"?"--":schs[i].gametime)+'</div></td>';
			content = content + '<td><div class="c3">'+schs[i].guest+'</div></td>';
			content = content + '<td><div class="c4"><span class="orange">'+rq+' </span></div></td>';
			content = content + '<td><div class="c5">'+schs[i].host+'</div></td>';
			content = content + '<td><div class="c6">'+schs[i].score+'</div></td>';
			content = content + '<td><div class="c7"><p><span class="v0">'+schs[i].sf+'</span></p></div></td>';
			content = content + '<td><div class="c8"><p><span class="v0">'+schs[i].rqsf+'</span></p></div></td>';
			content = content + '<td><div style="width:57px"><p><span class="v0">'+schs[i].sfc+'</span></p></div></td>';
			content = content + '<td><div style="width:177px"><p><span class="v0">'+yszf+'</span><span class="v1 orange">'+schs[i].dxf+'</span></p></div></td>';
			content = content + '</tr>';
	}
	$(content).appendTo($("#contentDetail_"));
}