
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("HDIpId2jSoQA1sekOyA4", "http://localhost/taewoo/login/naverlogin.jsp");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	    document.my.email_id.value =  naver_id_login.getProfileData('id');
        document.my.name.value = naver_id_login.getProfileData('nickname');
			document.my.submit();
  }

 

</script>
<form action="naverloginPro.jsp" name="my" method="post" >
    <input type="hidden" name="email_id" />
    <input type="hidden" name="pw" value="1234" />
    <input type="hidden" name="name" />
    <input type="hidden" name="tel" value="무" />
    <input type="hidden" name="age" value="0" />
    <input type="hidden" name="sex" value="무" />
    <input type="hidden" name="mem_level" value="일반회원" />
    <input type="hidden" name="userEmailChecked" value="1" />
</form> 
</body>
</html>
			