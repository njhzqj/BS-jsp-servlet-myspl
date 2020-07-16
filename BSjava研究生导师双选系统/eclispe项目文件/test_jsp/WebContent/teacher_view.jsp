<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test_jsp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view student info</title>
</head>
<body>
导师信息显示：
<br>
<br>
<%
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
     sql1="SELECT * FROM teacher_info";
     ResultSet rs = stmt.executeQuery(sql1);
     
     boolean find=false;
     while(rs.next())
     {
    	 String temp_college=rs.getString("college");
    	 if(temp_college.contentEquals(current_college)||current_college.contentEquals("all"))
    	 {
    		 out.print("导师编号： "+rs.getString("teacherid"));
    		 out.print(" 导师名称： "+rs.getString("teachername"));
    		 out.print(" 学院： "+rs.getString("college"));
    		 out.print(" 导师方向： "+rs.getString("teacher_major"));
    		 out.print("<br>");
    		 out.print("<br>");
    	 }
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

//返回上一步
//<a href="javascript:history.go(-1);">返回上一页</a>
//返回管理员选择界面
String return_to_admin="javascript:history.go(-1);";
out.print("<a href=\""+return_to_admin+"\"");
out.print("<br>");
out.print("<input type=button value=\"返回功能选择界面\" >");
out.print("</a>");
out.print("<br>");
%>
</body>
</html>