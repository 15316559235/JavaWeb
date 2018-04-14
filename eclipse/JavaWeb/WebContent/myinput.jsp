<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html><head> <title>输入信息</title></head>
<body>
<h4>输入信息</h4>
<form action = "s.do" method = "post">
 <table>
  <tr><td>长：</td> <td><input type="text" name="chang" ></td></tr>
  <tr><td>宽：</td><td><input type="text" name="kuan"></td></tr>      
  <tr><td><input type="submit" value="确定" ></td>
      <td><input type="reset" value="重置" ></td>
  </tr>
</table>
</form>
</body></html>
