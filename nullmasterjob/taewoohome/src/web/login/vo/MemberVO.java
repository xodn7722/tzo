package web.login.vo;
import java.sql.Timestamp;

public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String mail;
	private String se;
	
	private int tel;
	private int post;
	private String re;
	private String re2;
	private Timestamp reg;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getSe() {
		return se;
	}
	public void setSe(String se) {
		this.se = se;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getRe() {
		return re;
	}
	public void setRe(String re) {
		this.re = re;
	}
	public String getRe2() {
		return re2;
	}
	public void setRe2(String re2) {
		this.re2 = re2;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
}
