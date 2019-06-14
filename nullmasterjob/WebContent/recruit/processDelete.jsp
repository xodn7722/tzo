<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>


<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	RecruitDBBean dao = RecruitDBBean.getInstance();
	dao.deleteRecruit(index);
	
	response.sendRedirect("boardRecruit.jsp");
%>