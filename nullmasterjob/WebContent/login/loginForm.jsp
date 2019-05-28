<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
 if(session.getAttribute("loginID") == null){
	 %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

</head>
<body>
<div>
<jsp:include page="/menu/menu.jsp"/></div><br/>
<div align="center"> <h1> 로그인 </h1></div><br/>
<form action="./loginPro.jsp" method="post">
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="custom-control-inline ml-md-5 mx-md-5">
      <label class="mb-2 my-2" for="exampleInputEmail1">Email</label>
      <input type="email" class="form-control ml-2 mx-2" id="email_id" name="email_id" placeholder="@email">
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
       <div>
         <input type="submit" class="btn btn-primary" value="로그인" />
         <input type="button" value="회원가입" class="btn btn-primary" onclick="location.href = 'signupForm.jsp'" />
          <div class="container">
	<div class="dropdown" id="mydropdown">
	  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
	소셜로그인
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">naver</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">kakao</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">google</a></li>
	  </ul>
	</div>
       </div>       
   </div>
</div>
</form>
       
<div id="naverIdLogin" align="center"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "HDIpId2jSoQA1sekOyA4",
			callbackUrl: "http://localhost/taewoo/login/naverlogin.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
		<hr>
	</div>
</body>
<%}else{ response.sendRedirect("loginmain.jsp");}%>
</html>
