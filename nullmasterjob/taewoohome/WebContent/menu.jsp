<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String login = "로그인";
String logout = "로그아웃";
String r = null;
if(session.getAttribute("loginID") == null){
	 r = login;
    }else{
    	r = logout;
    }

%>

    <nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">홈</a>
				<a class="navbar-brand" href="./products.jsp">상품</a>
				<a class="navbar-brand" href="./list.jsp">게시판</a>
				<a class="navbar-brand" href="./signupPage.jsp">회원가입</a>
				<a class="navbar-brand" href="./addProductPage.jsp">상품등록</a>
				<a class="navbar-brand" href="./loginmain.jsp"><%=r%></a>
				
			</div>
		</div>
	</nav>