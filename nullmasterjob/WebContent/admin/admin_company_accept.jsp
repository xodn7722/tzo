<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.member.dao.MemberDAO" %>
<%@ page import="web.member.vo.MemberVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	MemberDAO dao = MemberDAO.getInstance();
	dao.updateCompanyMember(id);
	response.sendRedirect("admin_company_list.jsp");
%>
</head>
<body>

</body>
</html>