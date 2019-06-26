<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.bean.vd.*" %>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css" integrity="sha384-i1LQnF23gykqWXg6jxC2ZbCbUMxyw5gLZY6UiUS98LYV5unm8GWmfkIS6jqJfb4E" crossorigin="anonymous">
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css?ver=1">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script>
function logout(){
 if(confirm("로그아웃하시겠습니까?")){  
    }else{
    return false;
    }
}
</script>
<!DOCTYPE html>
<meta charset="UTF-8">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
  <a class="navbar-brand" href="/Test/main.jsp">nullmaster</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
	<div class="col-md-2"></div>
  <div class="collapse navbar-collapse" align="center" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" >
        <a class="nav-link" href="/Test/recruit/boardRecruit.jsp">채용정보</a>
      </li>

        <li class="nav-item">
        <a class="nav-link" href="/Test/annual_salary/chart.jsp">직업별연봉</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/Test/resume/boardResume.jsp">이력서</a>
      </li>
      <%if(session.getAttribute("loginID")== null){ %>
	    </ul>
	</div>
	<%} else {
		String id = (String)session.getAttribute("loginID");
		MemberDBBean dao = MemberDBBean.getInstance();
	    MemberDataBean vo = dao.getMember(id);
	     if (vo.getUserEmailChecked() == 1 && vo.getMem_level().equals("일반회원")){%>
	     <li class="nav-item">
        <a class="nav-link" href="/Test/company/formAddCompany.jsp">기업 등록</a>
      </li>
        </ul>
	</div>
	    <%} %>
	 <%  if(vo.getMem_level().equals("기업회원")){
		%>
		</ul>
	</div>
	<ul class="nav navbar-nav">
	<li role="presentation" class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
          	 <span class="caret">기업 관리</span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <li><a  href="/Test/company/contentCompany.jsp?email_id=<%=id%>">기업 홈페이지</a></li>
          <li><a href="/Test/recruit/formAddRecruit.jsp">구인 글쓰기</a></li>
          <li><a href="/Test/applicant/boardList.jsp">구인 현황</a></li>
          <li><a href="/Test/eventboard/writeForm.jsp">프리미엄 광고 신청</a></li>
        </ul>
      </li>
    </ul>
  <%	} else if(vo.getMem_level().equals("관리자")){ %>
  </ul>
	</div>
	   <ul class="nav navbar-nav">
	<li role="presentation" class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
          	 <span class="caret">홈페이지 관리</span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="/Test/admin/admin_member_list.jsp">회원 관리</a></li>
          <li><a href="/Test/admin/admin_company_list.jsp">기업 신청 현황</a></li>
          <li><a href="/Test/eventboard/event_board.jsp">프리미엄 광고 신청 현황</a></li>
          <li><a href="/Test/event/formAddEvent.jsp">프리미엄 광고 등록</a></li>
        </ul>
      </li>
    </ul>
	    <%}
	    }%>
       <ul class="navbar-nav mr-auto">
        <li class="nav-item">
        <div class="dropdown mr-5 mx-5">  
	      <div class="fas fa-users-cog fa-2x" data-toggle="dropdown"></div>
       
                   <% 
                    String r = "회원가입/로그인";
                    String ro = "로그아웃";                 
                    if( session.getAttribute("loginID") == null){%>
                        <!-- 로그인이 아닌상태일시 -->
                          <div class="dropdown-menu">
                    	  <a class="nav-link " href="/Test/login/loginForm.jsp"><%=r%></a>
                    	  </div>
                    	<%}else{
                    		if( session.getAttribute("loginID").equals("admin@admin")){%>
                        <!-- 관리자아이디로 로그인상태일시 -->        
                          <div class="dropdown-menu">
                          <a class="nav-link" href="/Test/login/logout.jsp" onclick="return logout()"><%=ro%></a>
                          <a class="nav-link" href="/Test/login/modify.jsp">내정보</a>          
                          </div>  
                          <%}else{%>
                        <!-- 일반회원으로 로그인상태일시 -->
                          <div class="dropdown-menu">
                          <a class="nav-link" href="/Test/login/logout.jsp" onclick="return logout()"><%=ro%></a>
                          <a class="nav-link" href="/Test/login/modify.jsp">내정보</a>
                          </div>
                          <%}%>                      
                     <%}%>
	        
	           </div>
        </li>
    </ul>  
    </div>
</nav>