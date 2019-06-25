<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="applicant.bean.vd.*" %>
<%@ page import="nominator.bean.vd.*" %>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%!	int pageSize = 30;	%>	
 
  <%
  	String  pageNum= request.getParameter("pageNum");
  	int code = Integer.parseInt(request.getParameter("code"));
  	if (pageNum == null) {
      pageNum = "1";
  	}
  	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
    int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
    int count = 0;
    int number=0;
    
    List list = null;	

    ApplicantDBBean dao = ApplicantDBBean.getInstance();
    count = dao.getApplicantCount(code);
    
    NominatorDBBean nomidao = NominatorDBBean.getInstance();
 	
    RecruitDBBean rcdao = RecruitDBBean.getInstance();
    RecruitDataBean rcvo = rcdao.getRecruit(code);
    
    if (count >0){
    	list = dao.getApplicants(startRow, endRow,code);
    }
    number = count - (currentPage-1)*pageSize;
  %>
<title><%=rcvo.getSubject() %></title>
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
				history.go(-1);
			</script>
		<% } %>
		<table class="table table-hover" >
		<thead>
			<tr height="30">
			<td align="center" width="100"> 번호 </td>
			<td align="center" width="600"> 지원자  </td>
			<td align="center" width="100"> 추천자 </td>
			<td align="center" width="100"> 소개 </td>
		</tr>
		</thead>
		<%
		if(count==0){ %>
		<tr>
		<td colspan="4" align="center">지원자가없습니다.</td>
		</tr>
	<%	} else{
		 for (int i=0; i< list.size();i++) {
	          ApplicantDataBean vo = (ApplicantDataBean)list.get(i);
	          NominatorDataBean nomi = nomidao.getNominator(code,vo.getEmail_id());
	          String nominator = nomi.getNominator();
	          String info = nomi.getInfo();
	          if (nominator == null){
	        	  nominator =" ";
	          }
	          
	          if (info == null){
	        	  info =" ";
	          }
		%>
		<tr height="30">
		<td align="center" width="100"> <%=number-- %></td>
		<td align="center" width="200"><a href="contantApplicant.jsp?code=<%=vo.getRecruit_code()%>&email=<%=vo.getEmail_id()%>&file=<%=vo.getFile_name()%>&resume=<%=vo.getResume_subject()%>"><%=vo.getEmail_id() %></a></td>
		<td align="center" width="200"> <%=nominator %></td>
		<td align="center" width="600"> <%=info %></td>
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
 %>
</div>
</div>
</div>
</body>
</html>