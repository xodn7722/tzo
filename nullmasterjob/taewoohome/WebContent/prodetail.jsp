<%@page import="web.bean.dao.ProductRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="web.bean.vo.Product"%>
<%
 ProductRepository ProductDAO = ProductRepository.getInstance();
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	 <% 
	    int index = Integer.parseInt(request.getParameter("index")); 
	    Product vo = ProductDAO.getAllProducts().get(index);
	 %>
	 
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
		    <img src="./resources/images/<%=vo.getFilename()%>" style="width:70%" />
			<h3><%= vo.getPname() %></h3>
			<p><%= vo.getDescription() %></p>
			<p>제조사<%= vo.getManufacturer() %></p>
			<p>분류<%= vo.getCategory() %></p>
			<p>재고수량<%= vo.getUnitsInStock() %></p>
			<p>가격<%= vo.getUnitPrice() %></p>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
