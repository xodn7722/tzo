<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="resume.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="resume"  class="resume.bean.vd.ResumeDataBean">
	<jsp:setProperty name="resume" property="*"/>
</jsp:useBean>

<%
	ResumeDBBean dao = ResumeDBBean.getInstance();
	dao.insertResume(resume);
	
	response.sendRedirect("boardResume.jsp");
%>