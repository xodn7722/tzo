<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
 if(session.getAttribute("loginID") == null){
	 %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.css">

</head>
<body>
<div>
<jsp:include page="/menu/menu.jsp"/></div><br/>
<div align="center"> <h1> 로그인 </h1></div><br/>
<form action="./loginPro.jsp" method="post" class="form=horizontal" role="form">
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="custom-control-inline">
      <label class="mb-2 my-2" for="exampleInputEmail1">Email</label>
      <input type="email" class="form-control ml-2 mx-2" name="email_id" placeholder="@email">
      </div>
        <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted"></small>
        </div>
      <div class="custom-control-inline">
      <label class="mb-2 my-2" for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control ml-2 mx-2" id="pw" name="pw" placeholder="Password"></span>
        </div>
        <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted"></small>
        </div> 
       <div class="custom-control-inline">
         <div class="container">
         <input type="submit" class="btn btn-primary" value="로그인" />
         </div>
         <div class="container">
         <input type="button" value="회원가입" class="btn btn-primary" onclick="location.href = 'signupForm.jsp'" />
         </div>
   <div class="container">
	<div class="dropdown" id="mydropdown">
	  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
	소셜로그인
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">link1</a>
	    <a class="dropdown-item" href="#">link2</a>
	    <a class="dropdown-item" href="#">link3</a>
	  
	  </div>
	</div>
       </div>       
   </div>
</div>
</form>
</body>
<%}else{ response.sendRedirect("loginmain.jsp");}%>
</html>
