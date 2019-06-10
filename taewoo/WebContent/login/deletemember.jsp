<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
   <script language="javascript">
     
       function begin(){
         document.myform.pw.focus();
       }

       function checkIt(){
		  if(!document.myform.pw.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }
	   }   
    
   </script>
</head>
<body onload="begin()">
	<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원탈퇴하시겠습니까?</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		<form name="myform" action="deletememberPro.jsp" method="post" onSubmit="return checkIt()">

  <div></div>
    <TD bgcolor="">
	 <b>비밀번호를 확인해주세요</b>
	 </TD>
  </div>
  <div>
    <TD >비밀번호</TD>
    <TD >
      <INPUT type="password" name="pw"  >
   </TD>
   </TR>
   </div>
   <div>
   <br/>
  <TR>
    <TD>
      <INPUT type="submit" value="회원탈퇴"> 
      <input type="button" value="취  소" onclick="javascript:window.location='loginmain.jsp'">
    </TD>
  </TR>
  </div>
</form>
		</div>
		<hr>
	</div>

</body>
</html>