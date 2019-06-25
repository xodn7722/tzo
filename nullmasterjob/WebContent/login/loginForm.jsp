<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
 if(session.getAttribute("loginID") == null){
	 %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- 네아로-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
    $(document).ready(function()
    {
        var userId = getCookie("cookieUserId"); 
        $("input[name='email_id']").val(userId); 
         
        if($("input[name='email_id']").val() != ""){ // Cookie에 만료되지 않은 아이디가 있어 입력됬으면 체크박스가 체크되도록 표시
            $("input[name='remember']").attr("checked", true);
        }
         
        $("button[type='submit']", $('.login-form')).click(function(){ // Login Form을 Submit할 경우,
            if($("input[name='remember']").is(":checked")){ // ID 기억하기 체크시 쿠키에 저장
                var userId = $("input[name='email_id']").val();
                setCookie("cookieUserId", userId, 7); // 7일동안 쿠키 보관
            } else {
                deleteCookie("cookieUserId");
            }
        });             
    })
 
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate()+exdays);
        var cookieValue = escape(value)+((exdays==null)? "": "; expires="+exdate.toGMTString());
        document.cookie = cookieName+"="+cookieValue;
    }
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate()-1);
        document.cookie = cookieName+"= "+"; expires="+expireDate.toGMTString();
    }
    function getCookie(cookieName){
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
         
    }
</script>
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
  	var naver_id_login = new naver_id_login("HDIpId2jSoQA1sekOyA4", "http://localhost/taewoo2/login/naverlogin.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,60);
  	naver_id_login.setDomain("http://localhost/taewoo/login/loginForm.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  </script>
	              
	              </a>
	              <a class="dropdown-item" href="#">link2</a>
	              <a class="dropdown-item" href="#">link3</a>
	           </div>
	        </div>
            <label class="float-left checkbox-inline"><input type="checkbox" name="remember" value="1"> Remember me</label>
            <a href="./passwordfind.jsp" target="_blank"  
            onclick="window.open(this.href,'_blank','width=500,height=300, scrollbars=yes');return false;" 
            class="float-right">비밀번호찾기</a>
        </div> 
        </div>       
   <br/>
    <p class="text-center"><a href="signupForm.jsp" >회원가입</a></p>
</div>


</body>
<%}else{ response.sendRedirect("/taewoo2/main.jsp");}%>
</html>
