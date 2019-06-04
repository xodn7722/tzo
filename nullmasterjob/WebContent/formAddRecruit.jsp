<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
	
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.address.value = roadFullAddr;
}

</script>
<title>Insert title here</title>
</head>
<body>
	<center>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">구인 등록</h3>
			<form class="form-signin" name=form id=form action="processRecruitAdd.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">제목</label>
					<input type="text" class="form-control" placeholder="제목" name="subject" required autofocus>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">추천인</label>
					<input type="text" class="form-control" placeholder="추천인 금액" name="nominator" required >
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">지원자</label>
					<input type="text" class="form-control" placeholder="지원자 금액" name="applicant" required >
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">그룹1</label>
					<input type="text" class="form-control" placeholder="그룹1" name="group1" required>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">그룹2</label>
					<input type="text" class="form-control" placeholder="그룹2" name="group2" required>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">주소</label>
					<input type="text" class="form-control" placeholder="주소" id="address" name="address" required readonly >
					<input type="button" onClick="goPopup();" value="주소 찾기"/>
				</div>
				
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">구인 기간</label>
					<input type="text" class="form-control" placeholder="0000-00-00 까지(년-월-일)" name="end_date" required>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">내용</label>
					<textarea class="form-control" rows="15" cols="20" name="content"></textarea>
				</div>
				
	
				
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Email</label> 
					<input	type="email" class="form-control" placeholder="Email" name="email_id" required>
				</div>
				
				  <div class="form-group">
   					 <input type="file" name="img">
   					 <p class="help-block">회사관련 이미지를 업로드하십시오.</p>
  					</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">업로드</button>
			</form>
		</div>
	</div>
</body>
</html>