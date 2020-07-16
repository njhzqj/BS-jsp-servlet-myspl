<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test_jsp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<title>teacher choose student</title>
</head>
<body>
导师选择学生界面：<br>
<br>
                        
        <%
        String teacher_name="";
        
        local_url lul=new local_url();
		String localUrl=lul.getUrl();
        request.setCharacterEncoding("UTF-8");
        String current_name=request.getParameter("teacher_name");
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
	         sql1="SELECT * FROM teacher_info";
	         ResultSet rs = stmt.executeQuery(sql1);
	         
	         while(rs.next())
	         {
	        	 
	        	 if(rs.getString("teachername").contentEquals(current_name))
	        	 {
	        		 
	        		 out.print(rs.getString("teachername")+"老师，你好！<br>");
	        		 out.print("<br>");
	        		 out.print("你的导师信息如下：<br>");
	        		 out.print("导师编号： "+rs.getString("teacherid"));
	        		 out.print("<br>");
	        		 teacher_name=rs.getString("teachername");
	        		 out.print("导师名称： "+teacher_name);
	        		 out.print("<br>");
	        		 out.print("学院： "+rs.getString("college"));
	        		 out.print("<br>");
	        		 out.print("导师方向： "+rs.getString("teacher_major"));
	        		 out.print("<br>");
	        		 out.print("<br>");
	        	 }
	         }
	         rs.close();
	         
        	 String sql2;
	         sql2 = "SELECT * FROM student_choose_info";
	         ResultSet rs2 = stmt.executeQuery(sql2);
	         out.print("<br>");

	         out.print("可选学生信息如下：<br>");
	         int num=1;
	         out.print("<form action=\"teacher_choose?teacher_name="+teacher_name+"\" method=\"post\">");
	         //显示所有的的可选学生信息
	         while(rs2.next())
	         {
	        	 //如果是选择了当前老师的学生并且未被选择过的学生，那么显示出来
	        	 boolean flag=false;
	        	 if(rs2.getString("firstchoose").contentEquals(current_name))
	        		 flag=true;
	        	 if(rs2.getString("secondchoose").contentEquals(current_name))
	        		 flag=true;
	        	 if(rs2.getString("thirdchoose").contentEquals(current_name))
	        		 flag=true;
	        	 if(flag==true)
	        	 {
	        		 boolean is_chosen=false;
	        		 if(rs2.getString("is_teacher_choose").contentEquals("导师选择：已选择"))
	        		 {
	        			 is_chosen=true;
	        		 }
	        		 if(rs2.getString("is_teacher_choose_2").contentEquals("导师选择：已选择"))
	        		 {
	        			 is_chosen=true;
	        		 }
	        		 if(rs2.getString("is_teacher_choose_3").contentEquals("导师选择：已选择"))
	        		 {
	        			 is_chosen=true;
	        		 }
	        		 if(is_chosen==false)
	        		 {
	        		 String stu_id=rs2.getString("studentid");
	        		 String stu_name=rs2.getString("studentname");
	        		 String stu_major=rs2.getString("major");
	        		 out.print("<input name=\"teacherchoose\" value=\""+stu_id+"\" type=\"checkbox\" >");
	        		 out.print(" 学号：");
	        		 out.print(stu_id+"    姓名：");
	        		 out.print(stu_name+"    专业：");
	        		 out.print(stu_major+"    ");
	        		 out.print("<br>");
	        		 num++;
	        		 }
	        	 }
	         }
	         rs2.close();
	         out.print("<br>");
	         out.print("<input type=\"submit\" value=\"确认选择\"/><br>");
        	 out.print("</form>");
        	 out.print("<br>");
        	String change_password=localUrl+"test_jsp/change_password.jsp";
     	    out.print("<a href=\""+change_password+"\"");
     	    out.print("<br>");
     	    out.print("<input type=button value=\"修改密码\" >");
     	    out.print("</a>");
     	    
        	 
        	 String login_url=localUrl+"test_jsp/login.jsp";
        	 out.print("<br>");
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
        <br>
</body>
</html>