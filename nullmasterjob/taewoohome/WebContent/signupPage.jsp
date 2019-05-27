<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="web.bean.vo.Product"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body>
<%if(session.getAttribute("loginID") == null){%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		<jsp:include page="signupform.jsp" />
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<%}else{ %>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		로그인중입니다<br/>
		회원가입을하시려면 로그아웃을해주세요<br/>
		로그아웃하시겠습니까?<button onclick="window.location='logout.jsp'"> 로그아웃 </button>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<%} %>
</body>
</html>
