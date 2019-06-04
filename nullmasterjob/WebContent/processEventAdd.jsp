<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="event.bean.vd.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="event" class="event.bean.vd.EventDataBean">
	<jsp:setProperty name="event" property="*"/>
</jsp:useBean>


<%


	String filename = "";
	String realFolder = request.getRealPath("images//"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String eventUrl = multi.getParameter("url");
	String eventEmail = multi.getParameter("email");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	String day = multi.getParameter("end_date");
	java.sql.Date end_date =  java.sql.Date.valueOf(day);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		conn = ds.getConnection();
		sql = "insert into event(code,url,img,email,end_date) values (event_seq.NEXTVAL,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, eventUrl);
		pstmt.setString(2, fileName);
		pstmt.setString(3, eventEmail);
		pstmt.setDate(4, end_date);
		pstmt.executeUpdate();
		
	
	if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
	if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}
	response.sendRedirect("main.jsp");
%>