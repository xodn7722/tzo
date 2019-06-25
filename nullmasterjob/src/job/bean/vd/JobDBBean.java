package job.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;

public class JobDBBean {
	private static JobDBBean instance = new JobDBBean();
	
	public static  JobDBBean getInstance() {
		return instance;
	}
	
	private JobDBBean() {}
	
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
	
	public int getCount(int i) {
		int x = 0;
		try {
			conn = getConnection();
			sql="select count(*) from jobsub where jno=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace();}
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
			
		}
		return x;
	}
	public List getJabNames(int x) {
		List list = null;
		try {
			conn= getConnection();
			sql = "select * from jobsub where jno=? order by jsname asc";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					JobDataBean job = new JobDataBean();
					job.setJsname(rs.getString("jsname"));
					list.add(job);
				}while(rs.next());
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}		
		return list;
	}
}
