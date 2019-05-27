<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script language="javascript">
 
 function checkForm(){
	 
	   var formId=/^[a-z|A-Z]/;
	   var formName=/^[가-힣]*$/;
	 
	   var c = document.my;
	   
	  
	   if(c.id.value==""){
		  alert("아이디를입력해주세요");
		  c.id.focus();
		  return false;	  
	   }else{
			 if(!formId.test(c.id.value)){
		     alert("id는영문으로만");
		     c.id.focus();
			 return false;	 
	         }else{
	        	  if(c.id.value.length<4 || c.id.value.length>12){
	        	  alert("아이디를 4~12내로 만들어주세요");
	        	  c.id.focus();
	    		  return false;	 
	        	  }
	        	
	         }
	   }
	   
	   if(c.pw.value==""){
		 alert("비밀번호를입력해주세요");
		 c.pw.focus();
		 return false;
	   }else{
	        if(c.pw.value.length < 4 || c.pw.value.length > 8){
		    alert("비밀번호는 4~8자까지만 가능합니다"); 
		    c.pw.focus();
			return false;
	        }
	   }
	   
	   if(c.pw.value!=c.pw2.value){
		   alert("비밀번호가 같은지 확인해주세요");
		   c.pw.focus();
		   return false;
	   }
	   
	   if(!c.name.value){
		   alert("이름을입력해주세요");
		   c.name.focus();
		   return false;
	   }else{
	        if(!formName.test(c.name.value)){
		    alert("이름을한글로입력해주세요")
		    c.name.focus();
			return false;
		    }
	   }
	   
	   if(!c.mail.value){
		   alert("이메일을 입력해주세요");
		   c.mail.focus();
		   return false;
	   }
	   if(c.se.value=="통신사"){
		   alert("통신사를체크해주세요");
		   c.se.focus();
		   return false;
	   }
	   if(!c.tel.value){
		   alert("연락처를입력해주세요");
		   c.tel.focus();
		   return false;
	   }
	   if(!c.post.value){
		   alert("우편번호를입력해주세요");
		   c.post.focus();
		   return false;
	   }
	   if(!c.re.value){
		   alert("주소를입력해주세요");
		   c.re.focus();
		   return false;
	   }
	   if(!c.re2.value){
		   alert("상세주소를입력해주세요");
		   c.re2.focus();
		   return false;
		   
	   }
 }
 function openConfirmId(inputid){
	 if(inputid.id.value == ""){
		 alert("중복확인에러 : 아이디를 입력하세요");
	 }
	 url = "confirmId.jsp?id=" + inputid.id.value;
	 
	 open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=310,height=180");
 }
 
</script>

<!doctype html>
<html lang="en">

 <head>
  <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
  <title>회원가입</title>
 </head>
 <body >
<div class="container">
  <form name="my" action="./signupPro.jsp" method="post" onsubmit="return checkForm();" >
<table width=700px>
  <tr>
    <td bgcolor="#EAEAEA">아이디</td>
      <td>
         <input type="text" name="id" size="10%" />
         <input type="button" name="confirm_Id" value="중복확인" 
          onClick="openConfirmId(this.form)"  />
      </td>
  </tr>
  <tr>
    <td bgcolor="#EAEAEA">암호</td> 
      <td>
         <input type="password" name="pw"  size="10%"  placeholder="****" />
     암호확인   <input type="password" name="pw2" size="10%"  placeholder="****" />
      </td>
  </tr>
  <tr>
      <td bgcolor="#EAEAEA"> 이름</td>
	  <td>
	     <input type="text" size="10%" name="name" />
	  </td>
  </tr>
  <tr>
     <td bgcolor="#EAEAEA"> 이메일 </td>
     <td>
     <input type="text" size="10%" name="mail"  placeholder="abcd@abcd.net" />
     </td>  
  </tr>	   
  <tr>
      <td bgcolor="#EAEAEA"> 연락처  </td> 
      <td > 
         <select name="se" >
           <option>통신사</option>
           <option>skt</option>
           <option>kt</option>
           <option>lg</option><br/>
         </select>
        <input type="text" size="10%" name="tel"  /> 
      </td>
  </tr>     
  <tr>
   
       <td bgcolor="#EAEAEA"> 우편번호</td> 
       <td >
          <input type="text"size="3%" name="post" /> 
	      <input type="button" value="우편번호검색" />
	   </td>
	
   </tr>	
  <tr>
     <td bgcolor="#EAEAEA"> 기본주소</td> 
     <td >
        <input type="text" size="70%" name="re"  />
     </td>
  </tr>   
  <tr>
    <td bgcolor="#EAEAEA"> 상세주소</td>
	   <td ><input type="text" size="70%" name="re2" /></td>
  </tr>
  
  <tr >
    <td  colspan="2" align="center"  > 
   
       <input type="submit" value="회원가입" />
   
   
       <input type="button" value="취소"/>
   
    </td>
  </tr>
</table>
</form  >
</div>
 </body>
</html>
