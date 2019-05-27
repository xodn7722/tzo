<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link href="/nullmasterjob/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="loginPro.jsp" method="post">
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="custom-control-inline ml-md-5 mx-md-5">
      <label class="mb-2 my-2" for="exampleInputEmail1">Email</label>
      <input type="email" class="form-control ml-2 mx-2" id="email_id"  placeholder="@email">
      </div>
        <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted">아이디로사용하실 Email을 입력해주세요</small>
        </div>
      <div class="custom-control-inline">
      <label class="mb-2 my-2" for="exampleInputPassword1">Password</label>
      <input type="email" class="form-control ml-2 mx-2" id="pw"  placeholder="Password"></span>
        </div>
        <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted">비밀번호는 영문숫자특수문자조합으로만들어주세요</small>
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
			callbackUrl: "http://localhost/nullmasterjob/login/naverlogin.jsp",
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
</html>