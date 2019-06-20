<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="board.bean.BoardDBBean" %>
<%@ page import ="board.bean.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
    int pageSize = 10;
    SimpleDateFormat sdf =
    	new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null){ pageNum = "1";} 
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage -1)* pageSize + 1;
    int endRow = currentPage * pageSize;  //1~10 11~20 21~30
    int count = 0;
    int number = 0;
    
    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    if ( count > 0){
    	articleList = dbPro.getArticles(startRow, pageSize);
    }
    number=count - (currentPage-1)*pageSize;
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="/menu/menu.jsp"/></div><br/>
<div class="container">
	<div class="col-md-4">
    <center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
    <tr>
      <td align="right">
        <a href="mylist.jsp">내글보기</a>  
        <%if(session.getAttribute("loginID") != null){%> 
             <a href="writeForm.jsp">글쓰기</a> 
        <%}else{%>
            <script>
              alert("로그인해주세요");
              location.href="/taewoo2/login/loginForm.jsp"
            </script>
        <%}%>
      </td>
</table>

<%if(count == 0){%>

    <table width="700" border="1" cellpadding="0" cellspacing="0">
     <tr>
       <td align="center">
                 게시판에 저장된 글이 없습니다.
       </td>
     </tr>
    </table>

<%}else{%>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="#EAEAEA"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
      <%for (int i = 0 ; i < articleList.size() ; i++) {
      BoardDataBean article = (BoardDataBean)articleList.get(i);
      %>
   <tr height="30">
    <td align="center"  width="50" >
     <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=number--%></a></td>
    <td  width="250" >
	  <%int wid=0; 
	    if(article.getRe_level()>0){
	    wid=5*(article.getRe_level());
	   %>
	  
	  <img src="images/level.gif" width="<%=wid%>" height="16">
	  <img src="images/re.gif">
	  <%}else{%>
	  <img src="images/level.gif" width="<%=wid%>" height="16">
	  <%}%>
           <%if(article.getPasswd() == null){ %>
           <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
           <%}else{ %> 
           <a href="contentpasswd.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a>
           <%} %>
          <%if(article.getPasswd() != null){ %>
          <img src="images/pw.png" width="20"> <%} %>
          <% if(article.getReadcount()>=20){%>
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100" ><%=article.getIp()%></td>
  </tr>
     <%}%>
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
		</div>
		<hr>
	</div>

</body>