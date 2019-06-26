<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "member.bean.vd.*" %>
<h1> loginPro</h1>

<% 
   String id = request.getParameter("email_id");
   String pw = request.getParameter("pw");
   MemberDBBean dao = MemberDBBean.getInstance();
   boolean result = dao.loginCheck(id,pw);
  
   if(result){
       if(id.equals("admin@admin") & pw.equals("nullmaster1!")){
           session.setAttribute("loginID", id);
     	   response.sendRedirect("/Test/main.jsp");
       }else{
    	   session.setAttribute("loginID", id);
     	   response.sendRedirect("/Test/main.jsp");
       }
    
   }else{%>
   <script>
     alert("id/pw를확인하세요");
     history.go(-1);
   </script>
<%}%>