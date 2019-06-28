<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">


	<%
	String id = null;
	if (session.getAttribute("loginID") == null){ %>
	<script>
		alert("악용 방지");
		location.href="../main.jsp";
	</script>
<%}
	int code = Integer.parseInt(request.getParameter("code"));
%>
<title>추천하기</title>
</head>
<body>
	<center>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">추천하기</h3>
			<form name="form"class="form-signin" action="processNominator.jsp?code=<%=code %>" method="post" >
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">추천인 이메일</label>
					<input type="email" class="form-control" placeholder="추천인 이메일" name="applicant" required autofocus>
				</div>
		
				<div class="form-group">
					<label for="end_date" class="sr-only">간단 소개</label> 
					<input	type="text" class="form-control" placeholder="추천 받는 분에 대한 간단소개" name='info' required>
				</div>
				
				<button class="btn btn btn-lg btn-success btn-block" type="submit" onclick="return check()">추천하기</button>
			</form>
		</div>
	</div>
</body>


</html>