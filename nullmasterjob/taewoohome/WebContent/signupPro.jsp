<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.login.dao.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="web.login.vo.MemberVO" />
<jsp:setProperty property="*" name="vo" />

<%
   MemberDAO dao = MemberDAO.getInstance();
   dao.insertMember(vo);
%>
