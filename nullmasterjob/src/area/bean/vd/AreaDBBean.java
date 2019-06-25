package area.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;

public class AreaDBBean {
	private static AreaDBBean instance = new AreaDBBean();
	
	public static  AreaDBBean getInstance() {
		return instance;
	}
	
	private AreaDBBean() {}
	
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
			sql="select count(*) from areasub where ano=?";
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
	public List getAreaNames(int x) {
		List list = null;
		try {
			conn= getConnection();
			sql = "select * from areasub where ano=? order by asname asc";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, x);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					AreaDataBean area = new AreaDataBean();
					area.setAsname(rs.getString("asname"));
					list.add(area);
				}while(rs.next());
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace();}
			if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
			if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}	
		}		
		return list;
	}
}
