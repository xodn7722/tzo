<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="recruit.bean.vd.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="recruit"  class="recruit.bean.vd.RecruitDataBean">
	<jsp:setProperty name="recruit" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css?ver=1">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
 <style>
    body { 
      margin: 0px;
      padding: 0px;
    }
    
    .header{
     position:   fixed;
     top: 	1;
     right:       1;
   	 width:      100%;
   	 height:     32px;
    }
    
    .border {
    	width: 400px;
    	height: 350px;
    	border: 2px solid black;
    }
    
    .null {
    	height: 50px;
    }
    
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
    
    table {
  border-spacing: 10px;
  border-collapse: separate;
	}
	table td {
  width: 200px;
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
  </script>
<%
	String str = request.getParameter("recruit_code");
	int index = Integer.parseInt(str);
	RecruitDBBean dao = RecruitDBBean.getInstance();
	RecruitDataBean vo = dao.getRecruit(index);
	String group1 = vo.getGroup1();
	int count = dao.getExtractionCount(group1, index);
	
	 List recruitList = null;
	    if (count >0){
	    	recruitList = dao.getExtraction(group1, index);
	    }
	
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	String nominator = df.format(vo.getNominator());
	String applicant = df.format(vo.getApplicant());
	
	Date beday = vo.getEnd_date();
	Date today = new Date();
	

	String day;
	int compare = beday.compareTo(today);
	if (compare > 0){
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		 day = transFormat.format(beday);
	} else {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		 day = transFormat.format(beday);
		day = "만료 되었습니다.";
	}
	
%>
<title><%=vo.getSubject() %></title>
</head>
<body>
<jsp:include page="/menu/menu.jsp" />
<div class="null"> </div>
	<div class="container">
		<div class="row" align="center">
		<div class="col-md-1">
		<h1><img src="/nullmasterjob/resources/images/<%=vo.getImg() %>" style="width: 800px; height: 80%"/></h1>
			</div>
			<div class="col-md-1">
			<div class="header">
				<div class="border">
				<div class="null"> </div>
				<h3>채용 보상금</h3>
				<div class="null"> </div>
			<div class="row">
				<div class="col-sm-6">
				<h5>추천인</h5>
				<p><%=nominator %>원
				</div>
				<div class="col-sm-6">
				<h5>지원자</h5>
				<p><%=applicant %>원
				</div>
				</div>
				<button  class="btn btn-primary">지원하기</button>
				</div>
				</div>
			</div>
			<div class="null"> </div>
			<div class="container">
			<div class="text-left">
				<h3><%=vo.getSubject() %></h3>
				 <div class="wrap">
				<textarea class="autosize"  disabled ><%=vo.getContent() %></textarea>
				</div>
			</div>
			</div>
			<hr style="margin-left:0;text-align:left; width:800px; color:#2E64FE">
			
					<table >
						<tr>
						<td> <h4><small>마감일</small></h4></td>
						<td> <h5><%=day %></h5></td>
						</tr>
						
						<tr>
						<td> <h4><small>주소</small></h4></td>
						<td style="width:500px"> <h5><%=vo.getAddress() %></h5></td>
						</tr>
					</table> 
			<div class="container">
			<div class="text-left">
			<div class="null"> </div>
			<h6><%=vo.getGroup1() %> 관련 최신글 입니다.</h6>
			</div>
			<div class="row" align="center">
		<% if(count == 0){ 
		%>
		<h1>저장된 글이 없습니다.</h1>
	<%} else{
		for (int i=0; i< count; i++) {
			RecruitDataBean forvo = (RecruitDataBean)recruitList.get(i);
			String compensation = df.format(forvo.getCompensation());
			%>
			<div class="col-md-3">
			<a href="contentRecruit.jsp?recruit_code=<%=forvo.getRecruit_code() %>">
				<img src="/nullmasterjob/resources/images/<%=forvo.getImg()%>" style="width: 100%; height: 80%"> </a>
				<a class="btn btn-default" href="contentRecruit.jsp?recruit_code=<%=forvo.getRecruit_code() %>">
				<h6><%=forvo.getSubject()%></h6>
				<p><%=compensation%></p>
				</a>
			</div>
	<%	}  
		} %>
			</div>
		</div>	
				</div>
			</div>
	</body>
</html>