 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="company.bean.vd.*" %>
 <%@ page import="recruit.bean.vd.*" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	request.setCharacterEncoding("UTF-8");

	String email_id = request.getParameter("email_id");
	CompanyDBBean cdao = CompanyDBBean.getInstance();
	CompanyDataBean cvo = cdao.getCompany(email_id);
	
	RecruitDBBean redao = RecruitDBBean.getInstance();
	
	List recruitList = null;
	int count = 0;
	count = redao.getCountCompany(email_id);
	
	if(count > 0){
		recruitList = redao.getRecruitsCompany(email_id);
	}
	
%>

<style>
	  .wrap {
      width: 500px;
    }
    .wrap textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }

    textarea:disabled{
    	width: 800px;
    	background-color: white;
    	resize: none;
    	border: 0;
    	overflow-y:hidden;
    } 
    .header{
    	width: 100%;
    	height: 5%;
    }
    
    .headimage{
    	width: 50px;
    	height: 50px;
    }
</style>

  <script type="text/javascript">
  $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
  
  function del(){
	  var result = confirm("일반회원으로 되며 현재 구인중인 글도 삭제됩니다.삭제하시겠습니까?");
	  if(result){
		  window.location.href = "processDelete.jsp?code=<%=cvo.getCompany_code() %>&id=<%=cvo.getEmail_id()%>";
	  }
  }
  
  function up(){
	  window.location.href = "formUpdateCompany.jsp?code=<%=cvo.getCompany_code() %>";
  }
  </script>
<title><%=cvo.getName() %></title>
</head>
<body>
	<jsp:include page="/menu/menu.jsp" />
	<br>
	<div class= "header">
	<div class="container">
		<div class="row" align="center">
		<div class="col-md-1">
		<img class="headimage" src="/Test/resources/company/<%=cvo.getLogo() %>">
		</div>
		<h3><%=cvo.getName() %></h3>
	</div>
	</div>
	</div>
	
	<hr style="margin-left:0;text-align:center; width:100%; color:#2E64FE">
	<div class="container">
		<div class="row" align="center">
		<div class="col-md-10">
		<h1><img src="/Test/resources/company/<%=cvo.getImg() %>" style="width: 100%; height: 80%"/></h1>
		</div>
		</div>
		</div>
		<br>
		<br>
		<div class="container">
			<div class="text-left">
				<h3>채용중인 포지션</h3>
				</div>
				</div>
				<br>
	<div class="container">
	<div class="col-md-9">
	<div class="row">
	<% if(count ==0){ %>
		<h1>직원을 모집하고 있지 않습니다.</h1>
	<%}  else { 
		for (int i=0; i<recruitList.size(); i++) {
			RecruitDataBean vo = (RecruitDataBean)recruitList.get(i);
	%>	
		<div class="col-md-4">
				<a href="/ProjectTest/recruit/contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code()%>">
				<img src="/ProjectTest/resources/recruit/<%=vo.getImg()%>" style="width: 100%; height: 70%"></a>
				<a class="btn btn-default" href="/ProjectTest/recruit/contentRecruit.jsp?recruit_code=<%=vo.getRecruit_code() %>">
				<h6><%=vo.getSubject()%></h6>
				</a>
	</div>
	<%	}
	}%>
	</div>
	</div>
	</div>	
	<br>
	<div class="container">
			<div class="text-left">
				<h3>회사 소개</h3>
				 <div class="wrap">
				<textarea  disabled ><%= cvo.getIntro() %></textarea>
				</div>
				</div>
			<table >
				<tr>
				<td> <h4><small>직원수</small></h4></td>
				<td> <h5><%=cvo.getEmployee() %></h5></td>
				</tr>
				
				<tr>
				<td><h4><small>주소</small></h4></td>
				<td><h5><%=cvo.getAddress() %></h5></td>
				</tr>
				
				<tr>
				<td style="width:200px"> <h4><small>홈페이지 주소</small></h4></td>
				<td style="width:500px"> <a href="<%=cvo.getHomepage()%>" target="_blank"><h5><%=cvo.getHomepage() %></h5></a></td>
				</tr>
				</table>
	</div>				
	<br>
	<% if (email_id.equals(session.getAttribute("loginID"))) {%>
	<div class="container">
		
			<div class="text-right">
				<button class="btn btn-danger" onclick="return del()">삭제</button>
				<button class="btn btn-primary" onclick="up()">수정</button>		
			</div>
		
	</div>
	<%} %>
	
	
</body>
</html>