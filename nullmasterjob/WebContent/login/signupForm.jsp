<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if(session.getAttribute("loginID")==null){%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkForm(){
	
	var regInt= /^[0-9]*$/;
	var regPw= /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/
	var c = document.my;
	
	if(c.email_id.value ==""){
		alert("이메일을입력해주세요");
		c.email_id.focus();
		return false;
	}
	
	if(c.pw.value ==""){
		alert("비밀번호를입력해주세요");
		c.pw.focus();
		return false;
	}else{
		   if(!regPw.test(c.pw.value)){
			   alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요");
			   c.pw.focus();
			   return false;
		   }
    }
	
	if(c.pw2.value ==""){
		alert("비밀번호를확인해주세요");
		c.pw2.focus();
		return false;
	}else{  
		  if(c.pw.value != c.pw2.value){
			  alert("비밀번호가일치하지않습니다");
				c.pw2.focus();
				return false;
		  }
		
	}
	
	if(c.name.value ==""){
		alert("이름을입력해주세요");
		c.name.focus();
		return false;
	}
	
	if(c.sex.value ==""){
		alert("성별을선택해주세요");
		c.sex.focus();
		return false;
	}
	
	if(c.age.value ==""){
		alert("나이를입력해주세요");
		c.age.focus();
		return false;
	}else{
		if(!regInt.test(c.age.value)){
			alert("나이는 숫자로만입력해주세요");
			c.age.focus();
			return false;
		}
		
	}
	
	if(c.tel.value ==""){
		alert("전화번호를입력해주세요");
		c.tel.focus();
		return false;
	}
	
	
	
}
</script>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
<div>
<jsp:include page="/menu/menu.jsp" />
</div><br/>
<h1 align="center" class="">회원가입</h1></br>
<form action="./signupPro.jsp" method="post" name="my" onsubmit="return checkForm();">
<fieldset>
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="form-group row">
        <label class="col-sm-1 col-form-label">EMAIL</label>
        <input type="email" class="form-control ml-2 mx-2" id="email_id" name="email_id" placeholder="@email">
      </div>   
      <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted">아이디로사용하실 Email을 입력해주세요</small>
      </div>
      <div class="form-group row">
        <label class="col-sm-1 col-form-label" for="exampleInputPassword1">PASSWORD</label>
        <input type="password" class="form-control ml-2 mx-2" id="pw" name="pw"  placeholder="PASSWORD">
      </div>
      <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted">비밀번호는 영문숫자특수문자조합으로만들어주세요</small>
      </div>
       <div class="form-group row">
        <label class="col-sm-1 col-form-label" for="exampleInputPassword1">PASSWORD CONFIRM</label>
        <input type="password" class="form-control ml-2 mx-2" id="pw2" name="pw2"  placeholder="PASSWORD">
      </div>
      <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted">비밀번호를 확인해주세요</small>
      </div>
       <div class="form-group row">
        <label class="col-sm-1 col-form-label">NAME</label>
        <input type="name" class="form-control ml-2 mx-2" id="name"  name="name" placeholder="이름">
      </div>
       <div class="form-group row">
        <label class="col-sm-1 col-form-label">SEX</label>
         <select class="custom-select col-sm-4" id="sex" name="sex">
           <option></option>
           <option>남자</option>
           <option>여자</option>
         </select>
      </div>
      <div class="form-group row">
        <label class="col-sm-1 col-form-label">AGE</label>
        <input type="age" class="form-control ml-2 mx-2" id="age" name="age" placeholder="">
      </div>
      <div class="form-group row">
        <label class="col-sm-1 col-form-label">TEL</label>
        <input type="tel" class="form-control ml-2 mx-2" id="tel" name="tel" placeholder="">
      </div>
      <input type="hidden" name="mem_level" value="3">
      <div align="center">
      <div class="form-group">
      <input type="submit" class="btn btn-primary" value="회원가입">
      </div>
      </div>
  </div>
      </fieldset>
</form>

</body>
</html>
<%}else{ response.sendRedirect("loginmain.jsp");}%>