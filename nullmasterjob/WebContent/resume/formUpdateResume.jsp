<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="resume.bean.vd.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 쓰기</title>

<%
	String str = request.getParameter("code");
	int index = Integer.parseInt(str);
	ResumeDBBean dao = ResumeDBBean.getInstance();
	ResumeDataBean vo = dao.getResume(index);
%>

</head>
<body>

	<% if(session.getAttribute("loginID").equals(vo.getEmail_id())) {%>

	<jsp:include page="/menu/menu.jsp"/>

		
		<br/>
<h1 align="center" class="">이력서 수정하기</h1></br>
<form action="processUpdate.jsp?code=<%=vo.getResume_code() %>" method="post" name="my" onsubmit="return checkForm();">
<fieldset>
<div class="form-group" align="center">
   <div class="col-sm-4">
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">제목</label>
        <input type="text" class="form-control ml-2 mx-2" id="resume_title" name="resume_title" placeholder="제목" value="<%=vo.getResume_title()%>">
      </div>   
      
       <div class="form-group row">
        <label class="col-sm-2 col-form-label">경력</label>
        <textarea class="form-control ml-2 mx-2" id="career"  name="career" placeholder="경력" cols="5" rows="15"><%=vo.getCareer()%></textarea> 
      </div>
   
   	 <div class="form-group row">
        <label class="col-sm-2 col-form-label">학력</label>
        <input type="text" class="form-control ml-2 mx-2" id="academic"  name="academic" placeholder="최종 학력" value="<%=vo.getAcademic()%>">
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">소개</label>
        <textarea class="form-control ml-2 mx-2" id="intro" name="intro" placeholder="자기 소개" cols="5" rows="15"><%=vo.getIntro()%></textarea>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">전화번호</label>
        <input type="tel" class="form-control ml-2 mx-2" id="tel" name="tel" placeholder="연락가능한 전화번호"  value="<%=vo.getTel()%>" >
      </div>
      
      <input type="hidden" name="email_id" value="<%=vo.getEmail_id() %>" />
      <div align="center">
      <div class="form-group">
      <input type="reset" class="btn btn-info" value="리셋">
      <input type="submit" class="btn btn-primary" value="수정">
      </div>
      </div>
  </div>
      </fieldset>
</form>
<%} else {%>
<script>
		alert("수정할 권한이 없는 사용자입니다.");
		location.href="boardResume.jsp";
	</script>
<%} %>
</body>
</html>