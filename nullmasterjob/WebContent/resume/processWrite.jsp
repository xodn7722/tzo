<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="resume.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="resume"  class="resume.bean.vd.ResumeVO">
	<jsp:setProperty name="resume" property="*"/>
</jsp:useBean>

<%
	ResumeDAO dao = ResumeDAO.getInstance();
	dao.insertResume(resume);
	
	response.sendRedirect("boardResume.jsp");
%>