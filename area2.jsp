<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="web.bean.dao.SearchDAO" %>
<%@ page import ="web.bean.vo.AreaVO" %>
<%@ page import ="java.util.*" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	SearchDAO serch = SearchDAO.getInstance();
	ArrayList <AreaVO> alist = serch.getAllLocation(no);

	// DAO 생성후 no 전달 값을 받아온다..
	
%>  
	<% for(int i = 0 ; i < alist.size() ; i++){ 
		AreaVO avo = alist.get(i);
		%>
	<li>
		<div class="sri_input3" >
			<input type="checkbox" id="<%=avo.getAsno() %>" name="loc_cd" >
			<label for="<%=avo.getAsno()%>"><span class="txt"><%=avo.getAsname() %></span></label>
		</div>
	</li>
	
	<%} %>