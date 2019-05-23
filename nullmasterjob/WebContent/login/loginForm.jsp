<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/nullmasterjob/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
<jsp:include page="/menu/menu.jsp"/>
</div>
<div>
<form action="lofinPro.jsp" method="post">
   <input type="text" name="id" placeholder="아이디" /> <br/>
   <input type="password" name="pw" placeholder="비밀번호" />
</form>
</div>
</body>
</html>