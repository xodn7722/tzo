<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css?ver=1">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
	
<title>My이력서</title>
<style type="text/css">
 .null {
    	height: 50px;
    }
    
  .FileBox {
  	width: 150px;
  	height: 150px;
  	border: 1px solid black;
  }
</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="null"></div>
	<div class="container">
		<form action="processResumeFileAdd.jsp" method="post" enctype="multipart/form-data">
		<div class="input-group">
 	 <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
  	</div>
  	<div class="custom-file">
    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
  </div>
</div>
	</div>
	<div class="null"></div>
	<div class="container">
	<div class="row">
		<h3>최근 파일</h3>
		<div class="container">
	<div class="text-right">
	<input type="submit" class="btn btn-primary" value="업로드">
		</form>
	</div>
		<div class="col-md-3">
				<div class="FileBox">
				
				</div>
			</div>
		
	</div>
	
	
	<div class="container">
	<div class="null"></div>
		<div class="row">
		<h3>최근 문서</h3>
	<div class="container">
	<div class="text-right">
		<button onclick="" class="btn btn-primary">이력서 쓰기</button>
		</div>
		</div>
		</div>
	</div>
		
</body>
</html>