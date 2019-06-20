<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "board.bean.vd.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="article" scope="page" class="board.bean.vd.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	BoardDBBean dbPro = BoardDBBean.getInstance();
    int check = dbPro.updateArticle(article);

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=event_board.jsp?pageNum=<%=pageNum%>" >
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

 