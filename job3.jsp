<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.SearchDAO" %>
<%@ page import = "java.util.*" %>
<%@ page import = "web.bean.vo.JobDetailVO" %>
 <% 
 	int jdno = Integer.parseInt(request.getParameter("jdno"));
		 SearchDAO serch = SearchDAO.getInstance();
		ArrayList <JobDetailVO> jdlist = serch.getAllJobDetail(jdno);
 	
 %>
                           <%for(int i = 0 ; i > jdlist.size() ; i++) {
                           		JobDetailVO jdvo = jdlist.get(i);%>
                            <li>
                            
                                <div class="sri_input3">
                                    <input type="checkbox" id="cat_cd_101" name="cat_cd[]" value="101">
                                    <label for="cat_cd_101"><span class="txt"><%=jdvo.getJdname()%></span></label>
                                </div>
                            </li>
                            <%} %>