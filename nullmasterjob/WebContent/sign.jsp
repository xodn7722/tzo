<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/taewoo/resources/css/bootstrap.min.css" />
<title>회원 가입</title>
<% request.setCharacterEncoding("UTF-8");     %>
	<script>
		function chk(){
			var form = document.form;
			var regId= /^[A-z|0-9]*$/;
			var regInt= /^[0-9]*$/;
			var regEng= /^[A-z]*$/;
			var regPhone=/^\d{3}-\d{3,4}-\d{4}$/;
			var check= form.check.value;
			
			var idchk = form.id.value;
			var pw1chk = form.pw.value;
			var pw2chk = form.pw2.value;
			var phonchk = form.tell.value;
			var agechk = form.age.value;
			if(!regId.test(idchk)){
				alert("아이디는 대소문자, 숫자만 가능합니다.");
				form.id.focus();
				return false;
			}
			if(idchk.length < 6 || idchk.length > 12){
				alert("아이디는  6~12자 이내로 입력해주십시오. ");
				form.id.focus();
				return false;
			}
			if(regInt.test(idchk)){
				alert("문자와 혼합하여 주십시오.");
				form.id.focus();
				return false;
			}
			if(regEng.test(idchk)){
				alert("숫자와 혼합하여 주십시오.");
				form.id.focus();
				return false;
			}
			
			if(pw1chk!=pw2chk){
				alert("비밀번호가 일치 하지 않습니다.");
				form.pw1.select();
				return false;
			}
			if(phonchk.length >=1){
			if(!regPhone.test(phonchk)){
				alert("000-0000-0000의 방식으로 써주십시오.");
				form.tell.focus();
				return false;
				}
			}
			if(agechk.length >=1){
				if(!regInt.test(agechk)){
					alert("숫자만 입력 가능합니다.");
					form.age.focus();
					return false;
					}
				}
			
			if(check == 0){
				alert("중복 체크를 해주십시오.");
				return false;
			}
		}
		function openConfirmid(form){
			
			
			if(form.id.value==""){
				alert("아이디를 입력하세요");
				return;
			}
			url = "confirmId.jsp?id="+form.id.value;
			open(url,"confirm","toolbar=no, location=no, status=no, member=no, width=300, height=200");
			
		}
	</script>
</head>
<body>
		
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">회원 가입 </h1>
		</div>
	</div>
		<div class="container" style="display: inline-block;text-align: center;">
		<form name="form" action="signInsert.jsp" class="form-horizontal" method="post" onsubmit="return chk()" >
		<input type ="hidden" name="check" value=0 >
		<fieldset>
		<legend>필수 항목</legend>
		
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-2">
				<div class="btn-group">
				<input type="text" maxlength="12" name="id" class="form-control" placeholder="영어,숫자 혼합" autofocus required >
				<div class="col-sm-1" style="text-align:right;">
				<input type="button" name="confirm_id" class="btn btn-default" value="중복 확인" onclick="openConfirmid(this.form)">
				</div>
			</div>
		</div>
	</div>
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="pw" class="form-control" required>
				</div>
			</div>
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="pw2" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="email" name="email" class="form-control" placeholder="example@domain.com" required>
				</div>
			</div>
			</fieldset>
			
			<fieldset>
			<legend>선택 항목</legend>
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control"  >
				</div>
			</div>
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="tell" class="form-control" placeholder="000-0000-0000" >
				</div>
			</div>
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control"  >
				</div>
			</div>
			
			<div class="form-group row">
			<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">나이</label>
				<div class="col-sm-3">
					<input type="text" name="age" class="form-control"  >
				</div>
			</div>
						
				<div class="form-group row">
				<div class="col-sm-7"> 	</div>
				<label class="col-sm-2">직업</label>
				<div class="col-sm-3">
					<input type="text" name="job" class="form-control"  >
				</div>
			</div>
			</fieldset>
			
			
			<div class="form-inline" style="text-align:right" >
				<div class="col-sm-10"></div>
				<div class="form-group">
					<input type="reset"  class="btn btn-info" value="리셋" >
					<div class="col-sm-2" style="text-align:right" >
					<input type="submit"  class="btn btn-primary" value="등록" >
				</div>
				</div>
			</div>
			</form>
			</div>

	
</body>
</html>