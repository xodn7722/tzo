<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<!DOCTYPE html>
<div >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/taewoo/main.jsp">nullmaster</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/taewoo/recruit/boardRecruit.jsp">채용정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/taewoo/resume/boardResume.jsp">이력서</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">추천</a>
      </li>
      <li class="nav-item">
        <% 
        String r = "회원가입/로그인";
        String ro = "내정보/로그아웃";
        String m = null;
        if(session.getAttribute("loginID") == null){
        m = r;%>    
        <a class="nav-link " href="/taewoo/login/loginForm.jsp"><%=m %></a>
        <%}else{ m = ro; %>
        <a class="nav-link " href="/taewoo/login/loginmain.jsp"><%=m %></a>
        <%}%>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
  </div>
</nav>