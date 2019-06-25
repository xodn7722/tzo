<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="applicant.bean.vd.*" %>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="file.bean.vd.*" %>
<%@ page import="resume.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  .wrap {
      width: 500px;
    }
    .wrap textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }

    textarea:disabled{
    	width: 800px;
    	background-color: white;
    	resize: none;
    	border: 0;
    	overflow-y:hidden;
    } 
</style>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	String email = request.getParameter("email");
	String file = request.getParameter("file");
	String resume = request.getParameter("resume");
	RecruitDBBean rcdao = RecruitDBBean.getInstance();
	RecruitDataBean rcvo = rcdao.getRecruit(code);
	
	ApplicantDBBean acdao = ApplicantDBBean.getInstance();
	FileDBBean filedao = FileDBBean.getInstance();
	ResumeDBBean rsdao = ResumeDBBean.getInstance();
	int rscount =  rsdao.getCount(email);
	int filecount = filedao.getFileCount(email);
	String rcid = rcvo.getEmail_id();
	
	if (session.getAttribute("loginID")== null){
%>
		<script>
		alert("권한이 없습니다.");
		history.go(-1);
		</script>	
<%	} else {
	String sessid = (String)session.getAttribute("loginID");
	if (!sessid.equals(rcid)){ %>
	<script>
	alert("권한이 없습니다.");
	history.go(-1);
	</script>	
<%	} %>
<title><%=rcvo.getSubject() %></title>
<%
	ApplicantDataBean acvo = acdao.getApplicant(code,email);
	FileDataBean filevo = filedao.getFile(file,email);
	ResumeDataBean rsvo = rsdao.getResume(email,resume);
%>
</head>
<body>
	<jsp:include page="/menu/menu.jsp"/>

	<br>
	
	<div class="container">
		<div class="col-md-12">
			<table >
			<tr>
			<td style="width:150px"> <h4><small>이름</small></h4></td>
			<td> <h5><%=acvo.getName() %></h5></td>
			</tr>
						
			<tr>
			<td> <h4><small>전화번호</small></h4></td>
			<td> <h5><%=acvo.getTel() %></h5></td>
			</tr>
			<tr>
			<td> <h4><small>이메일</small></h4></td>
			<td> <h5><%=acvo.getEmail_id() %></h5></td>
			</tr>
			</table>
			<br>
			<div class="text-left">
			<h3>이력서</h3>
			<%if (rscount==0){ %>
				<h5>이력서가 없습니다.</h5>	
		<%	} else { %>
			<table >
			<tr>
			<td style="width:150px"> <h4><small>학력</small></h4></td>
			<td>
				<div class="wrap">
				<textarea  disabled ><%=rsvo.getAcademic() %></textarea>
				</div>
			</td>
			</tr>
						
			<tr>
			<td> <h4><small>경력</small></h4></td>
			<td>
				 <div class="wrap">
				<textarea  disabled ><%=rsvo.getCareer() %></textarea>
				</div>
			</td>
			</tr>
			<tr>
			<td> <h4><small>소개</small></h4></td>
			<td>
			  <div class="wrap">
				<textarea  disabled ><%=rsvo.getIntro() %></textarea>
				</div>
			</td>
			</tr>
			</table>
			<%} %>
			<div class="row">
			<h3>첨부파일</h3>
			<div class="col-md-1"></div>
			<%if (filecount==0){ %>
				<h5>첨부파일이 없습니다.</h5>	
		<%	} else { %>
			<a href="processDownload.jsp?name=<%=filevo.getName()%>&id=<%=filevo.getEmail_id()%>">
				<h4><small><%=filevo.getSubject() %></small></h4>
				</a>
			<%} %>
			</div>
			</div>
			</div>
			</div>
</body>
<%} %>
</html>	