<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="applicant.bean.vd.*" %>
<%@ page import="nominator.bean.vd.*" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	
	 <%!	int pageSize = 20;	%>	
 
  <%
  
  	if(session.getAttribute("loginID")== null){%>
  		<script>
  			alert("권한이 없습니다.");	
  		</script>
  	<%} else {
  	String email_id = (String)session.getAttribute("loginID");
  	String  pageNum= request.getParameter("pageNum");
  	if (pageNum == null) {
      pageNum = "1";
  	}
  	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
    int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
    int count = 0, appcount=0, nomicount=0;
    int number=0;
    
    List recruitList = null;
    

    RecruitDBBean dao = RecruitDBBean.getInstance();
	
    count = dao.getCountCompany(email_id);
    
    ApplicantDBBean appdao = ApplicantDBBean.getInstance();
    NominatorDBBean nomidao = NominatorDBBean.getInstance();
    
    if (count >0){
    	recruitList = dao.getMyRecruits(startRow,endRow,email_id);
    }
    number = count - (currentPage-1)*pageSize;
  %>
<title>지원자 보기</title>
</head>
<body>

	<jsp:include page="/menu/menu.jsp"/>


	<br>
	
	<div class="container">
	<div align="center">
	<div class="col-md-12">
	<% if(session.getAttribute("loginID")== null){%>
			<script>
				alert("권한이 없습니다.");
			</script>
		<% } else %>
		<table class="table table-hover" >
		<thead>
			<tr height="30">
			<td align="center" width="100"> 번호 </td>
			<td align="center" width="600"> 제	   목 </td>
			<td align="center" width="100"> 지원자 수 </td>
			<td align="center" width="100"> 추천자 수 </td>
		</tr>
		</thead>
		<%
		if (count ==0){ %>
			<tr>
		<td colspan="4" align="center">구인글이 없습니다.</td>
		</tr>
		<%} else{
		 for (int i=0; i< recruitList.size();i++) {
	          RecruitDataBean vo = (RecruitDataBean)recruitList.get(i);
	          appcount = appdao.getApplicantCount(vo.getRecruit_code());
	          nomicount = nomidao.getNominatorCount(vo.getRecruit_code());
		%>
		<tr height="30">
		<td align="center" width="100"> <%=number-- %></td>
		<td align="left" width="600"><a href="boardApplicant.jsp?code=<%=vo.getRecruit_code()%>"><%=vo.getSubject() %></a></td>
		<td align="center" width="100"> <%=appcount %></td>
		<td align="center" width="100"> <%=nomicount %></td>
		</tr>
		<%} %>
		</table>

<%
	if(count >0){
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage > 10){ %>
			<a href="freePage.jsp?pageNum=<%=startPage -10 %>">[이전]</a>
		<% }
		for (int i = startPage; i<=endPage; i++){ %>
			<a href="freePage.jsp?pageNum=<%=i%>">[<%=i %>]</a>
	<%
		}
		  if (endPage < pageCount) {  %>
	        <a href="freePage.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<% 
		  }
	}
		}
} %>
</div>
</div>
</div>
</body>
</html>