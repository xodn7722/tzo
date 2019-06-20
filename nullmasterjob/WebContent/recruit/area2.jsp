<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="web.bean.dao.SearchDAO" %>
<%@ page import ="web.bean.vo.AreaVO" %>
<%@ page import ="java.util.*" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('input[name="loc_cd"]').change(function() {
		    var values = $(this).val();              // value
		    var checked = $(this).prop('checked');  // checked 상태 (true, false)
		    var count = $('input:checkbox[name="loc_cd"]:checked').length;
		    if(checked){
		    	console.log(values);
		   	 $.ajax({
					type : "post",
					url : "AreaP.jsp",
					data : { areaP : values },
					success : test3
				});	
	    	
		    }
		  	
		    else{
		    	console.log("error");
		    	 var $li_id = $("#as");
		    	 $li_id.remove();
		    }
		    
		});
	});
	function test3(data){	$("#Search_P").append(data);		}
	</script>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	SearchDAO serch = SearchDAO.getInstance();
	ArrayList <AreaVO> alist = serch.getAllLocation(no);

	// DAO 생성후 no 전달 값을 받아온다..
	
%>  
	<% for(int i = 0 ; i < alist.size() ; i++){ 
		AreaVO avo = alist.get(i);
		%>
	<li>
		<div class="sri_input3" >
			<input type="checkbox" id="<%=avo.getAsno() %>" name="loc_cd" value="<%=avo.getAsname() %>">
			<label for="<%=avo.getAsno()%>"><span class="txt"><%=avo.getAsname() %></span></label>
		</div>
	</li>

		<%} %>
	