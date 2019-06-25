package recruit.bean.vd;
import java.sql.Connection;
import java.sql.Date;
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
			sql = "select count(*) from recruit";
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
	
	public int getCountCompany(String email_id) {
		int count =0;
		
		try {
			conn=getConnection();
			sql = "select count(*) from recruit where email_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email_id);
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
	
	public void insertRecruit(String subject,String content,String area,String job_c,
			String img, String address, int compensation,String email_id,
			int nominator,int applicant, Date end_date,String company) 
	{
		try {
			conn = getConnection();
			sql = "insert into recruit values(recruit_seq.NEXTVAL,sysdate,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, end_date);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, area);
			pstmt.setString(5, job_c);
			pstmt.setString(6, img);
			pstmt.setString(7, address);
			pstmt.setInt(8, compensation);
			pstmt.setString(9, email_id);
			pstmt.setInt(10, nominator);
			pstmt.setInt(11, applicant);
			pstmt.setString(12, company);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
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
				vo.setArea(rs.getString("area"));
				vo.setJob_c(rs.getString("job_c"));
				vo.setImg(rs.getString("img"));
				vo.setAddress(rs.getString("address"));
				vo.setCompensation(rs.getInt("Compensation"));
				vo.setEmail_id(rs.getString("email_id"));
				vo.setApplicant(rs.getInt("applicant"));
				vo.setNominator(rs.getInt("nominator"));
				vo.setEnd_date(rs.getDate("end_date"));
				vo.setCompany_name(rs.getString("company_name"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			   e.printStackTrace();
		} finally {
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
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
					"select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name, r "+
							"from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name,rownum r " +
							"from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name " +
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
				recruit.setArea(rs.getString("area"));
				recruit.setJob_c(rs.getString("job_c"));
				recruit.setImg(rs.getString("img"));
				recruit.setAddress(rs.getString("address"));
				recruit.setRecruit_code(rs.getInt("recruit_code"));
				recruit.setCompensation(rs.getInt("compensation"));
				recruit.setContent(rs.getString("content"));
				recruit.setEnd_date(rs.getDate("end_date"));
				recruit.setCompany_name(rs.getString("company_name"));
				recruitList.add(recruit);
			} while(rs.next()); 
		}
	} catch(Exception e){
		e.printStackTrace();
		} finally {
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return recruitList;
	}
	
	public List getMyRecruits(int start, int end,String email_id) throws Exception {
		List recruitList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name, r "+
							"from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name,rownum r " +
							"from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name " +
							"from recruit order by recruit_code desc) order by recruit_code desc) where r >= ? and r <= ? and email_id=? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, email_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				recruitList = new ArrayList(end);
			do {
				RecruitDataBean recruit = new RecruitDataBean();
				recruit.setEmail_id(rs.getString("email_id"));
				recruit.setSubject(rs.getString("subject"));
				recruit.setArea(rs.getString("area"));
				recruit.setJob_c(rs.getString("job_c"));
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
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return recruitList;
	}
	
	public List getRecruitsCompany(String email_id) throws Exception {
		List recruitList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from (select * from (select * from recruit order by recruit_code desc) order by recruit_code desc) where sysdate < end_date and email_id=?");
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				recruitList = new ArrayList();
			do {
				RecruitDataBean recruit = new RecruitDataBean();
				recruit.setEmail_id(rs.getString("email_id"));
				recruit.setSubject(rs.getString("subject"));
				recruit.setArea(rs.getString("area"));
				recruit.setJob_c(rs.getString("job_c"));
				recruit.setImg(rs.getString("img"));
				recruit.setAddress(rs.getString("address"));
				recruit.setRecruit_code(rs.getInt("recruit_code"));
				recruit.setCompensation(rs.getInt("compensation"));
				recruit.setContent(rs.getString("content"));
				recruit.setEnd_date(rs.getDate("end_date"));
				recruit.setCompany_name(rs.getString("company_name"));
				recruitList.add(recruit);
			} while(rs.next()); 
		}
	} catch(Exception e){
		e.printStackTrace();
		} finally {
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if (pstmt!=null) try {	pstmt.close();	} catch (SQLException e) {}
			if (conn!=null) try {	conn.close();	} catch (SQLException e) {}
		}
		return recruitList;
	}
	
	public List getExtraction(String job_c,int index) {
		List recruitList = null;
		try {
			conn = getConnection();
			sql = "select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name" + 
					" from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name" + 
					" from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name" + 
					" from recruit order by recruit_code desc) order by recruit_code desc) where job_c =? and rownum <5 and recruit_code not in(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job_c);
			pstmt.setInt(2, index);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recruitList = new ArrayList();
			do {
				RecruitDataBean recruit = new RecruitDataBean();
				recruit.setEmail_id(rs.getString("email_id"));
				recruit.setSubject(rs.getString("subject"));
				recruit.setArea(rs.getString("area"));
				recruit.setJob_c(rs.getString("job_c"));
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
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		
		return recruitList;
	}
	public int getExtractionCount(String job_c,int index) {
		int count = 0;
		try {
			conn = getConnection();
			sql = "select max(rownum)" + 
					" from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name" + 
					" from (select recruit_code,subject,content,area,job_c,img,address,compensation,email_id,end_date,nominator,applicant,company_name" + 
					" from recruit order by recruit_code desc) order by recruit_code desc) where job_c =? and rownum <5 and recruit_code not in(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job_c);
			pstmt.setInt(2, index);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return count;
	}
	public void deleteRecruit(int index) {
		try {
			conn = getConnection();
			sql = "delete from recruit where recruit_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public void updateRecruit(RecruitDataBean recruit,Date end_date) {
		try {
			conn = getConnection();
			sql = "update recruit set subject=?, content=?, area=?, job_c=?, end_date=?"
					+ " where recruit_code=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, recruit.getSubject());
			pstmt.setString(2, recruit.getContent());
			pstmt.setString(3, recruit.getArea());
			pstmt.setString(4, recruit.getJob_c());
			pstmt.setDate(5,end_date);
			pstmt.setInt(6, recruit.getRecruit_code());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) { try {pstmt.close();} catch(SQLException s) {}}
			if(conn != null) { try {conn.close();} catch(SQLException s) {}}
		}
	}
	
	public List getSearch(String search){
			List list = null;
			try {
				conn = getConnection();
				sql = "select * from recruit where area=? or job_c=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				rs= pstmt.executeQuery();
				if(rs.next()) {
					list = new ArrayList();
				do {
					RecruitDataBean recruit = new RecruitDataBean();
					recruit.setEmail_id(rs.getString("email_id"));
					recruit.setSubject(rs.getString("subject"));
					recruit.setArea(rs.getString("area"));
					recruit.setJob_c(rs.getString("job_c"));
					recruit.setImg(rs.getString("img"));
					recruit.setAddress(rs.getString("address"));
					recruit.setRecruit_code(rs.getInt("recruit_code"));
					recruit.setCompensation(rs.getInt("compensation"));
					recruit.setContent(rs.getString("content"));
					recruit.setEnd_date(rs.getDate("end_date"));
					list.add(recruit);
				} while(rs.next()); 
			}
		} catch(Exception e) {
				e.printStackTrace();
			} finally {
				 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
			return list;
	}
	
	public int searchCount(String search) {
		int x= 0;
		try {
			conn = getConnection();
			sql ="select count(*) from recruit where area=? or job_c=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			 if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			 if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	         if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return x;
	}
	
}

