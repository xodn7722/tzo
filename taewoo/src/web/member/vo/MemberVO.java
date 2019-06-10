package web.member.vo;

public class MemberVO {
   private String email_id;
   private String name;
   private String tel;
   private String pw;
   private int age;
   private String sex;
   private String mem_level;
   private int userEmailChecked;
   
   
   
public String getMem_level() {
	return mem_level;
}
public void setMem_level(String mem_level) {
	this.mem_level = mem_level;
}
public int getUserEmailChecked() {
	return userEmailChecked;
}
public void setUserEmailChecked(int userEmailChecked) {
	this.userEmailChecked = userEmailChecked;
}
public String getEmail_id() {
	return email_id;
}
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}

  
  
}
