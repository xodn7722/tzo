<%@page import="java.text.DecimalFormat"%>

<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>

<%@page import="org.json.simple.JSONObject"%>

<%

    //커넥션 선언

    Connection con = null;



    try {

        //드라이버 호출, 커넥션 연결

        Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        String user = "TEAM02", pass="TEAM02";
        String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";

        con = DriverManager.getConnection(url,user,pass);



    	ResultSet rs = null;

        //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값

        List dustlist = new LinkedList();

 

	//전체 데이터 

     




	String query = "select * from chart";





	PreparedStatement pstm = con.prepareStatement(query);

        rs = pstm.executeQuery(query);

        

        //ajax에 반환할 JSON 생성

        JSONObject responseObj = new JSONObject();

        JSONObject lineObj = null;

        

	DecimalFormat f1 = new DecimalFormat("");



    	while (rs.next()) {

          
            	String job2 = rs.getString("job2"); //직업소분류
                int car = rs.getInt("car");  //경력연수
                int sal = rs.getInt("sal");  //연봉
            

 	    	lineObj = new JSONObject();

            

            	lineObj.put("job2", job2);

            	lineObj.put("car", (int)car);

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



