<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="event.bean.vd.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); 

	String filename = "";
	String realFolder = request.getRealPath("//resources//event"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	int imgmax = 3* 1024* 1024;
	
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
	<%}  else if(f.length() >= imgmax ){
	f.delete();%>
		<script>
			alert("3MB 이하의 이미지만 업로드 가능합니다.");
			history.go(-1);
		</script>
	<% } else {
	String eventEmail = multi.getParameter("email");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String day = multi.getParameter("end_date");
	java.sql.Date end_date =  java.sql.Date.valueOf(day);
	
	EventDBBean dao = EventDBBean.getInstance();
	dao.insertEvent(fileName, end_date, eventEmail);
	
	response.sendRedirect("../main.jsp");
	}
%>