package web.login.dao;
import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;

import web.login.vo.MemberVO;


public class MemberDAO {
    private static MemberDAO instance = new MemberDAO();
    public static MemberDAO getInstance() {
	    return instance;
    }
    
    private MemberDAO() {}
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    public Connection getConnection() { // db연결
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
    
    public boolean loginCheck(String id,String pw) { //로그인 db에서 확인
    	boolean result = false;
    	try {
    		conn = getConnection();
    		String sql = "select * from members where id=? and pw=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, id);
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
    		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,sysdate)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, vo.getId());
    		pstmt.setString(2, vo.getPw());
    		pstmt.setString(3, vo.getName());
    		pstmt.setString(4, vo.getMail());
    		pstmt.setString(5, vo.getSe());
    		pstmt.setInt(6, vo.getTel());
    		pstmt.setInt(7, vo.getPost());
    		pstmt.setString(8, vo.getRe());
    		pstmt.setString(9, vo.getRe2());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try{pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}	
    }
    
    public ArrayList<MemberVO> getAllMember(){ //회원가입 정보 리스트에 추가
    	ArrayList<MemberVO> list = null;
    	try {
    		conn = getConnection();
    		String sql = "select * from members";
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		list = new ArrayList<MemberVO>();
    		while(rs.next()) {
    			MemberVO vo = new MemberVO();
    			vo.setId(rs.getString("id"));
    			vo.setPw(rs.getString("pw"));
    			vo.setName(rs.getString("name"));
    			vo.setMail(rs.getString("mail"));
    			vo.setSe(rs.getString("se"));
    			vo.setTel(rs.getInt("tel"));
    			vo.setPost(rs.getInt("post"));
    			vo.setRe(rs.getString("re"));
    			vo.setRe2(rs.getString("re2"));
    			vo.setReg(rs.getTimestamp("reg"));
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
    
    public MemberVO getMember(String preId){ //회원가입 정보보기
    	MemberVO vo =null;
    	try {
    		conn = getConnection();
    		String sql = "select * from members where id=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, preId);
    		rs = pstmt.executeQuery();
    		
    		rs.next();
    			vo = new MemberVO();
    			vo.setId(rs.getString("id"));
    			vo.setPw(rs.getString("pw"));
    			vo.setName(rs.getString("name"));
    			vo.setMail(rs.getString("mail"));
    			vo.setSe(rs.getString("se"));
    			vo.setTel(rs.getInt("tel"));
    			vo.setPost(rs.getInt("post"));
    			vo.setRe(rs.getString("re"));
    			vo.setRe2(rs.getString("re2"));
    			vo.setReg(rs.getTimestamp("reg"));
    		
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return vo;
    
    			
    }
    
    public void updateMember(MemberVO member) throws SQLException{
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	
    	try {
            conn = getConnection();
            pstmt = conn.prepareStatement(
            "update members set pw=?,name=?,mail=?,se=?,tel=?,post=?,re=?,re2=?"+
            "where id=?");
    	    pstmt.setString(1, member.getPw());
    	    pstmt.setString(2, member.getName());
    	    pstmt.setString(3, member.getMail());
    	    pstmt.setString(4, member.getSe());
    	    pstmt.setInt(5, member.getTel());
    	    pstmt.setInt(6, member.getPost());
    	    pstmt.setString(7, member.getRe());
    	    pstmt.setString(8, member.getRe2());
    	    pstmt.setString(9, member.getId());
    	    
    	    pstmt.executeUpdate();
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}finally {
    		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	}
    	
    }
    
    @SuppressWarnings("resource")
    public int deleteMember(String id, String pw)
    	    throws Exception {
    	        Connection conn = null;
    	        PreparedStatement pstmt = null;
    	        ResultSet rs= null;
    	        String dbpasswd="";
    	        int x=-1;
    	        try {
    				conn = getConnection();

    	            pstmt = conn.prepareStatement(
    	            	"select pw from members where id = ?");
    	            pstmt.setString(1, id);
    	            rs = pstmt.executeQuery();
    	            
    				if(rs.next()){
    					dbpasswd= rs.getString("pw"); 
    					if(dbpasswd.equals(pw)){
    						pstmt = conn.prepareStatement(
    	            	      "delete from members where id=?");
    	                    pstmt.setString(1, id);
    	                    pstmt.executeUpdate();
    						x= 1; //회원탈퇴 성공
    					}else
    						x= 0; //비밀번호 틀림
    				}
    	        } catch(Exception ex) {
    	            ex.printStackTrace();
    	        } finally {
    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    			return x;
    	    }
    	 
    
    public int confirmId(String id)throws Exception{
    	int x=-1;
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement("select id from members where id=?");
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