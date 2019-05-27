<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="web.login.dao.MemberDAO" %>
<%@ page import="web.login.vo.MemberVO" %>
<% 
   String id =(String)session.getAttribute("loginID");
	MemberDAO dao = MemberDAO.getInstance();  
    MemberVO vo = dao.getMember(id);
    
%>

<html>
<head>
<style type="text/css">
        table{
        
            border:3px solid gray;
        }
        
        td{
            border:1px solid gray;
        }
        
        #title{
            width:100px;
            background-color:#EAEAEA;
        }
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="loginmain.jsp";
            }else if(val == "0"){
                location.href="./modifyForm.jsp";
            }else if(val == "1"){
                location.href="./DeleteForm.jsp";
            }
        }
        
    </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
<br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table width=600px>
            <tr>
                <td id="title">아이디</td>
                <td>  <%= vo.getId()%></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%= vo.getPw()%></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%= vo.getName()%></td>
            </tr>
            <tr>
                <td id="title">메일</td>
                <td><%= vo.getMail()%></td>
            </tr>       
            <tr>
                <td id="title">휴대전화</td> 
                <td><%= vo.getSe()%><%= vo.getTel()%></td>
            </tr>
              <tr>
                <td id="title">우편번호</td> 
                <td><%= vo.getPost()%></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td><%= vo.getRe()%></td>
            </tr>
            <tr>
                <td id="title">상세주소</td>
                <td><%= vo.getRe2()%></td>
            </tr>
             <tr>
                <td id="title">가입일</td>
                <td><%= vo.getReg()%></td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
