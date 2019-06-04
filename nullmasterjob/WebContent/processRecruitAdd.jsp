<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="recruit.bean.vd.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="recruit" class="recruit.bean.vd.RecruitDataBean">
	<jsp:setProperty name="recruit" property="*"/>
</jsp:useBean>

<%
	RecruitDBBean dao = RecruitDBBean.getInstance();
	
	
	
	 %>
	
	<script>
	alert(str);
	</script>
<%	String filename = "";
	String realFolder = request.getRealPath("images//"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String group1 = multi.getParameter("group1");
	String group2 = multi.getParameter("group2");
	String address = multi.getParameter("address");
	String email_id = multi.getParameter("email_id");
	String day = multi.getParameter("end_date");
	java.sql.Date end_date =  java.sql.Date.valueOf(day);
	int nominator = Integer.parseInt(multi.getParameter("nominator"));
	int applicant = Integer.parseInt(multi.getParameter("applicant"));
	int compen = nominator + applicant;
	
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
	
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		conn = ds.getConnection();
		sql = "insert into recruit values(recruit_seq.NEXTVAL,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt= conn.prepareStatement(sql);
		pstmt.setDate(1, end_date);
		pstmt.setString(2, subject);
		pstmt.setString(3, content);
		pstmt.setString(4, group1);
		pstmt.setString(5, group2);
		pstmt.setString(6, fileName);
		pstmt.setString(7, address);
		pstmt.setInt(8, compen);
		pstmt.setString(9, email_id);
		pstmt.setInt(10, nominator);
		pstmt.setInt(11, applicant);
		pstmt.executeUpdate();
	
	if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
	if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}
%>