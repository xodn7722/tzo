<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.login.dao.MemberDAO" %>
<%@ page import="web.login.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script language="JavaScript">
   

</script>
<%
    String id = (String)session.getAttribute("loginID");
   
   MemberDAO manager = MemberDAO.getInstance();
   MemberVO c = manager.getMember(id);


%>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보수정</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
<form method="post" action="modifyPro.jsp" name="userinput">

  <table width="600" border="1" cellspacing="0" cellpadding="3"  align="center">
    <tr > 
      <td  colspan="2" height="39" bgcolor=" align="center">
	     <font size="+1" ><b>회원 정보수정</b></font></td>
    </tr>
    <tr>
      <td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
    </tr>
    <tr> 
      <td  width="200"> 사용자 ID</td>
      <td  width="400"><%=c.getId()%></td>
    </tr>
    
     <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400"> 
        <input type="password" name="pw" size="10"  value="<%=c.getPw()%>">
      </td>
    <tr>  
    <tr> 
      <td  width="200" bgcolor=><b>개인정보 입력</b></td>
      <td width="400" bgcolor=>&nbsp;</td>
    <tr>  
    <tr> 
      <td   width="200">사용자 이름</td>
         <td width="400">
          <input type="text" name="name" size="40"  value="<%=c.getName()%>">	
      </td>
    </tr>
   <tr> 
      <td width="200">Mail</td>
      <td width="400">
          <input type="text" name="mail" size="40"  value="<%=c.getMail()%>">	
      </td>
    </tr>
      <tr> 
      <td width="200">통신사</td>
      <td width="400"> 
          <select name="se" value="<%=c.getSe()%>">
                            <option value="skt">skt</option>
                            <option value="kt">kt</option>
                            <option value="lg" >lg</option>                       
                        </select>
      </td>
    <tr>
      <tr> 
      <td width="200">번호</td>
      <td width="400"> 
        <input type="text" name="tel" size="15"  value="<%=c.getTel()%>">
      </td>
    <tr>
    <tr>
      <tr> 
      <td width="200">우편</td>
      <td width="400"> 
        <input type="text" name="post" size="15"  value="<%=c.getPost()%>">
      </td>
    <tr>
      <tr> 
      <td width="200">주소</td>
      <td width="400"> 
        <input type="text" name="re"  value="<%=c.getRe()%>">
      </td>
    <tr>
      <tr> 
      <td width="200">상세주소</td>
      <td width="400"> 
        <input type="text" name="re2"  value="<%=c.getRe2()%>">
      </td>
    <tr>
        
    <tr> 
      <td colspan="2" align="center" bgcolor=> 
       <input type="submit" name="modify" value="수   정" >
       <input type="button" value="취  소" onclick="javascript:window.location='loginmain.jsp'">      
      </td>
    </tr>
  </table>
</form>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>