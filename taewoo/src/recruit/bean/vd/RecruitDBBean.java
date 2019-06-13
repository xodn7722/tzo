package recruit.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class RecruitDBBean {
private static RecruitDBBean instance = new RecruitDBBean();
	
	public static RecruitDBBean getInstance() {
		return instance;
	}
	private RecruitDBBean() {}
	
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
	
	public int getCount() {
		int count =1;
		
		try {
			conn=getConnection();
			sql = "select max(recruit_code) from recruit";
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
	public RecruitDataBean getRecruit(int index) {
			RecruitDataBean vo = null;
		
		try {
			conn = getConnection();
			sql = "select * from recruit where recruit_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new RecruitDataBean();
				vo.setRecruit_code(rs.getInt("recruit_code"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setGroup1(rs.getString("group1"));
				vo.setGroup2(rs.getString("group2"));
				vo.setImg(rs.getString("img"));
				vo.setAddress(rs.getString("address"));
				vo.setCompensation(rs.getInt("Compensation"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setApplicant(rs.getInt("applicant"));
				vo.setNominator(rs.getInt("nominator"));
				vo.setEnd_date(rs.getDate("end_date"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			   e.printStackTrace();
		} finally {
            if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
            if(conn != null) {try {conn.close();}catch(SQLException s) {}}
            }
		return vo;
	}
	
	public List getRecruits(int start, int end) throws Exception {
		List recruitList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant, r "+
							"from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant,rownum r " +
							"from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant " +
							"from recruit order by recruit_code desc) order by recruit_code desc) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				recruitList = new ArrayList(end);
			do {
				RecruitDataBean recruit = new RecruitDataBean();
				recruit.setEmail_id(rs.getString("email_id"));
				recruit.setSubject(rs.getString("subject"));
				recruit.setGroup1(rs.getString("group1"));
				recruit.setGroup2(rs.getString("group2"));
				recruit.setImg(rs.getString("img"));
				recruit.setAddress(rs.getString("address"));
				recruit.setRecruit_code(rs.getInt("recruit_code"));
				recruit.setCompensation(rs.getInt("compensation"));
				recruit.setContent(rs.getString("content"));
				recruit.setEnd_date(rs.getDate("end_date"));
				recruitList.add(recruit);
			} while(rs.next()); 
		}
	} catch(Exception e){
		e.printStackTrace();
		} finally {
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return recruitList;
	}
	public List getExtraction(String group1,int index) {
		List recruitList = null;
		try {
			conn = getConnection();
			sql = "select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant" + 
					" from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant" + 
					" from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant" + 
					" from recruit order by recruit_code desc) order by recruit_code desc) where group1 =? and rownum <5 and recruit_code not in(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, group1);
			pstmt.setInt(2, index);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recruitList = new ArrayList();
			do {
				RecruitDataBean recruit = new RecruitDataBean();
				recruit.setEmail_id(rs.getString("email_id"));
				recruit.setSubject(rs.getString("subject"));
				recruit.setGroup1(rs.getString("group1"));
				recruit.setGroup2(rs.getString("group2"));
				recruit.setImg(rs.getString("img"));
				recruit.setAddress(rs.getString("address"));
				recruit.setRecruit_code(rs.getInt("recruit_code"));
				recruit.setCompensation(rs.getInt("compensation"));
				recruit.setContent(rs.getString("content"));
				recruit.setEnd_date(rs.getDate("end_date"));
				recruitList.add(recruit);
			} while(rs.next()); 
		}
	} catch(Exception e) {
			e.printStackTrace();
		} finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		
		return recruitList;
	}
	public int getExtractionCount(String group1,int index) {
		int count = 0;
		try {
			conn = getConnection();
			sql = "select max(rownum)" + 
					" from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant" + 
					" from (select recruit_code,subject,content,group1,group2,img,address,compensation,email_id,end_date,nominator,applicant" + 
					" from recruit order by recruit_code desc) order by recruit_code desc) where group1 =? and rownum <5 and recruit_code not in(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, group1);
			pstmt.setInt(2, index);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return count;
	}
}