<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="resume.bean.vd.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="resume" class="resume.bean.vd.ResumeDataBean">
<jsp:setProperty name="resume" property="*" />
</jsp:useBean>
<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	ResumeDBBean dao = ResumeDBBean.getInstance();
	resume.setResume_code(index);
	dao.updateResume(resume);
	
	response.sendRedirect("boardResume.jsp");
%>