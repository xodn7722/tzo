<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.vd.*"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id  = request.getParameter("id");
	
	MemberDBBean dao = MemberDBBean.getInstance();
	dao.admindeleteMember(id);
	response.sendRedirect("admin_member_list2.jsp");
%>

</head>
<body>
<script>

</script>
</body>
</html>