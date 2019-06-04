package recruit.bean.vd;

import java.sql.Date;

public class RecruitDataBean {
	private int recruit_code;
	private String subject;
	private String content;
	private String group1;
	private String group2;
	private String img;
	private String address;
	private int compensation;
	private String email_id;
	private int nominator;
	private int applicant;
	private Date end_date;
	
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	public int getNominator() {
		return nominator;
	}
	public void setNominator(int nominator) {
		this.nominator = nominator;
	}
	
	public int getApplicant() {
		return applicant;
	}
	public void setApplicant(int applicant) {
		this.applicant = applicant;
	}
	
	public int getRecruit_code() {
		return recruit_code;
	}
	public void setRecruit_code(int recruit_code) {
		this.recruit_code = recruit_code;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
	}
	
	public String getGroup2() {
		return group2;
	}
	public void setGroup2(String group2) {
		this.group2 = group2;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getCompensation() {
		return compensation;
	}
	public void setCompensation(int compensation) {
		this.compensation = compensation;
	}
	
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	
	
}
