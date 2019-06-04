
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="web.member.dao.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="web.member.vo.MemberVO" />
<jsp:setProperty property="*" name="vo" />

<%
String email_id = request.getParameter("email");
String name = request.getParameter("name");
String pw = request.getParameter("pw");
String tel = request.getParameter("tel");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String mem_level = request.getParameter("mem_level");
String EmailChecked = request.getParameter("EmailChecked");

   MemberDAO dao = MemberDAO.getInstance();
   int check = dao.confirmId(email_id);

   if( check == 1){
	   String id = email_id;
	   session.setAttribute("loginID", id);
       response.sendRedirect("loginmain.jsp");
   }
   
   else{
	   
	       
	       dao.insertMember(vo); 
	       String id = email_id;
   	       session.setAttribute("loginID", id);
           response.sendRedirect("loginmain.jsp");
		
  }%>  
   
      
