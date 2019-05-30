package web.member.dao;
import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;

import web.member.vo.MemberVO;

public class MemberDAO {

	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() { //db연결
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
	
	public boolean loginCheck(String email_id,String pw) { //로그인 db에서 확인
    	boolean result = false;
    	try {
    		conn = getConnection();
    		String sql = "select * from member where email_id=? and pw=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, email_id);
    		pstmt.setString(2, pw);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			result = true;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt !=null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return result;
    }
	public void insertMember(MemberVO vo) { //회원가입정보 vo에 입력
    	try {
    		conn = getConnection();
    		String sql = "insert into member values(?,?,?,?,?,?,?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, vo.getEmail_id());
    		pstmt.setString(2, vo.getPw());
    		pstmt.setString(3, vo.getName());
    		pstmt.setString(4, vo.getTel());
    		pstmt.setInt(5, vo.getAge());
    		pstmt.setString(6, vo.getSex());
    		pstmt.setInt(7, vo.getMem_level());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try{pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}	
    }
	
	public ArrayList<MemberVO> getAllMember(){ //회원가입정보리스트에추가
		ArrayList<MemberVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberVO>();
			while(rs.next()){
				MemberVO vo = new MemberVO();
				vo.setEmail_id(rs.getString("email_id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setTel(rs.getString("tel"));
				vo.setAge(rs.getInt("age"));
				vo.setSex(rs.getString("sex"));
				vo.setMem_level(rs.getInt("mem_level"));
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
	
	public int confirmId(String id)throws Exception{ //아이디중복확인
    	int x=-1;
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement("select email_id from member where email_id=?");
    		pstmt.setString(1, id);
    		
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
}
