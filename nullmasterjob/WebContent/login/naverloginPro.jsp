<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("email") %>
<%
   String id = request.getParameter("email");
session.setAttribute("loginID", id);
response.sendRedirect("/taewoo/login/loginForm.jsp"); %>
</body>
</html>