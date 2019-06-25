<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.member.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id  = request.getParameter("id");
	
    MemberDAO dao = MemberDAO.getInstance();
	dao.admindeleteMember(id);
	response.sendRedirect("admin_member_list2.jsp");
%>

</head>
<body>
<script>

</script>
</body>
</html>