<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="java.sql.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="recruit" class="recruit.bean.vd.RecruitDataBean">
<jsp:setProperty name="recruit" property="subject" />
<jsp:setProperty name="recruit" property="content" />
<jsp:setProperty name="recruit" property="area" />
<jsp:setProperty name="recruit" property="job_c" />
</jsp:useBean>


<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	
	String day = request.getParameter("end_date");
	java.sql.Date end_date =  java.sql.Date.valueOf(day);
	
	RecruitDBBean dao = RecruitDBBean.getInstance();
	RecruitDataBean vo = dao.getRecruit(index);
	
	recruit.setRecruit_code(index);
	dao.updateRecruit(recruit,end_date);
	response.sendRedirect("boardRecruit.jsp");
	
%>