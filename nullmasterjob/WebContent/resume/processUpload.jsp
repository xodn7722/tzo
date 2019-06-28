<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="file.bean.vd.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
	

<%	String filename = "";
	String realFolder = request.getRealPath("//resources//file//"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String email_id = (String)session.getAttribute("loginID");
	String type = multi.getContentType("file"); // 
	String [] format = type.split("/");	

		String fileName = multi.getFilesystemName("file");
		String subject = multi.getParameter("subject");
		
		
		
		List<String> exeList = new ArrayList<String>();
		   exeList.add("plain");exeList.add("octet-stream"); exeList.add("pdf");

		File f = multi.getFile("file");
		if(!format[0].equals("application") && !format[0].equals("text") ){
			f.delete();
		%>
			<script type="text/javascript">
				alert("텍스트파일만 업로드 가능합니다.");
				history.go(-1);
			</script>
		<% } else if(!exeList.contains(format[1]) ){
				f.delete();%>
				<script type="text/javascript">
				alert("txt, xlsx, doc, pdf, hwp 파일만 가능합니다.");
				history.go(-1);
			</script>
		<% } else{
	FileDBBean dao = FileDBBean.getInstance();
	dao.uploadFile(subject, fileName, email_id);
		}
%>

	<script>
		window.close();
	</script>