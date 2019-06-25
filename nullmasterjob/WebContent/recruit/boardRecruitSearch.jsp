<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*" %>
<%@ page import="area.bean.vd.*" %>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="search.bean.vd.*" %>
<%@ page import="job.bean.vd.*" %>
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
	
	
	String area [] = request.getParameterValues("Category");
	
     	List recruitList = null;
	  	int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
	    int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
	    int number=0;
	    int count = 0;
	    
	    
	    
	    DecimalFormat df = new DecimalFormat("###,###,###,###");
	    RecruitDBBean dao = RecruitDBBean.getInstance();
    
	    for(int i = 0; i< area.length;i++){
	    	count += dao.searchCount(area[i]);
	    }
  %>
</head>
<body>
 	<jsp:include page="/menu/menu.jsp" />
 	<br>

	<div class="container">
		<jsp:include page="NewFile2.jsp" />
		<div class="row" align="center">
		<% if(count==0){ %>
		<h1>검색결과가 없습니다.</h1>
	<%}  else {
		for (int i=0; i< area.length; i++){
		recruitList = dao.getSearch(area[i]);
		count = dao.searchCount(area[i]);
				for (int j=0; j< count; j++) {
					RecruitDataBean vo = (RecruitDataBean)recruitList.get(j);
					String compensation = df.format(vo.getCompensation());
			%>
			<div class="col-md-3">
				<a href="contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code()%>"><img src="/ProjectTest/resources/recruit/<%=vo.getImg()%>" style="width: 100%; height: 70%"></a>
				<a class="btn btn-default" href="contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code() %>">
				<h6><%=vo.getSubject()%></h6>
				<p>보상금: <%=compensation%></p> 
				</a>
			</div>
			<%
				}
			}
	}
			%>
		</div>

	</div>


</body>
</html>