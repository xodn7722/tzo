<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String job = request.getParameter("jv");
						%>
	<input type="hidden" value="<%=job %>" name="Category">					
	<span class="selected_keyword" id="ss"><%=job %><button type="button" class="btn_del remove-btn" onclick="remove()">삭제</button></span>    