<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%

    //ì»¤ë¥ì ì ì¸
    Connection con = null;

    try {

        //ëë¼ì´ë² í¸ì¶, ì»¤ë¥ì ì°ê²°

        Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        String user = "TEAM02", pass="TEAM02";
        String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";
        con = DriverManager.getConnection(url,user,pass);
    	ResultSet rs = null;
        //DBìì ë½ìì¨ ë°ì´í°(JSON) ì ë´ì ê°ì²´. íì responseObjì ë´ê¸°ë ê°
        List dustlist = new LinkedList();

	//ì ì²´ ë°ì´í° 
    String sel = request.getParameter("params");
    System.out.println(sel);

	String query = "select * from chart where job=?";

	PreparedStatement pstm = con.prepareStatement(query);
    pstm.setString(1, sel);
 	rs = pstm.executeQuery();

        //ajaxì ë°íí  JSON ìì±
        JSONObject responseObj = new JSONObject();
        JSONObject lineObj = null;
		DecimalFormat f1 = new DecimalFormat("");
		 response.setContentType("text/html;charset=UTF-8");
    	while (rs.next()) {
            String job = rs.getString("job"); //ì§ììë¶ë¥
            String car = rs.getString("car");  //ê²½ë ¥ì°ì
            int sal = rs.getInt("sal");  //ì°ë´
 	    	lineObj = new JSONObject();
            lineObj.put("job", job);
            lineObj.put("car", car);
            lineObj.put("sal", (int)sal);
            dustlist.add(lineObj);
        } 
    	responseObj.put("dustlist", dustlist);
        out.print(responseObj.toString());

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

%>


