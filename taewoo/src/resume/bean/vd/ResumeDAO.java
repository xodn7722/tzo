package resume.bean.vd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;

import web.member.vo.MemberVO;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

public class ResumeDAO {

	private static ResumeDAO instance = new ResumeDAO();
	public static ResumeDAO getInstance() {
		return instance;
	}
	
	private ResumeDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
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
	
	public void insertResume(ResumeVO vo) { // 이력서 db 삽입
		try {
			conn = getConnection();
			String sql = "insert into resume values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getResume_code());
			pstmt.setString(2, vo.getTel());
			pstmt.setString(3, vo.getEmail_id());
			pstmt.setString(4, vo.getCarrer());
			pstmt.setString(5, vo.getAcademic());
			pstmt.setString(6, vo.getIntro());
			pstmt.setString(7, vo.getResume_title());
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null){try{pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public ArrayList<ResumeVO> getAllResume(){ //이력서 리스트에추가
		ArrayList<ResumeVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from resume";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<ResumeVO>();
			while(rs.next()){
				ResumeVO vo = new ResumeVO();
				vo.setResume_code(rs.getInt("resume_code"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setCarrer(rs.getString("carrer"));
				vo.setAcademic(rs.getString("academic"));
				vo.setIntro(rs.getString("intro"));
				vo.setResume_title(rs.getString("resume_title"));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return list;
		
	}
	
	public int confirmCode(String code)throws Exception{ //이력서코드중복확인
    	int x=-1;
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement("select resume_code from resume where resume_code=?");
    		pstmt.setString(1, code);
    		
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			x = 1;
    		}else {
    			x= -1;
    		}
    				
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs!=null) try {rs.close();} catch(SQLException e) {}
    		if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
    		if(conn!=null) try {conn.close();} catch(SQLException e) {}
    	}
    	return x;
    	
    }
	
	public ResumeVO getResume(String email_id){ //이력서 꺼내오기 정보보기
		ResumeVO vo =null;
    	try {
    		conn = getConnection();
    		String sql = "select * from resume where email_id=? or resume_code=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, email_id);
    		rs = pstmt.executeQuery();
    		
    		rs.next();
    			vo = new ResumeVO();
    			vo.setEmail_id(rs.getString("email_id"));
    			vo.setResume_code(rs.getInt("resume_code"));
				vo.setTel(rs.getString("tel"));
				vo.setCarrer(rs.getString("carrer"));
				vo.setAcademic(rs.getString("academic"));
				vo.setIntro(rs.getString("intro"));
				vo.setResume_title(rs.getString("resume_title"));
    		
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return vo;
    
    			
    }
	
	
	
	
}
