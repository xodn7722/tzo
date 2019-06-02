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
<div class="login-form">
    <form action="./loginPro.jsp" method="post">
        <div class="form-group" align="center" >       
        <div class="form-group col-sm-3">
            <input type="email" class="form-control" placeholder="Email" name="email_id" required="required">
        </div>
        <div class="form-group col-sm-3">
            <input type="password" class="form-control" placeholder="Password" name="pw" required="required">
        </div>
        <div class="form-group col-sm-3">
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
         <div class="form-group mt-1 my-1">
	       <div class="dropdown">
	         <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
	                   소셜로그인
	         </button>
	           <div class="dropdown-menu">
	              <a class="dropdown-item" href="#">link1</a>
	              <a class="dropdown-item" href="#">link2</a>
	              <a class="dropdown-item" href="#">link3</a>
	           </div>
	        </div>
          </div>  

            <label class="float-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="./passwordfind.jsp" target="_blank"  
            onclick="window.open(this.href,'_blank','width=500,height=300, scrollbars=yes');return false;" 
            class="float-right">비밀번호찾기</a>
        </div> 
        </div>       
    </form><br/>
    <p class="text-center"><a href="signupForm.jsp" >회원가입</a></p>
</div>
</body>
<%}else{ response.sendRedirect("loginmain.jsp");}%>
</html>
