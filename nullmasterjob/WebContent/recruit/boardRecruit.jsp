<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="area.bean.vd.*" %>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="city.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="recruit"  class="recruit.bean.vd.RecruitDataBean">
	<jsp:setProperty name="recruit" property="*"/>
</jsp:useBean>
<!DOCTYPE html>


<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="table style.css" rel="stylesheet" type="text/css"/>
  <title>구인 게시판</title>
  <style>
    body { 
      margin: 0px;
      padding: 0px;
    }
  </style>
 
 <%!	int pageSize = 20;	%>	
 
  <%
  	String  pageNum= request.getParameter("pageNum");
  	if (pageNum == null) {
      pageNum = "1";
  	}
  	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
    int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
    int count = 0;
    int number=0;
    String str = null;
    
    List recruitList = null;
    
    DecimalFormat df = new DecimalFormat("###,###,###,###");
	

    RecruitDBBean dao = RecruitDBBean.getInstance();
    CityDBBean ctdao = CityDBBean.getInstance();
    
    count = dao.getCount();
    
    if (count >0){
    	recruitList = dao.getRecruits(startRow, endRow);
    }
    number = count - (currentPage-1)*pageSize;
    
    
  %>
</head>
<body>
 	<jsp:include page="/menu/menu.jsp" />
 	<br>

	<div class="container">
		<jsp:include page="NewFile2.jsp" />
		<br>
		<div class="row" align="center">
		<% if(count ==0){ %>
		<h1>저장된 글이 없습니다.</h1>
	<%}  else {
			
				for (int i=0; i<recruitList.size(); i++) {
					RecruitDataBean vo = (RecruitDataBean)recruitList.get(i);
					str = ctdao.getCityName(vo.getArea());
					String compensation = df.format(vo.getCompensation());
			%>
			<div class="col-md-3">
				<a href="contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code()%>"><img src="/ProjectTest/resources/recruit/<%=vo.getImg()%>" style="width: 100%; height: 70%"></a>
				<a class="btn btn-default" href="contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code() %>">
				<h6><%=vo.getSubject()%></h6>
				<p><%=str%>·<%=vo.getArea() %>
				 / 보상금: <%=compensation%>
				 </p>
				</a>
			</div>
			<%
				}
			}
			%>
		</div>
		<center>
		<%
	if(count >0){
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage > 10){ %>
			<a href="boardRecruit.jsp?pageNum=<%=startPage -10 %>">[이전]</a>
		<% }
		for (int i = startPage; i<=endPage; i++){ %>
			<a href="boardRecruit.jsp?pageNum=<%=i%>">[<%=i %>]</a>
	<%
		}
		  if (endPage < pageCount) {  %>
	        <a href="boardRecruit.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<% 
		  }
	}
%>
</center>
	</div>


</body>
</html>