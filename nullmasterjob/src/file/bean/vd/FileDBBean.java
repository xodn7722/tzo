package file.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class FileDBBean {
private static FileDBBean instance = new FileDBBean();
	
	public static FileDBBean getInstance() {
		return instance;
	}
	private FileDBBean() {}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	
	public Connection getConnection() throws Exception {
		try {
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/xe");
		conn = ds.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		return conn;
	}
	
	public int getFileCount(String email_id) {
		int count =0;
		try {
			conn = getConnection();
			sql = "select count(code) from resumefile where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		
		return count;
	}
	
	public List getFiles(String email_id) {
		List FileList = null;
		
		try {
			conn = getConnection();
			sql = "select *from (select * from resumefile order by code desc)"
					+ " where email_id=? and rownum<11  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				FileList = new ArrayList();
				do {
					FileDataBean resume = new FileDataBean();
					resume.setCode(rs.getInt("code"));
					resume.setEmail_id(rs.getString("email_id"));
					resume.setName(rs.getString("name"));
					resume.setSubject(rs.getString("subject"));
					FileList.add(resume);
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return FileList;
	}
	
	public FileDataBean getFile(String name,String email) {
		FileDataBean vo = null;
		try {
			conn = getConnection();
			sql ="select * from resumefile where name=? and email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new FileDataBean();
				vo.setCode(rs.getInt("code"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return vo;
	}
	public FileDataBean getFile(String email) {
		FileDataBean vo = null;
		try {
			conn = getConnection();
			sql ="select * from resumefile where  email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new FileDataBean();
				vo.setCode(rs.getInt("code"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return vo;
	}
	public void uploadFile(String subject, String fileName,String email_id) {
		try {
			conn = getConnection();
			sql = "insert into resumefile values(resumefile_seq.NEXTVAL,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, fileName);
			pstmt.setString(3, email_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			// TODO: handle finally clause
		}
	}
	public void deleteFile(int code,String id) {
		try {
			conn = getConnection();
			sql = "delete from resumefile where code=? and email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
