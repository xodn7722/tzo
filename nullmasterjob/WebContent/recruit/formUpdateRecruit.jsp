<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="member.bean.vd.*"%>
<%@ page import="job.bean.vd.*" %>
<%@ page import="java.util.List" %>
<%@ page import="work.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

<title>구인 수정1</title>

<%
	int index = Integer.parseInt(request.getParameter("code"));
	RecruitDBBean dao = RecruitDBBean.getInstance();
	RecruitDataBean vo = dao.getRecruit(index);
	
	JobDBBean jdao = JobDBBean.getInstance();
	WorkDBBean wdao = WorkDBBean.getInstance();
	String str = null;
	
	List job=null;
	int jobcount=0;
%>
</head>
<body>

	<jsp:include page="/menu/menu.jsp"/>


 	
 	<%  if (session.getAttribute("loginID")==null){ %>
 		<script>
 			alert("권한이없습니다.");
 			history.go(-1);
 		</script>
 	<%} else {
 		String id = (String)session.getAttribute("loginID");
 	if(session.getAttribute("loginID").equals(vo.getEmail_id())) {%>
		
	<center>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4">
			<h3 class="form-signin-heading">구인 수정</h3>
			<form class="form-signin" name=form id=form action="processUpdate.jsp?code=<%=vo.getRecruit_code() %>" method="post" >
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getSubject()%>" name="subject" required autofocus>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getNominator() %>"name="nominator" readonly >
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getApplicant() %>" name="applicant" readonly >
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getArea() %>" name="area" readonly>
				</div>
				
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getAddress() %>" id="address" name="address" readonly>
					
				</div>
				
				<div class="form-group">
					<select class="form-control" name="job_c">
					<% for(int i =0; i < 7; i++ ){
					int x = i+1;
					jobcount = jdao.getCount(x);
					job = jdao.getJabNames(x);
					str = wdao.getJobName(x); %>
					<optgroup label="<%=str%>" style="color: black;" >
					<%
						for(int j =0; j < jobcount; j++) {
									JobDataBean jvo = (JobDataBean)job.get(j);
					%>
					<option value="<%=jvo.getJsname()%>"><%=jvo.getJsname()%></option>
					<%} %>
					</optgroup>
					<%} %>
					</select>
				</div>
				
				<div class="form-group">
					<input type="date" class="form-control"  value="<%=vo.getEnd_date() %>" name="end_date" required>
				</div>
				
				<div class="form-group">
					<textarea class="form-control" rows="15" cols="20" name="content"><%=vo.getContent() %></textarea>
				</div>
				
	
				
				<div class="form-group">
					<input	type="email" class="form-control" value="<%=vo.getEmail_id() %>"  name="email_id" readonly>
				</div>
				
				<div class="form-group">
					<input	type="text" class="form-control" value="<%=vo.getCompany_name() %>"  name="company_name" readonly>
				</div>
				
				<input type="submit" class="btn btn btn-lg btn-success btn-block" value="수정">
			</form>
		</div>
	</div>
	<% } else  {%>
	<script>
		alert("수정할 권한이 없는 사용자입니다.");
		history.go(-1);
	</script>
	<% }
	}%>
</body>
</html>