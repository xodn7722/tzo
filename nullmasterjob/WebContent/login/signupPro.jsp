<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="member.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="member.bean.vd.MemberDataBean" />
<jsp:setProperty property="*" name="vo" />

<%
   String id = request.getParameter("email_id");
   MemberDBBean dao = MemberDBBean.getInstance();
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
           response.sendRedirect("/nullmasterjob/main.jsp");
		
  }%>  
   
  

