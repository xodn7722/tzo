<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="company.bean.vd.*"%>
<%@ page import="member.bean.vd.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	int code = Integer.parseInt(request.getParameter("code"));
	String email_id = request.getParameter("id");
	CompanyDBBean dao = CompanyDBBean.getInstance();
	CompanyDataBean vo = dao.getCompany(email_id);
	
	MemberDBBean mdao = MemberDBBean.getInstance();
	
	if (session.getAttribute("loginID")== null){ %>
		<script>
		alert("삭제할 권한이 없습니다.");
		history.go(-1);
	</script>
	<%} else{
	if (session.getAttribute("loginID").equals(email_id)){ 
			String id = (String)session.getAttribute("loginID");
			dao.deleteCompany(id);
			dao.deleteRecruit(id);
			mdao.updateMemberLevel(id);
		%>
		<script>
			alert("삭제가 완료되었습니다.그동안 이용해주셔서감사합니다.");
			history.go(-1);
		</script>
	<%}else {%>
	<script>
		alert("삭제할 권한이 없습니다.");
		history.go(-1);
	</script>
<%}
}%>