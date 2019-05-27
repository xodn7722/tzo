<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<form action="./signupPro.jsp" method="post" name="my" >
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