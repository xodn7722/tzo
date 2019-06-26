<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.vd.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  
%>
<body onload="begin()">
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		  <center><b>글삭제</b>
		  
<br>
<form method="POST" name="delForm"  action="listdeletePro.jsp?pageNum=<%=pageNum%>" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  >
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="passwd" size="8" maxlength="12">
	   <input type="hidden" name="num" value="<%=num%>"></td>
 </tr>
 <tr height="30">
    <td align=center >
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" 
       onclick="document.location.href='event_board.jsp?pageNum=<%=pageNum%>'">     
   </td>
 </tr>  
</table> 
</form>


		</div>
		<hr>
	</div>

</body>