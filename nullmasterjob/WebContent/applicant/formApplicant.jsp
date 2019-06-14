<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="web.member.dao.*" %>
<%@ page import="web.member.vo.*" %>
<%@ page import="resume.bean.vd.*" %>
<%@ page import="company.bean.vd.*" %>
<%@ page import="file.bean.vd.*" %>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<title>지원하기</title>

<%	
	String id = (String)session.getAttribute("loginID");
	String recruit_code =request.getParameter("code");
	
	MemberDAO mdao = MemberDAO.getInstance();
	MemberVO mvo = mdao.getMember(id);
	
	FileDBBean filedao = FileDBBean.getInstance();
	ResumeDAO resumedao = ResumeDAO.getInstance();
	
	List fileList = null, resumeList=null;
	
	int filecount = 0;
	int resumecount = 0;
	filecount = filedao.getFileCount(id);
	if (filecount >0){
		fileList = filedao.getFiles(id);
	}
	resumecount = resumedao.getCount(id);
	if (resumecount >0){
		resumeList = resumedao.getAllResume(id);
	}
	
	
%>

<script type="text/javascript">
	function check(){
		  var result = confirm("이대로 지원하시겠습니까?");
		  if(result){
			  alert("지원에 성공하였습니다.");
		  } else{
			  alert("취소하셨습니다.");
			  return false;
		  }
	}
</script>
</head>
<body>
	<center>
	<br>
	<form action="processInsert.jsp?recruit_code=<%=recruit_code %>" method="post">
	<table>
		<tr>
			<td>이름 </td>
			<td><input class="form-control" type="text" value="<%=mvo.getName() %>" name="name" readonly></td>
		</tr>
		
		<tr>
			<td>전화번호 </td>
			<td><input class="form-control" type="text" value="<%=mvo.getTel() %>" name="tel" readonly></td>
		</tr>
		
		<tr>
			<td>이메일 </td>
			<td><input class="form-control" type="text" value="<%=mvo.getEmail_id() %>" name="email_id" readonly></td>
		</tr>
	</table>
	<br>
	
		<div class="container">
			<table>
				<tr>
				<td style="width:100px" > <h4><small>내 파일</small></h4></td>
				<td>
				<% if(filecount == 0) {%>
					<h5>저장된 파일이없습니다.</h5>
				<% } else {%>
				<select class="form-control" name="file_name">
				<% for(int i=0; i< filecount; i++){ 
					FileDataBean vo = (FileDataBean)fileList.get(i); %>
				<option value="<%=vo.getName()%>"><%=vo.getName()%></option>
				<%} %>
				</select>
				<%} %>
				</td>
				</tr>
				
				<tr>
				<td style="width:100px" > <h4><small>내 이력서</small></h4></td>
				<td>
				<% if(resumecount == 0) {%>
					<h5>저장된 이력서가없습니다.</h5>
				<% } else {%>
				<select class="form-control" name="resume_subject">
				<% for(int i=0; i< resumecount; i++){ 
					ResumeVO vo = (ResumeVO)resumeList.get(i); %>
				<option value="<%=vo.getResume_title()%>"><%=vo.getResume_title()%></option>
				<%} %>
				</select>
				<%} %>
				</td>
				</tr>
			</table>
			<br>
			<div style="width:75%">
			<button type="submit" class="btn btn btn-lg btn-success btn-block" onclick="return check()">지원하기</button>
			</div>
		</div>
	</form>
		
</body>
</html>