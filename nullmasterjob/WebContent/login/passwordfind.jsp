<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
 <form class="form-group" action="./passwordfindPro.jsp" method="post">
   <div class="form-group offset-2 mt-5 my-5">
   <small class="form-text text-muted">비밀번호를받으실 email아이디를 입력해주세요</small>
   <input type="text" name="email_id" placeholder="@email"/>
   <button type="submit" class="btn btn-primary">비밀번호찾기</button>
   </div>
 </form>
</body>
</html>