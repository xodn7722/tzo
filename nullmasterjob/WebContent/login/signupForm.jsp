<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript">
function checkForm(){
	 
	 
	 
	   var c = document.my;
	   
	  
	   if(c.email_id.value==""){
		  alert("아이디를입력해주세요");
		  c.id.focus();
		  return false;	  
	   }
	   
	   
	   if(c.pw.value==""){
		 c.pw.value("비밀번호를입력해주세요");
		 c.pw.focus();
		 return false;
	   }else{
	        if(c.pw.value.length < 8 || c.pw.value.length > 15){
		    alert("비밀번호는 8~15자까지만 가능합니다"); 
		    c.pw.focus();
			return false;
	        }else{
	        	if(c.pw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
	        		    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
	        		    return false;
	        	    }
	            }
	        }
	   
	   
	  
	   
	   if(!c.name.value){
		   alert("이름을입력해주세요");
		   c.name.focus();
		   return false;
	   }
	   
	
	   if(!c.tel.value){
		   alert("연락처를입력해주세요");
		   c.tel.focus();
		   return false;
	   }
	 
}

</script>    
<!DOCTYPE html>
<html>
<head>
<link href="/nullmasterjob/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
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
        <input type="email" class="form-control ml-2 mx-2 " id="email_id" name="email_id" placeholder="@email">
      </div>   
      <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted">아이디로사용하실 Email을 입력해주세요</small>
      </div>
      <div class="form-group row">
        <label class="col-sm-1 col-form-label" for="exampleInputPassword1">PASSWORD</label>
        <input type="password" class="form-control ml-2 mx-2" id="pw" name="pw"  placeholder="Password">
      </div>
      <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted">비밀번호는 영문숫자특수문자조합으로만들어주세요</small>
      </div>
       <div class="form-group row">
        <label class="col-sm-1 col-form-label">NAME</label>
        <input type="name" class="form-control ml-2 mx-2" id="name"  name="name" placeholder="이름">
      </div>
       <div class="form-group row">
        <label class="col-sm-1 col-form-label">SEX</label>
         <select class="custom-select col-sm-4" id="sex" name="sex">
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
      <div class="form-group row">
      <input type="submit" class="btn btn-primary" value="회원가입">
      </div>
  </div>
      </fieldset>
</form>

</body>
</html>