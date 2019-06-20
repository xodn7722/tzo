<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.bean.vd.BoardDBBean" %>
<%@ page import = "board.bean.vd.BoardDataBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>

</head>
<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");
  
  BoardDBBean dbPro = BoardDBBean.getInstance();
  BoardDataBean article =  dbPro.getArticle(num);
  String pp = article.getPasswd();
  if(pp.equals(passwd)){
  

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
    
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
<body>
<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		
		 <center><b>글내용 보기</b>
<br>
	<form>
<table width="700" border="1" cellspacing="0" cellpadding="0"  align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">글번호</td>
    <td align="center" width="125" align="center">
	     <%=article.getNum()%></td>
    <td align="center" width="125" bgcolor="#EAEAEA">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125"  bgcolor="#EAEAEA">작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr height="300">
    <td align="center" width="125" bgcolor="#EAEAEA">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" align="right" bgcolor="#EAEAEA" > 
	  <%  String lid = (String)session.getAttribute("loginID");
	  if(lid != null){ 
		 if(article.getWriter().equals(lid)){%>  
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%if(article.getPasswd() == null){ %>
	   <input type="button" value="글삭제" 
       onclick="document.location.href='listdeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%}else{ %>
	  <input type="button" value="글삭제" 
       onclick="document.location.href='listdeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%} 
	   }%>
	   <%if(lid.equals("taewoo")){ %>
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%}} %>
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>
		</div>
		<hr>
	</div>

</body>

<% }else{%>
       <script language="JavaScript">      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
      </script>
<%
    }
 %>