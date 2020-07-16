<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add student</title>
</head>
<body>
添加新的学生信息：<br>
        <br>
        
        <form action="add_student" method="post">
                        学生学号:<input type="text" name="userNum"></input><br>
                        学生姓名:<input type="text" name="userName"></input><br>
        <%
        String temp_college="";
        request.setCharacterEncoding("UTF-8");
        String current_college=request.getParameter("college");
        if(current_college.contentEquals("all"))
        {
        	temp_college="";
        }
        else
        {
        	temp_college=current_college;
        }
        out.print("专业:<input value=\""+temp_college+"\" type=\"text\" name=\"college\"></input><br>");
        %>
        
        <br>
        <input type="submit" value="确认添加"/>
        <input type="reset" value="重新填入信息"/>         
        </form>
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