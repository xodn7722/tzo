package resume.bean.vd;

public class ResumeVO {
private int resume_code; //사람이많아진다면 이력서 이름제목이 겹칠수가있다.
private String tel;
private String email_id;
private String career;
private String academic;
private String intro;
private String resume_title;



public String getResume_title() {
	return resume_title;
}
public void setResume_title(String resume_title) {
	this.resume_title = resume_title;
}
public int getResume_code() {
	return resume_code;
}
public void setResume_code(int resume_code) {
	this.resume_code = resume_code;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getEmail_id() {
	return email_id;
}
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
public String getCareer() {
	return career;
}
public void setCareer(String career) {
	this.career = career;
}
public String getAcademic() {
	return academic;
}
public void setAcademic(String academic) {
	this.academic = academic;
}
public String getIntro() {
	return intro;
}
public void setIntro(String intro) {
	this.intro = intro;
}



}
