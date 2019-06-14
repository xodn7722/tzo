<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="company.bean.vd.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	int code = Integer.parseInt(request.getParameter("code"));
	String email_id = request.getParameter("id");
	CompanyDBBean dao = CompanyDBBean.getInstance();
	CompanyDataBean vo = dao.getCompany(email_id);
	
	if (session.getAttribute("loginID")== null){ %>
		<script>
		alert("삭제할 권한이 없습니다.");
		history.go(-1);
	</script>
	<%} else{
	if (session.getAttribute("loginID").equals(email_id)){
		int check = 0;
		check = dao.deleteCompanyCheck(email_id);
		if (check == 0){
	dao.deleteCompany(code);	
	response.sendRedirect("../main.jsp"); 
	} else {   %>
		<script>
		alert("구인중인 글을 삭제하시고 시도하시길 바랍니다.");
		history.go(-1);
	</script>
	<%	}
	}
		else {%>
	<script>
		alert("삭제할 권한이 없습니다.");
		history.go(-1);
	</script>
<%}
}%>