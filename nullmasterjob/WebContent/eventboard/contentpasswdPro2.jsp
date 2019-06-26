<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.bean.vd.*" %>

<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title>회원탈퇴</title>

</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String passwd = request.getParameter("passwd");

	BoardDBBean dbPro = BoardDBBean.getInstance();
    int check = dbPro.viewArticle(num,passwd);
	
	if(check==1){%>

<body >
	

	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
			<script>
	     window.location="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>"
	        </script>

<%}else {%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%}%>
		
		</div>
		<hr>
	</div>
	
</body>
