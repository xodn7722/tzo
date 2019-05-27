<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/nullmasterjob/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
<jsp:include page="/menu/menu.jsp" />
</div><br/>
<h1 align="center" class="">회원가입</h1></br>
<form action="./signupPro.jsp" method="post">
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="">
        <label class="mb-2 my-2">Email</label>
        <input type="email" class="form-control ml-2 mx-2 " id="email_id" name="email_id" placeholder="@email">
      </div>   
      <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted ">아이디로사용하실 Email을 입력해주세요</small>
      </div>
      <div class="">
        <label class="mb-2 my-2" for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control ml-2 mx-2" id="pw" name="pw"  placeholder="Password">
      </div>
      <div class="mb-2 my-2">
        <small id="passwordHelp" class="form-text text-muted">비밀번호는 영문숫자특수문자조합으로만들어주세요</small>
      </div>
       <div class="">
        <label class="mb-2 my-2">이름</label>
        <input type="name" class="form-control ml-2 mx-2" id="name"  name="name" placeholder="이름">
      </div>
       <div class="ml-2 mx-2">
        <label class="mn-2 my-2">성별</label>
         <select class="custom-select col-sm-4" id="sex" name="sex">
           <option>남자</option>
           <option>여자</option>
         </select>
      </div>
      <div class="">
        <label class="mb-2 my-2">나이</label>
        <input type="age" class="form-control ml-2 mx-2" id="age" name="age" placeholder="이름">
      </div>
      <div class="">
        <label class="mb-2 my-2">전화번호</label>
        <input type="tel" class="form-control ml-2 mx-2" id="tel" name="tel" placeholder="이름">
      </div>
    </div>
    </div>
      <input type="hidden" name="mem_level" value="3">
      <input type="submit" value="회원가입">
</form>
</body>
</html>