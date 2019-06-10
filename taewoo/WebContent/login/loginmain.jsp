<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="logout.jsp";
            }else if(val == "0"){
                location.href="modify.jsp";
            }else if(val == "1"){
                location.href="";
            }else if(val == "2"){
                location.href="";
            }else if(val == "3"){
                location.href="emailSendAction.jsp";
            }
       
        }
        
    </script>
</head>
<body>
<jsp:include page="/menu/menu.jsp"/></div><br/>
<input type="button" value="로그아웃" onclick="changeForm(-1)" />
<input type="button" value="내정보" onclick="changeForm(0)" />
<input type="button" value="내이력서" onclick="changeForm(1)" />
<input type="button" value="내구인글" onclick="changeForm(2)" />
<input type="button" value="이메일인증" onclick="changeForm(3)" />
</form>
</body>
</html>