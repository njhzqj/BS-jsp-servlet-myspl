<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test_jsp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>student choose teacher</title>
  </head>
  <body>
      学生选择导师界面：<br>
        <br>              
        <%
        local_url lul=new local_url();
		String localUrl=lul.getUrl();
        request.setCharacterEncoding("UTF-8");
        String current_name=request.getParameter("student_Name");
        //out.print(current_name+"<br>");
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
	         sql1="SELECT * FROM student_choose_info";
	         ResultSet rs = stmt.executeQuery(sql1);
	         
	         boolean find=false;
	         while(rs.next())
	         {
	        	 
	        	 if(rs.getString("studentname").contentEquals(current_name))
	        	 {
	        		 out.print(rs.getString("studentname")+"同学，你好！<br>");
	        		 out.print("<br>");
	        		 out.print("你已经选择了志愿，你的志愿列表如下：<br>");
	        		 out.print("你已选择： 志愿一： "+rs.getString("firstchoose")+"  "+rs.getString("is_teacher_choose")+" <br>");
	        		 out.print("你已选择： 志愿二： "+rs.getString("secondchoose")+"  "+rs.getString("is_teacher_choose_2")+" <br>");
	        		 out.print("你已选择： 志愿三： "+rs.getString("thirdchoose")+"  "+rs.getString("is_teacher_choose_3")+" <br>");
	        		 find=true;
	        		 String final_teacher="";
	        		 if(rs.getString("is_teacher_choose").contentEquals("导师选择：已选择"))
	        		 {
	        			 final_teacher=rs.getString("firstchoose");
	        		 }
	        		 if(rs.getString("is_teacher_choose_2").contentEquals("导师选择：已选择"))
	        		 {
	        			 final_teacher=rs.getString("secondchoose");
	        		 }
	        		 if(rs.getString("is_teacher_choose_3").contentEquals("导师选择：已选择"))
	        		 {
	        			 final_teacher=rs.getString("thirdchoose");
	        		 }
	        		 
	        		 out.print("你的最终导师为："+final_teacher+"<br>");
	        		 out.print("<br>");
	        	 }
	         }
	         rs.close();
	         if(find==false)
	         {
	        	 out.print("<form action=\"student_choose_teacher\" method=\"post\">");
	        	 out.print("你还没有选择自己的导师，请输入你的个人信息并选择三个志愿。<br>");
	        	 out.print(" <br>");
	        	 out.print(" 学号:<input type=\"text\" name=\"stunum\"></input><br>");
	        	 out.print(" 姓名:<input type=\"text\" name=\"name\"></input><br>");
	        	 out.print(" 专业:<input type=\"text\" name=\"major\"></input><br>");
	        	 String sql2;
		         sql2 = "SELECT * FROM teacher_info";
		         ResultSet rs2 = stmt.executeQuery(sql2);
		         out.print("<br>");
		         int num=1;
		         while(rs2.next())
		         {
		        	 String teacher_id  = rs2.getString("teacherid");  	 
		        	 String teacher_name=rs2.getString("teachername");
		        	 String teacher_major=rs2.getString("teacher_major");
		        	 String teacher_college=rs2.getString("college");
		        	 out.print("<input name=\"teacherchoose\" value=\""+teacher_name+"\" type=\"checkbox\" >");
		        	 out.print("  编号："+teacher_id+"    ");
		        	 out.print("  姓名："+teacher_name+"    ");
		        	 out.print("  学院："+teacher_college+"    ");
		        	 out.print("	     专业方向："+teacher_major+"    ");
		        	 out.print("<br>");
		        	 num++;
		         }
		         rs2.close();
		         out.print("<br>");
	        	 out.print("<input type=\"submit\" value=\"确认提交\"/><br>");
	        	 out.print("</form>");
		         
	         }
	         out.print("<br>");
	         String change_password=localUrl+"test_jsp/change_password.jsp";
	     	 out.print("<a href=\""+change_password+"\"");
	     	 out.print("<br>");
	     	 out.print("<input type=button value=\"修改密码\" >");
	     	 out.print("</a>");
	     	 
	         
	         String login_url=localUrl+"test_jsp/login.jsp";
	         out.print("<a href=\""+login_url+"\"");
	         out.print("<br>");
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
        <input type=button value="登出" >
        </a>
  </body>
</html>