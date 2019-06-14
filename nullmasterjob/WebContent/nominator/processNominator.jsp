<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%	request.setCharacterEncoding("UTF-8");


	String sessid = (String)session.getAttribute("loginID");
	String valueid = request.getParameter("email");
	
	if (sessid.equals(valueid)){%>
<script type="text/javascript">
	alert("자기 자신에게 추천할수 없습니다.");
	history.go(-1);
</script>
<% } else {%>
	
<%}%>