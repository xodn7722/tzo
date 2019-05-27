<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "web.login.dao.MemberDAO" %>
<h1> loginPro</h1>

<% 
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   MemberDAO dao = MemberDAO.getInstance();
   boolean result = dao.loginCheck(id,pw);
   
   if(result){
	   session.setAttribute("loginID", id);
	   response.sendRedirect("loginmain.jsp");
	   
   }else{%>
   <script>
     alert("id/pw를확인하세요");
     history.go(-1);
   </script>
<%}%>