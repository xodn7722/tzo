package applicant.bean.vd;

public class ApplicantDataBean {
	private int applicant_code;
	private int recruit_code;
	private String name;
	private String tel;
	private String email_id;
	private String file_name;
	private String resume_subject;
	
	public int getApplicant_code() {
		return applicant_code;
	}
	public void setApplicant_code(int applicant_code) {
		this.applicant_code = applicant_code;
	}
	
	
	public int getRecruit_code() {
		return recruit_code;
	}
	public void setRecruit_code(int recruit_code) {
		this.recruit_code = recruit_code;
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
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getResume_subject() {
		return resume_subject;
	}
	public void setResume_subject(String resume_subject) {
		this.resume_subject = resume_subject;
	}	
}
