<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="file.bean.vd.*" %>
<%@ page import="resume.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="file" class="file.bean.vd.FileDataBean">
	<jsp:setProperty name="file" property="*"/>
</jsp:useBean>
<jsp:useBean id="resume" class="resume.bean.vd.ResumeVO">
	<jsp:setProperty name="resume" property="*"/>
</jsp:useBean>

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
  	display:-webkit-box;
  	display:-moz-box;
 	 display:-ms-flexbox;
 	 display:-webkit-flex;
 	 display:flex;

  align-items:center;
  justify-content:center;
  -webkit-align-items:center;
  -webkit-justify-content:center;

  -webkit-box-pack:center;
  -webkit-box-align:center;
  -moz-box-pack:center;
  -moz-box-align:center;
  -ms-box-pack:center;
  -ms-box-align:center;
  }
  
 .ResumeBox{
 	width: 250px;
  	height: 250px;
  	border: 1px solid black;
  	display:-webkit-box;
  	display:-moz-box;
 	 display:-ms-flexbox;
 	 display:-webkit-flex;
 	 display:flex;

  align-items:center;
  justify-content:center;
  -webkit-align-items:center;
  -webkit-justify-content:center;

  -webkit-box-pack:center;
  -webkit-box-align:center;
  -moz-box-pack:center;
  -moz-box-align:center;
  -ms-box-pack:center;
  -ms-box-align:center;
 }

</style>

<script type="text/javascript">
	function upload(){
		var pop = window.open("uploadForm.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
</script>
	<%
		String email_id = (String)session.getAttribute("loginID");
		FileDBBean dao = FileDBBean.getInstance();
		ResumeDAO redao = ResumeDAO.getInstance();
		
		int MAX_FILE = 10;
		int count = 0, recount=0;
		
		List FileList=null, resumeList= null;
		
		count = dao.getFileCount(email_id);
		recount= redao.getCount(email_id);
		
		if(count > 0){
			FileList = dao.getFiles(email_id);
		}
		
		if(recount > 0){
			resumeList = redao.getAllResume(email_id);
		}
	%>
</head>
<body>
	<jsp:include page="/menu/menu.jsp"/>
	<div class="null"></div>
	<div class="container">
	<div class="null"></div>
		<div class="row">
		<h3>최근 파일</h3>
	<div class="container">
	<div class="text-right">
		<button onclick="upload();" class="btn btn-primary">업로드</button>
		</div>
		</div>
		</div>
		
		<div class="row">
		<% if (count == 0){ %>
		<div class="FileBox">
			<div>
				저장된 파일이 없습니다.
			</div>
		</div>
		<%} else{
			for(int i=0; i< count; i++){
				FileDataBean vo = (FileDataBean)FileList.get(i);
			%>
		<div class="col-md-2">
		<div class="FileBox">
			<div>
				<a href="processDownload.jsp?name=<%=vo.getName()%>&id=<%=vo.getEmail_id()%>">
				<%=vo.getName() %>
				</a>
			</div>
		</div>
		</div>
		<%	}  
			}%>
	</div>
	</div>
	<div class="null"></div>
	
	<div class="container">
	<div class="null"></div>
		<div class="row">
		<h3>최근 문서</h3>
	<div class="container">
	<div class="text-right">
		<button onclick="location='formResumeWrite.jsp';" class="btn btn-primary">이력서 쓰기</button>
		</div>
		</div>
		</div>
		
		<div class="row">
		<% if (recount == 0){ %>
		<div class="ResumeBox">
			<div>
				저장된 문서가 없습니다.
			</div>
		</div>
		<%} else{
			for(int i=0; i< recount; i++){
				ResumeVO vo = (ResumeVO)resumeList.get(i);
			%>
		<div class="col-md-3">
		<div class="ResumeBox">
			<div>
				<a href="contentResume.jsp?code=<%=vo.getResume_code()%>"><%=vo.getResume_title() %></a>
			</div>
		</div>
		</div>
		<%	}  
			}%>
	</div>
	</div>
		
</body>
</html>