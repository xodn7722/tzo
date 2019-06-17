package company.bean.vd;

import java.sql.*;
import java.sql.Date;

import javax.sql.*;

import javax.naming.*;
import java.util.*;

public class CompanyDBBean {
	private static CompanyDBBean instance = new CompanyDBBean();
	
	public static CompanyDBBean getInstance() {
		return instance;
	}

	private CompanyDBBean() {}
	
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
	
	public void insertCompany(String name, String homepage, String address, Date found_date,
			int employee, String intro, String email_id,String logo,String img) {
		try {
			conn = getConnection();
			sql = "insert into company values(company_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, homepage);
			pstmt.setString(3, address);
			pstmt.setDate(4, found_date);
			pstmt.setInt(5, employee);
			pstmt.setString(6, intro);
			pstmt.setString(7, email_id);
			pstmt.setString(8, logo);
			pstmt.setString(9, img);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
	}
	public CompanyDataBean getCompany(String email_id) {
		CompanyDataBean vo = null;
		
		try {
			conn = getConnection();
			sql = "select * from company where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new CompanyDataBean();
				vo.setAddress(rs.getString("address"));
				vo.setCompany_code(rs.getInt("company_code"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setEmployee(rs.getInt("employee"));
				vo.setFound_date(rs.getDate("found_date"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setImg(rs.getString("img"));
				vo.setIntro(rs.getString("intro"));
				vo.setLogo(rs.getString("logo"));
				vo.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return vo;
	}
	
	public CompanyDataBean getCompany(int company_code) {
		CompanyDataBean vo = null;
		
		try {
			conn = getConnection();
			sql = "select * from company where company_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, company_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new CompanyDataBean();
				vo.setAddress(rs.getString("address"));
				vo.setCompany_code(rs.getInt("company_code"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setEmployee(rs.getInt("employee"));
				vo.setFound_date(rs.getDate("found_date"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setImg(rs.getString("img"));
				vo.setIntro(rs.getString("intro"));
				vo.setLogo(rs.getString("logo"));
				vo.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return vo;
	}
	
	public int getResult(String email_id) {
		int x=0;
		try {
			conn = getConnection();
			sql = "select count(*) from company where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return x;
	}
	
	public int deleteCompanyCheck(String email_id) {
		int x = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from recruit where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return x;
	}
	public void deleteCompany(int code) {
		try {
			conn = getConnection();
			sql = "delete from company where company_code=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
			}
			pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
	}
	
	public void updateCompany(CompanyDataBean company,Date found_date) {
		
		try {
			conn = getConnection();
			sql = "update company set name=?, homepage=?, address=?, found_date=?, employee=?, intro=?"
					+ " where email_id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, company.getName());
			pstmt.setString(2, company.getHomepage());
			pstmt.setString(3, company.getAddress());
			pstmt.setDate(4, found_date);
			pstmt.setInt(5, company.getEmployee());
			pstmt.setString(6, company.getIntro());
			pstmt.setString(7, company.getEmail_id());
			pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
	}
}
