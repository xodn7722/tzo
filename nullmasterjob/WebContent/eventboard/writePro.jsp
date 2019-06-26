<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.bean.vd.*" %>
<%@ page import = "java.sql.Timestamp" %>

<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="article" scope="page" class="board.bean.vd.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	article.setIp(request.getRemoteAddr());

    BoardDBBean dbPro = BoardDBBean.getInstance();
    dbPro.insertArticle(article);

    response.sendRedirect("/ProjectTest/main.jsp");
%>
