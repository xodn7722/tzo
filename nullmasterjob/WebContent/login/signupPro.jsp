<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="web.member.dao.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="web.member.vo.MemberVO" />
<jsp:setProperty property="*" name="vo" />

<%
   String id = request.getParameter("email_id");
   MemberDAO dao = MemberDAO.getInstance();
   int check = dao.confirmId(id);

   if( check == 1){%>
   <script>
   alert("이미사용중인이메일아이디입니다");
   history.go(-1);
   </script>
   <%}
   
   else{
	   
	     
	       dao.insertMember(vo);
   
   	       session.setAttribute("loginID", id);
           response.sendRedirect("/taewoo2/main.jsp");
		
  }%>  
   
  

