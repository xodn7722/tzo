<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<title>구인 수정</title>

<%
	int index = Integer.parseInt(request.getParameter("code"));
	RecruitDBBean dao = RecruitDBBean.getInstance();
	RecruitDataBean vo = dao.getRecruit(index);
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
 	if(session.getAttribute("loginID").equals(vo.getEmail_id())) {%>
	<center>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
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
					<input type="text" class="form-control" value="<%=vo.getGroup1() %>" name="group1" required>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getGroup2() %>"  name="group2" required>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" value="<%=vo.getAddress() %>" id="address" name="address" readonly>
					
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