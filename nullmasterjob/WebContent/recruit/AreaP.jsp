<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="search.bean.vd.*"%>
<%@ page import ="java.util.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	String Area = request.getParameter("areaP");
	%>
	
	<input type="hidden" value="<%=Area %>" name="Category">					
	<span class="selected_keyword" id="as"><%=Area %><button type="button" class="btn_del remove-btn" onclick="remove()">삭제</button></span>  

	