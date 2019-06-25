package work.bean.vd;
1
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class WorkDBBean {
	private static WorkDBBean instance = new WorkDBBean();
	
	public static  WorkDBBean getInstance() {
		return instance;
	}
	
	private WorkDBBean() {}
	
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
	
	public String getJobName(int x) {
		String str = null;
		try {
			conn = getConnection();
			sql = "select jname from jobgroup where jno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace();}
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}	
		return str;
	}
}
