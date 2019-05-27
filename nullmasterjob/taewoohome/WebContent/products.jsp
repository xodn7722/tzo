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
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		ArrayList<Product> listOfProducts = ProductDAO.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
			    <img src="./resources/images/<%=product.getFilename()%>" style="width:30%" />
			  
				<h3><a href="./prodetail.jsp?index=<%=i%>"><%=product.getPname()%></a></h3> 
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
