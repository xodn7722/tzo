<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="file.bean.vd.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="file" class="file.bean.vd.FileDataBean">
	<jsp:setProperty name="file" property="*"/>
</jsp:useBean>

	

<%	String filename = "";
	String realFolder = request.getRealPath("//resources//file//"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String email_id = (String)session.getAttribute("loginID");
	

		String fileName = multi.getFilesystemName("file");
		String subject = multi.getParameter("subject");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		conn = ds.getConnection();
		sql = "insert into resumefile values(resumefile_seq.NEXTVAL,?,?,?)";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, fileName);
		pstmt.setString(3, email_id);
		pstmt.executeUpdate();
	
	if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
	if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}
%>

	<script>
		window.close();
	</script>