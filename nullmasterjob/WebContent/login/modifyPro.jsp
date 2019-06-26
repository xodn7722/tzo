<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "member.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<jsp:useBean id="member" class="member.bean.vd.MemberDataBean">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
    String id = (String)session.getAttribute("loginID");
	member.setEmail_id(id);

	MemberDBBean dao = MemberDBBean.getInstance();
    dao.updateMember(member);
    
    response.sendRedirect("modify.jsp");
 %>

</body>