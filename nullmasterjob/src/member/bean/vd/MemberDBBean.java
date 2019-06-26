package member.bean.vd;
import java.sql.Connection;




import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;


public class MemberDBBean {

	private static MemberDBBean instance = new MemberDBBean();
	public static MemberDBBean getInstance() {
		return instance;
	}
	private MemberDBBean() {}
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
	public void insertMember(MemberDataBean vo) { //회원가입정보 vo에 입력
    	try {
    		conn = getConnection();
    		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, vo.getEmail_id());
    		pstmt.setString(2, vo.getPw());
    		pstmt.setString(3, vo.getName());
    		pstmt.setString(4, vo.getTel());
    		pstmt.setInt(5, vo.getAge());
    		pstmt.setString(6, vo.getSex());
    		pstmt.setString(7, vo.getMem_level());
    		pstmt.setInt(8, vo.getUserEmailChecked());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try{pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}	
    }
	
	public ArrayList<MemberDataBean> getAllMember(){ //회원가입정보리스트에추가
		ArrayList<MemberDataBean> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberDataBean>();
			while(rs.next()){
				MemberDataBean vo = new MemberDataBean();
				vo.setEmail_id(rs.getString("email_id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setTel(rs.getString("tel"));
				vo.setAge(rs.getInt("age"));
				vo.setSex(rs.getString("sex"));
				vo.setMem_level(rs.getString("mem_level"));
				vo.setUserEmailChecked(rs.getInt("userEmailChecked"));
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
	
	  public MemberDataBean getMember(String id){ //회원가입 정보보기
	    	MemberDataBean vo =null;
	    	try {
	    		conn = getConnection();
	    		String sql = "select * from member where email_id=?";
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setString(1, id);
	    		rs = pstmt.executeQuery();
	    		
	    		rs.next();
	    			vo = new MemberDataBean();
	    			vo.setEmail_id(rs.getString("email_id"));
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setTel(rs.getString("tel"));
					vo.setAge(rs.getInt("age"));
					vo.setSex(rs.getString("sex"));
					vo.setMem_level(rs.getString("mem_level"));
					vo.setUserEmailChecked(rs.getInt("userEmailChecked"));
	    		
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}finally {
	    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
	    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	    	}
	    	return vo;
	    
	    			
	    }
	    
	  public void updateCompanyMember(String id) {

	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(
	            "update member set mem_level='기업회원' where email_id=?");
	           
	    		pstmt.setString(1, id);
	    	    pstmt.executeUpdate();
	    	}catch(Exception ex){
	    		ex.printStackTrace();
	    	}finally {
	    		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	}
	    }
	  
	  public void updateMemberLevel(String id) {

	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement( "update member set mem_level='일반회원' where email_id=?");
	    		pstmt.setString(1, id);
	    	    pstmt.executeUpdate();
	    	}catch(Exception ex){
	    		ex.printStackTrace();
	    	}finally {
	    		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	}
	    }
	  
	    public void updateMember(MemberDataBean vo) throws SQLException{ //회원정보업데이트
	    	
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(
	            "update member set pw=?,name=?,tel=?,age=?,sex=?,mem_level=?,userEmailChecked=?"+
	            "where email_id=?");
	           
	    		pstmt.setString(1, vo.getPw());
	    		pstmt.setString(2, vo.getName());
	    		pstmt.setString(3, vo.getTel());
	    		pstmt.setInt(4, vo.getAge());
	    		pstmt.setString(5, vo.getSex());
	    		pstmt.setString(6, vo.getMem_level());
	    		pstmt.setInt(7, vo.getUserEmailChecked());
	    		pstmt.setString(8, vo.getEmail_id());
	    		
	    	    
	    	    pstmt.executeUpdate();
	    	}catch(Exception ex){
	    		ex.printStackTrace();
	    	}finally {
	    		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	}
	    	
	    }
	    
	    @SuppressWarnings("resource")
	    public int deleteMember(String id, String pw) //회원정보삭제
	    	    throws Exception {
	    	        Connection conn = null;
	    	        PreparedStatement pstmt = null;
	    	        ResultSet rs= null;
	    	        String dbpasswd="";
	    	        int x=-1;
	    	        try {
	    				conn = getConnection();

	    	            pstmt = conn.prepareStatement(
	    	            	"select pw from member where email_id = ?");
	    	            pstmt.setString(1, id);
	    	            rs = pstmt.executeQuery();
	    	            
	    				if(rs.next()){
	    					dbpasswd= rs.getString("pw"); 
	    					if(dbpasswd.equals(pw)){
	    						pstmt = conn.prepareStatement(
	    	            	      "delete from member where email_id=?");
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
	    
	    
	    
	    public String getUserEmail(String userID) {

			String SQL = "SELECT email_id FROM member WHERE email_id = ?";

			try {
				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getString(1); // 이메일 주소 반환

				}

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return null; // 데이터베이스 오류

		}

		

		public int getUserEmailChecked(String userID) {

			String SQL = "SELECT userEmailChecked FROM member WHERE email_id = ?";

			try {

				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getInt(1); // 이메일 등록 여부 반환

				}

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return 0; // 데이터베이스 오류

		}

		

		public int setUserEmailChecked(String userID) {

			String SQL = "UPDATE member SET userEmailChecked = 1 WHERE email_id = ?";

			try {

				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				pstmt.executeUpdate();

				return 1; // 이메일 등록 설정 성공

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return 0; // 이메일 등록 설정 실패

		}
		
		public void admindeleteMember(String id) //회원정보삭제
        {

	        try {
				conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"delete from member where email_id = ?");
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            
				
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			
	    }

}
