<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="web.member.dao.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="web.member.vo.MemberVO" />
<jsp:setProperty property="*" name="vo" />

<%
String email_id = request.getParameter("email_id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
int age = Integer.parseInt(request.getParameter("age"));
String sex = request.getParameter("sex");
String mem_level = request.getParameter("mem_level");
int userEmailChecked = Integer.parseInt(request.getParameter("userEmailChecked"));

MemberDAO dao = MemberDAO.getInstance();

int check = dao.confirmId(email_id);

     if( check == 1){
	  
	       session.setAttribute("loginID", email_id);
           response.sendRedirect("/nullmasterjob/main.jsp");
    
     }else{
	       dao.insertMember(vo);      
	       session.setAttribute("loginID", email_id);
           response.sendRedirect("/nullmasterjob/main.jsp");
		
}%>  

  
      
