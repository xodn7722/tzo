package company.bean.vd;

import java.sql.Date;

public class CompanyDataBean {
	private int company_code;
	private String name;
	private String homepage;
	private String address;
	private Date found_date;
	private String logo;
	private int employee;
	private String intro;
	private String email_id;
	private String img;
	
	public int getCompany_code() {
		return company_code;
	}
	public void setCompany_code(int company_code) {
		this.company_code = company_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getFound_date() {
		return found_date;
	}
	public void setFound_date(Date found_date) {
		this.found_date = found_date;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public int getEmployee() {
		return employee;
	}
	public void setEmployee(int employee) {
		this.employee = employee;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
