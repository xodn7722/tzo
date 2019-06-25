<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.vd.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	MemberDBBean dao = MemberDBBean.getInstance();
	dao.updateCompanyMember(id);
	response.sendRedirect("admin_company_list.jsp");
%>
</head>
<body>

</body>
</html>