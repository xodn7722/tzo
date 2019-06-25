package resume.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.sql.DataSource;

import file.bean.vd.FileDataBean;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

public class ResumeDBBean {

	private static ResumeDBBean instance = new ResumeDBBean();
	public static ResumeDBBean getInstance() {
		return instance;
	}
	
	private ResumeDBBean() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql="";
	
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
	
	public void insertResume(ResumeDataBean vo) { // 이력서 db 삽입
		try {
			conn = getConnection();
			sql = "insert into resume values(resume_seq.NEXTVAL,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTel());
			pstmt.setString(2, vo.getEmail_id());
			pstmt.setString(3, vo.getCareer());
			pstmt.setString(4, vo.getAcademic());
			pstmt.setString(5, vo.getIntro());
			pstmt.setString(6, vo.getResume_title());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null){try{pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public int getCount(String email_id) {
		int count=0;
		try {
			conn= getConnection();
			sql= "select count(resume_code) from resume where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
		} 
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(pstmt != null){try{pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return count;
	}
	
	public List getAllResume(String email_id){ //이력서 리스트에추가
		List ResumeList = null;
		try {
			conn = getConnection();
			sql = "select * from (select * from resume order by resume_code desc)"
					+ " where email_id=? and rownum < 11";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ResumeList = new ArrayList();
				do {
					ResumeDataBean resume = new ResumeDataBean();
					resume.setResume_code(rs.getInt("resume_code"));
					resume.setTel(rs.getString("tel"));
					resume.setEmail_id(rs.getString("email_id"));
					resume.setCareer(rs.getString("career"));
					resume.setAcademic(rs.getString("academic"));
					resume.setIntro(rs.getString("intro"));
					resume.setResume_title(rs.getString("resume_title"));
					ResumeList.add(resume);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return ResumeList;
		
	}
	
	/*
	 * public int confirmCode(String code)throws Exception{ //이력서코드중복확인 int x=-1;
	 * try { conn = getConnection(); pstmt =
	 * conn.prepareStatement("select resume_code from resume where resume_code=?");
	 * pstmt.setString(1, code);
	 * 
	 * rs = pstmt.executeQuery(); if(rs.next()) { x = 1; }else { x= -1; }
	 * 
	 * }catch(Exception e) { e.printStackTrace(); }finally { if(rs!=null) try
	 * {rs.close();} catch(SQLException e) {} if(pstmt!=null) try {pstmt.close();}
	 * catch(SQLException e) {} if(conn!=null) try {conn.close();}
	 * catch(SQLException e) {} } return x; }
	 */
	
	public ResumeDataBean getResume(int index){ //이력서 꺼내오기 정보보기
		ResumeDataBean vo =null;
    	try {
    		conn = getConnection();
    		sql = "select * from resume where resume_code=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, index);
    		rs = pstmt.executeQuery();
    		if(rs.next()){
    			vo = new ResumeDataBean();
    			vo.setEmail_id(rs.getString("email_id"));
    			vo.setResume_code(rs.getInt("resume_code"));
				vo.setTel(rs.getString("tel"));
				vo.setCareer(rs.getString("career"));
				vo.setAcademic(rs.getString("academic"));
				vo.setIntro(rs.getString("intro"));
				vo.setResume_title(rs.getString("resume_title"));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return vo;	
    }
	
	public ResumeDataBean getResume(String email_id){ //이력서 꺼내오기 정보보기
		ResumeDataBean vo =null;
    	try {
    		conn = getConnection();
    		sql = "select * from resume where email_id=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, email_id);
    		rs = pstmt.executeQuery();
    		if(rs.next()){
    			vo = new ResumeDataBean();
    			vo.setEmail_id(rs.getString("email_id"));
    			vo.setResume_code(rs.getInt("resume_code"));
				vo.setTel(rs.getString("tel"));
				vo.setCareer(rs.getString("career"));
				vo.setAcademic(rs.getString("academic"));
				vo.setIntro(rs.getString("intro"));
				vo.setResume_title(rs.getString("resume_title"));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return vo;	
    }
	
	public ResumeDataBean getResume(String email_id,String title){ //이력서 꺼내오기 정보보기
		ResumeDataBean vo =null;
    	try {
    		conn = getConnection();
    		sql = "select * from resume where email_id=? and resume_title=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, email_id);
    		pstmt.setString(2, title);
    		rs = pstmt.executeQuery();
    		if(rs.next()){
    			vo = new ResumeDataBean();
    			vo.setEmail_id(rs.getString("email_id"));
    			vo.setResume_code(rs.getInt("resume_code"));
				vo.setTel(rs.getString("tel"));
				vo.setCareer(rs.getString("career"));
				vo.setAcademic(rs.getString("academic"));
				vo.setIntro(rs.getString("intro"));
				vo.setResume_title(rs.getString("resume_title"));
    		} else {
    			vo = new ResumeDataBean();
    			vo.setEmail_id(null);
    			vo.setResume_code(0);
				vo.setTel(null);
				vo.setCareer(null);
				vo.setAcademic(null);
				vo.setIntro(null);
				vo.setResume_title(null);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return vo;	
    }
	
	public void deleteResume(int index) {
		try {
			conn = getConnection();
			sql = "delete from resume where resume_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public void updateResume(ResumeDataBean resume) {
		try {
			conn = getConnection();
			sql = "update resume set tel=?, career=?, academic=?, intro=?, resume_title=? "
					+ " where resume_code=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, resume.getTel());
			pstmt.setString(2, resume.getCareer());
			pstmt.setString(3, resume.getAcademic());
			pstmt.setString(4, resume.getIntro());
			pstmt.setString(5, resume.getResume_title());
			pstmt.setInt(6, resume.getResume_code());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) { try {pstmt.close();} catch(SQLException s) {}}
			if(conn != null) { try {conn.close();} catch(SQLException s) {}}
		}
	}
}
