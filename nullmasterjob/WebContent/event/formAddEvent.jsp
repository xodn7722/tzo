<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.css">  
<meta charset="UTF-8">
<title>이벤트 추가하기</title>
</head>
<body>
<%@ include file="/menu/menu.jsp"%>
	<center>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">이벤트 등록</h3>
			<form class="form-signin" action="processEventAdd.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputEmail" class="sr-only">Email</label> 
					<input	type="email" class="form-control" placeholder="Email" name='email' required>
				</div>
				<div class="form-group">
					<label for="end_date" class="sr-only">end_date</label> 
					<input	type="text" class="form-control" placeholder="end_date" name='end_date' required>
				</div>
				  <div class="form-group">
   					 <input type="file" name="img">
   					 <p class="help-block">메인으로 보여줄 이미지 입니다.</p>
  					</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">업로드</button>
			</form>
		</div>
	</div>

</body>
</html>