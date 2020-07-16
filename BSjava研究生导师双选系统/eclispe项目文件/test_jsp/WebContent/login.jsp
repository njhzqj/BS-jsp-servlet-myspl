<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>log in</title>
    </head>
    <body>
                         研究生导师双选系统，请先登录！<br>
        <br>
        <form action="login" method="post">
                        用户名:<input type="text" name="userName"></input><br>
                        密码:<input type="password" name="password"></input><br>
                        用户类型:<input type="radio" name="userType" value="student">学生
                     <input type="radio" name="userType" value="teacher">导师
                     <input type="radio" name="userType" value="cadmin">学院管理员
                     <input type="radio" name="userType" value="iadmin">研究院管理员<br>
        <input type="submit" value="login"/>
        <input type="reset" value="reset"/>         
        </form>
    </body>
</html>