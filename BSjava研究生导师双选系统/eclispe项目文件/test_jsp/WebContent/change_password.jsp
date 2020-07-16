<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>change password</title>
    </head>
    <body>
                         修改你的密码！<br>
        <br>
        <form action="change_password" method="post">
                         输入你的用户名:<input type="text" name="userName"></input><br>
                         输入你的旧密码:<input type="password" name="password"></input><br>
                         选择你的用户类型:<input type="radio" name="userType" value="student">学生
                     <input type="radio" name="userType" value="teacher">导师
                     <input type="radio" name="userType" value="cadmin">学院管理员
                     <input type="radio" name="userType" value="iadmin">研究院管理员<br>
                         输入你的新密码:<input type="password" name="new_password"></input><br>
        <br>
        <input type="submit" value="提交"/>
        <input type="reset" value="重新输入信息"/>         
        </form>
    </body>
</html>