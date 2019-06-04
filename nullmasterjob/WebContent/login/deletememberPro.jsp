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
	<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원탈퇴가완료되었습니다</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		<form method="post" action="loginmain.jsp" name="userinput" >
<table>
  <tr > 
    <td>
	 <b>회원정보가 삭제되었습니다.</b>
	</td>
  </tr>
 
  <tr>
    <td> 
      <input type="submit" value="확인">
    </td>
  </tr>
</table>
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