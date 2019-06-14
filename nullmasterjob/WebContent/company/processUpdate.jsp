<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="company.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="company" class="company.bean.vd.CompanyDataBean">
	<jsp:setProperty name="company" property="name"/>
	<jsp:setProperty name="company" property="homepage"/>
	<jsp:setProperty name="company" property="address"/>
	<jsp:setProperty name="company" property="intro"/>	
</jsp:useBean>
	
<%	
	int employee = Integer.parseInt(request.getParameter("employee"));

	String day = request.getParameter("found_date");
	java.sql.Date found_date =  java.sql.Date.valueOf(day);
	
	CompanyDBBean dao = CompanyDBBean.getInstance();

	if (session.getAttribute("loginID") == null){ %>
		<script>
		alert("권한이없습니다.");
		history.go(-1);
		</script>
<%} else {
	String email_id = (String)session.getAttribute("loginID");
	CompanyDataBean vo = dao.getCompany(email_id);
	if (email_id.equals(vo.getEmail_id())){
	company.setEmail_id(email_id);
	company.setEmployee(employee);
	dao.updateCompany(company,found_date); %>
	<script>
		location.href="contentCompany.jsp?email_id=<%=email_id%>";
	</script>
	<%	} else { %>
		<script>
			alert("권한이 없습니다.");
			history.go(-1);
		</script>	
	<% 	}
	}%>


	