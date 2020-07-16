<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="test_jsp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <title>set time limit</title>
    </head>
    <body>
                         设置学生可以进行选择的时间！<br>
        <br>
        <form action="set_time_limit" method="post">
                        开始时间:<br>
        
<%
//从数据库中获取当前的时间设置
local_url lul=new local_url();
String localUrl=lul.getUrl();
request.setCharacterEncoding("UTF-8");
String current_college=request.getParameter("college");
//out.print(current_college+"<br>");
database_var dbv = new database_var();
String JDBC_DRIVER = dbv.getJdbcDriver();  
String DB_URL = dbv.getDbUrl();
String USER = dbv.getUser();
String PASS = dbv.getPass();
Connection conn =null;
Statement stmt = null;
try{
    
     Class.forName(JDBC_DRIVER);
     conn = DriverManager.getConnection(DB_URL,USER,PASS);
     stmt = conn.createStatement();
     
     String sql1;
     sql1="SELECT * FROM time_limit";
     ResultSet rs = stmt.executeQuery(sql1);
     
     boolean find=false;
     while(rs.next())
     {
    	 String start=rs.getString("start_time");
    	 String end=rs.getString("end_time");
    	 out.print("<input type=\"text\" name=\"start_date\" value=\""+start+"\"/>");
    	 out.print("<br>");
    	 out.print("结束时间:<br>");
    	 out.print("<input type=\"text\" name=\"end_date\" value=\""+end+"\"/>");
    	 out.print("<br>");
     }
     rs.close();
     stmt.close();
     conn.close();
} 
catch(SQLException se) {
       
        se.printStackTrace();
} 
catch(Exception e) {
        
        e.printStackTrace();
}
finally{
        
        try{
            if(stmt!=null)
            stmt.close();
        }catch(SQLException se2){
        }
        try{
            if(conn!=null)
            conn.close();
        }catch(SQLException se){
            se.printStackTrace();
        }
        }

%>
        <br>
        <input type="submit" value="确认设置"/>
        </form>
        <br>
        <%
        String return_to_admin="javascript:history.go(-1);";
        out.print("<a href=\""+return_to_admin+"\"");
        out.print("<br>");
        out.print("<input type=button value=\"返回功能选择界面\" >");
        out.print("</a>");
        out.print("<br>");
        %>
    </body>
</html>