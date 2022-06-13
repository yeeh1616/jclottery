    var chart={
            chart: {
                renderTo: '',
                zoomType: 'xy'
            },
            credits: {       
                enabled: true,       
                text: "www.sporttery.cn",       
                href: "http://www.sporttery.cn",       
                style: {         
                    cursor: "pointer",         
                    color: "#909090",         
                    fontSize: "10px"       
                    }  
            },
            title: {text: '积分排名走势图'},
            //subtitle: {text: '副标题：副标题1'},
            xAxis: [{categories: [ ]}],
            yAxis: [{ // Primary yAxis
                allowDecimals:false,
                reversed:true ,
                labels: {
                    formatter: function() {
                        return this.value +'名';
                    },
                    style: { color: '#89A54E' }
                },
                title: {
                    text: '排名',
                    style: { color: '#89A54E' }
                }
            }, { // Secondary yAxis
                title: {
                    text: '积分',
                    style: { color: '#4572A7' }
                },
                labels: {
                    formatter: function() {
                        return this.value +'分';
                    },
                    style: { color: '#4572A7' }
                },
                opposite: true
            }],
            tooltip: {
                formatter: function() {
                    // return ''+ this.x +': '+ this.y +(this.series.name == '积分' ? ' 积分' : '排名');
                    return ''+ (this.series.name == '积分' ? ' 积分' : '排名')+': '+ this.y;
                }
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: '#FFFFFF'
            },
            series: [{name: '积分', color: '#4572A7',type: 'column',yAxis: 1,data:  []}
            		, {name: '排名',color: '#89A54E',type: 'spline',data: []}]
        };
    var demo ={
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            title: {text: '',style: {fontSize: '12px'} },
            xAxis: {
                categories: ['胜','平','负']
            },
            yAxis: {
                min: 0,
                title: {text: ''}
            },
            legend: {
                enabled:false,
                layout: 'vertical',
                backgroundColor: '#FFFFFF',
                align: 'left',
                verticalAlign: 'top',
                x: 100,
                y: 70,
                floating: true,
                shadow: true
            },
            tooltip: {
                formatter: function() {
                    return ''+ this.x +':'+ this.y +'场';
                }
            },
            plotOptions: {
                column: {
                    dataLabels: {enabled: true},
                    borderWidth: 0
                }
            },
                series: [{
                name: 'Tokyo',
                    data: [ { color:'#bd0402',y: 2},{ color:'#CCCCCC',y: 5},{ color:'#13548c',y: 8}]
    
            }]
        };

    function getChartBar(renderTo,text,h,d,a){
    	demo.chart.renderTo=renderTo;
        demo.title.text=text;    
        (demo.series)[0].data=eval("("+"[ { color:'red',y: "+h+"},{ color:'#CCCCCC',y: "+d+"},{ color:'blue',y: "+a+"}]"+")");  
        //(demo.series)[0].data=data;          
        new Highcharts.Chart(demo);
    }


    function showCharts(){
			
    	getChartBar('div_h_n6','近6场战绩',0,1,5);getChartBar('div_h_n6_h','近6场主场战绩',2,3,1);getChartBar('div_h_n20','近20场战绩',5,7,8);getChartBar('div_h_n20_h','近20场主场战绩',4,6,2);getChartBar('div_h_odds','相似赔率区间战绩',0,0,0);
		
    	getChartBar('div_a_n6','近6场战绩',0,1,5);getChartBar('div_a_n6_h','近6场客场战绩',3,2,1);getChartBar('div_a_n20','近20场战绩',9,4,7);getChartBar('div_a_n20_h','近20场客场战绩',6,4,4);getChartBar('div_a_odds','相似赔率区间战绩',0,0,0);
		
    	getChartBar('div_t1_n6','近6场战绩',0,0,0);getChartBar('div_t1_n6_h','近6场主场战绩',0,0,0);getChartBar('div_t1_n20','近20场战绩',0,0,0);getChartBar('div_t1_n20_h','近20场主场战绩',0,0,0);getChartBar('div_t1_odds','相似赔率区间战绩',0,0,0);
		
    	getChartBar('div_t2_n6','近6场战绩',0,0,0);getChartBar('div_t2_n6_h','近6场客场战绩',0,0,0);getChartBar('div_t2_n20','近20场战绩',0,0,0);getChartBar('div_t2_n20_h','近20场客场战绩',0,0,0);getChartBar('div_t2_odds','相似赔率区间战绩',0,0,0);
							
    }

    
    
    $(document).ready(function() {
	/*
		data = "[{categories: [ ]}]";
    	data = eval("("+data+")");
    	chart.xAxis.push(data);
        chart = new Highcharts.Chart(chart);*/
        showCharts();
    	getChartDate();
    	
    });

function getChartDate(){
	$.ajax({ 
	  	url: "http://info.sporttery.cn/football/info/fb_match_trendChart_getDate.php",
	  	data:{method:"getChartDate",m:"67217",a:Math.random() },
	  	type: "POST",
	  	dataType: "json",
		success: function(data){
       		alert("好吧");
			//alert(data.c.b);
       		//alert("title"+data.title);
			//alert((chart.series)[0].data);
			//data = eval("("+data.xAxis+")");
	    	//chart.xAxis.push(data.xAxis);
	    	chart.chart.renderTo="container_t1";
	    	chart.title.text="莱昂积分排名走势图";
	    	chart.xAxis[0].categories=data.t1.xAxis;
	    	(chart.series)[0].data=data.t1.score;
	    	(chart.series)[1].data=data.t1.order;
	        var chart1 = new Highcharts.Chart(chart);
	    	chart.chart.renderTo="container_t2";
	    	chart.title.text="蒂华纳积分排名走势图";
	    	chart.xAxis[0].categories=data.t2.xAxis;
	    	(chart.series)[0].data=data.t2.score;
	    	(chart.series)[1].data=data.t2.order;
	        var chart2 = new Highcharts.Chart(chart);
		}
	});
}


function jump_link(){
	var mid = $("#jump_mid").val();
	window.location.href="/football/info/fb_match_order.php?m="+mid+"";
}