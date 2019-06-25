<%@page import="java.io.File"%>
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


	
<%	String filename = "";
	String realFolder = request.getRealPath("//resources//recruit"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String type = multi.getContentType("img"); // image/ exe
	String [] format = type.split("/");	// [image][jpeg]
			
	   File f = multi.getFile("img");
	
	
	   if (!format[0].equals("image")) { 
		 	f.delete();
		 	%>
			<script>
				alert("이미지만 업로드 가능합니다.");
				history.go(-1);
			</script>
		<%}  else if(f.length() >= maxSize ){
		f.delete();%>
			<script>
				alert("5MB 이하의 이미지만 업로드 가능합니다.");
				history.go(-1);
			</script>
		<% } else {
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String area = multi.getParameter("area");
	String job_c = multi.getParameter("job_c");
	String address = multi.getParameter("address");
	String email_id = multi.getParameter("email_id");
	String day = multi.getParameter("end_date");
	String company = multi.getParameter("company_name");
	java.sql.Date end_date =  java.sql.Date.valueOf(day);
	int nominator = Integer.parseInt(multi.getParameter("nominator"));
	int applicant = Integer.parseInt(multi.getParameter("applicant"));
	int compensation = nominator + applicant;
	
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
	RecruitDBBean dao = RecruitDBBean.getInstance();
	dao.insertRecruit(subject, content, area, job_c, fileName, address, compensation,email_id, nominator, applicant, end_date,company);
	
	response.sendRedirect("boardRecruit.jsp");
	}
%>