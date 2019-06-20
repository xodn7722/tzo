<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    var queryObject = "";
    var queryObjectLen = "";
   
    function formSubmit(){
	    $.ajax({
	        type : 'POST',
	        url : 'data_rr.jsp',
	        data : {params:$("#sel2").val() },
	        dataType : 'json',
	        success : function(data) { 
	            queryObject = eval('(' + JSON.stringify(data,null,2) + ')');
	            // stringify : ì¸ìë¡ ì ë¬ë ìë°ì¤í¬ë¦½í¸ì ë°ì´í°(ë°°ì´)ë¥¼ JSONë¬¸ìì´ë¡ ë°ê¾¸ê¸°.   
	            // eval: javascript ì½ëê° ë§ëì§ ê²ì¦íê³  ë¬¸ìì´ì ìë°ì¤í¬ë¦½í¸ ì½ëë¡ ì²ë¦¬íë í¨ì 
	            // queryObject.barlist[0].city ="korea"
	 
	            queryObjectLen = queryObject.dustlist.length;
	            // queryObject.empdetails ìë 3ê°ì Json ê°ì²´ê° ìì 
	            // alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
	            drawChart();
	        },
	        error : function(xhr, type) {
	            alert('server error occoured')
	        }
	    });
    }
    
    
    
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      
	/*	var result = new Array();
		var data2 = ['Element', 'Density', { role: 'style' }];
		result[0] = data2;
     for (var i = 0; i < queryObjectLen; i++) {
    	 var data3 = new Array();
    	 var car = queryObject.dustlist[i].car;
         var sal = queryObject.dustlist[i].sal;
         data3[0]=car;
         data3[1]=sal;
         data3[2]='gold';
         result[i+1] =data3;
     } */  
     var data = new google.visualization.DataTable();
     data.addColumn('string','car');
     data.addColumn('number','sal');
     
     for( var i = 0 ; i < queryObjectLen; i++){
    	 var car = queryObject.dustlist[i].car;
    	 var sal = queryObject.dustlist[i].sal;
     
     data.addRows([[car,sal]]);
     
     }
     
      /* var data = google.visualization.arrayToDataTable(data2); */
     
      var options = {
    		  title: '직업별연봉',
    		  hAxis:{
    			  ticks:['신입','1년','2년','3년','4년','5년','6년','7년','8년','9년','10년'],
    			  title:'경력',
    			
        		  },
    		  vAxis:{
    			  ticks:[1000,2000,3000,4000,5000,6000],
    			  title:'연봉',
    		  },
    		  width: 1000,
    	        height: 600,
    	        
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
      chart.draw(data, options);
  }
  </script>
  
</head>
<body>
 
 <div><jsp:include page="/menu/menu.jsp"/></div>
 
  <div align="center">
    <div id="chart_div"></div>
    
   
<form name="sel" id="sel">
<select name="sel2" id="sel2">
<option>개발</option>
<option>게임제작</option>
<option>고객서비스,리테일</option>
<option>디자인</option>
<option>마케팅,광고</option>
<option>미디어</option>
<option>비즈니스</option>
<option>투자,분석</option>

</select>
<input type="button" value="연봉보기" onclick="formSubmit()" />
</form>
</div>

</body>
</html>