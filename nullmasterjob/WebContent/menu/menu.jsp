<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.member.dao.MemberDAO" %>
<%@ page import="web.member.vo.MemberVO" %>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css" integrity="sha384-i1LQnF23gykqWXg6jxC2ZbCbUMxyw5gLZY6UiUS98LYV5unm8GWmfkIS6jqJfb4E" crossorigin="anonymous">
 <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script>
function next(){
 if(confirm("로그아웃하시겠습니까?")){  
    }else{
    return false;
    }
}
</script>
<!DOCTYPE html>
<div >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/taewoo2/main.jsp">nullmaster</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/taewoo2/recruit/boardRecruit.jsp">채용정보</a>
      </li>

        <li class="nav-item">
        <a class="nav-link" href="/taewoo2/annual_salary/chart.jsp">직업별연봉</a>
      </li>

      
<%   
      
      MemberDAO dao = MemberDAO.getInstance();
      MemberVO vo = dao.getMember((String)session.getAttribute("loginID"));
      
%>

 <div class="dropdown mr-5 mx-5">
        <div class="fas fa-bars fa-2x" data-toggle="dropdown"></div>
      <%if( session.getAttribute("loginID") != null){%>
      <!-- 로그인상태일시 -->
      <!-- 관리자 -->
      <%if( vo.getMem_level().equals("관리자")){%>
          <div class="dropdown-menu">
              <a class="nav-link" href="#">관리자</a>
              <a class="nav-link" href="/taewoo2/event/formAddEvent.jsp">이벤트 추가</a>
              <a class="nav-link" href="/taewoo2/eventboard/event_board.jsp">배너신청란</a>
              <a class="nav-link" href="/taewoo2/admin/admin_member_list.jsp">회원관리</a>
              <a class="nav-link" href="/taewoo2/admin/admin_company_list.jsp">기업등록관리</a>
          </div>
      <!-- 기업회원 -->
      <%}else if( vo.getMem_level().equals("기업회원")){%>
           <div class="dropdown-menu">
              <a class="nav-link" href="/taewoo2/company/formAddCompany.jsp">기업등록</a>
              <a class="nav-link" href="/taewoo2/recruit/formAddRecruit.jsp">구인</a>
              <a class="nav-link" href="/taewoo2/eventboard/writeForm.jsp">배너신청</a>
               <a class="nav-link" href="/taewoo2/resume/boardResume.jsp">이력서</a>
          </div>
      
      <!-- 일반회원 -->   
      <%}else{%>
           <div class="dropdown-menu">
              <a class="nav-link" href="/taewoo2/resume/boardResume.jsp">이력서</a>
              <a class="nav-link" href="#">일반회원</a>
          </div>
      <%}%>
      <!-- 비로그인상태일시 -->
          <div class="dropdown-menu">
              <a class="nav-link" href="#">비로그인</a>
              <a class="nav-link" href="#">비로그인</a>
          </div>
      <%}%>
       
        </div>
  
     
        
        <li class="nav-item">
        <div class="dropdown mr-5 mx-5">  
	      <div class="fas fa-users-cog fa-2x" data-toggle="dropdown"></div>
       
                   <% 
                    String r = "회원가입/로그인";
                    String ro = "로그아웃";                 
                    if( session.getAttribute("loginID") == null){%>
                        <!-- 로그인이 아닌상태일시 -->
                          <div class="dropdown-menu">
                    	  <a class="nav-link " href="/taewoo2/login/loginForm.jsp"><%=r%></a>
                    	  </div>
                    	<%}else{
                    		if( session.getAttribute("loginID").equals("admin@admin")){%>
                        <!-- 관리자아이디로 로그인상태일시 -->        
                          <div class="dropdown-menu">
                          <a class="nav-link" href="/taewoo2/login/logout.jsp" onclick="return next()"><%=ro%></a>
                          <a class="nav-link" href="/taewoo2/login/modify.jsp">내정보</a>
                          
                          </div>  
                          <%}else{%>
                        <!-- 일반회원으로 로그인상태일시 -->
                          <div class="dropdown-menu">
                          <a class="nav-link" href="/taewoo2/login/logout.jsp" onclick="return next()"><%=ro%></a>
                          <a class="nav-link" href="/taewoo2/login/modify.jsp">내정보</a>
                          </div>
                          <%}%>                      
                     <%}%>
	        
	           </div>
        </div>
        </li>
    </ul>
       
    
    
  </div>
</nav>