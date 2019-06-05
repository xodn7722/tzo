
<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="web.member.dao.MemberDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  
    
   
    MemberDAO dao = MemberDAO.getInstance();
    

	String loginID = null;

	if(session.getAttribute("loginID") != null) {

		loginID = (String) session.getAttribute("loginID");

	}

	if(loginID == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'loginForm.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	int emailChecked = dao.getUserEmailChecked(loginID);

	if(emailChecked == 1) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('이미 인증 된 회원입니다.');");

		script.println("location.href = 'loginForm.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}

	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:80/taewoo/login/";

	String from = "xodn7722@gmail.com";

	String to = dao.getUserEmail(loginID);

	String subject = "nullmasterjob 이메일인증";

	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +

		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

	

	// SMTP에 접속하기 위한 정보를 기입합니다.

	Properties p = new Properties();

	p.put("mail.smtp.user", from);

	p.put("mail.smtp.host", "smtp.googlemail.com");

	p.put("mail.smtp.port", "465");

	p.put("mail.smtp.starttls.enable", "true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	 

	try{

	    Authenticator auth = new Gmail();

	    Session ses = Session.getInstance(p, auth);

	    ses.setDebug(true);

	    MimeMessage msg = new MimeMessage(ses); 

	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);

	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);

	    msg.addRecipient(Message.RecipientType.TO, toAddr);

	    msg.setContent(content, "text/html;charset=UTF-8");

	    Transport.send(msg);
	    
	    PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('인증이메일전송완료.');");

		script.println("location.href = 'loginmain.jsp'");

		script.println("</script>");

		script.close();		

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('오류가 발생했습니다..');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

%>
