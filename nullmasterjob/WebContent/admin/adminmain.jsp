<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
 if(session.getAttribute("loginID") != null){
	 %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="/nullmasterjob/login/logout.jsp";
            }else if(val == "0"){
                location.href="/nullmasterjob/admin/admin_member_list.jsp";
            }else if(val == "1"){
                location.href="admin_company_list.jsp";
            }else if(val == "2"){
                location.href="";
            }else if(val == "3"){
                location.href="/nullmasterjob/login/modify.jsp";
            }
       
        }
        
    </script>
</head>
<body>
<jsp:include page="/menu/menu.jsp"/></div><br/>
<input type="button" value="로그아웃" onclick="changeForm(-1)" />
<input type="button" value="회원관리" onclick="changeForm(0)" />
<input type="button" value="기업등록관리" onclick="changeForm(1)" />
<input type="button" value="이벤트관리" onclick="changeForm(2)" />
<input type="button" value="관리자정보" onclick="changeForm(3)" />
</form>
</body>
</html>
<%}else{%>
<script>
alert("로그인해주세요");
location.href="/nullmasterjob/login/loginForm.jsp"
</script>
<%}%>