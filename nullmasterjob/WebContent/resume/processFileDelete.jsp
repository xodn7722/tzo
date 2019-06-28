<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="file.bean.vd.*"%>
<% request.setCharacterEncoding("UTF-8");%>


<%	
	if (session.getAttribute("loginID")== null){%>
		<script>
			alert("로그인을 해주십시오.");
			location.href='/Test/login/loginForm.jsp';
		</script>
		<% } else { 
		int code = Integer.parseInt(request.getParameter("code"));
		String checkid = request.getParameter("id");
		String id = (String)session.getAttribute("loginID");
		
		if(!checkid.equals(id)) {%>
			<script>
				alert("권한이 없습니다.");
				history.go(-1);
			</script>
		<%} else {
		 FileDBBean dao = FileDBBean.getInstance();
		 dao.deleteFile(code,id); %>
		 <script>
		 alert("삭제되었습니다.");
		 history.go(-1);
		 </script>
		<%	}
		} %>
