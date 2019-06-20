<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script language="JavaScript" src="script.js"></script>
</head>
<% 
   
  int num=0,ref=1,re_step=0,re_level=0;
  try{  
    if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>
<body>

<jsp:include page="/menu/menu.jsp"/></div><br/>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		 <center><b>프리미엄배너신청</b>
<br>
<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table width="700" border="1" cellspacing="0" cellpadding="0"  bgcolor="#EAEAEA" align="center">
   <tr>
    <td align="right" colspan="2" bgcolor="#EAEAEA">
   </td>
   </tr>
   <tr>
    <td  width="70"  bgcolor="#EAEAEA" align="center">작성자</td>
    <td  width="330">
   
     <input type="text" size="40" maxlength="50" name="writer" value="<%=session.getAttribute("loginID") %>" />
    
  </tr>
  <tr>
    <td  width="70"  bgcolor="#EAEAEA" align="center" >제 목</td>
    <td  width="330">
    <%if(request.getParameter("num")==null){%>
       <input type="text" size="40" maxlength="50" name="subject"></td>
	<%}else{%>
	   <input type="text" size="40" maxlength="50" name="subject" value="[답변]">
	<%}%>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#EAEAEA" align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content"  rows="13" cols="100"></textarea> </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#EAEAEA" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="#EAEAEA" align="center"> 
  <input type="submit" value="신청" >  
  <input type="reset" value="다시작성">
</td></tr></table>    
 <%
  }catch(Exception e){}
%>     
</form>    
		</div>
		<hr>
	</div>

</body>
