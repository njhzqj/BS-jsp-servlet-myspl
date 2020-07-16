<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test_jsp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Institute admin</title>
</head>
<body>
研究院管理员功能选择界面：<br>
<br>

<%
        //String admin_name="";
        
        local_url lul=new local_url();
		String localUrl=lul.getUrl();
        request.setCharacterEncoding("UTF-8");
        String current_name=request.getParameter("admin_name");
        //out.print(current_name+"<br>");
        String current_college=request.getParameter("college_name");
        //out.print(current_college+"<br>");
        out.print(current_college+" 管理员 "+current_name+"，您好！<br>");
	    out.print("<br>");
	    
	    //设置系统双选时间限制
	    String set_time_limit_url=localUrl+"test_jsp/set_time_limit.jsp";
	    out.print("<a href=\""+set_time_limit_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"设置系统双选时间限制\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //查看学生信息按钮
	    String student_view_url=localUrl+"test_jsp/student_view.jsp?college=all";
	    out.print("<a href=\""+student_view_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"查看所有学生信息\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //查看老师信息按钮
	    String teacher_view_url=localUrl+"test_jsp/teacher_view.jsp?college=all";
	    out.print("<a href=\""+teacher_view_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"查看所有导师信息\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //增加学生按钮
	    String add_student_url=localUrl+"test_jsp/add_student.jsp?college=请填写";
	    out.print("<a href=\""+add_student_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"增加学生信息\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //增加老师按钮
	    String add_teacher_url=localUrl+"test_jsp/add_teacher.jsp?college=请填写";
	    out.print("<a href=\""+add_teacher_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"增加老师信息\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //增加学院管理员
	    String add_college_admin_url=localUrl+"test_jsp/add_college_admin.jsp";
	    out.print("<a href=\""+add_college_admin_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"增加学院管理员\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //修改密码
	    String change_password=localUrl+"test_jsp/change_password.jsp";
	    out.print("<a href=\""+change_password+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"修改密码\" >");
	    out.print("</a>");
	    out.print("<br>");
	    
	    //登出按钮
	    String login_url=localUrl+"test_jsp/login.jsp";
	    out.print("<a href=\""+login_url+"\"");
	    out.print("<br>");
	    out.print("<input type=button value=\"登出\" >");
	    out.print("</a>");
	    
        %>
        <br>

</body>
</html>