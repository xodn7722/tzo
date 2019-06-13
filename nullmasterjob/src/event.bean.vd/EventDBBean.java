package event.bean.vd;
import java.sql.*;
import javax.sql.*;


import javax.naming.*;
import java.util.*;
import java.util.Date; 

public class EventDBBean {
	private static EventDBBean instance = new EventDBBean();
	
	public static EventDBBean getInstance() {
		return instance;
	}
	private EventDBBean() {}
	
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
	
	public void insertEvent(EventDataBean event) throws Exception {
		
		try {
			conn = getConnection();
			sql = "insert into event(code,url,img,email,end_date) values (event_seq.NEXTVAL,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, event.getUrl());
			pstmt.setString(2, event.getImg());
			pstmt.setString(3, event.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		if(pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace();}
		if(conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace();}
		}
	}
	
	
	
	public List getEvents() {
		List eventList = null;
		try {
			conn = getConnection();
			sql = "select * from event  where end_date > sysdate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				eventList = new ArrayList();
			}
			do {
				EventDataBean event = new EventDataBean();
				event.setCode(rs.getInt("code"));
				event.setEmail(rs.getString("email"));
				event.setEnd_date(rs.getTimestamp("end_date"));
				event.setImg(rs.getString("img"));
				event.setUrl(rs.getString("url"));
				eventList.add(event);
			} while(rs.next());
		}catch (Exception e) {
			// TODO: handle exception
			   e.printStackTrace();
		} finally {
            if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
            if(conn != null) {try {conn.close();}catch(SQLException s) {}}
            }
		return eventList;
	}
	
	public int getCount() {
		int count =1;
		
		try {
			conn=getConnection();
			sql = "select count(code) from event where end_date > sysdate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e){ e.printStackTrace();}
		finally {
			  if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	            if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return count;
	}
}

