package applicant.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import recruit.bean.vd.RecruitDataBean;

public class ApplicantDBBean {
	private static  ApplicantDBBean instance= new ApplicantDBBean();
	
	public static ApplicantDBBean getInstance() {
		return instance;
	}
	private ApplicantDBBean() {}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = null;
	
	public Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void insertApplicant(ApplicantDataBean vo) {
		try {
			conn = getConnection();
			sql = "insert into applicant values(applicant_seq.NEXTVAL,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRecruit_code());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail_id());
			pstmt.setString(5, vo.getFile_name());
			pstmt.setString(6, vo.getResume_subject());
			pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
	}
	public int getApplicantCount(int code) {
		int x = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from applicant where recruit_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x= rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return x;
	}
	
	public List getApplicants(int start, int end, int code) {
		List List = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select applicant_code,recruit_code,name,tel,email_id,file_name,resume_subject,r" + 
					" from (select applicant_code,recruit_code,name,tel,email_id,file_name,resume_subject,rownum r  from applicant order by applicant_code desc)"
				  + " where r >= ? and r <= ? and recruit_code=? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				List = new ArrayList(end);
			do {
				ApplicantDataBean applicant = new ApplicantDataBean();
				applicant.setEmail_id(rs.getString("email_id"));
				applicant.setApplicant_code(rs.getInt("applicant_code"));
				applicant.setFile_name(rs.getString("file_name"));
				applicant.setName(rs.getString("name"));
				applicant.setRecruit_code(rs.getInt("recruit_code"));
				applicant.setResume_subject(rs.getString("resume_subject"));
				applicant.setTel(rs.getString("tel"));
				List.add(applicant);
			} while(rs.next()); 
		}
	} catch(Exception e){
		e.printStackTrace();
		} finally {
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return List;
	}
	public ApplicantDataBean getApplicant(int code,String email) {
		ApplicantDataBean vo = null;
		try {
			conn = getConnection();
			sql = "select * from applicant where recruit_code=? and email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ApplicantDataBean();
				vo.setApplicant_code(rs.getInt("applicant_code"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setFile_name(rs.getString("file_name"));
				vo.setName(rs.getString("name"));
				vo.setRecruit_code(rs.getInt("recruit_code"));
				vo.setResume_subject(rs.getString("resume_subject"));
				vo.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return vo;
	}
}
