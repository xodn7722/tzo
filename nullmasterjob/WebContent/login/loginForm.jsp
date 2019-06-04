<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
 if(session.getAttribute("loginID") == null){
	 %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/dist/css/bootstrap.css">
<!-- 네아로-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
            </form>
         <div class="form-group mt-1 my-1">
          </div>  
<div class="dropdown">
	         <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
	                   소셜로그인
	         </button>
	           <div class="dropdown-menu">
	              <a class="dropdown-item" href="#">
	               <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("HDIpId2jSoQA1sekOyA4", "http://localhost/taewoo/login/naverlogin.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,60);
  	naver_id_login.setDomain("http://localhost/taewoo/login/loginForm.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
	              
	              </a>
	              <a class="dropdown-item" href="#">link2</a>
	              <a class="dropdown-item" href="#">link3</a>
	           </div>
	        </div>
            <label class="float-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="./passwordfind.jsp" target="_blank"  
            onclick="window.open(this.href,'_blank','width=500,height=300, scrollbars=yes');return false;" 
            class="float-right">비밀번호찾기</a>
        </div> 
        </div>       
   <br/>
    <p class="text-center"><a href="signupForm.jsp" >회원가입</a></p>
</div>


</body>
<%}else{ response.sendRedirect("loginmain.jsp");}%>
</html>
