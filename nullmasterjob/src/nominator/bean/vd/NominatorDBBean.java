package nominator.bean.vd;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.*;
import javax.naming.*;
public class NominatorDBBean {
	private static NominatorDBBean instance = new NominatorDBBean();
	
	public static NominatorDBBean getInstance() {
		return instance;
	}
	
	private NominatorDBBean() {}
	
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static String sql = null;
	
	public Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
	
	public void insertNominator(NominatorDataBean vo) {
		try {
			conn = getConnection();
			sql = "insert into nominator values(nominator_seq.NEXTVAL,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getRecruit_code());
			pstmt.setString(2,vo.getNominator());
			pstmt.setString(3,vo.getApplicant());
			pstmt.setString(4,vo.getInfo());
			pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public int getNominatorCount(int code) {
		int x = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from nominator where recruit_code=?";
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
	
	public NominatorDataBean getNominator(int code, String email_id) {
		NominatorDataBean vo = null;
		try {
			conn = getConnection();
			sql = "select * from nominator where recruit_code=? and applicant=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setString(2, email_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new NominatorDataBean();
				vo.setApplicant(rs.getString("applicant"));
				vo.setCode(rs.getInt("code"));
				vo.setInfo(rs.getString("info"));
				vo.setNominator(rs.getString("nominator"));
				vo.setRecruit_code(rs.getInt("recruit_code"));
			} else {
				vo = new NominatorDataBean();
				vo.setApplicant(null);
				vo.setCode(0);
				vo.setInfo(null);
				vo.setNominator(null);
				vo.setRecruit_code(0);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return vo;
	}
	public int getCheck(String applicant,int code) {
		int check=0;
		try {
			conn= getConnection();
			sql = "select count(*) from nominator where applicant=? and recruit_code=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,applicant);
			pstmt.setInt(2,code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}
		return check;
	}
}
