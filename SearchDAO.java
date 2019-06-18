package web.bean.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.bean.vo.AreaBVO;
import web.bean.vo.AreaVO;
import web.bean.vo.JobSubVO;
import web.bean.vo.RecruitVO;

public class SearchDAO {
	private static SearchDAO instance = new SearchDAO();
	public static SearchDAO getInstance(){ 
		return instance;
	};
	private  SearchDAO() {};
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt =null;
	
	public Connection getConnection() {
		try {	Context ctv = new InitialContext();
				Context ecv = (Context)ctv.lookup("java:comp/env");
				DataSource ds = (DataSource)ecv.lookup("jdbc/xe");
				conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	};
	
	
	public ArrayList<AreaVO> getAllLocation(int no) {
		ArrayList<AreaVO> alist = new ArrayList<AreaVO>();
		try {	
			conn = getConnection();
			String sql = "select * from areasub where ano = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				AreaVO vo = new AreaVO();
				vo.setAno(rs.getInt("ano"));
				vo.setAsname(rs.getString("asname"));
				vo.setAsno(rs.getInt("asno"));
				alist.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null){try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null){try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null){try {conn.close();}catch(SQLException e) {}}
		}
		return alist;
	}
	
	public ArrayList<RecruitVO> getAlllist(String area, String job) {
		ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
		try {	
			conn = getConnection();
			String sql = "select * from recruit where area = ? , job = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,area);
			pstmt.setString(2,job);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				RecruitVO vo = new RecruitVO();
				vo.setRecruit_code(rs.getInt("recruit_code"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setArea(rs.getString("area"));
				vo.setJob_c(rs.getString("job_c"));
				vo.setImg(rs.getString("img"));
				vo.setAddress(rs.getString("address"));
				vo.setCompensation(rs.getInt("Compensation"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setApplicant(rs.getInt("applicant"));
				vo.setNominator(rs.getInt("nominator"));
				vo.setEnd_date(rs.getDate("end_date"));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null){try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null){try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null){try {conn.close();}catch(SQLException e) {}}
		}
		return list;
	}


	public AreaBVO getAllBLocation(int no) {
			AreaBVO vo = null;
		try {	
			conn = getConnection();
			String sql = "select * from areagroup where ano = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				vo = new AreaBVO();
				vo.setAno(rs.getInt("ano"));
				vo.setAname(rs.getString("aname"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null){try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null){try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null){try {conn.close();}catch(SQLException e) {}}
		}
		return vo;
	}
	
	
	
	
	
	public ArrayList<JobSubVO> getAllSubJob(int jno) {
		ArrayList<JobSubVO> jslist = new ArrayList<JobSubVO>();
		try {	
			conn = getConnection();
			String sql = "select * from jobsub where jno = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, jno);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				JobSubVO jvo = new JobSubVO();
				jvo.setJsno(rs.getInt("jsno"));
				jvo.setJsname(rs.getString("jsname"));
				jvo.setJno(rs.getInt("jno"));
				jslist.add(jvo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null){try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null){try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null){try {conn.close();}catch(SQLException e) {}}
		}
		return jslist;
	}
	
	
	public int getJobCount() {
		int x = 0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select count(*) from job in(?)");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);			
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
	}
}