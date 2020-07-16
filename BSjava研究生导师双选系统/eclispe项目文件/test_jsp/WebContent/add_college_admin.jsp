<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add college admin</title>
</head>
<body>
添加新的学院管理员信息：<br>
        <br>
        
        <form action="add_college_admin" method="post">
                        管理员用户名:<input type="text" name="userName"></input><br>
                         学院:<input type="text" name="college"></input><br>
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