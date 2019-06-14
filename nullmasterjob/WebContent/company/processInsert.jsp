<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="company.bean.vd.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = request.getRealPath("//resources//company"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	int imgmax = 3* 1024* 1024;

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String type = multi.getContentType("img"); // image/ exe
	String [] format = type.split("/");	// [image][jpeg]
	
	String logotype = multi.getContentType("logo"); // image/ exe
	String [] logoformat = type.split("/");	// [image][jpeg]
	
	File logof = multi.getFile("logo");
   	File f = multi.getFile("img");
   
   
 if (!format[0].equals("image") || !logoformat[0].equals("image")  ) { 
 	f.delete();
 	logof.delete();
 	%>
	<script>
		alert("이미지만 업로드 가능합니다.");
		history.go(-1);
	</script>
<%}  else if(f.length() >= imgmax || logof.length() >= imgmax ){
	f.delete();
	logof.delete();
	%>
	<script>
		alert("3MB 이하의 이미지만 업로드 가능합니다.");
		history.go(-1);
	</script>
<% } else {
	String name = multi.getParameter("name");
	String homepage = multi.getParameter("homepage");
	String address = multi.getParameter("address");
	String job_group = multi.getParameter("job_group");
	int employee = Integer.parseInt(multi.getParameter("employee"));
	String intro = multi.getParameter("intro");
	String email_id = multi.getParameter("email_id");

	
	String img = multi.getFilesystemName("img");
	String logo = multi.getFilesystemName("logo");

	String day = multi.getParameter("found_date");
	java.sql.Date found_date =  java.sql.Date.valueOf(day);
	
	
	CompanyDBBean dao = CompanyDBBean.getInstance();	
	dao.insertCompany(name, homepage, address, found_date, employee, intro, email_id, logo,img);
	response.sendRedirect("../main.jsp");

		
}%>

