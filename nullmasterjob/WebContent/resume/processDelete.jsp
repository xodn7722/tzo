<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="resume.bean.vd.*" %>


<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	ResumeDAO dao = ResumeDAO.getInstance();
	dao.deleteResume(index);
	
	response.sendRedirect("boardResume.jsp");
%>