<!DOCTYPE html>
<html>
<head>
<title>Google chart </title>
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
    	var params = $("#sel").serialize();
    
    $.ajax({
        type : 'POST',
        url : 'data_rr.jsp',
        dataType : 'json',
        success : function(data) { 
            queryObject = eval('(' + JSON.stringify(data,null,2) + ')');
            // stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
            // eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
            // queryObject.barlist[0].city ="korea"
 
            queryObjectLen = queryObject.dustlist.length;
            // queryObject.empdetails 에는 3개의 Json 객체가 있음 
            // alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
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
    		  hAxis:{
    			  title:'경력',
    			
        		  },
    		  vAxis:{
    			  ticks: [0,1000,2000,3000,4000,5000]
    		  },
    		  width: 1000,
    	        height: 800,
    	        
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
      chart.draw(data, options);
  }
  </script>
    
</head>
<body>
    <div id="chart_div"></div>
<form name="sel" id="sel">
<select>
<option>sm</option>
<option>si</option>
<option>s</option>
</select>
<input type="button" value="ajax" onclick="formSubmit()" />
</form>

</body>
</html>