$(document).ready(function (){
	contentDetail();
});

function contentDetail(){
	//$("#contentDetail_").html("<tr><td colospan=20>aaaaaaaaaaaaa</td></tr>");
	try {
		var content = "";
		for ( var i = 0; i < schs.length; i++ ) {
			  if(i%2 == 0)
					content = content + '<tr>';
				else
					content = content + '<tr class="even">';
				
				content = content + '<td><div class="c0">'+schs[i].id+'</div></td>';
				content = content + '<td class="" bgcolor="#'+schs[i].bgcolor+'" style="color:#fff"><div class="c1">'+schs[i].league+'</div></td>';
				content = content + '<td><div class="c2">'+(schs[i].gametime=="null"?"--":schs[i].gametime)+'</div></td>';
				content = content + '<td><div class="c3">'+schs[i].host+'</div></td>';
				content = content + '<td><div class="c4"><span class="orange">'+schs[i].rq+' </span></div></td>';
				content = content + '<td><div class="c5">'+schs[i].guest+'</div></td>';
				content = content + '<td><div class="c6">'+schs[i].score+'</div></td>';
				content = content + '<td><div class="c7"><p><span class="v0">'+schs[i].rqspf+'</span></p></div></td>';
				content = content + '<td><div class="c8"><p><span class="v0">'+schs[i].spf+'</span></p></div></td>';
				content = content + '<td><div class="c9"><p><span class="v0">'+schs[i].zqj+'</span></p></div></td>';
				content = content + '<td><div class="c10"><p><span class="v0">'+schs[i].bqc+'</span></p></div></td>';
				content = content + '</tr>';
		}
		$(content).appendTo($("#contentDetail_"));
	} catch ( ex ) {}
}