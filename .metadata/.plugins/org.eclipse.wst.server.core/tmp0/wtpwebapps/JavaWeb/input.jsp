<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>input</title>
</head>

<body>

<form action="login1.do" method="post">
   <table>
   <tr><td>学&nbsp;&nbsp;号：</td>
       <td><input type="text" name="sno" size="20"/></td>
   </tr>
   <tr><td>姓&nbsp;&nbsp;名:</td>
        <td><input type="text" name="name" size="20"/></td>
   </tr>
   <tr><td><input type="submit" value="登录" /></td>
       <td><input type="reset" value="取消"/></td>
   </tr>
   </table>
</form>

</body>
</html>