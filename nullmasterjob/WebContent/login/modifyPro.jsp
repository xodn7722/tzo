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

		<div class="container">
			<h1 class="display-3">정보수정완료</h1>
		</div>

      <form>
	    <input type="button" value="메인으로" onclick="window.location='/nullmasterjob/main.jsp'">
      </form>
      5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=/nullmasterjob/main.jsp" >

</body>