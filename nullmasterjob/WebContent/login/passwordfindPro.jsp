
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
<%@ page import="web.member.vo.MemberVO" %>
<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
    
    String id = request.getParameter("email_id");
    MemberDAO dao = MemberDAO.getInstance();
    MemberVO vo = dao.getMember(id);

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:80/taewoo/login/";

	String from = "xodn7722@gmail.com";

	String to = id;

	String subject = "nullmasterjob 비밀번호";

	String content = vo.getName()+"님의비밀번호는"+vo.getPw()+"입니다";

	

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

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('오류가 발생했습니다..');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;
}%>

<script language="javascript">
alert("비밀번호전송완료");
self.opener = self;

window.close();

</script>
