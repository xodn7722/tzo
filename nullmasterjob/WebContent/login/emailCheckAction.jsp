<%@page import="java.io.PrintWriter"%>

<%@page import="util.SHA256"%>

<%@page import="web.member.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	request.setCharacterEncoding("UTF-8");

	String code = request.getParameter("code");

	MemberDAO dao = MemberDAO.getInstance();

	String loginID = null;

	if(session.getAttribute("loginID") != null) {

		loginID = (String) session.getAttribute("loginID");

	}

	if(loginID == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'loginForm.jsp'");

		script.println("</script>");

		script.close();

		return;

	}else{
		int emailChecked = dao.getUserEmailChecked(loginID);

		if(emailChecked == 1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('이미 인증 된 회원입니다.');");

			script.println("location.href = 'loginForm.jsp'");

			script.println("</script>");

			script.close();		

			return;

		}
		
	}

	String userEmail = dao.getUserEmail(loginID);

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(rightCode == true) {

	    dao.setUserEmailChecked(loginID);

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('인증에 성공했습니다.');");

		script.println("location.href = 'loginForm.jsp'");

		script.println("</script>");

		script.close();		

		return;

	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('유효하지 않은 코드입니다.');");

		script.println("location.href = 'loginForm.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}%>