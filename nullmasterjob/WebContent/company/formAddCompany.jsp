<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="company.bean.vd.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 등록</title>

<%
	String id = (String)session.getAttribute("loginID");
	int check = 0;
	
	CompanyDBBean dao = CompanyDBBean.getInstance();
	check = dao.getResult(id); 
	
%>


<script>
	function check(){
	var form = document.form;
	
	var url = form.homepage.value;
	var url_check = /^(http\:\/\/)/;	
	
	var found_date = form.found_date.value;
	var date_check = /^\d{4}-\d{2}-\d{2}$/;
	
	var employee = form.employee.value;
	var regInt= /^[0-9]*$/;
	if(!url_check.test(url)){
		alert("시작은 http://로 시작해주십시오.");
		form.homepage.focus();
		return false;
	}
	if(!date_check.test(found_date)){
		alert("0000-00-00 양식에 맞게 입력해주십시오.");
		form.found_date.focus();
		return false;
	}
	if(!regInt.test(employee)){
		alert("숫자만 입력 가능합니다.");
		form.employee.focus();
		return false;
	}
	}
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
</head>
<body>


	<% if(session.getAttribute("loginID")== null){%>
		<script>
			alert("권한이 없습니다.");
			history.go(-1);
		</script>
	<% } else {
	if(check == 0){
%>
	<jsp:include page="/menu/menu.jsp"/>
	<br/>
	
	
	<center>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4">
			<h3 class="form-signin-heading">회사 등록</h3>
			<form  name=form class="form-signin" action="processInsert.jsp" method="post" enctype="multipart/form-data" >
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">회사 이름</label>
					<input type="text" class="form-control" placeholder="회사 이름" name='name' required autofocus>
				</div>
				
				<div class="form-group">
					<label for="end_date" class="sr-only">회사 주소</label> 
					<input	type="text" class="form-control" placeholder="회사주소" id="address" name="address" required readonly>
					<input type="button" onClick="goPopup();" value="주소 찾기"/>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="sr-only">회사 홈페이지</label> 
					<input	type="text" class="form-control" placeholder="회사 홈페이지 주소  / http://주소" name='homepage' required>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="sr-only">설립날짜</label> 
					<input	type="text" class="form-control" placeholder="회사 설립 날짜 / 0000-00-00 양식으로 입력" name='found_date' required>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">직원 수</label>
					<input type="text" class="form-control" placeholder="직원수" name='employee' required autofocus>
				</div>
				
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">회사소개</label>
					<textarea class="form-control" rows="15" cols="20" name="intro"></textarea>
				</div>
				<div class="form-group">
					<label for="inputEventUrl" class="sr-only">담당자 이메일</label>
					<input type="text" class="form-control" value="<%=id%>"name='email_id' readonly>
				</div>
				
				  <div class="form-group">
   					 <input type="file" name="logo">
   					 <p class="help-block">회사 로고 이미지를 업로드해주십시오.</p>
  					</div>
  					
  					<div class="form-group">
   					 <input type="file" name="img">
   					 <p class="help-block">메인으로 보여줄 이미지 입니다.</p>
  					</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit" onclick="return check()">등록</button>
			</form>
		</div>
	</div>
	<%} else {
	%>
	<script>
		location.href="contentCompany.jsp?email_id=<%=id%>";
	</script>
	<%} 
	}%>
</body>
</html>