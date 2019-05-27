<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="web.bean.dao.ProductRepository" %>
<%@ page import="web.bean.vo.Product" %>
<%
	request.setCharacterEncoding("UTF-8"); // post 방식 한글처리 
	String saveDir = request.getRealPath("resources//images//");
	String enc = "UTF-8";
	int maxSize = 1024*1024*10;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,saveDir,maxSize,enc,dp);
	String type = mr.getContentType("productImage");
	String [] t= type.split("/");
	if(t[0].equals("image")){
		Product vo = new Product();
		vo.setProductId(mr.getParameter("productId"));
		vo.setPname(mr.getParameter("name"));
		vo.setUnitPrice(Integer.parseInt(mr.getParameter("unitPrice")));
		vo.setDescription(mr.getParameter("description"));
		vo.setManufacturer(mr.getParameter("manufacturer"));
		vo.setCategory(mr.getParameter("category"));
		vo.setUnitsInStock(Integer.parseInt(mr.getParameter("unitsInStock")));
		vo.setCondition(mr.getParameter("condition"));
		vo.setFilename(mr.getFilesystemName("productImage"));
		ProductRepository pr = ProductRepository.getInstance();
		pr.addProduct(vo);
		response.sendRedirect("./products.jsp");
	}else{%>
		<script>
			alert("사진파일만 업로드 가능합니다.!!");
			history.go(-1);
		</script>
  <%}%>

















