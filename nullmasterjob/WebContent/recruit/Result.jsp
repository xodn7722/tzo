<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.SearchDAO" %>
<%@ page import = "web.bean.vo.RecruitVO" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type = text/javascript>
</script>
<%
	
	String area [] = request.getParameterValues("Category");
	ArrayList all = new ArrayList();
	for(int i=0;i<area.length;i++)
	{
		all.add(area[i]);
	}
	for(int i=0;i<all.size();i++)
	{
		//out.print(all.get(i));
	}

	 SearchDAO search = SearchDAO.getInstance();
	ArrayList <RecruitVO> list = search.getAlllist(all); 	
		out.print(list);
%>

<body>
<%-- <%for (int i = 0 ; i < list.size() ; i++){
		//RecruitVO vo = (RecruitVO)list.get(i);
		//out.print(vo.getArea()+"list");%>
<%} %> --%>
</body>
</html>