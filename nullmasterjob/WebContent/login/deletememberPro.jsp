<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "web.member.dao.MemberDAO" %>
<html>
<head>
<title>회원탈퇴</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<%
    String id = (String)session.getAttribute("loginID");
	String pw  = request.getParameter("pw");
	
	MemberDAO manager = MemberDAO.getInstance();
    int check = manager.deleteMember(id,pw);
	
	if(check==1){
		session.invalidate();
%>


<body >
   <jsp:include page="/menu/menu.jsp"/>
			<h1 class="display-3">회원탈퇴가완료되었습니다</h1>
	
	
	<div class="container">
	
		<div class="col-md-4">
		<form method="post" action="/nullmasterjob/main.jsp" name="userinput" >

      <input type="submit" value="확인">

</form>
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