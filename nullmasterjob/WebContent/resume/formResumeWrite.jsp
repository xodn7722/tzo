<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 쓰기</title>

<%
	String email_id = (String)session.getAttribute("loginID");
%>

</head>
<body>
		<jsp:include page="/menu/menu.jsp"/>
		
		<br/>
<h1 align="center" class="">이력서 쓰기</h1></br>
<form action="processWrite.jsp" method="post" name="my" onsubmit="return checkForm();">
<fieldset>
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">제목</label>
        <input type="text" class="form-control ml-2 mx-2" id="resume_title" name="resume_title" placeholder="제목">
      </div>   
      
       <div class="form-group row">
        <label class="col-sm-2 col-form-label">경력</label>
        <textarea class="form-control ml-2 mx-2" id="career"  name="career" placeholder="경력" cols="5" rows="15"></textarea> 
      </div>
   
   	 <div class="form-group row">
        <label class="col-sm-2 col-form-label">학력</label>
        <input type="text" class="form-control ml-2 mx-2" id="academic"  name="academic" placeholder="최종 학력">
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">소개</label>
        <textarea class="form-control ml-2 mx-2" id="intro" name="intro" placeholder="자기 소개" cols="5" rows="15"></textarea>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">전화번호</label>
        <input type="tel" class="form-control ml-2 mx-2" id="tel" name="tel" placeholder="연락가능한 전화번호">
      </div>
      
      <input type="hidden" name="email_id" value="<%=email_id %>" />
      <div align="center">
      <div class="form-group">
      <input type="reset" class="btn btn-info" value="리셋">
      <input type="submit" class="btn btn-primary" value="글쓰기">
      </div>
      </div>
  </div>
      </fieldset>
</form>
</body>
</html>