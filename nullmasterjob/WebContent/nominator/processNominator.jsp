<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="nominator.bean.vd.*" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="nominator"  class="nominator.bean.vd.NominatorDataBean">
	<jsp:setProperty name="nominator" property="*"/>
</jsp:useBean>
	
<%	if(session.getAttribute("loginID") == null){%>
	<script>
		alert("권한이 없습니다.")
	</script>	
<%	} else {
	String sessid = (String)session.getAttribute("loginID");
	String valueid = request.getParameter("applicant");
	int recruit_code = Integer.parseInt(request.getParameter("code"));
	
	NominatorDBBean dao = NominatorDBBean.getInstance();
	int check = 0;
	check = dao.getCheck(valueid,recruit_code);
	
	if(check !=0){ %>
	<script>
	alert("이미 추천 받은 사람입니다.");
	history.go(-1);
	</script>
<%}else {
	nominator.setNominator(sessid);
	nominator.setRecruit_code(recruit_code);
	dao.insertNominator(nominator);
%>
<script>
	alert("추천이 완료 되었습니다.");
	self.close();
</script>
<%}
}%>

