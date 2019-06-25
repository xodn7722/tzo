<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.bean.vd.*"%>
 <%@page import="java.util.ArrayList"%>
<% if(session.getAttribute("loginID") == null ){%>

<script>
  alert("로그인해주세요");
  location.href="/taewoo2/login/loginForm.jsp"
</script>

<%}else{ if(session.getAttribute("loginID").equals("admin@admin")){
%>
<!DOCTYPE html>
<html>
<head>
<script>
function next(){
 if(confirm("회원을삭제하시겠습니까?")){  
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
<div class="container">
	<jsp:include page="/menu/menu.jsp"/>
	</div>
	<br>
<div class="container">
   <div align="center">
   <div class="col-md-12">   
      <table class="table table-striped table-hover" >
      <thead>
         <tr height="30">
         <td width="200"> Email </td>
         <td width="200"> Pw  </td>
         <td width="100"> Name </td>
         <td width="300"> Tel </td>
         <td width="100"> Age </td>
         <td width="100"> Sex </td>
         <td width="100"> Mem_level </td>
         <td width="100"> UserEmailChecked </td>
         <td width="120"> 수정</td>
         <td width="120"> 삭제</td>
      </tr>
      </thead>

	<%
     
	MemberDBBean dao = MemberDBBean.getInstance();
        
	    ArrayList<MemberDataBean> list = dao.getAllMember();
        for(int i = 0 ; i < list.size(); i++){
        	MemberDataBean a = list.get(i);
	%>

			<tr>
				<td><%=a.getEmail_id() %></td>
				<td><%=a.getPw() %></td>
				<td><%=a.getName() %></td>
                <td><%=a.getTel() %></td>
                <td><%=a.getAge() %></td>
                <td><%=a.getSex() %></td>
                <td><%=a.getMem_level() %></td>
                <td><%=a.getUserEmailChecked() %></td>
                <td><a href="admin_member_modify.jsp?id=<%=a.getEmail_id() %>">수정</a></td>
                <td><a href="admin_member_delete.jsp?id=<%=a.getEmail_id()%>" onclick="return next()">삭제</a></td> 
			</tr>


<%}%>

	</table>	

 <div align="center">
   <input type="button" value="뒤로" onclick="back()" />
 </div>
 </div>
 </div>
 </div>
</body>

</html>
<%}else{%>
	<script>
	 alert("접근권한이없습니다");
	 location.href="/taewoo2/main.jsp"
	</script>
<%}}%>
