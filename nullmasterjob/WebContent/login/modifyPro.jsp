<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "web.member.dao.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<jsp:useBean id="member" class="web.member.vo.MemberVO">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
    String id = (String)session.getAttribute("loginID");
	member.setEmail_id(id);

	MemberDAO dao = MemberDAO.getInstance();
    dao.updateMember(member);
 %>
<body>
	<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">정보수정완료</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		   <table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="#EAEAEA"> 
    <td height="39"  align="center">
	  <font size="+1" ><b>회원정보가 수정되었습니다.</b></font></td>
  </tr>
  <tr>
    <td bgcolor="#EAEAEA" align="center"> 
      <p>입력하신 내용대로 수정이 완료되었습니다.</p>
    </td>
  </tr>
  <tr>
    <td bgcolor="#EAEAEA" align="center"> 
      <form>
	    <input type="button" value="메인으로" onclick="window.location='main.jsp'">
      </form>
      5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
</table>
		</div>
		<hr>
	</div>

</body>