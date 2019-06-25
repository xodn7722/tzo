<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="search.bean.vd.*"%>
<%@ page import="job.bean.vd.*" %>
<%@ page import ="java.util.*" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('input[name="Job_cd"]').change(function() {
		    var values = $(this).val();              // value
		    var checked = $(this).prop('checked');  // checked 상태 (true, false)
		    var count = $('input:checkbox[name="Job_cd"]:checked').length;
		    // checked ? $label.css('background-color', value) : $label.css('background-color', 'white');
			if(checked){
		    	console.log(values);
		    	 $.ajax({
						type : "post",
						url : "SearchP.jsp",
						data : { jv : values },
						success : test3
					});	
		    	
			}
		  	
		    else{
		    	console.log("error");
		    	 var $li_id = $("#ss");
		    	 $li_id.remove();
		    }
		});
	});
	function test3(data){	$("#Search_P").append(data);		}
	</script>
<%
	int jno = Integer.parseInt(request.getParameter("jsno"));
	SearchDAO serch = SearchDAO.getInstance();
	ArrayList <JobSubVO> jslist = serch.getAllSubJob(jno);

	// DAO 생성후 no 전달 값을 받아온다..
	
%>

	<% for(int i = 0 ; i < jslist.size() ; i++){ 
		JobSubVO jsvo = jslist.get(i);
		%>
             <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="<%=jsvo.getJsno() %>" name="Job_cd" value ="<%=jsvo.getJsname()%>">
                                    <label for="<%=jsvo.getJsno() %>"><span class="txt"><%=jsvo.getJsname() %></span></label>
                                </div>
                            </li>
           
	<%} %>		