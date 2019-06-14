<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="applicant.bean.vd.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="applicant" class="applicant.bean.vd.ApplicantDataBean">
<jsp:setProperty name="applicant" property="*" />
</jsp:useBean>

<%
	ApplicantDBBean dao= ApplicantDBBean.getInstance();
	dao.insertApplicant(applicant);
%>
<script>
	self.close();
</script>