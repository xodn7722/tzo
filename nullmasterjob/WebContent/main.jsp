<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="event.bean.vd.*" %>
<%@ page import="recruit.bean.vd.*" %>
<%@page import="java.util.List"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="event"  class="event.bean.vd.EventDataBean">
	<jsp:setProperty name="event" property="*"/>
</jsp:useBean>
<jsp:useBean id="recruit"  class="recruit.bean.vd.RecruitDataBean">
	<jsp:setProperty name="recruit" property="*"/>
</jsp:useBean>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<title>NULLMASTERJOB</title>

 <%!	int pageSize = 24;	%>	
 
  <%
  	String  pageNum= request.getParameter("pageNum");
  	if (pageNum == null) {
      pageNum = "1";
  	}
  	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
    int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
    int count = 0;
    int number=0;
    
    List recruitList = null;

    RecruitDBBean dao = RecruitDBBean.getInstance();
    count = dao.getCount();
    
    if (count >0){
    	recruitList = dao.getRecruits(startRow, endRow);
    }
  %>
  
<%
	EventDBBean edao = EventDBBean.getInstance();
	int ecount = edao.getCount();
	
	List EventList = null;

	if(ecount >0){
		EventList = edao.getEvents();
	}

%>

	
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

	.slide{
        height: 600px;
        overflow: hidden;
         position: relative;
        margin: 0 auto;
      }
      .slide ul{
        width: 40000px;
         position: absolute;
        top:0;
        left:0;
        font-size: 0;
      }
      .slide ul li{
        display: inline-block;
      }
      #back{
        position: absolute;
        top: 200px;
        left: 0;
        cursor: pointer;
        z-index: 1;
      }
      #next{
        position: absolute;
        top: 200px;
        right: 0;
        cursor: pointer;
        z-index: 1;
      }
      a:link {
      	text-decoration: none;
      	color : black;      	
      }
      a:visited {
      	text-decoration: none;
      	color : black; 
      }
      a:active {
      	text-decoration: none;
      	color : black;
      
      }
      a:hover {
      	text-decoration: none;
      	color : black;
      }
</style>

<script>
	$(document).ready(function(){
    var imgs;
    var img_count = <%=ecount%>;
    var img_position = 1;
    var $interval;
    imgs = $(".slide ul");
	
    img();
    timer();
    //버튼을 클릭했을 때 함수 실행
    $('#back').click(function () {
      back();
      img();
      window.clearInterval($interval);
      timer();
    });
    $('#next').click(function () {
      next();
      img();
      window.clearInterval($interval);   
      timer();
    });

    function back() {
      if(1<img_position){
        imgs.animate({
          left:'+=2000px'
        });
        img_position--;
      }
    }
    function next() {
      if(img_count>img_position){
        imgs.animate({
          left:'-=2000px'
        });
        img_position++;
      }
    }
    function img(){
    	if(img_position==1){
    		$("#back").hide();
    		$("#next").show();
    	} else if(img_position==img_count){
    		$("#next").hide();
    		$("#back").show();
    	} else {
    		$("#back").show();
    		$("#next").show();
    	}
    }
    
    function show(){
    	if(img_count>img_position){
            imgs.animate({
              left:'-=2000px'
            });
            img_position++;
          } else if(img_count==img_count){
        	  imgs.animate({
                  left:'0'
                });
                img_position=1;
          }
    	img();
    	}
    
    function timer(){
    	  $interval=setInterval(function(){show()},4000);                        
    	}
  });
</script>
</head>
<body>
 	<jsp:include page="menu.jsp"/>

<div class="slide">

	<%
			if (ecount==0){%>
				<h1>진행중인 이벤트가 없습니다!</h1>
			<%} else {%>
    	  <img id="back" src="images/back.png" alt="" width="100">
      <ul>
		<%
		for (int i=0; i < ecount; i++){ 
			EventDataBean forvo = (EventDataBean)EventList.get(i);
		%>
			<li><a href="<%=forvo.getUrl()%>"><img src="images/<%=forvo.getImg()%>" width="2000"  height="500" id="<%=forvo.getCode()%>"></a></li>
		<%} %>
		</ul>
		 <img id="next" src="images/next.png" alt="" width="100">
	</div>
	<%} %>
	<div class="container">
	<h1>새로운 구인글</h1>
	<h4><small>최신 구인글을 바로 확인하십시오.</small></h4>
	
		<div class="row" align="center">
		<% if(count ==0){ 
		%>
		<h1>저장된 글이 없습니다.</h1>
	<%} else if (count < 4) {
		
		for (int i=0; i< count; i++) {
			RecruitDataBean forvo = (RecruitDataBean)recruitList.get(i);
			DecimalFormat df = new DecimalFormat("###,###,###,###");
			String compensation = df.format(forvo.getCompensation());%>
			<div class="col-md-3">
			<a href="contentRecruit?recruit_code=<%=forvo.getRecruit_code() %>">
				<img src="images/<%=forvo.getImg()%>" style="width: 100%; height: 80%"></a>
				<a class="btn btn-default" href="contentRecruit.jsp?recruit_code=<%=forvo.getRecruit_code() %>">
				<h6><%=forvo.getSubject()%></h6>
				<p><%=compensation%></p>
				</a>
			</div>
	<%	}  
		}else {
				for (int i=0; i< 4; i++) {
					RecruitDataBean forvo = (RecruitDataBean)recruitList.get(i);
					DecimalFormat df = new DecimalFormat("###,###,###,###");
					String compensation = df.format(forvo.getCompensation());
			%>
			<div class="col-md-3">
				<a href="contentRecruit.jsp?recruit_code=<%=forvo.getRecruit_code() %>">
				<img src="images/<%=forvo.getImg()%>" style="width: 100%; height: 80%"></a>
				<a class="btn btn-default" href="contentRecruit.jsp?recruit_code=<%=forvo.getRecruit_code() %>">
				<h6><%=forvo.getSubject()%></h6>
				<p>보상금: <%=compensation%></p>
				</a>
			</div>
			<%
				}
			}
			%>
		</div>	
		</div>  
</div>

</body>
</html>