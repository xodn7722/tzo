<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="resume.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css?ver=1">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
 <style>
    body { 
      margin: 0px;
      padding: 0px;
    }
    
    .header{
     position:   fixed;
     top: 	1;
     right:       1;
   	 width:      100%;
   	 height:     32px;
    }
    
    .border {
    	width: 400px;
    	height: 350px;
    	border: 2px solid black;
    }
    
    .null {
    	height: 50px;
    }
    
      .wrap {
      width: 500px;
    }
    .wrap textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }

    textarea:disabled{
    	width: 800px;
    	background-color: white;
    	resize: none;
    	border: 0;
    	overflow-y:hidden;
    } 
    
    table {
  border-spacing: 10px;
  border-collapse: separate;
	}
	table td {
  width: 200px;
	}
  </style>

<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	ResumeDAO dao = ResumeDAO.getInstance();
	ResumeVO vo = dao.getResume(index);
	
%>

  <script type="text/javascript">
  $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
  
  function del(){
	  var result = confirm("정말로 삭제하시겠습니까?");
	  if(result){
		  alert("삭제되었습니다.");
		  window.location.href = "processDelete.jsp?code=<%=vo.getResume_code()%>";
	  }
  }
  function up(){
	  window.location.href = "formUpdateResume.jsp?code=<%=vo.getResume_code()%>";
  }
  
  </script>
<title><%=vo.getResume_title() %></title>
</head>
<body>
<jsp:include page="/menu/menu.jsp" />
<div class="null"> </div>
	<div class="container">
		<div class="row" align="center">
		<div class="col-md-5">
		<h1><%=vo.getResume_title() %></h1> <br/>
			</div>
			<div class="container">
			<div class="text-left">
				<h3>경력</h3>
				 <div class="wrap">
				<textarea  disabled ><%=vo.getCareer() %></textarea> <br>
				</div>
				<h3>학력</h3>
				 <div class="wrap">
				<textarea  disabled ><%=vo.getAcademic() %></textarea>
				</div>
				<h3>자기소개</h3>
				 <div class="wrap">
				<textarea  disabled ><%=vo.getIntro() %></textarea>
				</div>
			
			</div>
			</div>
			</div>
			</div>
				<div class="container">
					<div class="row" align="right">
					<div class="col-md-10">
						<input type="button" class="btn btn-info" value="삭제하기" onclick="return del();">
						<input type="button" class="btn btn-primary" value="수정하기" onclick="return up()">
						</div>
					</div>
				</div>
	</body>
</html>