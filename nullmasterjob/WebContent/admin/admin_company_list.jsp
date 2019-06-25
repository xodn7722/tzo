<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="web.member.dao.MemberDAO"%>
<%@page import="company.bean.vd.*" %>
<%@page import="java.util.ArrayList"%>
 
<jsp:useBean id="vo" class="web.member.vo.MemberVO">
    <jsp:setProperty name="vo" property="*" />
    </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<% if(session.getAttribute("loginID") == null ){%>

<script>
  alert("로그인해주세요");
  location.href="/taewoo2/login/loginForm.jsp"
</script>

<%}else{ if(session.getAttribute("loginID").equals("admin@admin")){
%>

<script>
function next(){
 if(confirm("수락하시겠습니까?")){  
 }else{
 return false;
 }
}
function back(){
  location.href="adminmain.jsp"
}
</script>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
</head>
<body>
	<jsp:include page="/menu/menu.jsp"/>
	<br/>

      <table class="table table-striped table-hover">
      <thead>
         <tr >
         <td width="70"> 번호 </td>
         <td width="100"> name  </td>
         <td width="100"> homepage </td>
         <td width="100"> address </td>
         <td width="100"> date </td>
         <td width="100"> employee </td>
         <td width="100"> email_id </td>
         <td width="30"> logo </td>
         <td width="30"> img </td>
         <td width="70"> 수락 </td>
         </tr>
      </thead>

	<%
     
	CompanyDBBean DBBean = CompanyDBBean.getInstance();

	
	    ArrayList<CompanyDataBean> list = DBBean.getAllCompany();
        for(int i = 0 ; i < list.size(); i++){
        	CompanyDataBean a = list.get(i);
        	
	%>
         <tbody>
			<tr>
				<td><a href="admin_company_content.jsp?id=<%=a.getEmail_id()%>"><%=a.getCompany_code()%></a></td>
				<td><%=a.getName() %></td>
				<td><%=a.getHomepage() %></td>
                <td><%=a.getAddress() %></td>
                <td><%=a.getFound_date() %></td>
                <td><%=a.getEmployee() %></td>
                <td><%=a.getEmail_id() %></td>
                <td><%=a.getLogo() %></td>
                <td><%=a.getImg() %></td>
                <td><a href="admin_company_accept.jsp?id=<%=a.getEmail_id()%>" onclick="return next()">수락</a></td> 
			</tr>
        </tbody>
     <%}%>
	</table>
		
 <div align="center">
   <input type="button" value="뒤로" onclick="back()" />
 </div>
</body>

</html>
<%}else{%>
	<script>
	 alert("접근권한이없습니다");
	 location.href="/taewoo2/main.jsp"
	</script>
<%}}%>
