<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="web.bean.dao.SearchDAO" %>
<%@ page import ="web.bean.vo.JobSubVO" %>
<%@ page import ="java.util.*" %>

<%
	int jno = Integer.parseInt(request.getParameter("jsno"));
	SearchDAO serch = SearchDAO.getInstance();
	ArrayList <JobSubVO> jslist = serch.getAllSubJob(jno);

	// DAO 생성후 no 전달 값을 받아온다..
	
%>
    
 <ul class="list_sub" id="job1">
	<% for(int i = 0 ; i < jslist.size() ; i++){ 
		JobSubVO jsvo = jslist.get(i);
		%>
             <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="<%=jsvo.getJsno() %>" class="xs" name="Job_cd">
                                    <label for="<%=jsvo.getJsno() %>"><span class="txt"><%=jsvo.getJsname() %></span></label>
                                </div>
                            </li>
                 
                
	<%} %>
   </ul>