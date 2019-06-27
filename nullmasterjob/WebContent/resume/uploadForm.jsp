<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<title>이력서 업로드</title>
<style type="text/css">
 .null {
    	height: 50px;
    }
 </style>
</head>
<body>
<br>
<div class="container" align="center">
<form action="processUpload.jsp" method="post" enctype="multipart/form-data">
	<input type="text" name="subject" placeholder="제목" required>
	<br>
	<br>
	<input type="file" name="file" readonly>
	<div class="null"></div>
	<input class="btn btn-primary" type="submit" value="업로드">
</form>
</div>
</body>
</html>