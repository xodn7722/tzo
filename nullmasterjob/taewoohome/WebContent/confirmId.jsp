<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.login.dao.MemberDAO" %>
<%
   request.setCharacterEncoding("UTF-8");
%>

<%
	String id = request.getParameter("id");
    MemberDAO dao = MemberDAO.getInstance();
    int check = dao.confirmId(id);
    
    
   
    if(id ==""){%>
    	<b>아이디를 입력해주세요</b>
    	<form name="checkForm" method="post" action="confirmId.jsp">
    	<input type="text" name="id" />
    	<input type="submit" value="ID중복확인" />
    	</form>
    <%}else{
        if(check == 1) {%>
    	<b><font color="red"><%=id %></font>는 이미 사용중인 아이디입니다.</b>
    	<form name="checkForm" method="post" action="confirmId.jsp">
    	<b>다른 아이디를 선택하세요</b><br/><br/>
    	<input type="text" name="id" />
    	<input type="submit" value="ID중복확인" />
    	</form>    	
       <%}else{%>
    	<center>
    	  <b> 입력하신 <font color="red"><%=id %></font>는 <br/>
    	              사용하실 수 있는 ID입니다.</b><br/><br/>
    	  <input type="button" value="닫기" onclick="setid()">
    	</center>
    <%}
    }%>
    <script language="javascript">
    function setid(){
    	opener.document.my.id.value="<%=id%>";
    	self.close();
    }
    
    </script>