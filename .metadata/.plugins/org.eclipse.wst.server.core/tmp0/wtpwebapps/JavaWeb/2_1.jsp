<%@ page contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>
<html>
<head><title>登录页面</title></head>
<body>
<form action="Login.jsp" method="post">
   <table>
   <tr><td>用户名： </td>
       <td><input type="text" name="username" size="30"/></td>
   </tr>
   <tr><td>密&nbsp;&nbsp;码:</td>
        <td><input type="password" name="password" size="30"/></td>
   </tr>
   <tr><td><input type="submit" value="登录" /></td>
       <td><input type="reset" value="取消"/></td>
   </tr>
   </table>
</form>
</body>
</html>
