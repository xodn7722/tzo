<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     
     if(session.getAttribute("loginID") == null){
	 response.sendRedirect("loginForm.jsp");
     }
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그아웃하시겠습니까?</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		<h2><%= session.getAttribute("loginID") %>님이 로그인중입니다</h2>
        <button onclick="window.location='logout.jsp'"> 로그아웃 </button>
        <button onclick="window.location='userInfo.jsp'">회원정보</button>
        <button onclick="window.location='mylist.jsp'">내글보기</button>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

