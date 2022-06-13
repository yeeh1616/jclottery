$(document).ready(function (){
	contentDetail();
});

function contentDetail(){
	try {
		var content = "";
		for ( var i = 0; i < schs.length; i++ ) {
			  if(i%2 == 0)
					content = content + '<tr>';
				else
					content = content + '<tr class="even">';
				
			  content = content + '<td><div class="c0_b">'+schs[i].id+'</div></td>';
			  content = content + '<td class="" bgcolor="#'+schs[i].reserved1+'" style="color:#fff"><div class="c1_b">'+schs[i].leagueName+'</div></td>';
			  content = content + '<td><div class="c2_b">'+(schs[i].raceTime=="null"?"--":schs[i].raceTime)+'</div></td>';
			  content = content + '<td><div class="c3_b">'+schs[i].hostTeam+'</div></td>';
			  content = content + '<td><div class="c4_b"><span class="orange">'+schs[i].rq+' </span></div></td>';
			  content = content + '<td><div class="c5_b">'+schs[i].guestTeam+'</div></td>';
			  content = content + '<td><div class="c6_b">'+(schs[i].allScore == ""?"--":schs[i].allScore)+'</div></td>';
			  content = content + '<td><div class="c7_b">'+(schs[i].halfScore == ""?"--":schs[i].halfScore)+'</div></td>';
			  content = content + '</tr>';
		}
		$(content).appendTo($("#contentDetail_"));
	} catch ( ex ) {}
}